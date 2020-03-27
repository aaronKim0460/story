package egovframework.com.cop.bbs.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.hsqldb.lib.StringUtil;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BBSKeyword;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 게시물 관리를 위한 서비스 구현 클래스
 * 
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 * 
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일     	수정자           수정내용
 *  -----------    --------    ---------------------------
 *   2009.03.19  	이삼섭          최초 생성
 *  2011.09.22 	서준식          nttId IdGen 서비스로 변경
 *  2014.02.21		이기하          답글에 대한 nttId 생성
 * </pre>
 */
@Service("EgovBBSManageService")
public class EgovBBSManageServiceImpl extends AbstractServiceImpl implements EgovBBSManageService {

	@Resource(name = "BBSManageDAO")
	private BBSManageDAO bbsMngDAO;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "egovNttIdGnrService")
	private EgovIdGnrService nttIdgenService;

	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;

	@Resource(name = "BBSKeywordDAO")
	private BBSKeywordDAO bbsKeywordDAO;
	
	@Resource(name = "keywordIdGnrService")
	private EgovIdGnrService keywordIdgenService;

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(EgovBBSManageServiceImpl.class.getClass());

	/**
	 * 게시물 한 건을 삭제 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#deleteBoardArticle(egovframework.com.cop.bbs.brd.service.Board)
	 */
	public void deleteBoardArticle(Board board) throws Exception {

		FileVO fvo = new FileVO();

		fvo.setAtchFileId(board.getAtchFileId());

		board.setNttSj("이 글은 작성자에 의해서 삭제되었습니다.");

		int resultCnt = bbsMngDAO.deleteBoardArticle(board);
		
		// #tag 검색 process
		BBSKeyword deleteVO = new BBSKeyword();
		deleteVO.setBbsId(board.getBbsId());
		deleteVO.setNttId(String.valueOf(board.getNttId()));
		
		bbsKeywordDAO.deleteBBSKeywordByBbsKeys(deleteVO);

		if (resultCnt > 0) {

			// history 생성
			board.setActionTy("D"); // 상태(C:생성 / U:수정 / D:삭제 / R:복원)
			insertBoardArticleLog(board);
		}

		// if (!"".equals(fvo.getAtchFileId()) || fvo.getAtchFileId() != null) {
		// fileService.deleteAllFileInf(fvo);
		// }
	}

	/**
	 * 게시물 여러 건을 삭제해제 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#deleteBoardArticlesUndo(egovframework.com.cop.bbs.brd.service.Board)
	 */
	public void deleteBoardArticlesUndo(Board board) throws Exception {

		FileVO fvo = new FileVO();

		fvo.setAtchFileId(board.getAtchFileId());

		board.setNttSj("이 글은 작성자에 의해서 삭제되었습니다.");

		int resultCnt = bbsMngDAO.deleteBoardArticlesUndo(board);

		if (resultCnt > 0) {

			// history 생성
			board.setActionTy("D"); // 상태(C:생성 / U:수정 / D:삭제 / R:복원)
			insertBoardArticleLog(board);
		}

	}

	/**
	 * 게시판에 게시물 또는 답변 게시물을 등록 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#insertBoardArticle(egovframework.com.cop.bbs.brd.service.Board)
	 */
	public int insertBoardArticle(Board board) throws Exception {
		// SORT_ORDR는 부모글의 소트 오더와 같게, NTT_NO는 순서대로 부여

		int resultCnt = 0;

		if ("Y".equals(board.getReplyAt())) {
			// 답글인 경우 1. Parnts를 세팅, 2.Parnts의 sortOrdr을 현재글의 sortOrdr로 가져오도록, 3.nttNo는 현재 게시판의 순서대로
			// replyLc는 부모글의 ReplyLc + 1

			board.setNttId(nttIdgenService.getNextIntegerId()); // 답글에 대한 nttId 생성
			bbsMngDAO.replyBoardArticle(board);

		} else {
			// 답글이 아닌경우 Parnts = 0, replyLc는 = 0, sortOrdr = nttNo(Query에서 처리)
			board.setParnts("0");
			board.setReplyLc("0");
			board.setReplyAt("N");
			board.setNttId(nttIdgenService.getNextIntegerId());// 2011.09.22

			resultCnt = bbsMngDAO.insertBoardArticle(board);

			if (resultCnt > 0) {
				// history 생성
				board.setActionTy("C"); // 상태(C:생성 / U:수정 / D:삭제 / R:복원)
				insertBoardArticleLog(board);
			}

			// 연동 게시판
			if (board.getLinkBbsId() != null && !"".equals(board.getLinkBbsId())) {

				String bbsId = board.getBbsId();
				long nttId = board.getNttId();
				String atchFileId = board.getAtchFileId();

				String[] linkBbsIds = board.getLinkBbsId().split(",");

				for (String linkBbsId : linkBbsIds) {

					board.setBbsId(bbsId);
					board.setNttId(nttId);
					board.setLinkBbsId(linkBbsId);
					board.setLinkNttId(nttIdgenService.getNextIntegerId());

					if (atchFileId != null && !"".equals(atchFileId)) {
						board.setLinkAtchFileId(idgenService.getNextStringId());
					} else {
						board.setLinkAtchFileId(atchFileId);
					}

					if (bbsMngDAO.insertLinkBbs(board) > 0) {

						// 파일 처리
						if (atchFileId != null && !"".equals(atchFileId)) {
							bbsMngDAO.insertLinkAtchFile(board);
							bbsMngDAO.insertLinkAtchFileDetail(board);
						}

						// history 생성
						board.setBbsId(board.getLinkBbsId());
						board.setNttId(board.getLinkNttId());
						board.setActionTy("C"); // 상태(C:생성 / U:수정 / D:삭제 / R:복원)

						insertBoardArticleLog(board);

					}

				}
			}
		}

		// #tag 검색 process
		if (board.getKeywordTag() != null && !"".equals(board.getKeywordTag())) {
			String[] arrayString = board.getKeywordTag().split("#");

			if (arrayString.length > 0) {
				for (int i = 0; i < arrayString.length; i++) {
					if (!StringUtil.isEmpty(arrayString[i])) {
						BBSKeyword insertVO = new BBSKeyword();
						insertVO.setKeyId(keywordIdgenService.getNextStringId());
						insertVO.setBbsId(board.getBbsId());
						insertVO.setNttId(String.valueOf(board.getNttId()));
						insertVO.setFrstRegisterId(board.getFrstRegisterId());
						insertVO.setKeyword(arrayString[i]);

						bbsKeywordDAO.insertBBSKeyword(insertVO);
					}
				}
			}
		}

		return resultCnt;
	}

	/**
	 * 게시물 대하여 상세 내용을 조회 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#selectBoardArticle(egovframework.com.cop.bbs.brd.service.BoardVO)
	 */
	public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception {
		if (boardVO.isPlusCount()) {
			int iniqireCo = bbsMngDAO.selectMaxInqireCo(boardVO);

			boardVO.setInqireCo(iniqireCo);
			bbsMngDAO.updateInqireCo(boardVO);
		}

		return bbsMngDAO.selectBoardArticle(boardVO);
	}

	/**
	 * 조건에 맞는 게시물 목록을 조회 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#selectBoardArticles(egovframework.com.cop.bbs.brd.service.BoardVO)
	 */
	public Map<String, Object> selectBoardArticles(BoardVO boardVO, String attrbFlag) throws Exception {

		List<BoardVO> list = new ArrayList<BoardVO>();
		List<BoardVO> result = new ArrayList<BoardVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = 0;

		if (boardVO.getBbsAttrbCode().equals("BBSA02")) { // BBSA02는 게시판 속성 중 갤러리 (BBSA01:유효게시판, BBSA02:갤러리, BBSA03:일반게시판)

			list = bbsMngDAO.selectImgBoardArticleList(boardVO); // 리스트 중 이미지를 노출 시키기 위함

		} else {

			// BBST09:연구게시판(유형), BBST06:문서게시판(유형), BBSA01:유효게시판(속성)
			if (boardVO.getBbsTyCode().equals("BBST12") || boardVO.getTmpStr().equals("IMGLIST")) {
				if (boardVO.getCnReplace() == 1) {
					list = bbsMngDAO.selectImgBoardArticleList_R(boardVO); // 리스트 중 이미지를 노출 시키기 위함(메인 페이지 내에 게시판 내용 일부 출력)
				} else {
					list = bbsMngDAO.selectImgBoardArticleList(boardVO); // 리스트 중 이미지를 노출 시키기 위함(메인 페이지 내에 게시판 내용 일부 출력)
				}
			} else {
				if (boardVO.getCnReplace() == 1) { // 1인 경우 (":큰따옴표) replace
					list = bbsMngDAO.selectBoardArticleList_R(boardVO); // COMTNBBS
				} else {
					list = bbsMngDAO.selectBoardArticleList(boardVO); // COMTNBBS
				}
			}
		}

		cnt = list == null || list.isEmpty() ? 0 : list.get(0).getTotCnt();

		if ("BBSA01".equals(attrbFlag)) {
			// 유효게시판 임
			String today = EgovDateUtil.getToday();

			BoardVO vo;
			Iterator<BoardVO> iter = list.iterator();
			while (iter.hasNext()) {
				vo = (BoardVO) iter.next();

				if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
					if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
						// 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
						vo.setIsExpired("Y");
					}
				}
				result.add(vo);
			}
		} else {
			result = list;
		}

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/** 
	 * 통합검색
	 * (non-Javadoc)
	 * @see egovframework.com.cop.bbs.service.EgovBBSManageService#selectBoardArticles2(egovframework.com.cop.bbs.service.BoardVO)
	 */
	public Map<String, Object> selectBoardArticles2(BoardVO boardVO) throws Exception {
		List<BoardVO> list = new ArrayList<BoardVO>();
		List<BoardVO> result = new ArrayList<BoardVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = 0;

		list = bbsMngDAO.selectBoardArticleList2(boardVO); // COMTNBBS
		cnt = list == null || list.isEmpty() ? 0 : list.get(0).getTotCnt();
		result = list;

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}
	
	public Map<String, Object> selectBoardArticles3(BoardVO boardVO) throws Exception {
		List<BoardVO> list = new ArrayList<BoardVO>();
		List<BoardVO> result = new ArrayList<BoardVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = 0;

		list = bbsMngDAO.selectBoardArticleList3(boardVO); // COMTNBBS
		cnt = list == null || list.isEmpty() ? 0 : list.get(0).getTotCnt();
		result = list;

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	}
		
	/**
	 * 게시물 한 건의 내용을 수정 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#updateBoardArticle(egovframework.com.cop.bbs.brd.service.Board)
	 */
	public void updateBoardArticle(Board board) throws Exception {
		bbsMngDAO.updateBoardArticle(board);

		// 컨텐츠이력 추가
		insertBoardArticleLog(board);
		
		// #tag 검색 process - 전체 삭제를 하고 다시 등록한다.
		BBSKeyword deleteVO = new BBSKeyword();
		deleteVO.setBbsId(board.getBbsId());
		deleteVO.setNttId(String.valueOf(board.getNttId()));
		
		bbsKeywordDAO.deleteBBSKeywordByBbsKeys(deleteVO);
		
		if (board.getKeywordTag() != null && !"".equals(board.getKeywordTag())) {
			String[] arrayString = board.getKeywordTag().split("#");
			
			if (arrayString.length > 0) {
				for (int i = 0; i < arrayString.length; i++) {
					if (!StringUtil.isEmpty(arrayString[i])) {
						BBSKeyword insertVO = new BBSKeyword();
						insertVO.setKeyId(keywordIdgenService.getNextStringId());
						insertVO.setBbsId(board.getBbsId());
						insertVO.setNttId(String.valueOf(board.getNttId()));
						insertVO.setFrstRegisterId(board.getLastUpdusrId());
						insertVO.setKeyword(arrayString[i]);

						bbsKeywordDAO.insertBBSKeyword(insertVO);
					}
				}
			}
		}
	}

	/**
	 * 방명록 내용을 삭제 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#deleteGuestList(egovframework.com.cop.bbs.brd.service.BoardVO)
	 */
	public void deleteGuestList(BoardVO boardVO) throws Exception {
		bbsMngDAO.deleteGuestList(boardVO);
	}

	/**
	 * 방명록에 대한 목록을 조회 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#selectGuestList(egovframework.com.cop.bbs.brd.service.BoardVO)
	 */
	public Map<String, Object> selectGuestList(BoardVO boardVO) throws Exception {
		List<BoardVO> result = bbsMngDAO.selectGuestList(boardVO);
		int cnt = bbsMngDAO.selectGuestListCnt(boardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 방명록에 대한 패스워드를 조회 한다.
	 * 
	 * @param board
	 * @return
	 * @throws Exception
	 */
	public String getPasswordInf(Board board) throws Exception {
		return bbsMngDAO.getPasswordInf(board);
	}

	public String getVodFileSn(Board board) throws Exception {
		return bbsMngDAO.getVodFileSn(board);
	}

	public BoardVO selectDialogReplyArticle(BoardVO boardVO) throws Exception {
		if (boardVO.isPlusCount()) {
			int iniqireCo = bbsMngDAO.selectMaxInqireCo(boardVO);

			boardVO.setInqireCo(iniqireCo);
			bbsMngDAO.updateInqireCo(boardVO);
		}

		return bbsMngDAO.selectDialogReplyArticle(boardVO);
	}

	public Map<String, Object> selectBoardDialogArticles(BoardVO boardVO, String attrbFlag) throws Exception {
		List<BoardVO> list = new ArrayList<BoardVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = 0;

		boardVO.setTmpStr("100");
		boardVO.setBbsSearchTerm(0);
		list = bbsMngDAO.selectBoardDialogArticles(boardVO); // COMTNBBS
		cnt = bbsMngDAO.selectBoardDialogArticlesCnt(boardVO);

		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	public void realDeleteBoardArticles(BoardVO board) throws Exception {
		FileVO fvo = new FileVO();

		fvo.setAtchFileId(board.getAtchFileId());

		board.setNttSj("이 글은 작성자에 의해서 삭제되었습니다.");

		bbsMngDAO.realDeleteBoardArticles(board);

		if (!"".equals(fvo.getAtchFileId()) || fvo.getAtchFileId() != null) {
			fileService.deleteAllFileInf(fvo);
		}
	}

	public Map<String, Object> selectBoardArticles_obj(BoardVO boardVO, String attrbFlag) throws Exception {
		List<BoardVO> result = new ArrayList<BoardVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = 0;

		result = bbsMngDAO.selectBoardArticles_obj(boardVO); // 리스트 중 이미지를 노출 시키기 위함
		cnt = bbsMngDAO.selectBoardArticles_objCnt(boardVO);

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.cop.bbs.service.EgovBBSManageService#insertBoardArticleLog(egovframework.com.cop.bbs.service.Board)
	 */
	public int insertBoardArticleLog(Board board) throws Exception {

		int resultCnt = 0;

		// 게시판, 게시물 ID 확인
		if (board == null || board.getBbsId() == null || "".equals(board.getBbsId()) || board.getNttId() < 1) {
			return resultCnt;
		}

		// ip 설정
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		if (user != null)
			board.setUpdusrIp(user.getIp());

		// 게시물 이력 생성
		resultCnt = bbsMngDAO.insertBoardArticleLog(board);

		if (resultCnt > 0 && board.getAtchFileId() != null && !"".equals(board.getAtchFileId())) {
			// 파일 정보 생성
			bbsMngDAO.insertBoardArticleFileLog(board);
		}

		return resultCnt;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.cop.bbs.service.EgovBBSManageService#selectBBSHistory(egovframework.com.cop.bbs.service.Board)
	 */
	public List<BoardVO> selectBBSHistory(Board Board) throws Exception {

		return bbsMngDAO.selectBBSHistory(Board);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.cop.bbs.service.EgovBBSManageService#contentBBSHistoryPreview(egovframework.com.cop.bbs.service.BoardVO)
	 */
	public BoardVO contentBBSHistoryPreview(BoardVO boardVO) throws Exception {

		return bbsMngDAO.selectBBSHistoryPreview(boardVO);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.cop.bbs.service.EgovBBSManageService#selectBBSHistoryFileList(egovframework.com.cop.bbs.service.BoardVO)
	 */
	public List<FileVO> selectBBSHistoryFileList(BoardVO boardVO) throws Exception {

		return bbsMngDAO.selectBBSHistoryFileList(boardVO);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.cop.bbs.service.EgovBBSManageService#restorationBBSHistory(egovframework.com.cop.bbs.service.Board)
	 */
	public int restorationBBSHistory(Board board) throws Exception {

		int resultCnt = 0;

		// 게시판, 게시물 ID 확인
		if (board == null || board.getBbsId() == null || "".equals(board.getBbsId()) || board.getNttId() < 1 || "".equals(board.getNttSn())
				|| "".equals(board.getNttSn())) {
			return resultCnt;
		}

		// 게시물 복원
		resultCnt = bbsMngDAO.updateBBSOfHistory(board);

		// 파일 복원
		bbsMngDAO.deleteBBSFileDetail(board); // 파일 삭제
		bbsMngDAO.insertBBSFileDetail(board); // 파일 생성

		if (resultCnt > 0) {
			// history 생성
			board.setActionTy("R"); // 상태(C:생성 / U:수정 / D:삭제 / R:복원)
			insertBoardArticleLog(board);
		}

		return resultCnt;

	}

	/**
	 * 조건에 맞는 게시물 목록을 조회 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#selectBoardArticles(egovframework.com.cop.bbs.brd.service.BoardVO)
	 */
	public BoardVO selectWaterMainPhoto(BoardVO boardVO) throws Exception {

		return bbsMngDAO.selectWaterMainPhoto(boardVO);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.cop.bbs.service.EgovBBSManageService#updateBoardFileSn(egovframework.com.cop.bbs.service.Board)
	 */
	public void updateBoardFileSn(Board board) throws Exception {

		int resultCnt = 0;

		// 첨부파일이 있을경우에만 진행
		if (board.getNewFileSn() != null && !board.getNewFileSn().equals("")) {
			String[] fileInfo = board.getNewFileSn();

			board.setAtchFileId(fileInfo[0].split("\\|")[0]);

			List<EgovMap> fileList = bbsMngDAO.selectBBSFileList(board);

			if (fileList != null && !fileList.isEmpty()) {

				bbsMngDAO.deleteBoardFileInfo(board);

				for (int i = 0; i < fileInfo.length; i++) {

					for (int j = 0; j < fileList.size(); j++) {

						if ((fileList.get(j).get("fileSn") + "").equals(fileInfo[i].split("\\|")[1])) {

							fileList.get(j).put("fileSn", i + "");

							resultCnt += bbsMngDAO.insertBoardFileSn(fileList.get(j));

							break;
						}
					}

				}

			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.cop.bbs.service.EgovBBSManageService#selectBBSList(egovframework.com.cop.bbs.service.Board)
	 */
	public List<EgovMap> selectBBSList(Board Board) throws Exception {
		return bbsMngDAO.selectBBSList(Board);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see egovframework.com.cop.bbs.service.EgovBBSManageService#realCopyBoardArticles(egovframework.com.cop.bbs.service.Board)
	 */
	public int realCopyBoardArticles(Board board) throws Exception {

		if (board.getBbsId() == null || "".equals(board.getBbsId()) || board.getCopyNttId() == null || "".equals(board.getCopyNttId())
				|| board.getLinkBbsId() == null || "".equals(board.getLinkBbsId())) {

			return 0;

		}

		int resultCnt = 0;

		String bbsId = board.getBbsId();
		String[] nttIds = board.getCopyNttId().split(",");
		String[] linkBbsIds = board.getLinkBbsId().split(",");

		EgovMap oriBbsInfo = null;
		String atchFileId = null;

		for (String nttId : nttIds) {

			board.setBbsId(bbsId);
			board.setNttId(Long.parseLong(nttId));

			// 복사대상 게시물 정보 조회
			oriBbsInfo = bbsMngDAO.selectRealCopyBbsInfo(board);

			if (oriBbsInfo == null || oriBbsInfo.isEmpty())
				continue;

			atchFileId = oriBbsInfo.get("atchFileId") + "";

			for (String linkBbsId : linkBbsIds) {

				board.setBbsId(bbsId);
				board.setNttId(Long.parseLong(nttId));
				board.setLinkBbsId(linkBbsId);
				board.setLinkNttId(nttIdgenService.getNextIntegerId());

				if (atchFileId != null && !"".equals(atchFileId)) {
					board.setLinkAtchFileId(idgenService.getNextStringId());
					board.setAtchFileId(atchFileId);
				} else {
					board.setLinkAtchFileId(atchFileId);
				}

				if (bbsMngDAO.insertLinkBbs(board) > 0) {

					resultCnt++;

					// 파일 처리
					if (atchFileId != null && !"".equals(atchFileId)) {
						bbsMngDAO.insertLinkAtchFile(board);
						bbsMngDAO.insertLinkAtchFileDetail(board);
					}

					// history 생성
					board.setBbsId(board.getLinkBbsId());
					board.setNttId(board.getLinkNttId());
					board.setActionTy("C"); // 상태(C:생성 / U:수정 / D:삭제 / R:복원)

					insertBoardArticleLog(board);

				}

			}

		}

		return resultCnt;

	}
}
