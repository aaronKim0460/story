/**
 * @Name : CalenderController.java
 * @Description : 달력 controller.
 * @author 이한구
 * @since 2016. 11. 22.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 22.	이한구. 최초 생성.
 */
package egovframework.com.kids.calender.web;

import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.kids.calender.service.CalenderService;
import egovframework.com.kids.calender.vo.CalenderVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CalenderController {

	@Resource(name = "calenderService")
	CalenderService calenderService;

	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
	private EgovMenuManageService menuManageService;

	/**
	 * 달력 목록
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/calender/calenderList.do")
	public String calenderList(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		// -------- 목록 페이지에서 세션이 있는 경우에만 "등록" 버튼 출력을 위해서 세션 체크
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (user != null) {
			model.addAttribute("sessionUniqId", user.getUniqId());
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(calenderVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(calenderVO.getPageUnit());
		paginationInfo.setPageSize(calenderVO.getPageSize());

		calenderVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		calenderVO.setLastIndex(paginationInfo.getLastRecordIndex());
		calenderVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("resultList", calenderService.selectCalenderList(calenderVO));

		paginationInfo.setTotalRecordCount(calenderService.selectCalenderCount(calenderVO));
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/kids/calender/calenderList";
	}

	/**
	 * 달력 등록 화면
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/calender/calenderRegist.do")
	public String calenderRegist(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		return "egovframework/com/kids/calender/calenderRegist";
	}

	/**
	 * 달력 등록
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/calender/calenderInsert.do")
	public String calenderInsert(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			calenderService.insertCalender(calenderVO);

			model.addAttribute("resultMsg", "success.common.insert");
			return "forward:/Relay.do?_forward_page=/com/kids/calender/calenderList.do";
		} else {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
	}

	/**
	 * 달력 상세 보기
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/calender/calenderInqire.do")
	public String calenderInqire(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		model.addAttribute("result", calenderService.selectCalender(calenderVO));

		return "egovframework/com/kids/calender/calenderInqire";
	}

	/**
	 * 달력 삭제
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/calender/calenderDelete.do")
	public String calenderDelete(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			calenderService.deleteCalender(calenderVO);

			model.addAttribute("resultMsg", "success.common.delete");
			return "forward:/Relay.do?_forward_page=/com/kids/calender/calenderList.do";
		} else {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
	}

	/**
	 * 달력 수정 화면
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/calender/calenderDetail.do")
	public String calenderDetail(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		model.addAttribute("result", calenderService.selectCalender(calenderVO));

		return "egovframework/com/kids/calender/calenderDetail";
	}

	/**
	 * 달력 수정
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/calender/calenderUpdate.do")
	public String calenderUpdate(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (isAuthenticated) {
			calenderService.updateCalender(calenderVO);

			model.addAttribute("resultMsg", "success.common.update");
			return "forward:/Relay.do?_forward_page=/com/kids/calender/calenderList.do";
		} else {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
	}

	/**
	 * 달력으로 보기
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/calender/calenderView.do")
	public String calenderView(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		// 날짜가 없을 경우 넣어서 검색한다.
		if (calenderVO.getCalendarViewYn() == null) {
			Calendar cal = Calendar.getInstance();

			String year = String.valueOf(cal.get(Calendar.YEAR));
			int currentMonth = cal.get(Calendar.MONTH) + 1;
			String month = "";

			if (currentMonth < 10) {
				month = "0" + String.valueOf(currentMonth);
			} else {
				month = String.valueOf(currentMonth);
			}

			calenderVO.setSrchYear(year);
			calenderVO.setSrchMonth(month);
			calenderVO.setSrchGubun(null);
			calenderVO.setSearchCondition(null);
			calenderVO.setSearchKeyword(null);
		}

		model.addAttribute("resultList", calenderService.selectCalenderViewList(calenderVO));

		return "egovframework/com/kids/calender/calenderView";
	}

	/**
	 * 학습자 달력 목록
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/calender/calenderList.do")
	public String userCalenderList(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		// -------- 목록 페이지에서 세션이 있는 경우에만 "등록" 버튼 출력을 위해서 세션 체크
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (user != null) {
			model.addAttribute("sessionUniqId", user.getUniqId());
		}

		// 메뉴 프로그램 관리
		String menuNo = req.getParameter("menuNo");
		if (StringUtils.isNotEmpty(menuNo)) {
			ComDefaultVO searchVO = new ComDefaultVO();
			searchVO.setMenuLongId(Long.parseLong(menuNo));
			MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(searchVO);
			model.addAttribute("menuManageVO", resultVO);
			searchVO.setSearchKeyword(menuNo);
			model.addAttribute("menuManager", menuManageService.selectMenuAdminManage(searchVO));
		}

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(calenderVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(calenderVO.getPageUnit());
		paginationInfo.setPageSize(calenderVO.getPageSize());

		calenderVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		calenderVO.setLastIndex(paginationInfo.getLastRecordIndex());
		calenderVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("resultList", calenderService.selectCalenderList(calenderVO));

		paginationInfo.setTotalRecordCount(calenderService.selectCalenderCount(calenderVO));
		model.addAttribute("paginationInfo", paginationInfo);

		return "kor/kids/calendar/calendarList";
	}

	/**
	 * 학습자 달력 상세 보기
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/calender/calenderInqire.do")
	public String userCalenderInqire(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		// 메뉴 프로그램 관리
		String menuNo = req.getParameter("menuNo");
		if (StringUtils.isNotEmpty(menuNo)) {
			ComDefaultVO searchVO = new ComDefaultVO();
			searchVO.setMenuLongId(Long.parseLong(menuNo));
			MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(searchVO);
			model.addAttribute("menuManageVO", resultVO);
			searchVO.setSearchKeyword(menuNo);
			model.addAttribute("menuManager", menuManageService.selectMenuAdminManage(searchVO));
		}

		model.addAttribute("result", calenderService.selectCalender(calenderVO));

		return "kor/kids/calendar/calendarInqire";
	}

	/**
	 * 학습자 달력으로 보기
	 * 
	 * @param req
	 * @param res
	 * @param calenderVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/calender/calenderView.do")
	public String userCalenderView(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("calenderVO") CalenderVO calenderVO, Model model)
			throws Exception {
		// 날짜가 없을 경우 넣어서 검색한다.
		if (calenderVO.getCalendarViewYn() == null) {
			Calendar cal = Calendar.getInstance();

			String year = String.valueOf(cal.get(Calendar.YEAR));
			int currentMonth = cal.get(Calendar.MONTH) + 1;
			String month = "";

			if (currentMonth < 10) {
				month = "0" + String.valueOf(currentMonth);
			} else {
				month = String.valueOf(currentMonth);
			}

			calenderVO.setSrchYear(year);
			calenderVO.setSrchMonth(month);
			calenderVO.setSrchGubun(null);
			calenderVO.setSearchCondition(null);
			calenderVO.setSearchKeyword(null);
		}

		// 메뉴 프로그램 관리
		String menuNo = req.getParameter("menuNo");
		if (StringUtils.isNotEmpty(menuNo)) {
			ComDefaultVO searchVO = new ComDefaultVO();
			searchVO.setMenuLongId(Long.parseLong(menuNo));
			MenuManageVO resultVO = menuManageService.selectMenuInfo_PRGM(searchVO);
			model.addAttribute("menuManageVO", resultVO);
			searchVO.setSearchKeyword(menuNo);
			model.addAttribute("menuManager", menuManageService.selectMenuAdminManage(searchVO));
		}

		model.addAttribute("resultList", calenderService.selectCalenderViewList(calenderVO));
		model.addAttribute("resultList2", calenderService.selectCalenderUserList(calenderVO));

		return "kor/kids/calendar/calendarView";
	}
}
