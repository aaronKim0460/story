package egovframework.com.cop.bbs.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.hsqldb.lib.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import spamClasses.RequestSpamApi;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.cop.bbs.service.EgovBBSCommentService;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.com.cop.bbs.service.EgovBBSSatisfactionService;
import egovframework.com.cop.bbs.service.EgovBBSScrapService;
import egovframework.com.cop.com.service.EgovUserInfManageService;
import egovframework.com.sts.bst.service.EgovBbsStatsService;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.fdl.string.EgovStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 게시물 관리를 위한 컨트롤러 클래스
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
 *   2009.3.19  이삼섭          최초 생성
 *   2009.06.29	한성곤			2단계 기능 추가 (댓글관리, 만족도조사)
 *   2011.07.01 안민정		 	댓글, 스크랩, 만족도 조사 기능의 종속성 제거
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *   2011.09.07 서준식           유효 게시판 게시일 지나도 게시물이 조회되던 오류 수정
 * </pre>
 */


@Controller
public class EgovBBSManageController {

	private static final Logger LOG = Logger.getLogger(EgovBBSManageController.class.getName());

    @Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

    @Resource(name = "EgovBBSAttributeManageService")
    private EgovBBSAttributeManageService bbsAttrbService;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;

    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "EgovUserInfManageService")
    private EgovUserInfManageService userInfService;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;
    
    /** EgovBbsStatsService */
   	@Resource(name = "bbsStatsService")
    private EgovBbsStatsService bbsStatsService;
    //---------------------------------
    // 2009.06.29 : 2단계 기능 추가
    // 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
    //---------------------------------
    @Autowired(required=false)
    private EgovBBSCommentService bbsCommentService;

    @Autowired(required=false)
    private EgovBBSSatisfactionService bbsSatisfactionService;

    @Autowired(required=false)
    private EgovBBSScrapService bbsScrapService;
    ////-------------------------------
    
    /** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;
	
    @Autowired
    private DefaultBeanValidator beanValidator;

    //protected Logger log = Logger.getLogger(this.getClass());

    /**
     * XSS 방지 처리.
     *
     * @param data
     * @return
     */
    protected String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }

        String ret = data;

        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }

    
    /**
     * 게시물에 대한 목록을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectBoardList.do")
    public String selectBoardArticles(HttpServletRequest request ,@ModelAttribute("searchVO") BoardVO boardVO,  ModelMap model) throws Exception {
    	
		//-------- 목록 페이지에서 세션이 있는 경우에만 "등록" 버튼 출력을 위해서 세션 체크
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		//사용자, 관리자 판단 Tiles 사용
		String tilesPrefix = ""; //사용자용 화면 노출
		String menuNo = request.getParameter("menuNo");
		
		if(user != null){
			model.addAttribute("sessionUniqId", user.getUniqId());
			model.addAttribute("userAuthority", user.getAuthority());
			// 일반 관리자에게도 승인대기건 노출
			boardVO.setConfmSttus("A");
			
			tilesPrefix = "";//관리자용 화면 노출
		}else{
			model.addAttribute("sessionUniqId", null);
			boardVO.setConfmSttus("C");
			if(StringUtils.isEmpty(menuNo)){
				model.addAttribute("resultMsg", "fail.url.msg");
				return "forward:/Relay.do?_forward_page=/code404.jsp";
			}
		}
		if(StringUtils.isNotEmpty(menuNo)){
			ComDefaultVO searchVO = new ComDefaultVO();
	    	//searchVO.setPageUnit(Integer.parseInt(menuNo));
			searchVO.setMenuLongId(Long.parseLong(menuNo));
	    	MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(searchVO);
	    	model.addAttribute("menuManageVO", resultVO);	
	    	searchVO.setSearchKeyword(menuNo);
	    	model.addAttribute("menuManager", menuManageService.selectMenuAdminManage(searchVO));	    	
	    	tilesPrefix = ""; //사용자용 화면 노출
		}			
		//-------- 목록 페이지에서 세션이 있는 경우에만 "등록" 버튼 출력을 위해서 세션 체크
		
		
		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());

		BoardMasterVO vo = new BoardMasterVO();

		vo.setBbsId(boardVO.getBbsId());

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

		//-------------------------------
		// 방명록이면 방명록 URL로 forward
		//-------------------------------
		if (master != null && "BBST04".equals(master.getBbsTyCode())){
		    return "forward:/cop/bbs/selectGuestList.do";
		}
		////-----------------------------

		boardVO.setPageUnit(master.getBbsPageUnit());
		boardVO.setPageSize(master.getBbsPageSize());

		if(StringUtils.isEmpty(request.getParameter("moveSite")) && StringUtils.isEmpty(tilesPrefix)){
			boardVO.setNttSe("");
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		boardVO.setBbsTyCode(master.getBbsTyCode());
		boardVO.setBbsAttrbCode(master.getBbsAttrbCode());
		
		//Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		//-------------------------------
		// 기본 BBS template 지정
		//-------------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		    master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
		////-----------------------------

		model.addAttribute("resultList", map.get("resultList"));
		//model.addAttribute("sublist", map.get("sublist"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("tilesPrefix", tilesPrefix);
		
		//---------------분류1 코드(머리말) ------------------------------------------
		if (StringUtils.isNotEmpty(master.getCl1Code())) {
			ComDefaultCodeVO voCode = new ComDefaultCodeVO();
			voCode.setCodeId(master.getCl1Code());
			
			List<CmmnDetailCode> cl1CodeResult = cmmUseService.selectCmmCodeDetail(voCode);
			model.addAttribute("codeList", cl1CodeResult);
		}
		//---------------분류1 코드(머리말) ------------------------------------------
		
		//---------------분류2 코드(머리말) ------------------------------------------
		if (StringUtils.isNotEmpty(master.getCl2Code())) {
			ComDefaultCodeVO voCode2 = new ComDefaultCodeVO();
			voCode2.setCodeId(master.getCl2Code());
					
			List<CmmnDetailCode> cl2CodeResult = cmmUseService.selectCmmCodeDetail(voCode2);
			model.addAttribute("codeList2", cl2CodeResult);
		}
		//---------------분류2 코드(머리말) ------------------------------------------
		
		String siteTp = "";
		if(StringUtils.isNotEmpty(master.getCodeNm())){
			siteTp = master.getCodeNm().toLowerCase() + "/";
			if(user != null && StringUtils.isEmpty(menuNo)){
				siteTp = "";
			}
		}
		
	System.out.println(master.getMngrListPge());
		
		return tilesPrefix + master.getMngrListPge();
    }
    
    /**
     * 게시물에 대한 상세 정보를 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectBoardArticle.do")
    public String selectBoardArticle(HttpServletRequest request , @ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		//사용자, 관리자 판단 Tiles 사용
		String tilesPrefix = ""; //사용자용 화면 노출
		
		String menuNo = EgovStringUtil.null2void(request.getParameter("menuNo"));
		if(user != null){
			model.addAttribute("sessionUniqId", user.getUniqId());
			// 일반 관리자에게도 승인대기건 노출
			boardVO.setConfmSttus("A");
			
			tilesPrefix = "";//관리자용 화면 노출
		}else{
			model.addAttribute("sessionUniqId", null);
			boardVO.setConfmSttus("C");
			if(StringUtils.isEmpty(menuNo)){
				model.addAttribute("resultMsg", "fail.url.msg");
				return "forward:/Relay.do?_forward_page=/code404.jsp";
			}
		}
				
		// 조회수 증가 여부 지정
		boardVO.setPlusCount(true);

		//---------------------------------
		// 2009.06.29 : 2단계 기능 추가
		//---------------------------------
		if (!boardVO.getSubPageIndex().equals("")) {
		    boardVO.setPlusCount(false);
		}
		////-------------------------------

		//----------------------------
		// template 처리 (기본 BBS template 지정  포함)
		//----------------------------
		BoardMasterVO master = new BoardMasterVO();

		master.setBbsId(boardVO.getBbsId());

		BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);
		
		if (masterVo.getBbsTyCode().equals("BBST11")) {
		    boardVO.setPlusCount(false);
		}
		
		BoardVO vo = bbsMngService.selectBoardArticle(boardVO);
		vo.setSiteType(boardVO.getSiteType());
		model.addAttribute("result", vo);
		//CommandMap의 형태로 개선????
		
		if(StringUtils.isNotEmpty(menuNo) && !menuNo.equals("0")){
			ComDefaultVO searchVO = new ComDefaultVO();
	    	//searchVO.setPageUnit(Integer.parseInt(menuNo));
			searchVO.setMenuLongId(Long.parseLong(menuNo));
	    	MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(searchVO);
	    	resultVO.setPublicNuriTy(vo.getPublicNuriTy()); //게시글 상세보기 누리코드 설정 추가
	    	model.addAttribute("menuManageVO", resultVO);
	    	searchVO.setSearchKeyword(menuNo);
	    	model.addAttribute("menuManager", menuManageService.selectMenuAdminManage(searchVO));	    	
	    	tilesPrefix = ""; //사용자용 화면 노출//관리자용 화면 노출
		}	
		
		if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
		    masterVo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", masterVo);
		////-----------------------------

		//----------------------------
		// 2009.06.29 : 2단계 기능 추가
		// 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
		//----------------------------
		if (bbsCommentService != null){
			if (bbsCommentService.canUseComment(boardVO.getBbsId())) {
			    model.addAttribute("useComment", "true");
			}
		}
		if (bbsSatisfactionService != null) {
			if (bbsSatisfactionService.canUseSatisfaction(boardVO.getBbsId())) {
			    model.addAttribute("useSatisfaction", "true");
			}
		}
		if (bbsScrapService != null ) {
			if (bbsScrapService.canUseScrap()) {
			    model.addAttribute("useScrap", "true");
			}
		}

		//==============여기서 통계
		System.out.println("======================================================================================");
		System.out.println("masterVo.getBbsTyCode() : "+ masterVo.getBbsTyCode());
		System.out.println("masterVo.getBbsAttrbCode()" + masterVo.getBbsAttrbCode());
		System.out.println("boardVO.getBbsId()" + boardVO.getBbsId());
		System.out.println("Long.toString(boardVO.getNttId())" + Long.toString(boardVO.getNttId()));
		System.out.println("======================================================================================");
		
		bbsStatsService.bbsRdCntStats(masterVo.getBbsTyCode(), masterVo.getBbsAttrbCode(), boardVO.getBbsId(), Long.toString(boardVO.getNttId()));
		
		
		//==============여기서 통계

		////--------------------------
		////-------동영상 게시판의 경우 동영상 파일의 filesn을 알아야 화면에 출력할 수 있으므로(강제할 수 없음 -> 게시자가 어떤 순서로 파일을 업로드 하는지 예측할 수 없으므로)-------------------
		if(masterVo.getBbsTyCode().equals("BBST12")){
			Board lbbsVo = new Board();
			lbbsVo.setAtchFileId(vo.getAtchFileId());
			String fileSn  = bbsMngService.getVodFileSn(lbbsVo);
			model.addAttribute("fileSnStr", fileSn);
		}
		////-------동영상 게시판의 경우 동영상 파일의 filesn을 알아야 화면에 출력할 수 있으므로(강제할 수 없음 -> 게시자가 어떤 순서로 파일을 업로드 하는지 예측할 수 없으므로)-------------------
		
		
		model.addAttribute("boardVO", boardVO);

		String siteTp = "";
		if(StringUtils.isNotEmpty(masterVo.getCodeNm())){
			siteTp = masterVo.getCodeNm().toLowerCase() + "/";
			if(user != null && StringUtils.isEmpty(menuNo)){
				siteTp = "";
			}			
		}	
		model.addAttribute("tilesPrefix", tilesPrefix);
		
		return tilesPrefix + masterVo.getMngrDetailPge();
    }
    
    /**
     * 게시물 등록을 위한 등록페이지로 이동한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/addBoardArticle.do")
    public String addBoardArticle(HttpServletRequest request ,@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		BoardMasterVO vo = new BoardMasterVO();
		BoardMasterVO bdMstr = new BoardMasterVO();
		vo.setBbsId(boardVO.getBbsId());
		bdMstr = bbsAttrbService.selectBBSMasterInf(vo);

		
		//사용자, 관리자 판단 Tiles 사용
		String tilesPrefix = ""; //사용자용 화면 노출
		
		String menuNo = request.getParameter("menuNo");
		if (isAuthenticated) {

		    vo.setUniqId(user.getUniqId());

		    model.addAttribute("bdMstr", bdMstr);
		    model.addAttribute("sessionNm", user.getName());
		    
		    tilesPrefix = "";//관리자용 화면 노출
		    
		    if(StringUtils.isNotEmpty(menuNo) && !menuNo.equals("0")){
				ComDefaultVO searchVO = new ComDefaultVO();
		    	//searchVO.setPageUnit(Integer.parseInt(menuNo));
				searchVO.setMenuLongId(Long.parseLong(menuNo));
		    	MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(searchVO);
		    	model.addAttribute("menuManageVO", resultVO);	
		    	searchVO.setSearchKeyword(menuNo);
		    	model.addAttribute("menuManager", menuManageService.selectMenuAdminManage(searchVO));		    	
		    	tilesPrefix = ""; //사용자용 화면 노출//관리자용 화면 노출
			}			    
		}else{
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		//----------------------------
		// 기본 BBS template 지정
		//----------------------------
		if (bdMstr.getTmplatCours() == null || bdMstr.getTmplatCours().equals("")) {
		    bdMstr.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bdMstr);
		model.addAttribute("tilesPrefix", tilesPrefix);
		
		//---------------분류1 코드(머리말) ------------------------------------------
		if (StringUtils.isNotEmpty(bdMstr.getCl1Code())) {
			ComDefaultCodeVO voCode = new ComDefaultCodeVO();
			voCode.setCodeId(bdMstr.getCl1Code());
					
			List<CmmnDetailCode> cl1CodeResult = cmmUseService.selectCmmCodeDetail(voCode);
			model.addAttribute("codeList", cl1CodeResult);
		}
		//---------------분류1 코드(머리말) ------------------------------------------
				
		//---------------분류2 코드(머리말) ------------------------------------------
		if (StringUtils.isNotEmpty(bdMstr.getCl2Code())) {
			ComDefaultCodeVO voCode2 = new ComDefaultCodeVO();
			voCode2.setCodeId(bdMstr.getCl2Code());
							
			List<CmmnDetailCode> cl2CodeResult = cmmUseService.selectCmmCodeDetail(voCode2);
			model.addAttribute("codeList2", cl2CodeResult);
		}
		//---------------분류2 코드(머리말) ------------------------------------------
				
		String siteTp = "";
		if(StringUtils.isNotEmpty(bdMstr.getCodeNm())){
			siteTp = bdMstr.getCodeNm().toLowerCase() + "/";
			if(user != null && StringUtils.isEmpty(menuNo)){
				siteTp = "";
			}			
		}
		
		return tilesPrefix + bdMstr.getMngrRegistPge();
    }
    
    /**
     * 게시물을 등록한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/insertBoardArticle.do")
    public String insertBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, SessionStatus status,
	    ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		// 게시판 승인여부 
		String  strConfmUseYn = ""; 

		BoardMasterVO master = new BoardMasterVO();
	    BoardMasterVO vo = new BoardMasterVO();

	    vo.setBbsId(boardVO.getBbsId());
	    vo.setUniqId(user.getUniqId());

	    master = bbsAttrbService.selectBBSMasterInf(vo);
	    
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("bdMstr", master);

		    //----------------------------
		    // 기본 BBS template 지정
		    //----------------------------
		    if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		    	master.setTmplatCours("css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		    }

		    model.addAttribute("brdMstrVO", master);

		    strConfmUseYn = master.getConfmUseYn();
		    ////-----------------------------

		    return master.getMngrRegistPge();
		}else{
			strConfmUseYn = master.getConfmUseYn();
		}
		
		if (isAuthenticated) {

		    List<FileVO> result = null;
		    String atchFileId = "";
		    String thumbFileId = "";

		    // 썸네일 설정
		    FileVO thumbVO = new FileVO();
		    thumbVO.setThumbnailYn("Y");
		    thumbVO.setThumbnailWidth(214);
		    thumbVO.setThumbnailHeight(145);
		    
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    
		    // 썸네일 업로더 처리
		    MultipartFile thumbFile = files.get("thumbFile");
		    
		    //20170123 썸네일 == null인데 썸네일 등록이 진행되서 에러가 나는 경우를 방지하기 위해 수정 
		    if(thumbFile != null){
			    if (!thumbFile.isEmpty()) {
			    	// 1. 썸네일 정보를 멀티파일정보에서 꺼내서 썸네일 저장을 시작한다.
				    final Map<String, MultipartFile> thFiles = new HashMap<String, MultipartFile>();
				    thFiles.put("thumbFile", thumbFile);
				    
				    // 2. 썸네일 파일 정보를 저장한다.
				    List<FileVO> thumbResult = null;
				    thumbResult = fileUtil.parseFileInfNier(thFiles, "BBSTH_", 0, "", "" , "boardatch/" + board.getBbsId(), thumbVO);
				    
				    thumbFileId = fileMngService.insertFileInfs(thumbResult);
				    
				    // 3. 썸네일 정보를 멀티파일정보에서 삭제한다.
				    files.remove("thumbFile");
			    }
		    }
		    
		    if (!files.isEmpty()) {
		    	
		    	result = fileUtil.parseFileInfNier(files, "BBS_", 0, "", "" , "boardatch/" + board.getBbsId(), thumbVO);

		    	atchFileId = fileMngService.insertFileInfs(result);
		    }

		    board.setAtchFileId(atchFileId);
		    board.setThumbFileId(thumbFileId);
		    board.setFrstRegisterId(user.getUniqId());
		    board.setBbsId(board.getBbsId());

		    board.setBbsNttSe(bdMstr.getBbsNttSe());
		    //board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)

		    //개시일자 슈퍼관리자 여부 - 화면에서 값을 가져오면 가져온 값으로 처리한다.	    
		    if (StringUtil.isEmpty(board.getConfmSttus())) {
		    	if("ROLE_ADMIN".equals(user.getAuthority()) || strConfmUseYn.equals("N")){
		    		board.setConfmSttus("C");
		    	}else{
		    		board.setConfmSttus("R");
		    	}
		    }

		    if(board.getPassword().equals("dummy")){
		    	board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    }

		    board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장

		    if(board.getNtcrNm().equals("")){ //게시물의 ntcrNm이 없는 경우 로그인한 계정의 이름으로 저장
		    	board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		    }

		    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
		    board.setBbsTyCode(bdMstr.getBbsTyCode());

		    bbsMngService.insertBoardArticle(board);
		    
			model.addAttribute("resultMsg", "success.common.insert");
			return "forward:/Relay.do?_forward_page=/cop/bbs/selectBoardList.do?bbsId=" + boardVO.getBbsId();			
		}else{
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";	
		}

    }    
    
    /**
     * 게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/addReplyBoardArticle.do")
    public String addReplyBoardArticle(HttpServletRequest request, @ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		BoardMasterVO master = new BoardMasterVO();
		BoardMasterVO vo = new BoardMasterVO();

		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		master = bbsAttrbService.selectBBSMasterInf(vo);

		
		model.addAttribute("result", boardVO);

		String tilesPrefix = "";//관리자용 화면 노출
		
		String menuNo = request.getParameter("menuNo");
		if (isAuthenticated) {

		    vo.setUniqId(user.getUniqId());

		    model.addAttribute("bdMstr", master);
		    model.addAttribute("sessionNm", user.getName());
		    
		    tilesPrefix = "";//관리자용 화면 노출
		    
		    if(StringUtils.isNotEmpty(menuNo) && !menuNo.equals("0")){
				ComDefaultVO searchVO = new ComDefaultVO();
		    	//searchVO.setPageUnit(Integer.parseInt(menuNo));
				searchVO.setMenuLongId(Long.parseLong(menuNo));
		    	MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(searchVO);
		    	model.addAttribute("menuManageVO", resultVO);	
		    	searchVO.setSearchKeyword(menuNo);
		    	model.addAttribute("menuManager", menuManageService.selectMenuAdminManage(searchVO));		    	
		    	tilesPrefix = ""; //사용자용 화면 노출//사용자 화면 노출
			}			    
		}else{
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
		
		//----------------------------
		// 기본 BBS template 지정
		//----------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		    master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", master);
		////-----------------------------
		
		//---------------본문글 상세정보 ------------------------------------------
		BoardVO detailVo = bbsMngService.selectBoardArticle(boardVO);
		model.addAttribute("replyResult", detailVo);
		//---------------본문글 상세정보 ------------------------------------------
		
		//---------------분류1 코드(머리말) ------------------------------------------
		if (StringUtils.isNotEmpty(master.getCl1Code())) {
			ComDefaultCodeVO voCode = new ComDefaultCodeVO();
			voCode.setCodeId(master.getCl1Code());
							
			List<CmmnDetailCode> cl1CodeResult = cmmUseService.selectCmmCodeDetail(voCode);
			model.addAttribute("codeList", cl1CodeResult);
		}
		//---------------분류1 코드(머리말) ------------------------------------------
						
		//---------------분류2 코드(머리말) ------------------------------------------
		if (StringUtils.isNotEmpty(master.getCl2Code())) {
			ComDefaultCodeVO voCode2 = new ComDefaultCodeVO();
			voCode2.setCodeId(master.getCl2Code());
									
			List<CmmnDetailCode> cl2CodeResult = cmmUseService.selectCmmCodeDetail(voCode2);
			model.addAttribute("codeList2", cl2CodeResult);
		}
		//---------------분류2 코드(머리말) ------------------------------------------
		
		//return "egovframework/com/cop/bbs/EgovNoticeReply";
		return tilesPrefix + master.getMngrRegistPge();
    }

    /**
     * 게시물에 대한 답변을 등록한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/replyBoardArticle.do")
    public String replyBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
	    SessionStatus status) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		BoardMasterVO master = new BoardMasterVO();
	    BoardMasterVO vo = new BoardMasterVO();

	    vo.setBbsId(boardVO.getBbsId());
	    vo.setUniqId(user.getUniqId());

	    master = bbsAttrbService.selectBBSMasterInf(vo);
	    
		// 게시판 승인여부 
		String  strConfmUseYn = ""; 
				
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
		    model.addAttribute("bdMstr", master);
		    model.addAttribute("result", boardVO);
		    
		    //----------------------------
			// 기본 BBS template 지정
			//----------------------------
			if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
			    master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
			}

			model.addAttribute("brdMstrVO", master);
			////-----------------------------

			//---------------본문글 상세정보 ------------------------------------------
			BoardVO detailVo = bbsMngService.selectBoardArticle(boardVO);
			model.addAttribute("replyResult", detailVo);
			//---------------본문글 상세정보 ------------------------------------------
			
			//---------------분류1 코드(머리말) ------------------------------------------
			if (StringUtils.isNotEmpty(master.getCl1Code())) {
				ComDefaultCodeVO voCode = new ComDefaultCodeVO();
				voCode.setCodeId(master.getCl1Code());
								
				List<CmmnDetailCode> cl1CodeResult = cmmUseService.selectCmmCodeDetail(voCode);
				model.addAttribute("codeList", cl1CodeResult);
			}
			//---------------분류1 코드(머리말) ------------------------------------------
							
			//---------------분류2 코드(머리말) ------------------------------------------
			if (StringUtils.isNotEmpty(master.getCl2Code())) {
				ComDefaultCodeVO voCode2 = new ComDefaultCodeVO();
				voCode2.setCodeId(master.getCl2Code());
										
				List<CmmnDetailCode> cl2CodeResult = cmmUseService.selectCmmCodeDetail(voCode2);
				model.addAttribute("codeList2", cl2CodeResult);
			}
			//---------------분류2 코드(머리말) ------------------------------------------
			
			String tilesPrefix = "";//관리자용 화면 노출
			
			//return "egovframework/com/cop/bbs/EgovNoticeReply";
			return tilesPrefix + master.getMngrRegistPge();
		} else {
			strConfmUseYn = master.getConfmUseYn();
		}

		if (isAuthenticated) {
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    String atchFileId = "";

		    // 썸네일 설정
		    FileVO thumbVO = new FileVO();
		    thumbVO.setThumbnailYn("Y");
		    thumbVO.setThumbnailWidth(214);
		    thumbVO.setThumbnailHeight(145);
		    
		    if (!files.isEmpty()) {
			List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "", thumbVO);
			atchFileId = fileMngService.insertFileInfs(result);
		    }

		    board.setAtchFileId(atchFileId);
		    board.setReplyAt("Y");
		    board.setFrstRegisterId(user.getUniqId());
		    board.setBbsId(board.getBbsId());
		    board.setParnts(Long.toString(boardVO.getNttId()));
		    board.setSortOrdr(boardVO.getSortOrdr());
		    board.setReplyLc(Integer.toString(Integer.parseInt(boardVO.getReplyLc()) + 1));

		    //게시 여부	    
		    if("ROLE_ADMIN".equals(user.getAuthority()) || strConfmUseYn.equals("N")){
		    	board.setConfmSttus("C");
			}else{
				board.setConfmSttus("R");
			}

		    if(board.getPassword().equals("dummy")){
		    	board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    }

		    board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장

		    if(board.getNtcrNm().equals("")){ //게시물의 ntcrNm이 없는 경우 로그인한 계정의 이름으로 저장
		    	board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		    }

		    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
		    board.setBbsTyCode(bdMstr.getBbsTyCode());
		    
		    

		    bbsMngService.insertBoardArticle(board);
		}

		return "forward:/cop/bbs/selectBoardList.do";
    }
    
    /**
     * 게시물 수정을 위한 수정페이지로 이동한다.
     * 
     * @param boardVO
     * @param vo
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/forUpdateBoardArticle.do")
    public String selectBoardArticleForUpdt(HttpServletRequest request ,@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model)
	    throws Exception {

		//log.debug(this.getClass().getName()+"selectBoardArticleForUpdt getNttId "+boardVO.getNttId());
		//log.debug(this.getClass().getName()+"selectBoardArticleForUpdt getBbsId "+boardVO.getBbsId());

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if(!isAuthenticated){
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
		
		//사용자, 관리자 판단 Tiles 사용
		String tilesPrefix = ""; //사용자용 화면 노출
		
		String menuNo = request.getParameter("menuNo");
		
		if(user == null){
			model.addAttribute("sessionUniqId", "");
		}else{
			model.addAttribute("sessionUniqId", user.getUniqId());
			model.addAttribute("userAuthority", user.getAuthority());
			boardVO.setFrstRegisterId(user.getUniqId());
			
		    tilesPrefix = "";//관리자용 화면 노출
		    
			if(StringUtils.isNotEmpty(menuNo)){
				ComDefaultVO searchVO = new ComDefaultVO();
		    	//searchVO.setPageUnit(Integer.parseInt(menuNo));
				searchVO.setMenuLongId(Long.parseLong(menuNo));
		    	MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(searchVO);
		    	model.addAttribute("menuManageVO", resultVO);	
		    	searchVO.setSearchKeyword(menuNo);
		    	model.addAttribute("menuManager", menuManageService.selectMenuAdminManage(searchVO));		    	
		    	tilesPrefix = ""; //사용자용 화면 노출//관리자용 화면 노출
			}				
		}

		BoardMaster master = new BoardMaster();
		BoardMasterVO bmvo = new BoardMasterVO();
		BoardVO bdvo = new BoardVO();

		vo.setBbsId(boardVO.getBbsId());

		master.setBbsId(boardVO.getBbsId());

		if(user != null){
			master.setUniqId(user.getUniqId());
		}

	    bmvo = bbsAttrbService.selectBBSMasterInf(master);
	    bdvo = bbsMngService.selectBoardArticle(boardVO);

		model.addAttribute("result", bdvo);
		model.addAttribute("bdMstr", bmvo);

		//----------------------------
		// 기본 BBS template 지정
		//----------------------------
		if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().equals("")) {
		    bmvo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bmvo);
		////-----------------------------

		//---------------분류1 코드(머리말) ------------------------------------------
		if (StringUtils.isNotEmpty(bmvo.getCl1Code())) {
			ComDefaultCodeVO voCode = new ComDefaultCodeVO();
			voCode.setCodeId(bmvo.getCl1Code());
							
			List<CmmnDetailCode> cl1CodeResult = cmmUseService.selectCmmCodeDetail(voCode);
			model.addAttribute("codeList", cl1CodeResult);
		}
		//---------------분류1 코드(머리말) ------------------------------------------
						
		//---------------분류2 코드(머리말) ------------------------------------------
		if (StringUtils.isNotEmpty(bmvo.getCl2Code())) {
			ComDefaultCodeVO voCode2 = new ComDefaultCodeVO();
			voCode2.setCodeId(bmvo.getCl2Code());
									
			List<CmmnDetailCode> cl2CodeResult = cmmUseService.selectCmmCodeDetail(voCode2);
			model.addAttribute("codeList2", cl2CodeResult);
		}
		//---------------분류2 코드(머리말) ------------------------------------------
		
		String siteTp = "";
		if(StringUtils.isNotEmpty(bmvo.getCodeNm())){
			siteTp = bmvo.getCodeNm().toLowerCase() + "/";
			if(user != null && StringUtils.isEmpty(menuNo)){
				siteTp = "";
			}			
		}		
		model.addAttribute("tilesPrefix", tilesPrefix);
		
		return tilesPrefix + bmvo.getMngrUpdtPge();
    }    
    
    /**
     * 게시물에 대한 내용을 삭제한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/deleteBoardArticle.do")
    public String deleteBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
		    board.setLastUpdusrId(user.getUniqId());
		    bbsMngService.deleteBoardArticle(board);
			model.addAttribute("resultMsg", "success.common.delete");
			return "forward:/Relay.do?_forward_page=/cop/bbs/selectBoardList.do?bbsId=" + boardVO.getBbsId();		    
		}

		return "forward:/cop/bbs/selectBoardList.do";
    }
    
    /**== 정리 끝 ==*/    
    
    
    
    /**
     * 게시물에 대한 내용을 수정한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/updateBoardArticle.do")
    public String updateBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
	    SessionStatus status) throws Exception {
    	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String title = multiRequest.getParameter("nttSj");
//		title = new String(title.getBytes("utf-8"), "utf-8");
		
		String originalStr = title; // 테스트 
		String [] charSet = {"utf-8","euc-kr","ksc5601","iso-8859-1","x-windows-949"};
		  
		for (int i=0; i<charSet.length; i++) {
		 for (int j=0; j<charSet.length; j++) {
		  try {
		   System.out.println("[" + charSet[i] +"," + charSet[j] +"] = " + new String(originalStr.getBytes(charSet[i]), charSet[j]));
		  } catch (UnsupportedEncodingException e) {
		   e.printStackTrace();
		  }
		 }
		}
		
		System.out.println("!!! title=="+title);
		
		String atchFileId = boardVO.getAtchFileId();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

		    boardVO.setFrstRegisterId(user.getUniqId());

		    BoardMaster master = new BoardMaster();
		    BoardMasterVO bmvo = new BoardMasterVO();
		    BoardVO bdvo = new BoardVO();

		    master.setBbsId(boardVO.getBbsId());
		    master.setUniqId(user.getUniqId());

		    bmvo = bbsAttrbService.selectBBSMasterInf(master);
		    bdvo = bbsMngService.selectBoardArticle(boardVO);

		    model.addAttribute("result", bdvo);
		    model.addAttribute("bdMstr", bmvo);

		    return master.getMngrUpdtPge();
		}

		if (isAuthenticated) {
			//파일순서 변경
			bbsMngService.updateBoardFileSn(board);
			
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    
		    
		    
		    // 썸네일 설정
		    FileVO thumbVO = new FileVO();
		    thumbVO.setThumbnailYn("Y");
		    thumbVO.setThumbnailWidth(214);
		    thumbVO.setThumbnailHeight(145);
		    
		    String thumbFileId = boardVO.getThumbFileId();
		    
		    // 썸네일 업로더 처리
		    if (StringUtil.isEmpty(thumbFileId)) {
		    	MultipartFile thumbFile = files.get("thumbFile");
		    	//20170123 썸네일 == null인데 썸네일 등록이 진행되서 에러가 나는 경우를 방지하기 위해 수정 
			    if(thumbFile != null){
			    	if (!thumbFile.isEmpty()) {
			    		// 1. 썸네일 정보를 멀티파일정보에서 꺼내서 썸네일 저장을 시작한다.
			    		final Map<String, MultipartFile> thFiles = new HashMap<String, MultipartFile>();
			    		thFiles.put("thumbFile", thumbFile);
			    		
			    		// 2. 썸네일 파일 정보를 저장한다.
			    		List<FileVO> thumbResult = null;
			    		thumbResult = fileUtil.parseFileInfNier(thFiles, "BBSTH_", 0, "", "" , "boardatch/" + board.getBbsId(), thumbVO);
			    		
			    		thumbFileId = fileMngService.insertFileInfs(thumbResult);
			    		
			    		// 3. 썸네일 정보를 멀티파일정보에서 삭제한다.
			    		files.remove("thumbFile");
			    		
			    		// 4. 게시판 정보에 썸네일 아이디를 입력한다.
			    		board.setThumbFileId(thumbFileId);
			    	}
			    }
		    }
		    
		    if (!files.isEmpty()) {
				if ("".equals(atchFileId)) {
				    List<FileVO> result = fileUtil.parseFileInfNier(files, "BBS_", 0, "", "" , "boardatch/" + board.getBbsId(), thumbVO);
				    atchFileId = fileMngService.insertFileInfs(result);
				    board.setAtchFileId(atchFileId);
				} else {
				    FileVO fvo = new FileVO();
				    fvo.setAtchFileId(atchFileId);
				    int cnt = fileMngService.getMaxFileSN(fvo);
				    List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "", thumbVO);
				    fileMngService.updateFileInfs(_result);
				}
		    }

		    
		    board.setLastUpdusrId(user.getUniqId());

		    if(board.getNtcrNm().equals("")){
		    	board.setNtcrNm(user.getName());	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    }

		    if(board.getPassword().equals("")){
		    	board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    }
		    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

		    bbsMngService.updateBoardArticle(board);
		}

		return "forward:/cop/bbs/selectBoardList.do";
    }

    /**
     * 게시물에 여러건을 삭제해제한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/deleteBoardArticlesUndo.do")
    public String deleteBoardArticlesUndo(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
    		@ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	
    	if (isAuthenticated) {
    		board.setLastUpdusrId(user.getUniqId());
    		
    		bbsMngService.deleteBoardArticlesUndo(board);
    	}else{
    		model.addAttribute("resultMsg", "fail.url.msg");
    		return "forward:/Relay.do?_forward_page=/code404.jsp";
    	}
    	
    	return "forward:/cop/bbs/SelectBBSObjList.do";
    }
    
    

    /**
     * 템플릿에 대한 미리보기용 게시물 목록을 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/previewBoardList.do")
    public String previewBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		String template = boardVO.getSearchWrd();	// 템플릿 URL

		BoardMasterVO master = new BoardMasterVO();

		master.setBbsNm("미리보기 게시판");

		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		BoardVO target = null;
		List<BoardVO> list = new ArrayList<BoardVO>();

		target = new BoardVO();
		target.setNttSj("게시판 기능 설명");
		target.setFrstRegisterId("ID");
		target.setFrstRegisterNm("관리자");
		target.setFrstRegisterPnttm("2009-01-01");
		target.setInqireCo(7);
		target.setParnts("0");
		target.setReplyAt("N");
		target.setReplyLc("0");
		target.setUseAt("Y");

		list.add(target);

		target = new BoardVO();
		target.setNttSj("게시판 부가 기능 설명");
		target.setFrstRegisterId("ID");
		target.setFrstRegisterNm("관리자");
		target.setFrstRegisterPnttm("2009-01-01");
		target.setInqireCo(7);
		target.setParnts("0");
		target.setReplyAt("N");
		target.setReplyLc("0");
		target.setUseAt("Y");

		list.add(target);

		boardVO.setSearchWrd("");

		int totCnt = list.size();

		paginationInfo.setTotalRecordCount(totCnt);

		master.setTmplatCours(template);

		model.addAttribute("resultList", list);
		model.addAttribute("resultCnt", Integer.toString(totCnt));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("preview", "true");

		return "egovframework/com/cop/bbs/EgovNoticeList";
    }

    @RequestMapping("/cop/bbs/realDeleteBoardArticles.do")
    public String realDeleteBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
		    board.setLastUpdusrId(user.getUniqId());

		    bbsMngService.realDeleteBoardArticles(boardVO);
		}

		return "forward:/cop/bbs/SelectBBSObjList.do";
    }
    
    /**
	 * 게시물 관리 게시물 조회
	 * @param boardVO
	 * @param model
	 * @throws Exception
	 */
    @RequestMapping("/cop/bbs/SelectBBSObjList.do")
    public String SelectBBSObjList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());

		BoardMasterVO vo = new BoardMasterVO();

		vo.setBbsId(boardVO.getBbsId());

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

		boardVO.setPageUnit(master.getBbsPageUnit());
		boardVO.setPageSize(master.getBbsPageSize());

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		boardVO.setBbsTyCode(master.getBbsTyCode());
		boardVO.setBbsAttrbCode(master.getBbsAttrbCode());

		//Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		Map<String, Object> map = bbsMngService.selectBoardArticles_obj(boardVO, master.getBbsAttrbCode());//2011.09.07
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		//-------------------------------
		// 기본 BBS template 지정
		//-------------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		    master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
		////-----------------------------

		model.addAttribute("resultList", map.get("resultList"));
		//model.addAttribute("sublist", map.get("sublist"));
		model.addAttribute("resultCnt", map.get("resultCnt"));

		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);

		//---------------분류1 코드(머리말) ------------------------------------------
		if (StringUtils.isNotEmpty(master.getCl1Code())) {
			ComDefaultCodeVO voCode = new ComDefaultCodeVO();
			voCode.setCodeId(master.getCl1Code());
									
			List<CmmnDetailCode> cl1CodeResult = cmmUseService.selectCmmCodeDetail(voCode);
			model.addAttribute("codeList", cl1CodeResult);
		}
		//---------------분류1 코드(머리말) ------------------------------------------
								
		//---------------분류2 코드(머리말) ------------------------------------------
		if (StringUtils.isNotEmpty(master.getCl2Code())) {
			ComDefaultCodeVO voCode2 = new ComDefaultCodeVO();
			voCode2.setCodeId(master.getCl2Code());
											
			List<CmmnDetailCode> cl2CodeResult = cmmUseService.selectCmmCodeDetail(voCode2);
			model.addAttribute("codeList2", cl2CodeResult);
		}
		//---------------분류2 코드(머리말) ------------------------------------------

		return "egovframework/com/cop/bbs/EgovBbsObjDetailList";
    }

	/**
	 * 게시물 복사
	 * @param boardVO
	 * @param board
	 * @param bdMstr
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/realCopyBoardArticles.do")
    public void realCopyBoardArticles(@ModelAttribute("board") Board board, HttpServletResponse response, ModelMap model) throws Exception {

    	Map<String, String> resultMap = new HashMap<String, String>();
    	
		resultMap.put("result", bbsMngService.realCopyBoardArticles(board) > 0 ? "Y" : "N");

		String rtnVal = JSONSerializer.toJSON(resultMap).toString();
		EgovWebUtil.sendMessage(response, rtnVal);

    }

	/**
	 * 컨텐츠 이력 조회 pop
	 * @param board
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/contentBBSHistoryPop.do")
    public String contentBBSHistoryPop(@ModelAttribute("board") Board board, ModelMap model) throws Exception {

		model.addAttribute("historyList", bbsMngService.selectBBSHistory(board));

		model.addAttribute("boardInfo", board);
		return "egovframework/com/cop/bbs/EgovBbsHistoryPop";
    }

	/**
	 * 컨텐츠 이력 미리보기
	 * @param board
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/contentBBSHistoryPreview.do")
    public String contentBBSHistoryPreview(@ModelAttribute("board") BoardVO boardVO, ModelMap model) throws Exception{

		// 게시글 키 정보
		model.addAttribute("boardInfo", boardVO);
		
		// 게시글 조회
		model.addAttribute("historyDetail", bbsMngService.contentBBSHistoryPreview(boardVO));
		
		// 파일 조회
		model.addAttribute("fileList", bbsMngService.selectBBSHistoryFileList(boardVO)); 
		
		BoardMasterVO master = new BoardMasterVO();

		master.setBbsId(boardVO.getBbsId());
		
		master = bbsAttrbService.selectBBSMasterInf(master);
		
		String viewPage = "egovframework/com/cop/bbs/";

		// 미리보기 템플릿
		if("BBST12".equals(master.getBbsTyCode())){ //BBST12 : 동영상게시판(타입)
			viewPage = "kor/common/KorVodInqire";
		}else{
			viewPage += "EgovBbsHistoryPreviewPop";
		}
 
		return viewPage;
    }

	/**
	 * 컨텐츠 이력 파일 다운로드
	 * @param boardVO
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/cop/bbs/historyFileDown.do")
    public void historyFileDown(@ModelAttribute("board") BoardVO boardVO
    		, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 파일 조회
		List<FileVO> fileList = bbsMngService.selectBBSHistoryFileList(boardVO);

		if(fileList == null || fileList.isEmpty())throw new Exception();

		FileVO fvo = fileList.get(0);

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
	 * 게시물 복원
	 * @param board
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/contentBBSHistoryRestoration.do")
	public void contentBBSHistoryRestoration(@ModelAttribute("board") BoardVO board,
			HttpServletResponse response, ModelMap model)  throws Exception{

		int resultCnt = bbsMngService.restorationBBSHistory(board);

		Map<String, String> resultMap = new HashMap<String, String>();

		if(resultCnt > 0){
			resultMap.put("result", "Y");
		}

		String rtnVal = JSONSerializer.toJSON(resultMap).toString();
		EgovWebUtil.sendMessage(response, rtnVal);

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
    
	/**
	 * 스팸API 지수 확인
	 * @param request
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/contentSpamCheck.do")
	public void contentSpamCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)  throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String message = request.getParameter("message");
		int spamLevel  = Integer.parseInt(EgovProperties.getProperty("Globals.spamApiLevel"));
		int spamScore =0;
		String spamType="";
		RequestSpamApi spam = new
		//RequestSpamApi(request.getRemoteAddr(),request.getRemoteHost());
		RequestSpamApi("localhost","localhost");

		if( true == spam.request(message) ){
			resultMap.put("result", "Y");
		    spamScore = spam.getSpamScore();  //스팸지수
		    spamType = spam.getSpamType();    //스팸타입
			if(spamScore > spamLevel){
				resultMap.put("spamYn", "Y");
			}else{
				resultMap.put("spamYn", "N");
			}
			resultMap.put("spamScore", spamScore);
			resultMap.put("spamType", spamType);
		}else{
			resultMap.put("result", "N");
		  //스팸 측정 서버 오류(점검중)
		}

		String rtnVal = JSONSerializer.toJSON(resultMap).toString();
		EgovWebUtil.sendMessage(response, rtnVal);

	}
	
	
	/**
	 * 게시판 목록 팝업
	 * @param board
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/linkBbsListPop.do")
    public String linkBbsListPop(@ModelAttribute("board") Board board, ModelMap model) throws Exception {
		
		JSONObject jsObj = new JSONObject();
		Map<String, List<EgovMap>> resultMap = new HashMap<String, List<EgovMap>>();
		resultMap.put("resultMap", bbsMngService.selectBBSList(board));
		
		jsObj.putAll(resultMap);

		model.addAttribute("bbsList", jsObj.toString());
		model.addAttribute("boardInfo", board);
		
		resultMap.clear();
		
		return "egovframework/com/cop/bbs/EgovBbsListPop";
    }
	
	
	/**
	 * 게시물 미리보기
	 * @param boardVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/bbsPreview.do")
    public String bbsPreview(@RequestParam("p_nttCn") String nttCn, ModelMap model) throws Exception{

		nttCn.replaceAll("<nier", "<script");
		nttCn.replaceAll("</nier", "</script");
		
		model.addAttribute("nttCn", nttCn);
 
		return "egovframework/com/cop/bbs/EgovBbsPreview";
    }

}
