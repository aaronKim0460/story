package egovframework.com.cop.com.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.com.service.EgovUserInfManageService;
import egovframework.com.cop.com.service.UserInfVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


/**
 * 협업기능에서 활용하는 사용자 정보 조회용 컨트롤러 클래스
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
 *   2009.4.6   이삼섭          최초 생성
 *	 2011.07.21 안민정          커뮤니티 관련 메소드 분리 (->EgovCmyUserInfController)
 *
 * </pre>
 */
@Controller
public class EgovCopUserInfController {

	/** Validator */
	@Autowired
	private DefaultBeanValidator beanValidator;


    @Resource(name = "EgovUserInfManageService")
    private EgovUserInfManageService userInfService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    /** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    //Logger log = Logger.getLogger(this.getClass());

    /** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;
    
    /**
     * 사용자 정보에 대한 목록을 조회한다.
     *
     * @param userVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/selectUserList.do")
    public String selectUserList(@ModelAttribute("searchVO") UserInfVO userVO, Map<String, Object> commandMap, ModelMap model) throws Exception {
	String popFlag = (String)commandMap.get("PopFlag");
	String returnUrl = "egovframework/com/cop/com/EgovUserList";

	if ("Y".equals(popFlag)) {
	    returnUrl = "egovframework/com/cop/com/EgovUserListPop";
	}

	userVO.setPageUnit(propertyService.getInt("pageUnit"));
	userVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(userVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
	paginationInfo.setPageSize(userVO.getPageSize());

	userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	userVO.setLastIndex(paginationInfo.getLastRecordIndex());
	userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = userInfService.selectUserList(userVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("targetMethod", "selectUserList");
	model.addAttribute("trgetId", "");
	model.addAttribute("paginationInfo", paginationInfo);

	return returnUrl;
    }


	@RequestMapping("/cop/com/selectCmsUserList.do")
	public String selectCmsUserList(HttpServletRequest request , @ModelAttribute("searchVO") UserInfVO userVO, Map<String, Object> commandMap,
			ModelMap model, @RequestParam("moveSite") String moveSite) throws Exception {

		//-------- 목록 페이지에서 세션이 있는 경우에만 "등록" 버튼 출력을 위해서 세션 체크
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		//사용자, 관리자 판단 Tiles 사용
		String tilesPrefix = "/";
		String menuNo = request.getParameter("menuNo");
		
		if(user != null){
			model.addAttribute("sessionUniqId", user.getUniqId());
			model.addAttribute("userAuthority", user.getAuthority());
			
			tilesPrefix = "";//관리자용 화면 노출
		}else{
			model.addAttribute("sessionUniqId", null);
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
	    	tilesPrefix = "/";
		}			
		//-------- 목록 페이지에서 세션이 있는 경우에만 "등록" 버튼 출력을 위해서 세션 체크
		
		userVO.setPageUnit(propertyService.getInt("pageUnit"));
		userVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(userVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
		paginationInfo.setPageSize(userVO.getPageSize());

		userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		userVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 사이트 구분 별로 부서코드가 다름 ------------------------HGB
		userVO.setSiteCd(moveSite);
		String returnPage = "";
		if (moveSite.equals("HAN")) {
			userVO.setDepartCd("00700000");
			returnPage = "/han";
		} else if (moveSite.equals("GEUM")) {
			userVO.setDepartCd("00800000");
			returnPage = "/geum";
		} else if (moveSite.equals("NAKDONG")) {
			userVO.setDepartCd("00900000");
			returnPage = "/nakdong";
		} else if (moveSite.equals("YEONGSAN")) {
			userVO.setDepartCd("01000000");
			returnPage = "/yeongsan";
		} else if (moveSite.equals("TPRC")) {
			userVO.setDepartCd("00600000");
			returnPage = "/tprc";
		}
		// 사이트 구분 별로 부서코드가 다름 ------------------------HGB

		// -----------------------------HGB
		String fullDepartSearch = "";
		if(userVO.getDepartCd() != null && userVO.getDepartCd().length() > 4){
			fullDepartSearch = userVO.getDepartCd();
			if(!userVO.getDepartCd().substring(4,8).equals("0000")){
				userVO.setCmmntyId("2");
				userVO.setDepartCd(userVO.getDepartCd().substring(4,8));
			}else if(!userVO.getDepartCd().substring(0,4).equals("0000")){
				userVO.setCmmntyId("1");
				userVO.setDepartCd(userVO.getDepartCd().substring(0,4));
			}else if(userVO.getDepartCd().equals("00000000")){
				userVO.setDepartCd("");
			}
		}
		//-----------------------------HGB

		Map<String, Object> map = userInfService.selectCmsUserList(userVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("targetMethod", "selectUserList");
		model.addAttribute("trgetId", "");
		model.addAttribute("fullDepartSearch", fullDepartSearch);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("moveSite", moveSite); // 사이트 구분
		// 이니셜 검색인 경우 검색한 이니셜 유지하기 위함
		model.addAttribute("searchInitial", userVO.getSearchInitial());
		// 이니셜 검색인 경우 검색한 이니셜 유지하기 위함
		model.addAttribute("initialAt", userVO.getClubId());

		
		if (moveSite.equals("ENG")) {
			return "/eng/in/nren-in-0901";
		} else if (moveSite.equals("ADMIN")) {
			return "egovframework/com/cop/com/EgovCmsUserList";
		}
		return returnPage + tilesPrefix +"common/ComStaffList";
	}

    @RequestMapping(value="/cop/com/selectCmsUserDetailSelect.do")
    public String selectCmsUser( @ModelAttribute("userVO") UserInfVO userVO,
    		ModelMap model)
            throws Exception {
        // 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}
    	ComDefaultVO searchVO = new ComDefaultVO();
    	searchVO.setSearchKeywordFrom(userVO.getStaffCd());
    	UserInfVO resultVO = userInfService.selectCmsUser(searchVO);
        model.addAttribute("resultVO", resultVO);

        UserInfVO resultVO2 = new UserInfVO();
        resultVO2.setCmmntyId("1");// 페이징 하지 않기 위해서.
    	Map<String, Object> map = userInfService.selectCmsDptList(resultVO2);
        model.addAttribute("resultDptList", map.get("resultList"));

        Map<String, Object> map2 = userInfService.selectCmsSectList(resultVO2);
        model.addAttribute("resultSectList", map2.get("resultList"));
        return "egovframework/com/cop/com/EgovCmsUserListInqire";
    }

    @RequestMapping(value="/cop/com/selectCmsUserDetailSelectUpdt.do")
    public String updateCmsUserList(
    		@ModelAttribute("userVO") UserInfVO userVO,
    		BindingResult bindingResult,
    		ModelMap model)
            throws Exception {
		String resultMsg = "";
        String sLocationUrl = null;
    	// 0. Spring Security 사용자권한 처리
   	    Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

		if (bindingResult.hasErrors()){
			sLocationUrl = "forward:/cop/com/selectCmsUserDetailSelect.do";
			return sLocationUrl;
		}

		userInfService.updateCmsUserList(userVO);
		resultMsg = egovMessageSource.getMessage("success.common.update");
        sLocationUrl = "forward:/cop/com/selectCmsUserList.do?moveSite=ADMIN";
    	model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
    }

    @RequestMapping(value="/cop/com/selectCmsUserRegist.do")
    public String insertCmsUserList(
    		Map commandMap,
    		@ModelAttribute("userVO") UserInfVO userVO,
			BindingResult bindingResult,
			ModelMap model)
            throws Exception {
        String resultMsg = "";
        String sLocationUrl = null;
    	// 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

        String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
        if(sCmd.equals("insert")){
	        beanValidator.validate(userVO, bindingResult);
			if (bindingResult.hasErrors()){
				sLocationUrl = "egovframework/com/cop/com/EgovCmsDptListRegist";
				return sLocationUrl;
			}


			//직원코드 있는지 확인


			userInfService.insertCmsUserList(userVO);
			resultMsg = egovMessageSource.getMessage("success.common.insert");
	        sLocationUrl = "forward:/cop/com/selectCmsUserList.do?moveSite=ADMIN";
        }else{
            sLocationUrl = "egovframework/com/cop/com/EgovCmsUserListRegist";
        }

        userVO.setCmmntyId("1");// 페이징 하지 않기 위해서.
    	Map<String, Object> map = userInfService.selectCmsDptList(userVO);
        model.addAttribute("resultDptList", map.get("resultList"));

        Map<String, Object> map2 = userInfService.selectCmsSectList(userVO);
        model.addAttribute("resultSectList", map2.get("resultList"));
    	model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
    }

    @RequestMapping("/cop/com/selectCmsUserDelete.do")
    public String deleteCmsUserList(@ModelAttribute("userVO") UserInfVO userVO,
            ModelMap model)
            throws Exception {
		String sLocationUrl = null;
    	String resultMsg    = "";
        // 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

    	userInfService.deleteCmsUserList(userVO);
	   resultMsg = egovMessageSource.getMessage("success.common.delete");
	   sLocationUrl ="forward:/cop/com/selectCmsUserList.do?moveSite=ADMIN";

		model.addAttribute("resultMsg", resultMsg);
        //status.setComplete();
        return sLocationUrl ;
    }

    @RequestMapping("/cop/com/selectCmsDptList.do")
    public String selectCmsDptList(@ModelAttribute("searchVO") UserInfVO userVO, Map<String, Object> commandMap, ModelMap model, @RequestParam(value="moveSite", required=false, defaultValue="") String moveSite) throws Exception {

	userVO.setPageUnit(propertyService.getInt("pageUnit"));
	userVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(userVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
	paginationInfo.setPageSize(userVO.getPageSize());

	userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	userVO.setLastIndex(paginationInfo.getLastRecordIndex());
	userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());



	Map<String, Object> map = userInfService.selectCmsDptList(userVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("targetMethod", "selectUserList");
	model.addAttribute("trgetId", "");
	model.addAttribute("paginationInfo", paginationInfo);
	model.addAttribute("moveSite", moveSite); //사이트 구분
	model.addAttribute("searchInitial", userVO.getSearchInitial()); //이니셜 검색인 경우 검색한 이니셜 유지하기 위함
	model.addAttribute("initialAt", userVO.getClubId()); //이니셜 검색인 경우 검색한 이니셜 유지하기 위함

	return "egovframework/com/cop/com/EgovCmsDptList";
    }

    @RequestMapping(value="/cop/com/selectCmsDptRegist.do")
    public String insertCmsDptList(
    		Map commandMap,
    		@ModelAttribute("userVO") UserInfVO userVO,
			BindingResult bindingResult,
			ModelMap model)
            throws Exception {
        String resultMsg = "";
        String sLocationUrl = null;
        String deptYn = "";
    	// 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

        String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
        if(sCmd.equals("insert")){
	        beanValidator.validate(userVO, bindingResult);
			if (bindingResult.hasErrors()){
				sLocationUrl = "egovframework/com/cop/com/EgovCmsDptListRegist";
				return sLocationUrl;
			}
			deptYn = userInfService.selectCmsDptCode(userVO);
			if("N".equals(deptYn)){
			userInfService.insertCmsDptList(userVO);
			resultMsg = egovMessageSource.getMessage("success.common.insert");
			
	        sLocationUrl = "forward:/cop/com/selectCmsDptList.do";
			}else{
				resultMsg = egovMessageSource.getMessage("cop.part.already.msg");
				sLocationUrl = "egovframework/com/cop/com/EgovCmsDptListRegist";
			}
        }else{
            sLocationUrl = "egovframework/com/cop/com/EgovCmsDptListRegist";
        }
    	model.addAttribute("resultMsg", resultMsg);
    	
    	UserInfVO userVO1 = new UserInfVO();
    	userVO1.setCmmntyId("1");// 페이징 하지 않기 위해서.
    	Map<String, Object> map1 = userInfService.selectCmsDptList(userVO);
        model.addAttribute("resultDptList", map1.get("resultList"));    	
    	
		return sLocationUrl;
    }

    @RequestMapping("/cop/com/selectCmsDptDelete.do")
    public String deleteCmsDptList(@ModelAttribute("userVO") UserInfVO userVO,
            ModelMap model)
            throws Exception {
		String sLocationUrl = null;
    	String resultMsg    = "";
        // 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

    	userInfService.deleteCmsDptList(userVO);
	   resultMsg = egovMessageSource.getMessage("success.common.delete");
	   sLocationUrl ="forward:/cop/com/selectCmsDptList.do";

		model.addAttribute("resultMsg", resultMsg);
        //status.setComplete();
        return sLocationUrl ;
    }

    @RequestMapping(value="/cop/com/selectCmsDptDetailSelect.do")
    public String selectCmsDpt( @ModelAttribute("userVO") UserInfVO userVO,
    		ModelMap model)
            throws Exception {
        // 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}
    	ComDefaultVO searchVO = new ComDefaultVO();
    	searchVO.setSearchKeyword(userVO.getDepartCd());
    	UserInfVO resultVO = userInfService.selectCmsDpt(searchVO);
        model.addAttribute("resultVO", resultVO);
        return "egovframework/com/cop/com/EgovCmsDptListInqire";
    }

    @RequestMapping(value="/cop/com/selectCmsDptDetailSelectUpdt.do")
    public String updateCmsDptList(
    		@ModelAttribute("userVO") UserInfVO userVO,
    		BindingResult bindingResult,
    		ModelMap model)
            throws Exception {
		String resultMsg = "";
        String sLocationUrl = null;
    	// 0. Spring Security 사용자권한 처리
   	    Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

		if (bindingResult.hasErrors()){
			sLocationUrl = "forward:/cop/com/selectCmsDptDetailSelect.do";
			return sLocationUrl;
		}

		userInfService.updateCmsDptList(userVO);
		resultMsg = egovMessageSource.getMessage("success.common.update");
        sLocationUrl = "forward:/cop/com/selectCmsDptList.do";
    	model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
    }

    @RequestMapping("/cop/com/selectCmsSectList.do")
    public String selectCmsSectList(@ModelAttribute("searchVO") UserInfVO userVO, Map<String, Object> commandMap, ModelMap model, @RequestParam(value="moveSite", required=false, defaultValue="") String moveSite) throws Exception {

	userVO.setPageUnit(propertyService.getInt("pageUnit"));
	userVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(userVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
	paginationInfo.setPageSize(userVO.getPageSize());

	userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	userVO.setLastIndex(paginationInfo.getLastRecordIndex());
	userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());



	Map<String, Object> map = userInfService.selectCmsSectList(userVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("targetMethod", "selectUserList");
	model.addAttribute("trgetId", "");
	model.addAttribute("paginationInfo", paginationInfo);
	
	UserInfVO userVO1 = new UserInfVO();
	userVO1.setCmmntyId("1");// 페이징 하지 않기 위해서.
	Map<String, Object> map1 = userInfService.selectCmsDptList(userVO);
    model.addAttribute("resultDptList", map1.get("resultList"));
    

	return "egovframework/com/cop/com/EgovCmsSectList";
    }

    @RequestMapping(value="/cop/com/selectCmsSectRegist.do")
    public String insertCmsSectList(
    		Map commandMap,
    		@ModelAttribute("userVO") UserInfVO userVO,
			BindingResult bindingResult,
			ModelMap model)
            throws Exception {
        String resultMsg = "";
        String sLocationUrl = null;
    	// 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	String sectYn = ""; 
    	
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

        String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
        if(sCmd.equals("insert")){
	        beanValidator.validate(userVO, bindingResult);
			if (bindingResult.hasErrors()){
				sLocationUrl = "egovframework/com/cop/com/EgovCmsSectListRegist";
				return sLocationUrl;
			}

	        sectYn = userInfService.selectCmsSectCode(userVO);
			if("N".equals(sectYn)){
				userInfService.insertCmsSectList(userVO);
				resultMsg = egovMessageSource.getMessage("success.common.insert");
		        sLocationUrl = "forward:/cop/com/selectCmsSectList.do";
			}else{
				resultMsg = egovMessageSource.getMessage("cop.sect.already.msg");
				sLocationUrl = "egovframework/com/cop/com/EgovCmsSectListRegist";
			}
	        
	        
	        
        }else{
            sLocationUrl = "egovframework/com/cop/com/EgovCmsSectListRegist";
        }
        userVO.setCmmntyId("1");// 페이징 하지 않기 위해서.
        Map<String, Object> map = userInfService.selectCmsDptList(userVO);

        model.addAttribute("resultDptList", map.get("resultList"));
    	model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
    }

    @RequestMapping("/cop/com/selectCmsSectDelete.do")
    public String deleteCmsSectList(@ModelAttribute("userVO") UserInfVO userVO,
            ModelMap model)
            throws Exception {
		String sLocationUrl = null;
    	String resultMsg    = "";
        // 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

    	userInfService.deleteCmsSectList(userVO);
	   resultMsg = egovMessageSource.getMessage("success.common.delete");
	   sLocationUrl ="forward:/cop/com/selectCmsSectList.do";

		model.addAttribute("resultMsg", resultMsg);
        //status.setComplete();
        return sLocationUrl ;
    }

    @RequestMapping(value="/cop/com/selectCmsSectDetailSelect.do")
    public String selectCmsSect( @ModelAttribute("userVO") UserInfVO userVO,
    		ModelMap model)
            throws Exception {
        // 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}
    	ComDefaultVO searchVO = new ComDefaultVO();
    	searchVO.setSearchKeyword(userVO.getDepartCd());
    	UserInfVO resultVO = userInfService.selectCmsSect(searchVO);
        model.addAttribute("resultVO", resultVO);
        return "egovframework/com/cop/com/EgovCmsSectListInqire";
    }

    @RequestMapping(value="/cop/com/selectCmsSectDetailSelectUpdt.do")
    public String updateCmsSectList(
    		@ModelAttribute("userVO") UserInfVO userVO,
    		BindingResult bindingResult,
    		ModelMap model)
            throws Exception {
		String resultMsg = "";
        String sLocationUrl = null;
    	// 0. Spring Security 사용자권한 처리
   	    Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

		if (bindingResult.hasErrors()){
			sLocationUrl = "forward:/cop/com/selectCmsSectDetailSelect.do";
			return sLocationUrl;
		}

		userInfService.updateCmsSectList(userVO);
		resultMsg = egovMessageSource.getMessage("success.common.update");
        sLocationUrl = "forward:/cop/com/selectCmsSectList.do";
    	model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
    }

    @RequestMapping("/cop/com/selectCmsRankList.do")
    public String selectCmsRankList(@ModelAttribute("searchVO") UserInfVO userVO, Map<String, Object> commandMap, ModelMap model, @RequestParam(value="moveSite", required=false, defaultValue="") String moveSite) throws Exception {

	userVO.setPageUnit(propertyService.getInt("pageUnit"));
	userVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(userVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
	paginationInfo.setPageSize(userVO.getPageSize());

	userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	userVO.setLastIndex(paginationInfo.getLastRecordIndex());
	userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());



	Map<String, Object> map = userInfService.selectCmsRankList(userVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("targetMethod", "selectUserList");
	model.addAttribute("trgetId", "");
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/com/cop/com/EgovCmsRankList";
    }

    @RequestMapping(value="/cop/com/selectCmsRankRegist.do")
    public String insertCmsRankList(
    		Map commandMap,
    		@ModelAttribute("userVO") UserInfVO userVO,
			BindingResult bindingResult,
			ModelMap model)
            throws Exception {
        String resultMsg = "";
        String sLocationUrl = null;
    	// 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

        String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
        if(sCmd.equals("insert")){
	        beanValidator.validate(userVO, bindingResult);
			if (bindingResult.hasErrors()){
				sLocationUrl = "egovframework/com/cop/com/EgovCmsRankListRegist";
				return sLocationUrl;
			}

			userInfService.insertCmsRankList(userVO);
			resultMsg = egovMessageSource.getMessage("success.common.insert");
	        sLocationUrl = "forward:/cop/com/selectCmsRankList.do";
        }else{
            sLocationUrl = "egovframework/com/cop/com/EgovCmsRankListRegist";
        }

    	model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
    }

    @RequestMapping(value="/cop/com/selectCmsRankDetailSelect.do")
    public String selectCmsRank( @ModelAttribute("userVO") UserInfVO userVO,
    		ModelMap model)
            throws Exception {
        // 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}
    	ComDefaultVO searchVO = new ComDefaultVO();
    	searchVO.setSearchKeyword(userVO.getRankCode());
    	UserInfVO resultVO = userInfService.selectCmsRank(searchVO);
        model.addAttribute("resultVO", resultVO);
        return "egovframework/com/cop/com/EgovCmsRankListInqire";
    }

    @RequestMapping(value="/cop/com/selectCmsRankDetailSelectUpdt.do")
    public String updateCmsRankList(
    		@ModelAttribute("userVO") UserInfVO userVO,
    		BindingResult bindingResult,
    		ModelMap model)
            throws Exception {
		String resultMsg = "";
        String sLocationUrl = null;
    	// 0. Spring Security 사용자권한 처리
   	    Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

		if (bindingResult.hasErrors()){
			sLocationUrl = "forward:/cop/com/selectCmsRankDetailSelect.do";
			return sLocationUrl;
		}

		userInfService.updateCmsRankList(userVO);
		resultMsg = egovMessageSource.getMessage("success.common.update");
        sLocationUrl = "forward:/cop/com/selectCmsRankList.do";
    	model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
    }

    @RequestMapping("/cop/com/selectCmsRankDelete.do")
    public String deleteCmsRankList(@ModelAttribute("userVO") UserInfVO userVO,
            ModelMap model)
            throws Exception {
		String sLocationUrl = null;
    	String resultMsg    = "";
        // 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovCmsLoginUsr";
    	}

    	userInfService.deleteCmsRankList(userVO);
	   resultMsg = egovMessageSource.getMessage("success.common.delete");
	   sLocationUrl ="forward:/cop/com/selectCmsRankList.do";

		model.addAttribute("resultMsg", resultMsg);
        //status.setComplete();
        return sLocationUrl ;
    }


    @RequestMapping("/cop/com/selectCmsOrgList.do")
    public String selectCmsOrgList(@ModelAttribute("searchVO") UserInfVO userVO, Map<String, Object> commandMap, ModelMap model, @RequestParam(value="moveSite", required=false, defaultValue="") String moveSite) throws Exception {

		Map<String, Object> map = userInfService.selectCmsOrgList(userVO);

		model.addAttribute("resultList", map.get("resultList"));
		return "kor/common/KorOrgList";
    }



}