package egovframework.com.cop.bbs.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.sym.mnu.mcm.service.MenuCreatVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 게시물 관리를 위한 데이터 접근 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------      --------    ---------------------------
 *   2009.3.19  이삼섭          최초 생성
 *   2011.09.22 서준식          nttId IdGen 서비스로 변경
 * </pre>
 */
@Repository("BBSManageDAO")
public class BBSManageDAO extends EgovComAbstractDAO {

    /**
     * 게시판에 게시물을 등록 한다.
     * 
     * @param board
     * @throws Exception
     */
    public int insertBoardArticle(Board board) throws Exception {
    	
    	return Integer.parseInt(insert("BBSManageDAO.insertBoardArticle", board) + "");
    }

    /**
     * 게시판에 답변 게시물을 등록 한다.
     * 
     * @param board
     * @throws Exception
     */
    public long replyBoardArticle(Board board) throws Exception {
	long nttId = (Long)getSqlMapClientTemplate().queryForObject("BBSManageDAO.selectMaxNttId");
	board.setNttId(nttId);
	
	insert("BBSManageDAO.replyBoardArticle", board);

	//----------------------------------------------------------
	// 현재 글 이후 게시물에 대한 NTT_NO를 증가 (정렬을 추가하기 위해)
	//----------------------------------------------------------
	//String parentId = board.getParnts();
	long nttNo = (Long)getSqlMapClientTemplate().queryForObject("BBSManageDAO.getParentNttNo", board);

	board.setNttNo(nttNo);
	update("BBSManageDAO.updateOtherNttNo", board);

	board.setNttNo(nttNo + 1);
	update("BBSManageDAO.updateNttNo", board);

	return nttId;
    }
	
    /**
     * 게시물 한 건에 대하여 상세 내용을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception {
    	
		return (BoardVO)selectByPk("BBSManageDAO.selectBoardArticle", boardVO); //COMTNBBS
	
    }

    /**
     * 조건에 맞는 게시물 목록을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectBoardArticleList(BoardVO boardVO) throws Exception {
	return (List<BoardVO>) list("BBSManageDAO.selectBoardArticleList", boardVO);
    }

    /**
     * 통합검색
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public List<BoardVO> selectBoardArticleList2(BoardVO boardVO) throws Exception {
    	return (List<BoardVO>) list("BBSManageDAO.selectBoardArticleList2", boardVO);
    }
    
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectBoardArticleList3(BoardVO boardVO) throws Exception {
    	return (List<BoardVO>) list("BBSManageDAO.selectBoardArticleList3", boardVO);
    }
    
    /**
     * 조건에 맞는 게시물 목록에 대한 전체 건수를 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectBoardArticleListCnt(BoardVO boardVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("BBSManageDAO.selectBoardArticleListCnt", boardVO);
    }

    /**
     * 게시물 한 건의 내용을 수정 한다.
     * 
     * @param board
     * @throws Exception
     */
    public void updateBoardArticle(Board board) throws Exception {
    	update("BBSManageDAO.updateBoardArticle", board);
    }

    /**
     * 게시물 한 건을 삭제 한다.
     * 
     * @param board
     * @throws Exception
     */
    public int deleteBoardArticle(Board board) throws Exception {
    	return update("BBSManageDAO.deleteBoardArticle", board);
    }
    
    /**
     * 게시물 여러 건을 삭제해제 한다.
     * 
     * @param board
     * @throws Exception
     */
    public int deleteBoardArticlesUndo(Board board) throws Exception {
    	
		String strArr[] = board.getNttDocSe().split(",");
		int flagCnt = 0;
		if(strArr.length > 0){
			for(int i=0; i<strArr.length; i++){
				BoardVO paramVO = new BoardVO();
				paramVO.setNttDocSe(strArr[i]);
				paramVO.setBbsId(board.getBbsId());
				paramVO.setLastUpdusrId(board.getLastUpdusrId());
				update("BBSManageDAO.deleteBoardArticlesUndo", paramVO);
				flagCnt++;
			}
		}
    	
    	return flagCnt;
    }

    /**
     * 게시물에 대한 조회 건수를 수정 한다.
     * 
     * @param board
     * @throws Exception
     */
    public void updateInqireCo(BoardVO boardVO) throws Exception {
	update("BBSManageDAO.updateInqireCo", boardVO);
    }

    /**
     * 게시물에 대한 현재 조회 건수를 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectMaxInqireCo(BoardVO boardVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("BBSManageDAO.selectMaxInqireCo", boardVO);
    }

    /**
     * 게시판에 대한 목록을 정렬 순서로 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectNoticeListForSort(Board board) throws Exception {
	return (List<BoardVO>) list("BBSManageDAO.selectNoticeListForSort", board);
    }

    /**
     * 게사판에 대한 정렬 순서를 수정 한다.
     * 
     * @param sortList
     * @throws Exception
     */
    public void updateSortOrder(List<BoardVO> sortList) throws Exception {
	BoardVO vo;
	Iterator<BoardVO> iter = sortList.iterator();
	while (iter.hasNext()) {
	    vo = (BoardVO)iter.next();
	    update("BBSManageDAO.updateSortOrder", vo);
	}
    }

