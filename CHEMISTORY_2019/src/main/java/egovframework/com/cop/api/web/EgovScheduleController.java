package egovframework.com.cop.api.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
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
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.api.service.DayComUtil;
import egovframework.com.cop.api.service.DayVO;
import egovframework.com.cop.api.service.EgovScheduleService;
import egovframework.com.cop.api.service.EgovScheduleVO;
import egovframework.com.cop.com.service.EgovUserInfManageService;
import egovframework.com.cop.com.service.UserInfVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;

@Controller
public class EgovScheduleController {

	 @Autowired
	 private DefaultBeanValidator beanValidator;
	 
	@Resource(name = "EgovScheduleService")
	private EgovScheduleService egovScheduleService;
	
	 /** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    @Resource(name = "EgovUserInfManageService")
    private EgovUserInfManageService userInfService;
    
    /** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;    
    
	@SuppressWarnings({ "unused", "unchecked", "rawtypes" })
	@RequestMapping("/cop/com/selectScheduleList.do")
    public String selectScheduleList(HttpServletRequest request  , @ModelAttribute("searchVO") EgovScheduleVO reportVO, ModelMap model) throws Exception {
	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		//사용자, 관리자 판단 Tiles 사용
		String tilesPrefix = "/";
		String menuNo = request.getParameter("menuNo");
		
		if(user != null){
			model.addAttribute("sessionUniqId", user.getUniqId());
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
	    	tilesPrefix = "/";//관리자용 화면 노출
		}
		
		Calendar today = Calendar.getInstance();
		DayComUtil comUtil = new DayComUtil();
		
		String tmpToday = DayComUtil.getDateToStr(today.getTime(), "yyyyMMdd");
	    String dayDisp = tmpToday.substring(0, 4) + "," + tmpToday.substring(4, 6) + "," + tmpToday.substring(6, 8);
	    
		int year = 0;
		int month = 0;
		int day = 0;
		
		if(!reportVO.getYearStr().equals("")){
			year = Integer.parseInt(reportVO.getYearStr().trim());
		}else{
			year = today.get(1);
		}
		
		if(!reportVO.getMonthStr().equals("")){
			month = Integer.parseInt(reportVO.getMonthStr().trim());
		}else{
			month = today.get(2) + 1;
		}
		
		if(!reportVO.getDayStr().equals("")){
			day = Integer.parseInt(reportVO.getDayStr().trim());
		}else{
			day = today.get(5);
		}
		 
		
		if (year < 1950) {
	      year = today.get(1);
	    }
		
		 if ((month > 12) || (month < 1)) {
	      month = today.get(2) + 1;
	    }
		 
	    if ((day > 31) || (day < 1)) {
	      day = today.get(5);
	    }
	    
	    Calendar nextmonth = Calendar.getInstance();
	    nextmonth.set(year, month - 1, 1);
	    nextmonth.add(2, 1);
	    
	    
	    Calendar prevmonth = Calendar.getInstance();
	    prevmonth.set(year, month - 1, 1);
	    prevmonth.add(2, -1);
	    
	    Calendar nextyear = Calendar.getInstance();
	    nextyear.set(year, month - 1, 1);
	    nextyear.add(1, 1);

	    Calendar prevyear = Calendar.getInstance();
	    prevyear.set(year, month - 1, 1);
	    prevyear.add(1, -1);

	    Calendar nextday = Calendar.getInstance();
	    nextday.set(year, month - 1, day);
	    nextday.add(5, 1);
	    String tmpNextday = DayComUtil.getDateToStr(nextday.getTime(), "yyyyMMdd");
	    String nextDayDisp = tmpNextday.substring(0, 4) + "," + tmpNextday.substring(4, 6) + "," + tmpNextday.substring(6, 8);
	    

	    Calendar prevday = Calendar.getInstance();
	    prevday.set(year, month - 1, day);
	    prevday.add(5, -1);
	    String tmpPrevday = DayComUtil.getDateToStr(prevday.getTime(), "yyyyMMdd");
	    String prevDayDisp = tmpPrevday.substring(0, 4) + "," + tmpPrevday.substring(4, 6) + "," + tmpPrevday.substring(6, 8);
	    
	    List<DayVO> dayList = this.getDays(today, year, month);
	    List<EgovScheduleVO> weekList = new ArrayList();
	    
	    for (int i = 0; i < dayList.size(); i++)
	    {
	    	DayVO dayVo = (DayVO)dayList.get(i);
	      if ( (DayComUtil.getStrYmd(year, month, day).equals(dayVo.getYmd())))
	      {
	        EgovScheduleVO scheduleVO = new EgovScheduleVO();
	        scheduleVO.setSearchDate(dayVo.getYmd().replace("-", ""));
	        List<EgovScheduleVO> eventList = egovScheduleService.selectDiarySechdule(scheduleVO);
	        model.addAttribute("eventList", eventList);
	      }
	      if ( (DayComUtil.getCalendarYmd(year, month, day).get(4) == DayComUtil.getCalendarYmd(dayVo.getYear(), dayVo.getMonth(), dayVo.getDay()).get(4)))
	      {
	        EgovScheduleVO scheduleVO = new EgovScheduleVO();
	        scheduleVO.setSearchDate(dayVo.getYmd().replace("-", ""));
	        List<EgovScheduleVO> tempList = egovScheduleService.selectDiarySechdule(scheduleVO);
	        for (int j = 0; j < tempList.size(); j++) {
	          weekList.add((EgovScheduleVO)tempList.get(j));
	        }
	      }
	    }
	    model.addAttribute("dayDisp", dayDisp);
	    model.addAttribute("nextDayDisp", nextDayDisp);
	    model.addAttribute("prevDayDisp", prevDayDisp);
	    model.addAttribute("nextmonth", Integer.valueOf(nextmonth.get(2) + 1));
	    model.addAttribute("prevmonth", Integer.valueOf(prevmonth.get(2) + 1));
	    model.addAttribute("nextyear", Integer.valueOf(nextyear.get(1)));
	    model.addAttribute("prevyear", Integer.valueOf(prevyear.get(1)));
	    
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("day",day);
		model.addAttribute("dayList",dayList);
		model.addAttribute("weekList", weekList);
		model.addAttribute("tilesPrefix", tilesPrefix);
		
		return tilesPrefix + "kor/common/SchdulList";
	}
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<DayVO> getDays(Calendar today, int toYear, int toMonth) throws Exception
	  {
	    Calendar firstday = Calendar.getInstance();
	    Calendar lastday = Calendar.getInstance();
	    
	    firstday.set(toYear, toMonth - 1, 1);
	    lastday.set(toYear, toMonth, 1);
	    lastday.add(5, -1);
	    
	    int jcount = (int)Math.ceil((lastday.get(5) - 1 + firstday.get(7)) / 7.0D);
	    int daycount = 2;
	    int days = 0;
	    List<DayVO> dayList = new ArrayList();
	    for (int ju = 0; ju < jcount; ju++) {
	      for (int i = 0; i < 7; i++)
	      {
	        days = daycount - firstday.get(7);
	        if (days > lastday.get(5)) {
	          days = 0;
	        } else if (days < 0) {
	          days = 0;
	        }
	        DayVO day = new DayVO(toYear, toMonth, days);
	        
	        int events = 0;
	        if (days > 0) {
	        	EgovScheduleVO scheduleVO = new EgovScheduleVO();
	        	scheduleVO.setSearchDate(day.getYmd().replace("-", ""));
	        	events= (Integer)egovScheduleService.selectReverseCnt(scheduleVO);
	        }
	        if (events > 0) {
	          day.setReserve(1);
	        }
	        dayList.add(day);
	        daycount++;
	      }
	    }
	    return dayList;
	  } 
	 
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/cop/com/insertScheduleRegist.do")
    public String insertScheduleRegist(Map commandMap, @ModelAttribute("searchVO") EgovScheduleVO schdulVO, BindingResult bindingResult, ModelMap model)
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
        if("insert".equals(sCmd)){
	        beanValidator.validate(schdulVO, bindingResult);
			if (bindingResult.hasErrors()){
				sLocationUrl = "kor/common/KorSchdulRegist";
				return sLocationUrl;
			}

			schdulVO.setRegDt(schdulVO.getRegDt().replaceAll("-", ""));
			egovScheduleService.insertSchdulList(schdulVO);
			resultMsg = egovMessageSource.getMessage("success.common.insert");
			model.addAttribute("resultMsg", resultMsg);
	        sLocationUrl = "forward:/cop/com/selectScheduleList.do";
        }else{
            
            sLocationUrl = "kor/common/SchdulRegist";
        }
        
        UserInfVO userVO = new UserInfVO();
        userVO.setCmmntyId("1");// 페이징 하지 않기 위해서.
    	Map<String, Object> map = userInfService.selectCmsDptList(userVO);
        model.addAttribute("resultDptList", map.get("resultList"));
        
        Map<String, Object> map2 = userInfService.selectCmsSectList(userVO);
        model.addAttribute("resultSectList", map2.get("resultList"));
        
    	model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl; 
    }    
	
	@RequestMapping("/cop/com/selectSchedule.do")
    public String selectNierSchedule(@ModelAttribute("searchVO") EgovScheduleVO schdulVO, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null){
			model.addAttribute("sessionUniqId", null);
		}else{
			model.addAttribute("sessionUniqId", user.getUniqId());
		}
		
		EgovScheduleVO vo = egovScheduleService.selectSchedule(schdulVO);
	
		model.addAttribute("result", vo);
		//CommandMap의 형태로 개선????
	
		UserInfVO userVO = new UserInfVO();
        userVO.setCmmntyId("1");// 페이징 하지 않기 위해서.
    	Map<String, Object> map = userInfService.selectCmsDptList(userVO);
        model.addAttribute("resultDptList", map.get("resultList"));
        
        Map<String, Object> map2 = userInfService.selectCmsSectList(userVO);
        model.addAttribute("resultSectList", map2.get("resultList"));
        
		return "kor/common/SchdulInqire";
	
    }
	
	@RequestMapping("/cop/com/updateScheduleArticle.do")
    public String updateNierSchdul(@ModelAttribute("searchVO") EgovScheduleVO schdulVO, ModelMap model)
	    throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if(user == null){
			model.addAttribute("sessionUniqId", null);
		}else{
			model.addAttribute("sessionUniqId", user.getUniqId());
		}
	
		if (isAuthenticated) {
		    
			egovScheduleService.updateSchdul(schdulVO);;
		}
		
		return "forward:/cop/com/selectScheduleList.do";
    }
	
	@SuppressWarnings("unused")
	@RequestMapping("/cop/com/deleteSchedule.do")
	    public String deleteBoardArticle(@ModelAttribute("searchVO") EgovScheduleVO schdulVO, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
		    
			egovScheduleService.deleteSchedule(schdulVO);
		}

		return "forward:/cop/com/selectScheduleList.do";
    }
	 
	@SuppressWarnings({ "unused", "unchecked", "rawtypes" })
	@RequestMapping("/user/cop/com/selectScheduleList.do")
    public String selectUserList(HttpServletRequest request  , @ModelAttribute("searchVO") EgovScheduleVO reportVO, ModelMap model) throws Exception {
	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		//사용자, 관리자 판단 Tiles 사용
		String tilesPrefix = "/";
		String menuNo = request.getParameter("menuNo");
		
		if(user != null){
			model.addAttribute("sessionUniqId", user.getUniqId());
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
	    	tilesPrefix = "/";//관리자용 화면 노출
		}
		
		Calendar today = Calendar.getInstance();
		DayComUtil comUtil = new DayComUtil();
		
		String tmpToday = DayComUtil.getDateToStr(today.getTime(), "yyyyMMdd");
	    String dayDisp = tmpToday.substring(0, 4) + "," + tmpToday.substring(4, 6) + "," + tmpToday.substring(6, 8);
	    
		int year = 0;
		int month = 0;
		int day = 0;
		
		if(!reportVO.getYearStr().equals("")){
			year = Integer.parseInt(reportVO.getYearStr().trim());
		}else{
			year = today.get(1);
		}
		
		if(!reportVO.getMonthStr().equals("")){
			month = Integer.parseInt(reportVO.getMonthStr().trim());
		}else{
			month = today.get(2) + 1;
		}
		
		if(!reportVO.getDayStr().equals("")){
			day = Integer.parseInt(reportVO.getDayStr().trim());
		}else{
			day = today.get(5);
		}
		 
		
		if (year < 1950) {
	      year = today.get(1);
	    }
		
		 if ((month > 12) || (month < 1)) {
	      month = today.get(2) + 1;
	    }
		 
	    if ((day > 31) || (day < 1)) {
	      day = today.get(5);
	    }
	    
	    Calendar nextmonth = Calendar.getInstance();
	    nextmonth.set(year, month - 1, 1);
	    nextmonth.add(2, 1);
	    
	    
	    Calendar prevmonth = Calendar.getInstance();
	    prevmonth.set(year, month - 1, 1);
	    prevmonth.add(2, -1);
	    
	    Calendar nextyear = Calendar.getInstance();
	    nextyear.set(year, month - 1, 1);
	    nextyear.add(1, 1);

	    Calendar prevyear = Calendar.getInstance();
	    prevyear.set(year, month - 1, 1);
	    prevyear.add(1, -1);

	    Calendar nextday = Calendar.getInstance();
	    nextday.set(year, month - 1, day);
	    nextday.add(5, 1);
	    String tmpNextday = DayComUtil.getDateToStr(nextday.getTime(), "yyyyMMdd");
	    String nextDayDisp = tmpNextday.substring(0, 4) + "," + tmpNextday.substring(4, 6) + "," + tmpNextday.substring(6, 8);
	    

	    Calendar prevday = Calendar.getInstance();
	    prevday.set(year, month - 1, day);
	    prevday.add(5, -1);
	    String tmpPrevday = DayComUtil.getDateToStr(prevday.getTime(), "yyyyMMdd");
	    String prevDayDisp = tmpPrevday.substring(0, 4) + "," + tmpPrevday.substring(4, 6) + "," + tmpPrevday.substring(6, 8);
	    
	    List<DayVO> dayList = this.getDays(today, year, month);
	    List<EgovScheduleVO> weekList = new ArrayList();
	    
	    for (int i = 0; i < dayList.size(); i++)
	    {
	    	DayVO dayVo = (DayVO)dayList.get(i);
	      if ( (DayComUtil.getStrYmd(year, month, day).equals(dayVo.getYmd())))
	      {
	        EgovScheduleVO scheduleVO = new EgovScheduleVO();
	        scheduleVO.setSearchDate(dayVo.getYmd().replace("-", ""));
	        List<EgovScheduleVO> eventList = egovScheduleService.selectDiarySechdule(scheduleVO);
	        model.addAttribute("eventList", eventList);
	      }
	      if ( (DayComUtil.getCalendarYmd(year, month, day).get(4) == DayComUtil.getCalendarYmd(dayVo.getYear(), dayVo.getMonth(), dayVo.getDay()).get(4)))
	      {
	        EgovScheduleVO scheduleVO = new EgovScheduleVO();
	        scheduleVO.setSearchDate(dayVo.getYmd().replace("-", ""));
	        List<EgovScheduleVO> tempList = egovScheduleService.selectDiarySechdule(scheduleVO);
	        for (int j = 0; j < tempList.size(); j++) {
	          weekList.add((EgovScheduleVO)tempList.get(j));
	        }
	      }
	    }
	    model.addAttribute("dayDisp", dayDisp);
	    model.addAttribute("nextDayDisp", nextDayDisp);
	    model.addAttribute("prevDayDisp", prevDayDisp);
	    model.addAttribute("nextmonth", Integer.valueOf(nextmonth.get(2) + 1));
	    model.addAttribute("prevmonth", Integer.valueOf(prevmonth.get(2) + 1));
	    model.addAttribute("nextyear", Integer.valueOf(nextyear.get(1)));
	    model.addAttribute("prevyear", Integer.valueOf(prevyear.get(1)));
	    
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("day",day);
		model.addAttribute("dayList",dayList);
		model.addAttribute("weekList", weekList);
		model.addAttribute("tilesPrefix", tilesPrefix);
		
		return tilesPrefix + "kor/common/UserSchdulList";
	}
	
	@RequestMapping("/user/cop/com/selectNierSchedule.do")
    public String selectUserSchedule(@ModelAttribute("searchVO") EgovScheduleVO schdulVO, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null){
			model.addAttribute("sessionUniqId", null);
		}else{
			model.addAttribute("sessionUniqId", user.getUniqId());
		}
		
		EgovScheduleVO vo = egovScheduleService.selectSchedule(schdulVO);
	
		model.addAttribute("result", vo);
		//CommandMap의 형태로 개선
	
		UserInfVO userVO = new UserInfVO();
        userVO.setCmmntyId("1");// 페이징 하지 않기 위해서.
    	Map<String, Object> map = userInfService.selectCmsDptList(userVO);
        model.addAttribute("resultDptList", map.get("resultList"));
        
        Map<String, Object> map2 = userInfService.selectCmsSectList(userVO);
        model.addAttribute("resultSectList", map2.get("resultList"));
        
		return "kor/common/UserSchdulInqire";
	
    }
}
