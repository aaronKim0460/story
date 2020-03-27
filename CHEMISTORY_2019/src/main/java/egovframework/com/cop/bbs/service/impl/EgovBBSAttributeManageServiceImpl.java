package egovframework.com.cop.bbs.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardUseInf;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.cop.com.service.EgovUserInfManageService;
import egovframework.com.cop.com.service.UserInfVO;
import egovframework.com.sym.prm.service.ProgrmManageVO;
import egovframework.com.sym.prm.service.impl.ProgrmManageDAO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 게시판 속성관리를 위한 서비스 구현 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.3.24  이삼섭          최초 생성
 *   2009.06.26	한성곤		2단계 기능 추가 (댓글관리, 만족도조사)
 *   2011.09.15 서준식       댓글, 만족도 조사 적용 방법 변경
 * </pre>
 */
@Service("EgovBBSAttributeManageService")
//public class EgovBBSAttributeManageServiceImpl extends AbstractServiceImpl implements EgovBBSAttributeManageService {
public class EgovBBSAttributeManageServiceImpl extends EgovAbstractServiceImpl implements EgovBBSAttributeManageService {
    @Resource(name = "BBSAttributeManageDAO")
    private BBSAttributeManageDAO attrbMngDAO;

    @Resource(name = "BBSUseInfoManageDAO")
    private BBSUseInfoManageDAO bbsUseDAO;

    @Resource(name = "EgovUserInfManageService")
    private EgovUserInfManageService userService;