    /**
     * 게시판에 대한 현재 게시물 번호의 최대값을 구한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public long selectNoticeItemForSort(Board board) throws Exception {
	return (Long)getSqlMapClientTemplate().queryForObject("BBSManageDAO.selectNoticeItemForSort", board);
    }

    /**
     * 방명록에 대한 목록을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectGuestList(BoardVO boardVO) throws Exception {
	return (List<BoardVO>) list("BBSManageDAO.selectGuestList", boardVO);
    }

    /**
     * 방명록에 대한 목록 건수를 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectGuestListCnt(BoardVO boardVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("BBSManageDAO.selectGuestListCnt", boardVO);
    }

    /**
     * 방명록 내용을 삭제 한다.
     * 
     * @param boardVO
     * @throws Exception
     */
    public void deleteGuestList(BoardVO boardVO) throws Exception {
	update("BBSManageDAO.deleteGuestList", boardVO);
    }

    /**
     * 방명록에 대한 패스워드를 조회 한다.
     * 
     * @param board
     * @return
     * @throws Exception
     */
    public String getPasswordInf(Board board) throws Exception {
	return (String)getSqlMapClientTemplate().queryForObject("BBSManageDAO.getPasswordInf", board);
    }
    
    
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectImgBoardArticleList(BoardVO boardVO) throws Exception {
    	
    	if(boardVO.getBbsTyCode().trim().equals("BBST12")){ //동영상게시판일 경우 첨부한 파일 중에 이미지 파일만 리스트에 출력
    		boardVO.setImgSearchCnd(1);
    	}else{
    		boardVO.setImgSearchCnd(0); //이미지 리스트인 경우 파일 인덱스가 0인(가장 첫번째 이미지)만을 노출
    	}
    	return (List<BoardVO>) list("BBSManageDAO.selectImgBoardArticleList", boardVO);
    }
    
    public String getVodFileSn(Board board) throws Exception {
    	return (String)getSqlMapClientTemplate().queryForObject("BBSManageDAO.getVodFileSn", board);
    }
    
    public int selectImgBoardArticleListCnt(BoardVO boardVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("BBSManageDAO.selectImgBoardArticleListCnt", boardVO);
    }
    
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectBoardArticleList_R(BoardVO boardVO) throws Exception {
	return (List<BoardVO>) list("BBSManageDAO.selectBoardArticleList_R", boardVO);
    }
    
    @SuppressWarnings("unchecked")
	public List<BoardVO> selectImgBoardArticleList_R(BoardVO boardVO) throws Exception {
    	if(boardVO.getBbsTyCode().trim().equals("BBST12")){ //동영상게시판일 경우 첨부한 파일 중에 이미지 파일만 리스트에 출력
    		boardVO.setImgSearchCnd(1);
    	}else{
    		boardVO.setImgSearchCnd(0); //이미지 리스트인 경우 파일 인덱스가 0인(가장 첫번째 이미지)만을 노출
    	}
    	return (List<BoardVO>) list("BBSManageDAO.selectImgBoardArticleList_R", boardVO);
    }
    
    public BoardVO selectDialogReplyArticle(BoardVO boardVO)throws Exception {
		return (BoardVO)selectByPk("BBSManageDAO.selectDialogReplyArticle", boardVO); //COMTNBBS
	}

	@SuppressWarnings("unchecked")
	public List<BoardVO> selectBoardDialogArticles(BoardVO boardVO) throws Exception {
		return (List<BoardVO>) list("BBSManageDAO.selectBoardDialogArticleList", boardVO);
    }
	
