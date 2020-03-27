package egovframework.com.sym.mnu.mpm.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.com.cop.com.service.EgovUserInfManageService;
import egovframework.com.cop.com.service.UserInfVO;
import egovframework.com.kids.calender.service.CalenderService;
import egovframework.com.kids.calender.vo.CalenderVO;
import egovframework.com.kids.lms.service.LmsCourseManageService;
import egovframework.com.kids.lms.vo.LmsCourseVO;
import egovframework.com.kids.recall.service.RecallBBSService;
import egovframework.com.kids.recall.vo.RecallBBSVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.com.uss.ion.bnr.service.BannerVO;
import egovframework.com.uss.ion.bnr.service.EgovBannerService;
import egovframework.com.uss.ion.pwm.service.EgovPopupManageService;
import egovframework.com.uss.ion.pwm.service.PopupManageVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MenuManagerController {

	protected Log log = LogFactory.getLog(this.getClass());

	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;

    @Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;
    

    @Resource(name = "EgovUserInfManageService")
    private EgovUserInfManageService userInfService;
    
    @Resource(name = "egovBannerService")
    private EgovBannerService egovBannerService;

    /** Message ID Generation */
    @Resource(name="egovBannerIdGnrService")
    private EgovIdGnrService egovBannerIdGnrService;
    
    /** EgovPopupManageService */
	@Resource(name = "egovPopupManageService")
	private EgovPopupManageService egovPopupManageService;
    
	@Resource(name = "recallBBSService")
	private RecallBBSService recallBBSService;
	
	@Resource(name = "calenderService")
	CalenderService calenderService;
	
	@Resource(name = "lmsCourseManageService")
	private LmsCourseManageService lmsCourseManageService;
	
	/**
	 * 국문 index Page
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/kor/index.do")
    public String kor_index(HttpServletRequest request , ModelMap model, @ModelAttribute("recallBBSVO") RecallBBSVO recallBBSVO
    		, @ModelAttribute("calenderVO") CalenderVO calenderVO, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO) throws Exception {
    	
    	BoardVO boardVO = new BoardVO();
    	boardVO.setFirstIndex(0);    	
    	
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(recallBBSVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(recallBBSVO.getPageUnit());
		paginationInfo.setPageSize(recallBBSVO.getPageSize());
    	
    	//공지사항
    	String bbsAttrbCode = "BBSA03";
    	boardVO.setBbsId("BBSMSTR_000000000012");
    	boardVO.setRecordCountPerPage(6);
    	Map<String, Object> noticeList = bbsMngService.selectBoardArticles(boardVO, bbsAttrbCode);//2011.09.07
    	model.addAttribute("noticeList1", noticeList.get("resultList")); 
    	
    	//환경연구뉴스
    	bbsAttrbCode = "BBSA03";
    	boardVO.setBbsId("BBSMSTR_000000000330");
    	boardVO.setRecordCountPerPage(3);
    	noticeList = bbsMngService.selectBoardArticles(boardVO, bbsAttrbCode);//2011.09.07
    	model.addAttribute("noticeList5", noticeList.get("resultList"));  
    	
    	//배너 알림판 2건
    	BannerVO bannerVO = new BannerVO();
		bannerVO.setSiteType("KOR");
		bannerVO.setBannerAt("1");
		List<BannerVO> fileList = egovBannerService.selectNierBannerResult(bannerVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("resultType", bannerVO.getResultType());
		
		//팝업리스트
		PopupManageVO popupVo = new PopupManageVO(); 
		List<?> popupList = egovPopupManageService.selectPopupMainList(popupVo);
		model.addAttribute("popupList", popupList);
		
		//어린이-환경보건 교육과정
		lmsCourseVO.setSearchCnd("2");
		List<?> courseList = lmsCourseManageService.selectLmsCourseListForUser(lmsCourseVO);
		model.addAttribute("courseList", courseList);
    	
    	//학부모-환경뉴스
		bbsAttrbCode = "BBSA03";
		boardVO.setBbsId("BBSMSTR_000000000590");
		boardVO.setRecordCountPerPage(4);
    	noticeList = bbsMngService.selectBoardArticles(boardVO, bbsAttrbCode);//2016.12.09
    	model.addAttribute("newsList", noticeList.get("resultList"));
    	
    	//학부모-핫이슈
		bbsAttrbCode = "BBSA03";
		boardVO.setBbsId("BBSMSTR_000000000580");
		boardVO.setConfmSttus("C");
		boardVO.setRecordCountPerPage(3);
    	noticeList = bbsMngService.selectBoardArticles(boardVO, bbsAttrbCode);//2016.12.09
    	model.addAttribute("issueList", noticeList.get("resultList"));
    	
    	//학부모-국내/국외어린이용품리콜
		recallBBSVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		recallBBSVO.setLastIndex(paginationInfo.getLastRecordIndex());
		recallBBSVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		recallBBSVO.setDomesticYn("Y");
		model.addAttribute("recallListY", recallBBSService.selectRecallBBSList(recallBBSVO));
		
		recallBBSVO.setDomesticYn("N");
		model.addAttribute("recallListN", recallBBSService.selectRecallBBSList(recallBBSVO));

		paginationInfo.setTotalRecordCount(recallBBSService.selectRecallBBSCount(recallBBSVO));
		model.addAttribute("recallPaginationInfo", paginationInfo);
		
    	//교사-공지사항
		bbsAttrbCode = "BBSA03";
		boardVO.setBbsId("BBSMSTR_000000000012");
		boardVO.setRecordCountPerPage(3);
    	noticeList = bbsMngService.selectBoardArticles(boardVO, bbsAttrbCode);//2016.12.09
    	model.addAttribute("alrimList", noticeList.get("resultList"));
		
    	//교사-환경보건행사
		calenderVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		calenderVO.setLastIndex(paginationInfo.getLastRecordIndex());
		calenderVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		model.addAttribute("calenderList", calenderService.selectCalenderList(calenderVO));

		paginationInfo.setTotalRecordCount(calenderService.selectCalenderCount(calenderVO));
		model.addAttribute("calenderPaginationInfo", paginationInfo);

		//교사-환경보건 교육자료=교수지도안
		bbsAttrbCode = "BBSA03";
		boardVO.setBbsId("BBSMSTR_000000000670");
		boardVO.setRecordCountPerPage(4);
    	noticeList = bbsMngService.selectBoardArticles(boardVO, bbsAttrbCode);//2016.12.08
    	model.addAttribute("eduDataList", noticeList.get("resultList"));
    	
    	return "kor/kor_index";
    }
    
    @RequestMapping(value="/kor/getMainPopup.do")
	public String getMainPopup(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("PopupManageVO") PopupManageVO searchVO, ModelMap model) throws Exception{
		
		System.out.println("popupid ==> " + searchVO.getPopupId());
		
		PopupManageVO popvo = egovPopupManageService.selectPopup(searchVO);
		String consn = popvo.getPopupCn();
		System.out.println("consn ==>" + consn);
		consn = consn.replaceAll("&quot;", "\"");
		System.out.println("consn ==>" + consn);
		popvo.setPopupCn(consn);
		
		model.addAttribute("pvo", popvo);		
		return "kor/ajaxlistdata/getMainPopup";
	}
    
    /***
     * 영문 index Page
     * @return
     * @throws Exception
     */
    @RequestMapping("/eng/index.do")
    public String eng_index(HttpServletRequest request , ModelMap model) throws Exception {
    	
    	BoardVO boardVO = new BoardVO();
    	boardVO.setFirstIndex(0);    	
    	//News & Events
    	String bbsAttrbCode = "BBSA01";
    	boardVO.setBbsId("BBSMSTR_000000000124");
    	boardVO.setRecordCountPerPage(3);
    	Map<String, Object> noticeList = bbsMngService.selectBoardArticles(boardVO, bbsAttrbCode);//2011.09.07
    	model.addAttribute("noticeList0", noticeList.get("resultList"));   
    	
    	//International Cooperation
    	bbsAttrbCode = "BBSA01";
    	boardVO.setBbsId("BBSMSTR_000000000125");
    	boardVO.setRecordCountPerPage(3);
    	noticeList = bbsMngService.selectBoardArticles(boardVO, bbsAttrbCode);//2011.09.07
    	model.addAttribute("noticeList1", noticeList.get("resultList"));
    	
    	//배너 알림판 2건
    	BannerVO bannerVO = new BannerVO();
		bannerVO.setSiteType("ENG");
		bannerVO.setBannerAt("1");
		List<BannerVO> fileList = egovBannerService.selectNierBannerResult(bannerVO);
		model.addAttribute("fileList", fileList);
		model.addAttribute("resultType", bannerVO.getResultType());
		
		//배너1 (추가 : 20160125)
		BannerVO bannerVO2 = new BannerVO();
		bannerVO2.setSiteType("ENG");
		bannerVO2.setBannerAt("0");
		List<BannerVO> bnrList = egovBannerService.selectNierBannerResult(bannerVO2);
		model.addAttribute("bnrList", bnrList);
		
    	return "eng/eng_index";
    }
    
    /***
     * 한강 index Page
     * @return
     * @throws Exception
     */
    @RequestMapping("/han/index.do")
    public String han_index(HttpServletRequest request, ModelMap model) throws Exception {
    	
		//배너1 (추가 : 20160125)
		BannerVO bannerVO2 = new BannerVO();
		bannerVO2.setSiteType("HAN");
		bannerVO2.setBannerAt("0");
		List<BannerVO> bnrList = egovBannerService.selectNierBannerResult(bannerVO2);
		model.addAttribute("bnrList", bnrList);
    	
    	return "han/han_index";
    } 
    
    @RequestMapping("/{site}/{contentTp}/{urlTp}.do")
    public String korMovePage(@PathVariable("site")
    String site , @PathVariable("contentTp")
    String contentTp,@PathVariable("urlTp")
    String urlTp , @RequestParam("menuNo") String menuNo,
	ModelMap model) throws Exception {
    	
    	ComDefaultVO searchVO = new ComDefaultVO();
    	//searchVO.setPageUnit(Integer.parseInt(menuNo));
    	searchVO.setMenuLongId(Long.parseLong(menuNo));
    	MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(searchVO);
    	model.addAttribute("menuManageVO", resultVO);	
    	searchVO.setSearchKeyword(menuNo);
    	model.addAttribute("menuManager", menuManageService.selectMenuAdminManage(searchVO));	
    	
    	return "/"+site+"/"+contentTp+"/"+urlTp;
    }
   
    
    /***
     * 조직도
     * @return
     * @throws Exception
     */
    @RequestMapping("/showorg.do")
    public String showorg(HttpServletRequest request , @ModelAttribute("searchVO") UserInfVO userVO , ModelMap model) throws Exception {
    	
    	String fileNm = request.getParameter("fileNm");
    	String num = request.getParameter("num");
    	model.addAttribute("num", num); 
    	
		userVO.setFirstIndex(0);
		userVO.setRecordCountPerPage(100);
		userVO.setSearchCnd("3");
		
		if("orgDept3".indexOf(fileNm) > -1){
			if("0".equals(num)){
				userVO.setSearchWrd("위해성평가연구과");	
				Map<String, Object> map2 = userInfService.selectCmsUserList(userVO);
				userVO.setSearchWrd("화학물질연구과");	
				Map<String, Object> map3 = userInfService.selectCmsUserList(userVO);	
				model.addAttribute("resultList2", map2.get("resultList"));
				model.addAttribute("resultList3", map3.get("resultList"));				
				userVO.setSearchWrd("환경보건연구과");	
			}else if("1".equals(num)){
				userVO.setSearchWrd("환경보건연구과");				
			}else if("2".equals(num)){
				userVO.setSearchWrd("위해성평가연구과");
			}else if("3".equals(num)){
				userVO.setSearchWrd("화학물질등록평가팀");
			}else if("4".equals(num)){
				userVO.setSearchWrd("화학물질연구과");
			}
		}else if(fileNm.indexOf("orgDept4") > -1){
			if("0".equals(num)){
				userVO.setSearchWrd("지구환경연구과");	
				Map<String, Object> map2 = userInfService.selectCmsUserList(userVO);
				userVO.setSearchWrd("대기공학연구과");	
				Map<String, Object> map3 = userInfService.selectCmsUserList(userVO);
				userVO.setSearchWrd("대기질통합예보센터");	
				Map<String, Object> map4 = userInfService.selectCmsUserList(userVO);	
				model.addAttribute("resultList2", map2.get("resultList"));
				model.addAttribute("resultList3", map3.get("resultList"));	
				model.addAttribute("resultList4", map4.get("resultList"));	
				userVO.setSearchWrd("대기환경연구과");	
			}else if("1".equals(num)){
				userVO.setSearchWrd("대기환경연구과");				
			}else if("2".equals(num)){
				userVO.setSearchWrd("지구환경연구과");
			}else if("3".equals(num)){
				userVO.setSearchWrd("대기공학연구과");
			}else if("4".equals(num)){
				userVO.setSearchWrd("대기질통합예보센터");
			}			
		}else if(fileNm.indexOf("orgDept5") > -1){
			if("0".equals(num)){
				userVO.setSearchWrd("물환경공학연구과");	
				Map<String, Object> map2 = userInfService.selectCmsUserList(userVO);
				userVO.setSearchWrd("물환경평가연구과");	
				Map<String, Object> map3 = userInfService.selectCmsUserList(userVO);
				userVO.setSearchWrd("유역총량연구과");	
				model.addAttribute("resultList2", map2.get("resultList"));
				model.addAttribute("resultList3", map3.get("resultList"));	
			}else if("1".equals(num)){
				userVO.setSearchWrd("유역총량연구과");				
			}else if("2".equals(num)){
				userVO.setSearchWrd("물환경공학연구과");
			}else if("3".equals(num)){
				userVO.setSearchWrd("유역생태연구팀");
			}else if("4".equals(num)){
				userVO.setSearchWrd("물환경평가연구과");
			}			
		}else if(fileNm.indexOf("orgDept6") > -1){
			if("0".equals(num)){
				userVO.setSearchWrd("폐자원에너지연구과");	
				Map<String, Object> map2 = userInfService.selectCmsUserList(userVO);
				userVO.setSearchWrd("자연환경연구과");	
				Map<String, Object> map3 = userInfService.selectCmsUserList(userVO);
				model.addAttribute("resultList2", map2.get("resultList"));
				model.addAttribute("resultList3", map3.get("resultList"));
				userVO.setSearchWrd("자원순환연구과");	
			}else if("1".equals(num)){
				userVO.setSearchWrd("자원순환연구과");				
			}else if("2".equals(num)){
				userVO.setSearchWrd("폐자원에너지연구과");
			}else if("3".equals(num)){
				userVO.setSearchWrd("자연환경연구과");
			}			
		}else if(fileNm.indexOf("orgDept7") > -1){
			if("0".equals(num)){
				userVO.setSearchWrd("상하수도연구과");	
				Map<String, Object> map2 = userInfService.selectCmsUserList(userVO);
				userVO.setSearchWrd("토양지하수연구과");	
				Map<String, Object> map3 = userInfService.selectCmsUserList(userVO);
				userVO.setSearchWrd("환경측정분석센터");	
				Map<String, Object> map4 = userInfService.selectCmsUserList(userVO);	
				model.addAttribute("resultList2", map2.get("resultList"));
				model.addAttribute("resultList3", map3.get("resultList"));	
				model.addAttribute("resultList4", map4.get("resultList"));	
				userVO.setSearchWrd("생활환경연구과");	
			}else if("1".equals(num)){
				userVO.setSearchWrd("생활환경연구과");				
			}else if("2".equals(num)){
				userVO.setSearchWrd("상하수도연구과");
			}else if("3".equals(num)){
				userVO.setSearchWrd("토양지하수연구과");
			}else if("4".equals(num)){
				userVO.setSearchWrd("환경측정분석센터");
			}			
		}else if(fileNm.indexOf("orgDept10") > -1){
			if("0".equals(num)){
				userVO.setSearchWrd("국립습지센터");	
			}			
		}else if(fileNm.indexOf("orgDept2") > -1){
			if("0".equals(num)){
				userVO.setSearchWrd("연구전략기획과");	
			}			
		}else if(fileNm.indexOf("orgDept8") > -1){
			if("0".equals(num)){
				userVO.setSearchWrd("교통환경연구소");	
			}			
		}else if(fileNm.indexOf("orgDept9") > -1){
			if("0".equals(num)){
				userVO.setSearchWrd("한강물환경연구소");	
			}			
		}else if(fileNm.indexOf("orgDept1") > -1){
			if("0".equals(num)){
				userVO.setSearchWrd("연구지원과");	
			}			
		}
		Map<String, Object> map = userInfService.selectCmsUserList(userVO);

		int totCnt = Integer.parseInt((String) map.get("resultCnt"));  
		model.addAttribute("resultList", map.get("resultList"));

    	
    	return "kor/in/"+fileNm;
    }    
}