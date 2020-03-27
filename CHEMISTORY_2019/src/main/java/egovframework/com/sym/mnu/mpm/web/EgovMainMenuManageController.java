package egovframework.com.sym.mnu.mpm.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.fdl.string.EgovStringUtil;

/**
 * 메인메뉴 해당링크 처리를 하는 비즈니스 구현 클래스
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 *   2011.09.07  서준식          사용자 구분 오류 수정
 * </pre>
 */

@Controller
public class EgovMainMenuManageController {

	protected Log log = LogFactory.getLog(this.getClass());

	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;

    /** EgovFileMngService */
	//@Resource(name="EgovFileMngService")
	//private EgovFileMngService fileMngService;

    /** EgovFileMngUtil */
	//@Resource(name="EgovFileMngUtil")
	//private EgovFileMngUtil fileUtil;
	
	@Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

    /*### 메인작업 ###*/
    /*Main Index 조회*/
    /**
     * Main메뉴의 Index를 조회한다.
     * @param menuNo  String
     * @param chkURL  String
     * @return 출력페이지정보 "menu_index"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenuIndex.do")
    public String selectMainMenuIndex(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam("menuNo") String menuNo,
    		@RequestParam("chkURL") String chkURL,
    		ModelMap model)
            throws Exception {

    	Long iMenuNo = Long.parseLong(menuNo);
    	menuManageVO.setMenuNo(iMenuNo);
    	//menuManageVO.setTempValue(chkURL);
        model.addAttribute("resultVO", menuManageVO);

        return "egovframework/com/menu_index";
    }

    /**
     * Head메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "main_headG", "main_head"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenu.do")
    public String selectMainMenu(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		ModelMap model)
            throws Exception {

    	LoginVO user =
			(LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	menuManageVO.setTmpId(user.getId());
    	menuManageVO.setTmpPassword(user.getPassword());
    	menuManageVO.setTmpUserSe(user.getUserSe());
    	menuManageVO.setTmpName(user.getName());
    	menuManageVO.setTmpEmail(user.getEmail());
    	menuManageVO.setTmpOrgnztId(user.getOrgnztId());
    	menuManageVO.setTmpUniqId(user.getUniqId());

    	List list_headmenu = menuManageService.selectMainMenuHead(menuManageVO);
        model.addAttribute("list_headmenu", list_headmenu);
		if (!user.getId().equals("")) {
        	// 메인 페이지 이동
			// G일반 / E기업 / U업무
			if (user.getUserSe().equals("USR")) {
	    		return "egovframework/com/EgovMainView";
	    	} else {
	    		return "egovframework/com/EgovMainViewG";
        	}
        } else {
        	// 오류 페이지 이동
        	return "egovframework/com/cmm/error/egovError";
        }
    }

    /**
     * Head메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "main_headG", "main_head"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenuHead.do")
    public String selectMainMenuHead(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		ModelMap model)
            throws Exception {

    	LoginVO user =
			(LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	menuManageVO.setTmpId(user.getId());
    	menuManageVO.setTmpPassword(user.getPassword());
    	menuManageVO.setTmpUserSe(user.getUserSe());
    	menuManageVO.setTmpName(user.getName());
    	menuManageVO.setTmpEmail(user.getEmail());
    	menuManageVO.setTmpOrgnztId(user.getOrgnztId());
    	menuManageVO.setTmpUniqId(user.getUniqId());
    	menuManageVO.setSiteType(user.getSiteType());
    	List list_headmenu = menuManageService.selectMainMenuHead(menuManageVO);
        model.addAttribute("list_headmenu", list_headmenu);
        model.addAttribute("sessionInf", user);
		if (!user.getId().equals("")) {
        	// 메인 페이지 이동
			// G일반 / E기업 / U업무
			if (user.getUserSe().equals("USR")) {
        		return "egovframework/com/main_head"; //"EgovMainViewG"; 일반사용자
        	} else {
        		return "egovframework/com/main_headG";
        	}
        } else {
        	// 오류 페이지 이동
        	return "egovframework/com/cmm/error/egovError";
        }
    }


    /**
     * 좌측메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @param vStartP      String
     * @return 출력페이지정보 "main_left"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenuLeft.do")
    public String selectMainMenuLeft(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam("vStartP") String vStartP,
    		ModelMap model)
            throws Exception {
    	Long iMenuNo = Long.parseLong(vStartP);
    	menuManageVO.setTempInt(iMenuNo);
        model.addAttribute("resultVO", menuManageVO);

    	LoginVO user =
			(LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	menuManageVO.setTmpId(user.getId());
    	menuManageVO.setTmpPassword(user.getPassword());
    	menuManageVO.setTmpUserSe(user.getUserSe());
    	menuManageVO.setTmpName(user.getName());
    	menuManageVO.setTmpEmail(user.getEmail());
    	menuManageVO.setTmpOrgnztId(user.getOrgnztId());
    	menuManageVO.setTmpUniqId(user.getUniqId());
    	menuManageVO.setSiteType(user.getSiteType());
    	List list_menulist = menuManageService.selectAdminMenuLeft(menuManageVO);
        model.addAttribute("list_menulist", list_menulist);
      	return "egovframework/com/main_left";
    }

    /**
     * 우측화면을 조회한다.
     * @param menuManageVO MenuManageVO
     * @param vStartP      String
     * @return 출력페이지정보 해당URL
     * @exception Exception
     */
    /*Right Menu 조회*/
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenuRight.do")
    public String selectMainMenuRight(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam("vStartP") String vStartP,
    		ModelMap model)
            throws Exception {
    	Long iMenuNo = Long.parseLong(vStartP);
    	LoginVO user =
			(LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String forwardURL = null;
    	forwardURL = menuManageService.selectLastMenuURL(iMenuNo, user.getUniqId());
    	
      	return "redirect:"+forwardURL;
    }

    /**
     * HOME 메인화면 조회한다.
     * @param menuManageVO  MenuManageVO
     * @return 출력페이지정보 "EgovMainView","EgovMainViewG"
     * @exception Exception
     */
    @IncludedInfo(name="포털(예제) 메인화면", order = 1, gid = 0)
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenuHome.do")
    public String selectMainMenuHome(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		ModelMap model)
            throws Exception {

    	LoginVO user =
			(LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	menuManageVO.setTmpId(user.getId());
    	menuManageVO.setTmpPassword(user.getPassword());
    	menuManageVO.setTmpUserSe(user.getUserSe());
    	menuManageVO.setTmpName(user.getName());
    	menuManageVO.setTmpEmail(user.getEmail());
    	menuManageVO.setTmpOrgnztId(user.getOrgnztId());
    	menuManageVO.setTmpUniqId(user.getUniqId());
    	menuManageVO.setSiteType(user.getSiteType());
		List list_headmenu = menuManageService.selectMainMenuHead(menuManageVO);
		model.addAttribute("list_headmenu", list_headmenu);

		log.debug("## selectMainMenuHome ## getSUserSe 1: "+user.getUserSe());
		log.debug("## selectMainMenuHome ## getSUserId 2: "+user.getId());
		log.debug("## selectMainMenuHome ## getUniqId  2: "+user.getUniqId());

		if (!user.getId().equals("")) {
        	// 메인 페이지 이동
			// G일반 / E기업 / U업무
        	if (user.getUserSe().equals("GNR")) {//2011.09.07
        		return "egovframework/com/EgovMainViewG"; //"EgovMainViewG"; 일반사용자

        	}else if(user.getUserSe().equals("USR")){//2011.09.07
        		//return "egovframework/com/EgovIndvdlpgeDetail";
        		return "egovframework/com/EgovMainView";
        	}
        	else {
        		//return "egovframework/com/EgovMainView";//1차 사업 메인화면
        		return "egovframework/com/EgovMainView2";//2차 사업 메인화면
        	}
        } else {
        	// 오류 페이지 이동
        	return "egovframework/com/cmm/error/egovError";
        }
    }




    @RequestMapping(value="/sym/mnu/mpm/EgovNoLoginMainMenu.do")
    public String selectNoLoginMainMenu(@ModelAttribute("loginVO") LoginVO loginVO,
            HttpServletRequest request,
            ModelMap model)
            throws Exception {

    	MenuManageVO menuManageVO = new MenuManageVO();

    	List list_headmenu = menuManageService.selectNoLoginMainMenuHead(menuManageVO);
        model.addAttribute("list_headmenu", list_headmenu);

		//return "redirect:/kor/menu_korIndex.jsp";
        return "kor/kor_head";
    }

    @RequestMapping(value="/sym/mnu/mpm/EgovNoLoginMainMenuHead.do")
    public String selectNoLoginMainMenuHead(HttpServletRequest request , @ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam("vSiteType") String vSiteType,
    		ModelMap model) throws Exception {

    	menuManageVO.setSiteType(vSiteType);
    	menuManageVO.setAuthorCode("ROLE_ANONYMOUS");
    	List list_headmenu = menuManageService.selectNoLoginMainMenuHead(menuManageVO);
        model.addAttribute("list_headmenu", list_headmenu);
        
        model.addAttribute("mainYN", (String)request.getParameter("mainYN"));
        
        BoardVO boardVO = new BoardVO();
    	boardVO.setFirstIndex(0);    	
    	
    	//핫이슈 20161208
    	String bbsAttrbCode = "BBSA03";
    	boardVO.setBbsId("BBSMSTR_000000000580");
    	boardVO.setConfmSttus("C");
    	boardVO.setRecordCountPerPage(2);
    	Map<String, Object> issueList = bbsMngService.selectBoardArticles(boardVO, bbsAttrbCode);
    	model.addAttribute("issueList", issueList.get("resultList")); 
    	
    	//환경보건지식 20161209
    	bbsAttrbCode = "BBSA03";
    	boardVO.setBbsId("BBSMSTR_000000000610");
    	boardVO.setRecordCountPerPage(5);
    	Map<String, Object> knowList = bbsMngService.selectBoardArticles(boardVO, bbsAttrbCode);
    	model.addAttribute("knowList", knowList.get("resultList"));
    	
        if("KOR".equals(vSiteType)){
        	return "kor/kor_head";
        }else if("ENG".equals(vSiteType)){
        	return "eng/eng_head";
        }else{
        	return "kor/kor_head";
        }

    }

    @RequestMapping(value="/sym/mnu/mpm/EgovNoLoginMainMenuLeft.do")
    public String selectNoLoginMainMenuLeft(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam("vStartP") String vStartP,
    		@RequestParam("vSelect") String vSelect,
    		ModelMap model)
            throws Exception {
    	Long iMenuNo = Long.parseLong(vStartP);
    	menuManageVO.setTempInt(iMenuNo);
        model.addAttribute("resultVO", menuManageVO);

    	List list_menulist = menuManageService.selectMainMenuLeft(menuManageVO);
        model.addAttribute("list_menulist", list_menulist);
      	return "kor/op/nier-op-03";
    }

    @RequestMapping(value="/sym/mnu/mpm/EgovNoLoginMenuLeft.do")
    public String selectNoLoginMenuLeft_3D(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam("menuNo") String menuNo, @RequestParam("moveSite") String moveSite,
    		ModelMap model)
            throws Exception {

    	//ComDefaultVO searchVO = new ComDefaultVO();
    	//searchVO.setPageUnit(Integer.parseInt(menuNo));
    	//MenuManageVO menuInfVo = menuManageService.selectMenuInfo_PRGM(searchVO);
    	menuManageVO.setMenuNo(Long.parseLong(menuNo));
    	menuManageVO.setAuthorCode("ROLE_ANONYMOUS");
    	MenuManageVO menuInfVo = menuManageService.selectMenuInfo_PRGM(menuManageVO);

    	if(menuInfVo!=null) {
	    	if(menuInfVo.getMenuOrdr() != 3){
	    		menuInfVo.setTopMenuNo(Long.toString(menuInfVo.getUpperMenuId()));
	    	}
	
	    	menuInfVo.setAuthorCode("ROLE_ANONYMOUS"); //NO LOGIN 이므로 ANONYMOUS
	    	List list_menulist = menuManageService.selectNoLoginMenuLeft_3D(menuInfVo);
	        model.addAttribute("list_menulist", list_menulist);
	        model.addAttribute("selectedTop", menuInfVo.getTopMenuNo());
	        model.addAttribute("selectedUp", menuInfVo.getUpperMenuId());
	        model.addAttribute("selectedNo", menuInfVo.getMenuNo());
	
	        if(moveSite.trim().equals("KOR")){
	        	return "kor/kor_left";
	        }else if(moveSite.trim().equals("HAN")){
	        	return "han/han_left";
	        }else if(moveSite.trim().equals("GEUM")){
	        	return "geum/geum_left";
	        }else if(moveSite.trim().equals("TPRC")){
	        	return "tprc/tprc_left";
	        }else if(moveSite.trim().equals("NAKDONG")){
	        	return "nakdong/nakdong_left";
	        }else if(moveSite.trim().equals("YEONGSAN")){
	        	return "yeongsan/yeongsan_left";
	        }else if(moveSite.trim().equals("ENG")){
	        	return "eng/eng_left";
	        }else if(moveSite.trim().equals("ERIP")){
	        	return "erip/erip_left";
	        }else{
	        	return "kor/kor_left";
	        }
    	} else {
    		return "forward:/Relay.do?_forward_page=/code404.jsp";
    	}
    }


	@RequestMapping(value = "/EgovMovePage.do")
	public String selectNoLoginMenuInf(HttpServletRequest request, ModelMap model) throws Exception {

		ComDefaultVO searchVO = new ComDefaultVO();
		MenuManageVO menuSearchVO = new MenuManageVO();

		String menuNo = request.getParameter("menuNo");
		if(StringUtils.isNotEmpty(menuNo)){
			//searchVO.setPageUnit(Integer.parseInt(menuNo));
			menuSearchVO.setMenuNo(Long.parseLong(menuNo));
			menuSearchVO.setAuthorCode("ROLE_ANONYMOUS");
			MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(menuSearchVO);

			searchVO.setSearchKeyword(menuNo);
			model.addAttribute("menuManager", menuManageService.selectMenuAdminManage(searchVO));
			model.addAttribute("menuManageVO", resultVO);	
			
			if(resultVO!=null) {
				String returnUrl = "";
				returnUrl = resultVO.getMenuUrl();
				
				if (returnUrl.indexOf("/EgovPageLink.do") > -1) {
					 returnUrl = returnUrl.split("=")[1];
					 returnUrl = returnUrl + ".do?menuNo="+menuNo;
					return "redirect:" + returnUrl;
				} else if(returnUrl.indexOf("/user/cop/com/selectScheduleList.do") > -1){
					returnUrl = returnUrl + "?menuNo=" + menuNo;
					return "redirect:" + returnUrl;				
				} else {
					if (returnUrl.indexOf("?") > -1) {
						returnUrl = returnUrl + "&menuNo=" + menuNo;
					} else {
						returnUrl = returnUrl + "?menuNo=" + menuNo;
					}
					return "redirect:" + returnUrl;	
				}	
			} else {
				return "forward:/Relay.do?_forward_page=/code404.jsp";
			}
		}else{
			String linkPage = EgovStringUtil.null2string(request.getParameter("linkPage"),"");
			linkPage = linkPage.substring(1, linkPage.length()-1);
			return linkPage;
		}




	}

    @RequestMapping(value="/sym/mnu/mpm/EgovNoLoginMenuAllList.do")
    public String selectNoLoginMenuAllList(@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam("vSiteType") String vSiteType,
    		ModelMap model) throws Exception {

    	menuManageVO.setSiteType(vSiteType);
    	List list_headmenu = menuManageService.selectNoLoginMainMenuHead(menuManageVO);
        model.addAttribute("list_headmenu", list_headmenu);

        if("KOR".equals(vSiteType)){
        	return "kor/kor_head";
        }else if("ENG".equals(vSiteType)){
        	return "eng/et/nren-et-0101";
        }else{
        	return "kor/kor_head";
        }

    }

    @RequestMapping(value="/EgovMovePageMain.do")
    public String selectNoLoginMovePageMain(@RequestParam("menuNo") String menuNo, @RequestParam("nId") String nId, @RequestParam("Command") String Command,
    		ModelMap model) throws Exception {

    	//ComDefaultVO searchVO = new ComDefaultVO();
    	//searchVO.setPageUnit(Integer.parseInt(menuNo));
    	MenuManageVO menuSearchVO = new MenuManageVO();
    	menuSearchVO.setMenuNo(Long.parseLong(menuNo));
    	menuSearchVO.setAuthorCode("ROLE_ANONYMOUS");
    	
    	MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(menuSearchVO);
    	resultVO.setPageCmd(Command);
    	resultVO.setTempValue(nId);
    	model.addAttribute("menuManageVO", resultVO);


    	String returnUrl = "";
    	returnUrl = resultVO.getMenuUrl();
    	if(returnUrl.indexOf("/EgovPageLink.do") > -1){
    		//returnUrl = returnUrl.split("=")[1];
    		//returnUrl = returnUrl + ".do?menuNo="+menuNo;
    		return "forward:"+returnUrl;
    	}else{
    		returnUrl = returnUrl + "&menuNo=" + menuNo;
    		return "redirect:"+returnUrl;
    	}
    }
}