    @Resource(name = "egovBBSMstrIdGnrService")
    private EgovIdGnrService idgenService;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name="progrmManageDAO")
    private ProgrmManageDAO progrmManageDAO;

    //---------------------------------
    // 2009.06.26 : 2단계 기능 추가
    //---------------------------------
    @Resource(name = "BBSAddedOptionsDAO")
    private BBSAddedOptionsDAO addedOptionsDAO;
    
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    /**
     * 등록된 게시판 속성정보를 삭제한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#deleteBBSMasterInf(egovframework.com.cop.bbs.brd.service.BoardMaster)
     */
    public void deleteBBSMasterInf(BoardMaster boardMaster) throws Exception {
	attrbMngDAO.deleteBBSMasterInf(boardMaster);

	BoardUseInf bdUseInf = new BoardUseInf();

	bdUseInf.setBbsId(boardMaster.getBbsId());
	bdUseInf.setLastUpdusrId(boardMaster.getLastUpdusrId());

	bbsUseDAO.deleteBBSUseInfByBoardId(bdUseInf);
    }

	/**
	 * 신규 게시판 속성정보를 생성한다.
	 *
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#insertBBSMastetInf(egovframework.com.cop.bbs.brd.service.BoardMaster)
	 */
	public String insertBBSMastetInf(BoardMaster boardMaster) throws Exception {
		String bbsId = idgenService.getNextStringId();

		boardMaster.setBbsId(bbsId);

		attrbMngDAO.insertBBSMasterInf(boardMaster);

		// ---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		// ---------------------------------
		if (boardMaster.getOption().equals("comment") || boardMaster.getOption().equals("stsfdg")) {
			addedOptionsDAO.insertAddedOptionsInf(boardMaster);
		}
		// //-------------------------------

		if ("Y".equals(boardMaster.getBbsUseFlag())) {
			BoardUseInf bdUseInf = new BoardUseInf();

			bdUseInf.setBbsId(bbsId);
			bdUseInf.setTrgetId(boardMaster.getTrgetId());
			bdUseInf.setRegistSeCode(boardMaster.getRegistSeCode());
			bdUseInf.setFrstRegisterId(boardMaster.getFrstRegisterId());
			bdUseInf.setUseAt("Y");

			bbsUseDAO.insertBBSUseInf(bdUseInf);

			UserInfVO userVO = new UserInfVO();
			userVO.setTrgetId(boardMaster.getTrgetId());

			List<UserInfVO> tmpList = null;
			Iterator<UserInfVO> iter = null;

			if ("REGC05".equals(boardMaster.getRegistSeCode())) {
				tmpList = userService.selectAllClubUser(userVO);
				iter = tmpList.iterator();
				while (iter.hasNext()) {
					bdUseInf = new BoardUseInf();

					bdUseInf.setBbsId(bbsId);
					bdUseInf.setTrgetId(((UserInfVO) iter.next()).getUniqId());
					bdUseInf.setRegistSeCode("REGC07");
					bdUseInf.setUseAt("Y");
					bdUseInf.setFrstRegisterId(boardMaster.getFrstRegisterId());

					bbsUseDAO.insertBBSUseInf(bdUseInf);
				}
			} else if ("REGC06".equals(boardMaster.getRegistSeCode())) {
				tmpList = userService.selectAllCmmntyUser(userVO);
				iter = tmpList.iterator();
				while (iter.hasNext()) {
					bdUseInf = new BoardUseInf();

					bdUseInf.setBbsId(bbsId);
					bdUseInf.setTrgetId(((UserInfVO) iter.next()).getUniqId());
					bdUseInf.setRegistSeCode("REGC07");
					bdUseInf.setUseAt("Y");
					bdUseInf.setFrstRegisterId(boardMaster.getFrstRegisterId());

					bbsUseDAO.insertBBSUseInf(bdUseInf);
				}
			}


		}

		insertProgrm(boardMaster);

		return bbsId;
	}

	private void insertProgrm(BoardMaster boardMaster) throws Exception {
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM078");
		vo.setCode(boardMaster.getSiteType());
		String site = cmmUseService.selectCmmCodeVal(vo).getCodeNm().toLowerCase(Locale.getDefault());
		int bbsNo = Integer.parseInt(StringUtils.right(boardMaster.getBbsId(), 12));

		ProgrmManageVO progrmManageVO = new ProgrmManageVO();
		progrmManageVO.setProgrmFileNm(site + "-bbs-" + bbsNo);
		progrmManageVO.setProgrmStrePath("/" + site);
		progrmManageVO.setProgrmKoreanNm(boardMaster.getBbsNm());
		progrmManageVO.setProgrmDc(boardMaster.getBbsNm());
		progrmManageVO.setUrl("/cop/bbs/selectBoardList.do?bbsId=" + boardMaster.getBbsId());
		progrmManageDAO.insertProgrm(progrmManageVO);
	}

	/**
     * 게시판 속성 정보의 목록을 조회 한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#selectAllBBSMasteInf(egovframework.com.cop.bbs.brd.service.BoardMasterVO)
     */
    public List<BoardMasterVO> selectAllBBSMasteInf(BoardMasterVO vo) throws Exception {
	return attrbMngDAO.selectAllBBSMasteInf(vo);
    }

    /**
     * 게시판 속성정보 한 건을 상세조회한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#selectBBSMasterInf(egovframework.com.cop.bbs.brd.service.BoardMasterVO)
     */
    public BoardMasterVO selectBBSMasterInf(BoardMaster searchVO) throws Exception {
	//---------------------------------
	// 2009.06.26 : 2단계 기능 추가
	//---------------------------------
	//return attrbMngDAO.selectBBSMasterInf(searchVO);

    BoardMasterVO result = attrbMngDAO.selectBBSMasterInf(searchVO);

	//String flag = EgovProperties.getProperty("Globals.addedOptions");
	//if (flag != null && flag.trim().equalsIgnoreCase("true")) {
	if(EgovComponentChecker.hasComponent("EgovBBSCommentService") || EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")){//2011.09.15
	    BoardMasterVO options = addedOptionsDAO.selectAddedOptionsInf(searchVO);

	    if (options != null) {
		if (options.getCommentAt().equals("Y")) {
		    result.setOption("comment");
		}

		if (options.getStsfdgAt().equals("Y")) {
		    result.setOption("stsfdg");
		}
	    } else {
		result.setOption("na");	// 미지정 상태로 수정 가능 (이미 지정된 경우는 수정 불가로 처리)
	    }
	}

	return result;
	////-------------------------------

    }

    /**
     * 게시판 속성 정보의 목록을 조회 한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#selectBBSMasterInfs(egovframework.com.cop.bbs.brd.service.BoardMasterVO)
     */
    public Map<String, Object> selectBBSMasterInfs(BoardMasterVO searchVO) throws Exception {
    	
		List<BoardMasterVO> result = attrbMngDAO.selectBBSMasterInfs(searchVO);
		int cnt = result == null || result.isEmpty() ? 0 : result.get(0).getTotCnt();
		
		// 사이트구분
		List<EgovMap> siteList = attrbMngDAO.selectSiteList();
	
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));
		map.put("siteList", siteList);

		return map;
    }

    /**
     * 게시판 속성정보를 수정한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#updateBBSMasterInf(egovframework.com.cop.bbs.brd.service.BoardMaster)
     */
    public void updateBBSMasterInf(BoardMaster boardMaster) throws Exception {
	attrbMngDAO.updateBBSMasterInf(boardMaster);

	//---------------------------------
	// 2009.06.26 : 2단계 기능 추가
	//---------------------------------

	if (boardMaster.getOption().equals("comment") || boardMaster.getOption().equals("stsfdg")) {
	    if (boardMaster.getOption().equals("na")) {
		return;
	    }
	    BoardMasterVO options = addedOptionsDAO.selectAddedOptionsInf(boardMaster);

	    if (options == null) {
		boardMaster.setFrstRegisterId(boardMaster.getLastUpdusrId());
		addedOptionsDAO.insertAddedOptionsInf(boardMaster);
	    } else {
		//수정 기능 제외 (새롭게 선택사항을 지정한 insert만 처리함)
		//addedOptionsDAO.updateAddedOptionsInf(boardMaster);
	    egovLogger.debug("BBS Master update ignored...");
	    }
	}
	////-------------------------------
    }

    /**
     * 템플릿의 유효여부를 점검한다.
     *
     * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#validateTemplate(egovframework.com.cop.bbs.brd.service.BoardMasterVO)
     */
    public void validateTemplate(BoardMasterVO searchVO) throws Exception {
    	egovLogger.debug("validateTemplate method ignored...");
    }

    /**
     * 사용중인 게시판 속성 정보의 목록을 조회 한다.
     */
    public Map<String, Object> selectBdMstrListByTrget(BoardMasterVO vo) throws Exception {
	List<BoardMasterVO> result = attrbMngDAO.selectBdMstrListByTrget(vo);
	int cnt = attrbMngDAO.selectBdMstrListCntByTrget(vo);

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 커뮤니티, 동호회에서 사용중인 게시판 속성 정보의 목록을 전체조회 한다.
     */
    public List<BoardMasterVO> selectAllBdMstrByTrget(BoardMasterVO vo) throws Exception {
	return attrbMngDAO.selectAllBdMstrByTrget(vo);
    }

    /**
     * 사용중이지 않은 게시판 속성 정보의 목록을 조회 한다.
     */
    public Map<String, Object> selectNotUsedBdMstrList(BoardMasterVO searchVO) throws Exception {
	List<BoardMasterVO> result = attrbMngDAO.selectNotUsedBdMstrList(searchVO);
	int cnt = attrbMngDAO.selectNotUsedBdMstrListCnt(searchVO);

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    public BoardMasterVO selectBBSMasterInfMenuNo(BoardMaster searchVO) throws Exception {
    	//---------------------------------
    	// 2009.06.26 : 2단계 기능 추가
    	//---------------------------------
    	//return attrbMngDAO.selectBBSMasterInf(searchVO);

    	BoardMasterVO result = attrbMngDAO.selectBBSMasterInfMenuNo(searchVO);

    	//String flag = EgovProperties.getProperty("Globals.addedOptions");
    	//if (flag != null && flag.trim().equalsIgnoreCase("true")) {
    	if(EgovComponentChecker.hasComponent("EgovBBSCommentService") || EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")){//2011.09.15
    	    BoardMasterVO options = addedOptionsDAO.selectAddedOptionsInf(searchVO);

    	    if (options != null) {
    		if (options.getCommentAt().equals("Y")) {
    		    result.setOption("comment");
    		}

    		if (options.getStsfdgAt().equals("Y")) {
    		    result.setOption("stsfdg");
    		}
    	    } else {
    		result.setOption("na");	// 미지정 상태로 수정 가능 (이미 지정된 경우는 수정 불가로 처리)
    	    }
    	}

    	return result;
    	////-------------------------------

      }


    public BoardMasterVO selectBBSMasterInfNttId(BoardMaster searchVO) throws Exception {
    	//---------------------------------
    	// 2009.06.26 : 2단계 기능 추가
    	//---------------------------------
    	//return attrbMngDAO.selectBBSMasterInf(searchVO);

        BoardMasterVO result = attrbMngDAO.selectBBSMasterInfNttId(searchVO);

    	//String flag = EgovProperties.getProperty("Globals.addedOptions");
    	//if (flag != null && flag.trim().equalsIgnoreCase("true")) {
    	if(EgovComponentChecker.hasComponent("EgovBBSCommentService") || EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")){//2011.09.15
    	    BoardMasterVO options = addedOptionsDAO.selectAddedOptionsInf(searchVO);

    	    if (options != null) {
    		if (options.getCommentAt().equals("Y")) {
    		    result.setOption("comment");
    		}

    		if (options.getStsfdgAt().equals("Y")) {
    		    result.setOption("stsfdg");
    		}
    	    } else {
    		result.setOption("na");	// 미지정 상태로 수정 가능 (이미 지정된 경우는 수정 불가로 처리)
    	    }
    	}

    	return result;
    	////-------------------------------

        }

    public BoardMasterVO selectBBSPhoto(BoardMaster searchVO) throws Exception {

    	BoardMasterVO result = attrbMngDAO.selectBBSPhoto(searchVO);

    	return result;
      }
    
    /* (non-Javadoc)
     * @see egovframework.com.cop.bbs.service.EgovBBSAttributeManageService#selectBbsObjConfirmList(egovframework.com.cop.bbs.service.BoardMasterVO)
     */
    public Map<String, Object> selectBbsObjConfirmList(BoardMasterVO boardMasterVO) throws Exception {
    	
    	// 페이징 설정
    	boardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardMasterVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardMasterVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardMasterVO.getPageUnit());
		paginationInfo.setPageSize(boardMasterVO.getPageSize());
	
		boardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		// 게시물 리스트 조회
		List<EgovMap> result = attrbMngDAO.selectBbsObjConfirmList(boardMasterVO);
		
		// 총 게시물 수
		String cnt = result != null && !result.isEmpty() ? result.get(0).get("cnt") + "" : "0";
		
		if(cnt == null || "".equals(cnt))cnt = "0";
		
		paginationInfo.setTotalRecordCount(Integer.parseInt(cnt));
		
		// 사이트구분
		List<EgovMap> siteList = attrbMngDAO.selectSiteList();
			
    	Map<String, Object> map = new HashMap<String, Object>();

    	map.put("resultList", result);
    	map.put("resultCnt", cnt);
    	map.put("paginationInfo", paginationInfo);
    	map.put("siteList", siteList);
	
    	return map;
    }
    
    /* (non-Javadoc)
     * @see egovframework.com.cop.bbs.service.EgovBBSAttributeManageService#contentBBSPreview(egovframework.com.cop.bbs.service.BoardVO)
     */
    public List<EgovMap> selectContentBBSPreview(BoardVO boardVO) throws Exception{
    	
    	return attrbMngDAO.selectContentBBSPreview(boardVO);
	}
    
    /* (non-Javadoc)
     * @see egovframework.com.cop.bbs.service.EgovBBSAttributeManageService#selectBBSFileList(egovframework.com.cop.bbs.service.BoardVO)
     */
    public List<EgovMap> selectBBSFileList(BoardVO boardVO) throws Exception {
    	
    	return attrbMngDAO.selectBBSFileList(boardVO);
    }
    
    /* (non-Javadoc)
     * @see egovframework.com.cop.bbs.service.EgovBBSAttributeManageService#updateBBSConfmSttus(egovframework.com.cop.bbs.service.BoardVO)
     */
    public int updateBBSConfmSttus(BoardVO boardVO) throws Exception {
    	
    	int resultCnt = 0;
    	
    	String[] bbsInfo = boardVO.getCode().split(",");
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	boardVO.setLastUpdusrId(user.getName());
    	
    	for(int i=0; i<bbsInfo.length; i++){
    		
    		boardVO.setBbsId(bbsInfo[i].split("\\|")[0]);
    		boardVO.setNttId(Integer.parseInt(bbsInfo[i].split("\\|")[1]));
    		
    		resultCnt += attrbMngDAO.updateBBSConfmSttus(boardVO);
    	}
    	
    	return resultCnt;
    	
    }
    
    /* (non-Javadoc)
     * @see egovframework.com.cop.bbs.service.EgovBBSAttributeManageService#updateBBSConfmSttus(egovframework.com.cop.bbs.service.BoardVO)
     */
    public int updateBBSConfmWaitSttus(BoardVO boardVO) throws Exception {
    	
    	int resultCnt = 0;
    	
    	String[] bbsInfo = boardVO.getCode().split(",");
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	boardVO.setLastUpdusrId(user.getName());
    	
    	for(int i=0; i<bbsInfo.length; i++){
    		
    		boardVO.setBbsId(bbsInfo[i].split("\\|")[0]);
    		boardVO.setNttId(Integer.parseInt(bbsInfo[i].split("\\|")[1]));
    		
    		resultCnt += attrbMngDAO.updateBBSConfmWaitSttus(boardVO);
    	}
    	
    	return resultCnt;
    	
    }
}
