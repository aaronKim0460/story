/**
 * @Name : LmsCourseManageController.java
 * @Description : 과정관리 controller.
 * @author 이한구
 * @since 2016. 11. 25.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 25.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.kids.lms.service.LmsCourseManageService;
import egovframework.com.kids.lms.vo.LmsChasiVO;
import egovframework.com.kids.lms.vo.LmsCourseVO;
import egovframework.com.kids.lms.vo.LmsQuestionVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class LmsCourseManageController {

	@Resource(name = "lmsCourseManageService")
	private LmsCourseManageService lmsCourseManageService;

	/**
	 * 과정 목록
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsCourseList.do")
	public String lmsCourseList(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model)
			throws Exception {
		// -------- 목록 페이지에서 세션이 있는 경우에만 "등록" 버튼 출력을 위해서 세션 체크
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (user != null) {
			model.addAttribute("sessionUniqId", user.getUniqId());
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(lmsCourseVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(lmsCourseVO.getPageUnit());
		paginationInfo.setPageSize(lmsCourseVO.getPageSize());

		lmsCourseVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		lmsCourseVO.setLastIndex(paginationInfo.getLastRecordIndex());
		lmsCourseVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("resultList", lmsCourseManageService.selectLmsCourseList(lmsCourseVO));

		paginationInfo.setTotalRecordCount(lmsCourseManageService.selectLmsCourseCount(lmsCourseVO));
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/kids/lms/lmsCourseList";
	}

	/**
	 * 과정 등록 화면
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsCourseRegist.do")
	public String lmsCourseRegist(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		return "egovframework/com/kids/lms/lmsCourseRegist";
	}

	/**
	 * 과정 등록
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsCourseInsert.do")
	public String lmsCourseInsert(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		lmsCourseVO.setRegId(user.getUniqId());
		lmsCourseVO.setRegNm(user.getName());

		if (isAuthenticated) {
			lmsCourseManageService.insertLmsCourse(lmsCourseVO);

			model.addAttribute("resultMsg", "success.common.insert");
			return "forward:/Relay.do?_forward_page=/com/kids/lms/lmsCourseList.do";
		} else {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
	}

	/**
	 * 과정 상세 보기
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsCourseInqire.do")
	public String lmsCourseInqire(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		model.addAttribute("result", lmsCourseManageService.selectLmsCourse(lmsCourseVO));

		return "egovframework/com/kids/lms/lmsCourseInqire";
	}

	/**
	 * 과정 삭제
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsCourseDelete.do")
	public String lmsCourseDelete(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			lmsCourseManageService.deleteLmsCourse(lmsCourseVO);

			model.addAttribute("resultMsg", "success.common.delete");
			return "forward:/Relay.do?_forward_page=/com/kids/lms/lmsCourseList.do";
		} else {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
	}

	/**
	 * 과정 수정 화면
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsCourseDetail.do")
	public String lmsCourseDetail(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		model.addAttribute("result", lmsCourseManageService.selectLmsCourse(lmsCourseVO));

		return "egovframework/com/kids/lms/lmsCourseDetail";
	}

	/**
	 * 과정 수정
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsCourseUpdate.do")
	public String lmsCourseUpdate(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			lmsCourseManageService.updateLmsCourse(lmsCourseVO);

			model.addAttribute("resultMsg", "success.common.update");
			return "forward:/Relay.do?_forward_page=/com/kids/lms/lmsCourseList.do";
		} else {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
	}

	/**
	 * 차시 관리 화면
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsChasiManage.do")
	public String lmsChasiManage(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated || lmsCourseVO.getCourseId() == null) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		model.addAttribute("result", lmsCourseManageService.selectLmsCourse(lmsCourseVO));
		LmsChasiVO listVO = new LmsChasiVO();
		listVO.setCourseId(lmsCourseVO.getCourseId());
		model.addAttribute("resultList", lmsCourseManageService.selectLmsChasiListByCourseId(listVO));

		return "egovframework/com/kids/lms/lmsChasiManage";
	}

	/**
	 * 차시 저장
	 * 
	 * @param req
	 * @param res
	 * @param lmsChasiVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsCharsiSave.do")
	@ResponseBody
	public String lmsCharsiSave(HttpServletRequest req, HttpServletResponse res, LmsChasiVO lmsChasiVO, Model model) throws Exception {
		String finalResult = "";

		try {
			if (lmsChasiVO.getChasiId() != null) {
				lmsCourseManageService.updateLmsChasi(lmsChasiVO);
			} else {
				lmsCourseManageService.insertLmsChasi(lmsChasiVO);
			}

			finalResult = "success";
		} catch (Exception e) {
			e.printStackTrace();
			finalResult = "failure";
		}

		return finalResult;

	}

	/**
	 * 차시 삭제
	 * 
	 * @param req
	 * @param res
	 * @param lmsChasiVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsCharsiDelete.do")
	@ResponseBody
	public String lmsCharsiDelete(HttpServletRequest req, HttpServletResponse res, LmsChasiVO lmsChasiVO, Model model) throws Exception {
		String finalResult = "";

		try {
			lmsCourseManageService.deleteLmsChasi(lmsChasiVO);

			finalResult = "success";
		} catch (Exception e) {
			e.printStackTrace();
			finalResult = "failure";
		}

		return finalResult;

	}

	/**
	 * 과정 문제 관리 화면
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsQuestionManage.do")
	public String lmsQuestionManage(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated || lmsCourseVO.getCourseId() == null) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		model.addAttribute("result", lmsCourseManageService.selectLmsCourse(lmsCourseVO));
		LmsQuestionVO listVO = new LmsQuestionVO();
		listVO.setCourseId(lmsCourseVO.getCourseId());
		model.addAttribute("resultList", lmsCourseManageService.selectLmsQuestionListByCourseId(listVO));

		return "egovframework/com/kids/lms/lmsQuestionManage";
	}

	/**
	 * 과정 문제 상세 보기
	 * 
	 * @param req
	 * @param res
	 * @param lmsQuestionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsQuestionDetail.do")
	public String lmsQuestionDetail(HttpServletRequest req, HttpServletResponse res, LmsQuestionVO lmsQuestionVO, Model model) throws Exception {

		model.addAttribute("result", lmsCourseManageService.selectLmsQuestion(lmsQuestionVO));

		return "egovframework/com/kids/lms/lmsQuestionDetail";
	}

	/**
	 * 과정 문제 저장
	 * 
	 * @param req
	 * @param res
	 * @param lmsQuestionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsQuestionSave.do")
	@ResponseBody
	public String lmsQuestionSave(HttpServletRequest req, HttpServletResponse res, LmsQuestionVO lmsQuestionVO, Model model) throws Exception {
		String finalResult = "";

		try {
			if (lmsQuestionVO.getQuestionId() != null) {
				lmsCourseManageService.updateLmsQuestion(lmsQuestionVO);
			} else {
				lmsCourseManageService.insertLmsQuestion(lmsQuestionVO);
			}

			finalResult = "success";
		} catch (Exception e) {
			e.printStackTrace();
			finalResult = "failure";
		}

		return finalResult;

	}

	/**
	 * 과정 문제 삭제
	 * 
	 * @param req
	 * @param res
	 * @param lmsQuestionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/lms/lmsQuestionDelete.do")
	@ResponseBody
	public String lmsQuestionDelete(HttpServletRequest req, HttpServletResponse res, LmsQuestionVO lmsQuestionVO, Model model) throws Exception {
		String finalResult = "";

		try {
			lmsCourseManageService.deleteLmsQuestion(lmsQuestionVO);

			finalResult = "success";
		} catch (Exception e) {
			e.printStackTrace();
			finalResult = "failure";
		}

		return finalResult;

	}

}