	public int selectBoardDialogArticlesCnt(BoardVO boardVO) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject("BBSManageDAO.selectBoardDialogArticleListCnt", boardVO);
    }
	
	public void realDeleteBoardArticles(BoardVO board) throws Exception {
		
		String strArr[] = board.getNttDocSe().split(",");
		if(strArr.length > 0){
			for(int i=0; i<strArr.length; i++){
				update("BBSManageDAO.realDeleteBoardArticles", strArr[i]);
			}
		}
		
    }
	 
	@SuppressWarnings("unchecked")
	public List<BoardVO> selectBoardArticles_obj(BoardVO boardVO) throws Exception {
    	return (List<BoardVO>) list("BBSManageDAO.selectBoardArticles_obj", boardVO);
    }
    
    public int selectBoardArticles_objCnt(BoardVO boardVO) throws Exception {
    	return (Integer)getSqlMapClientTemplate().queryForObject("BBSManageDAO.selectBoardArticles_objCnt", boardVO);
    }
    
    /**
     * 게시글 변경이력 생성
     * @param board
     * @return
     * @throws Exception
     */
    int insertBoardArticleLog(Board board) throws Exception {
    	
    	return Integer.parseInt(insert("BBSManageDAO.insertBoardArticleLog", board) + "");
    }
    
    /**
     * 게시글 첨부파일 변경이력 생성
     * @param board
     * @return
     * @throws Exception
     */
    void insertBoardArticleFileLog(Board board) throws Exception {
    	
    	insert("BBSManageDAO.insertBoardArticleFileLog", board);
    }
    
    /**
     * 게시글 이력 조회
     * @param Board
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	List<BoardVO> selectBBSHistory(Board Board) throws Exception{
    	
        return (List<BoardVO>) list("BBSManageDAO.selectBBSHistory", Board);
    }
    
    /**
     * 컨텐츠 이력 미리보기
     * @param boardVO
     * @return
     * @throws Exception
     */
    public BoardVO selectBBSHistoryPreview(BoardVO boardVO) throws Exception {
    	return (BoardVO)selectByPk("BBSManageDAO.selectBBSHistoryPreview", boardVO);
    }
    
    /**
     * 컨텐츠 이력 파일조회
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	List<FileVO> selectBBSHistoryFileList(BoardVO boardVO) throws Exception {
    	
    	return (List<FileVO>) list("BBSManageDAO.selectBBSHistoryFileList", boardVO);
    }
    
    /**
     * 게시물 복원
     * @param board
     * @return
     * @throws Exception
     */
    int updateBBSOfHistory(Board board) throws Exception {
    	
    	return update("BBSManageDAO.updateBBSOfHistory", board);
    }
    
    /**
     * 파일 정보 삭제
     * @param board
     * @return
     * @throws Exception
     */
    int deleteBBSFileDetail(Board board) throws Exception {
    	
    	return update("BBSManageDAO.deleteBBSFileDetail", board);
    }
    
    /**
     * 파일 정보 생성
     * @param board
     * @throws Exception
     */
    void insertBBSFileDetail(Board board) throws Exception {
    	
    	insert("BBSManageDAO.insertBBSFileDetail", board);
    }
    
    /**
     * 컨텐츠 이력 미리보기
     * @param boardVO
     * @return
     * @throws Exception
     */
    BoardVO selectWaterMainPhoto(BoardVO boardVO) throws Exception {
    	
		return (BoardVO)selectByPk("BBSManageDAO.selectWaterMainPhoto", boardVO);
    }
    
    /**
     * 파일 리스트 조회
     * @param board
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	List<EgovMap> selectBBSFileList(Board board) throws Exception{
    	
    	return (List<EgovMap>)list("BBSManageDAO.selectBBSFileList", board);
    }
    
    /**
     * 파일 정보 삭제
     * @param board
     * @return
     * @throws Exception
     */
    int deleteBoardFileInfo(Board board)throws Exception {
    	
		return update("BBSManageDAO.deleteBoardFileInfo", board);
    }
    
    /**
     * 파일 정보 입력
     * @param board
     * @return
     * @throws Exception
     */
    int insertBoardFileSn(EgovMap board)throws Exception {
    	
		return update("BBSManageDAO.insertBoardFileSn", board);
    }
    
    /**
     * 게시판 목록 조회
     * @param Board
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	List<EgovMap> selectBBSList(Board Board) throws Exception{
    	
		return (List<EgovMap>) list("BBSManageDAO.selectBBSList", Board);
		
	}
    
    /**
     * 게시물 복사(연동 게시판)
     * @param board
     * @return
     * @throws Exception
     */
    int insertLinkBbs(Board board) throws Exception {
    	
    	return update("BBSManageDAO.insertLinkBbs", board);
    }
    
    /**
     * 첨부파일 정보 생성
     * @param board
     * @return
     * @throws Exception
     */
    int insertLinkAtchFile(Board board) throws Exception {
    	
    	return update("BBSManageDAO.insertLinkAtchFile", board);
    }
    
    /**
     * 첨부파일 상세 정보 생성
     * @param board
     * @return
     * @throws Exception
     */
    int insertLinkAtchFileDetail(Board board) throws Exception {
    	
    	return update("BBSManageDAO.insertLinkAtchFileDetail", board);
    }
    
    /**
     * 복사 대상 게시물 정보 조회
     * @param board
     * @return
     * @throws Exception
     */
    EgovMap selectRealCopyBbsInfo(Board board) throws Exception{
    	
    	return (EgovMap)selectByPk("BBSManageDAO.selectRealCopyBbsInfo", board);
    	
    }
    
    
}
