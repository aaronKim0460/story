package egovframework.com.cop.bbs.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.sym.ccm.cca.service.CmmnCodeVO;
import egovframework.com.sym.ccm.cca.service.EgovCcmCmmnCodeManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.json.JSONSerializer;


/**
 * 게시판 속성관리를 위한 컨트롤러  클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2009.3.12  이삼섭          최초 생성
 *   2009.06.26	한성곤		    2단계 기능 추가 (댓글관리, 만족도조사)
 *	 2011.07.21 안민정          커뮤니티 관련 메소드 분리 (->EgovBBSAttributeManageController)
 *	 2011.8.26	정진오			IncludedInfo annotation 추가
 *   2011.09.15 서준식           2단계 기능 추가 (댓글관리, 만족도조사) 적용방법 변경
 * </pre>
 */

@Controller
public class EgovBBSAttributeManageController {
	

    @Resource(name = "EgovBBSAttributeManageService")
    private EgovBBSAttributeManageService bbsAttrbService;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
    
    @Resource(name = "CmmnCodeManageService")
    private EgovCcmCmmnCodeManageService cmmnCodeManageService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    


    @Autowired
    private DefaultBeanValidator beanValidator;

    //Logger log = Logger.getLogger(this.getClass());
    
    /**
     * 신규 게시판 마스터 등록을 위한 등록페이지로 이동한다.
     * 
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/addBBSMaster.do")
    public String addBBSMaster(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, ModelMap model) throws Exception {
	BoardMaster boardMaster = new BoardMaster();

	ComDefaultCodeVO vo = new ComDefaultCodeVO();
	
	vo.setCodeId("COM004");
	
	List codeResult = cmmUseService.selectCmmCodeDetail(vo);
	
	model.addAttribute("typeList", codeResult);

	vo.setCodeId("COM009");
	
	codeResult = cmmUseService.selectCmmCodeDetail(vo);
	
	//게시판 머릿말코드
	CmmnCodeVO searchCodeVO = new CmmnCodeVO();
	searchCodeVO.setRecordCountPerPage(999999);
    searchCodeVO.setFirstIndex(0);
    searchCodeVO.setSearchCondition("clCode");
    searchCodeVO.setSearchKeyword("BCC");
    
	List CmmnCodeList = cmmnCodeManageService.selectCmmnCodeList(searchCodeVO);
    model.addAttribute("cmmnCodeList", CmmnCodeList);
	
	model.addAttribute("attrbList", codeResult);
	model.addAttribute("boardMaster", boardMaster);

	//-------- COM78 은 사이트 구분 _ HGB-----------------
	vo.setCodeId("COM078");
	List siteResult = cmmUseService.selectCmmCodeDetail(vo);
	//-------- COM78 은 사이트 구분 _ HGB-----------------
	
	model.addAttribute("siteType", siteResult);
	//---------------------------------
	// 2009.06.26 : 2단계 기능 추가
	//---------------------------------
	//String flag = EgovProperties.getProperty("Globals.addedOptions");
	//if (flag != null && flag.trim().equalsIgnoreCase("true")) {
	//    model.addAttribute("addedOptions", "true");
	//}
	////-------------------------------
	
	
	//---------------------------------
	// 2011.09.15 : 2단계 기능 추가 반영 방법 변경
	//---------------------------------

	
	if(EgovComponentChecker.hasComponent("EgovBBSCommentService")){
		model.addAttribute("useComment", "true");
	}
	if(EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")){
		model.addAttribute("useSatisfaction", "true");
	}
	
	////-------------------------------

	return "egovframework/com/cop/bbs/EgovBoardMstrRegist";
    }

    /**
     * 신규 게시판 마스터 정보를 등록한다.
     * 
     * @param boardMasterVO
     * @param boardMaster
     * @param status
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/cop/bbs/insertBBSMasterInf.do")
    public String insertBBSMasterInf(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, @ModelAttribute("boardMaster") BoardMaster boardMaster,
	    BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(boardMaster, bindingResult);
	if (bindingResult.hasErrors()) {

	    ComDefaultCodeVO vo = new ComDefaultCodeVO();
	    
	    vo.setCodeId("COM004");
	    
	    List codeResult = cmmUseService.selectCmmCodeDetail(vo);
	    
	    model.addAttribute("typeList", codeResult);

	    vo.setCodeId("COM009");
	   
	    codeResult = cmmUseService.selectCmmCodeDetail(vo);
	    
	    model.addAttribute("attrbList", codeResult);

	    return "egovframework/com/cop/bbs/EgovBoardMstrRegist";
	}
	
	if (isAuthenticated) {
	    boardMaster.setFrstRegisterId(user.getUniqId());
	    boardMaster.setUseAt("Y");
	    boardMaster.setTrgetId("SYSTEMDEFAULT_REGIST");

	    String bbsId = bbsAttrbService.insertBBSMastetInf(boardMaster);
	    
	}

	return "forward:/cop/bbs/SelectBBSMasterInfs.do";
    }

    /**
     * 게시판 마스터 목록을 조회한다.
     * 
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @IncludedInfo(name="게시판속성관리",order = 180 ,gid = 40)
    @RequestMapping("/cop/bbs/SelectBBSMasterInfs.do")
    public String selectBBSMasterInfs(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, ModelMap model) throws Exception {
    	
		boardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardMasterVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardMasterVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardMasterVO.getPageUnit());
		paginationInfo.setPageSize(boardMasterVO.getPageSize());
	
		boardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = bbsAttrbService.selectBBSMasterInfs(boardMasterVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));	
		model.addAttribute("siteList", map.get("siteList"));
		model.addAttribute("paginationInfo", paginationInfo);
	
		return "egovframework/com/cop/bbs/EgovBoardMstrList";
    }

    /**
     * 게시판 마스터 상세내용을 조회한다.
     * 
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/SelectBBSMasterInf.do")
    public String selectBBSMasterInf(@ModelAttribute("searchVO") BoardMasterVO searchVO, ModelMap model) throws Exception {
	BoardMasterVO vo = bbsAttrbService.selectBBSMasterInf(searchVO);

	model.addAttribute("result", vo);
	
	//---------------------------------
	// 2009.06.26 : 2단계 기능 추가
	//---------------------------------
	//String flag = EgovProperties.getProperty("Globals.addedOptions");
	//if (flag != null && flag.trim().equalsIgnoreCase("true")) {
	//    model.addAttribute("addedOptions", "true");
	//}
	////-------------------------------
	
	//---------------------------------
	// 2011.09.15 : 2단계 기능 추가 반영 방법 변경
	//---------------------------------
	
	if(EgovComponentChecker.hasComponent("EgovBBSCommentService")){
		model.addAttribute("useComment", "true");
	}
	if(EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")){
		model.addAttribute("useSatisfaction", "true");
	}
	
	////-------------------------------
	
	 //-------- COM78 은 사이트 구분 _ HGB-----------------
	ComDefaultCodeVO cVo = new ComDefaultCodeVO();
	cVo.setCodeId("COM078");
	List codeResult = cmmUseService.selectCmmCodeDetail(cVo);
	//-------- COM78 은 사이트 구분 _ HGB-----------------
	model.addAttribute("siteType", codeResult);
	
	ComDefaultCodeVO vo1 = new ComDefaultCodeVO();
	
	vo1.setCodeId("COM004");
	codeResult = cmmUseService.selectCmmCodeDetail(vo1);
	model.addAttribute("typeList", codeResult);

	vo1.setCodeId("COM009");
	codeResult = cmmUseService.selectCmmCodeDetail(vo1);
	model.addAttribute("attrbList", codeResult);
	
	//게시판 머릿말코드
	CmmnCodeVO searchCodeVO = new CmmnCodeVO();
	searchCodeVO.setRecordCountPerPage(999999);
	searchCodeVO.setFirstIndex(0);
	searchCodeVO.setSearchCondition("clCode");
	searchCodeVO.setSearchKeyword("BCC");
	    
	List CmmnCodeList = cmmnCodeManageService.selectCmmnCodeList(searchCodeVO);
	model.addAttribute("cmmnCodeList", CmmnCodeList);
	
	return "egovframework/com/cop/bbs/EgovBoardMstrUpdt";
    }

    /**
     * 게시판 마스터 정보를 수정한다.
     * 
     * @param boardMasterVO
     * @param boardMaster
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/UpdateBBSMasterInf.do")
    public String updateBBSMasterInf(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, @ModelAttribute("boardMaster") BoardMaster boardMaster,
	    BindingResult bindingResult, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(boardMaster, bindingResult);
	if (bindingResult.hasErrors()) {
	    BoardMasterVO vo = bbsAttrbService.selectBBSMasterInf(boardMasterVO);

	    model.addAttribute("result", vo);
	    
	    ComDefaultCodeVO vo1 = new ComDefaultCodeVO();
		
		vo1.setCodeId("COM004");
		List codeResult = cmmUseService.selectCmmCodeDetail(vo1);
		model.addAttribute("typeList", codeResult);

		vo1.setCodeId("COM009");
		codeResult = cmmUseService.selectCmmCodeDetail(vo1);
		model.addAttribute("attrbList", codeResult);
	    
	    return "egovframework/com/cop/bbs/EgovBoardMstrUpdt";
	}

	if (isAuthenticated) {
	    boardMaster.setLastUpdusrId(user.getUniqId());
	    
	    System.out.println("boardMaster.bbsAttrbCode"+boardMaster.getBbsAttrbCode());
	    System.out.println("boardMaster.getUserListPge"+boardMaster.getUserListPge());
	    System.out.println("boardMaster.getUserDetailPge"+boardMaster.getUserDetailPge());
	    
	    bbsAttrbService.updateBBSMasterInf(boardMaster);
	}

	return "forward:/cop/bbs/SelectBBSMasterInf.do";
    }

    /**
     * 게시판 마스터 정보를 삭제한다.
     * 
     * @param boardMasterVO
     * @param boardMaster
     * @param status
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/DeleteBBSMasterInf.do")
    public String deleteBBSMasterInf(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, @ModelAttribute("boardMaster") BoardMaster boardMaster,
	    SessionStatus status) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	if (isAuthenticated) {
	    boardMaster.setLastUpdusrId(user.getUniqId());
	    bbsAttrbService.deleteBBSMasterInf(boardMaster);
	}
	// status.setComplete();
	return "forward:/cop/bbs/SelectBBSMasterInfs.do";
    }

    /**
     * 게시판 마스터 선택 팝업을 위한 목록을 조회한다.
     * 
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/SelectBBSMasterInfsPop.do")
    public String selectBBSMasterInfsPop(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, ModelMap model) throws Exception {
	boardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardMasterVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(boardMasterVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(boardMasterVO.getPageUnit());
	paginationInfo.setPageSize(boardMasterVO.getPageSize());

	boardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	boardMasterVO.setUseAt("Y");
	
	Map<String, Object> map = bbsAttrbService.selectNotUsedBdMstrList(boardMasterVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));	
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/com/cop/bbs/EgovBoardMstrListPop";
    }
    
    @RequestMapping("/cop/bbs/SelectBBSMasterInfs_obj.do")
    public String selectBBSMasterInfs_obj(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, ModelMap model) throws Exception {
	boardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardMasterVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(boardMasterVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(boardMasterVO.getPageUnit());
	paginationInfo.setPageSize(boardMasterVO.getPageSize());

	boardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = bbsAttrbService.selectBBSMasterInfs(boardMasterVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));	
	model.addAttribute("siteList", map.get("siteList"));
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/com/cop/bbs/EgovBbsObjList";
    }
    
    @RequestMapping("/cop/bbs/SelectBBSMasterInfs_trget.do")
    public String selectBBSMasterInfs_trget(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, ModelMap model) throws Exception {
	boardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardMasterVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(boardMasterVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(boardMasterVO.getPageUnit());
	paginationInfo.setPageSize(boardMasterVO.getPageSize());

	boardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = bbsAttrbService.selectBBSMasterInfs(boardMasterVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));	
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/com/cop/bbs/EgovBbsObjTrgetPop";
    }
    
    /**
     * 게시물 승인
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/bbsObjConfirm.do")
    public String bbsObjConfirm(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
		Map<String, Object> map = bbsAttrbService.selectBbsObjConfirmList(boardMasterVO);
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));	
		model.addAttribute("paginationInfo", map.get("paginationInfo"));
		model.addAttribute("siteList", map.get("siteList"));
		model.addAttribute("userAuthority", user.getAuthority());
		
		return "egovframework/com/cop/bbs/EgovBbsObjConf";
    }
    
    /**
     * 게시물 미리보기
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/contentBBSPreview.do")
    public String contentBBSPreview(@ModelAttribute("board") BoardVO boardVO, ModelMap model) throws Exception{
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		// 게시글 조회
    	List<EgovMap> bbsDetail = bbsAttrbService.selectContentBBSPreview(boardVO);

		// 파일 조회
		List<EgovMap> fileList = bbsAttrbService.selectBBSFileList(boardVO);

		model.addAttribute("boardInfo", boardVO);
		model.addAttribute("bbsDetail", bbsDetail.size() > 0 ? bbsDetail.get(0) : null);
		model.addAttribute("fileList", fileList);
		
		model.addAttribute("userAuthority", user.getAuthority());

		return "egovframework/com/cop/bbs/EgovBbsPreviewPop";
    }
    
    /**
     * 게시물 승인
     * @param boardVO
     * @param response
     * @param model
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/bbsConfirm.do")
	public void bbsConfirm(@ModelAttribute("board") BoardVO boardVO,
			HttpServletResponse response, ModelMap model)  throws Exception{
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	Map<String, String> resultMap = new HashMap<String, String>();
    	
    	// 권한 확인
    	if(!"ROLE_ADMIN".equals(user.getAuthority())){
    		
    		resultMap.put("result", "A");
    	}else{
    		
    		int resultCnt = bbsAttrbService.updateBBSConfmSttus(boardVO);

    		if(resultCnt > 0){
    			resultMap.put("result", "Y");
    		}
    	}

		String rtnVal = JSONSerializer.toJSON(resultMap).toString();
		EgovWebUtil.sendMessage(response, rtnVal);

	}
    
    /**
     * 게시물 승인대기
     * @param boardVO
     * @param response
     * @param model
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/bbsConfirmWait.do")
    public void bbsConfirmWait(@ModelAttribute("board") BoardVO boardVO,
    		HttpServletResponse response, ModelMap model)  throws Exception{
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	Map<String, String> resultMap = new HashMap<String, String>();
    	
    	// 권한 확인
    	if(!"ROLE_ADMIN".equals(user.getAuthority())){
    		
    		resultMap.put("result", "A");
    	}else{
    		
    		int resultCnt = bbsAttrbService.updateBBSConfmWaitSttus(boardVO);
    		
    		if(resultCnt > 0){
    			resultMap.put("result", "Y");
    		}
    	}
    	
    	String rtnVal = JSONSerializer.toJSON(resultMap).toString();
    	EgovWebUtil.sendMessage(response, rtnVal);
    	
    }
    
    /**
     * 게시물 파일 다운로드
     * @param boardVO
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/cop/bbs/fileDown.do")
    public void fileDown(@ModelAttribute("board") BoardVO boardVO
    		, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 파일 조회
    	List<EgovMap> fileList = bbsAttrbService.selectBBSFileList(boardVO);

		if(fileList == null || fileList.isEmpty())throw new Exception();

		FileVO fvo = new FileVO();
		
		fvo.setFileStreCours(fileList.get(0).get("fileStreCours") + "");
		fvo.setStreFileNm(fileList.get(0).get("streFileNm") + "");
		fvo.setOrignlFileNm(fileList.get(0).get("orignlFileNm") + "");
		

		File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
		int fSize = (int)uFile.length();

		if(fSize > 0){
			String mimetype = "application/x-msdownload";

			response.setContentType(mimetype);
			setDisposition(fvo.getOrignlFileNm(), request, response);
			response.setContentLength(fSize);

			BufferedInputStream in = null;
			BufferedOutputStream out = null;

			try{

				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());

				FileCopyUtils.copy(in, out);
				out.flush();
			} finally {

				EgovResourceCloseHelper.close(in, out);
			}

		}else{

			response.setContentType("application/x-msdownload");

			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + fvo.getOrignlFileNm() + "</h2>");
			printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("<br><br><br>&copy; webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
    }
    
    /**
     * Disposition 지정하기.
     *
     * @param filename
     * @param request
     * @param response
     * @throws Exception
     */
    private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) {		// IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			throw new IOException("Not supported browser");
		}

		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)){
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
    }

    /**
     * 브라우저 구분 얻기.
     *
     * @param request
     * @return
     */
    private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Trident") > -1) {	// IE11 문자열 깨짐 방지
            return "Trident";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        return "Firefox";
    }
}
