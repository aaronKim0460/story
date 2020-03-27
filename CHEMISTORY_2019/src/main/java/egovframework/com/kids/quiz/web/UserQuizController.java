/**
 * @Name : UserQuizController.java
 * @Description : 사용자 퀴즈 controller.
 * @author 이한구
 * @since 2016. 12. 5.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 12. 5.	이한구. 최초 생성.
 */
package egovframework.com.kids.quiz.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.hsqldb.lib.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.kids.quiz.service.QuizService;
import egovframework.com.kids.quiz.vo.QzCategoryVO;
import egovframework.com.kids.quiz.vo.QzSubjectVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;

@Controller
public class UserQuizController {

	@Resource(name = "quizService")
	private QuizService quizService;

	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
	private EgovMenuManageService menuManageService;

	/**
	 * 사용자 퀴즈 메인
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/quiz/userQuizMain.do")
	public String userQuizMain(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {

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

		return "kor/kids/quiz/userQuizMain";
	}

	/**
	 * 사용자 퀴즈 풀기 화면
	 * 
	 * @param req
	 * @param res
	 * @param qzCategoryVO
	 * @param qzSubjectVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/quiz/quizInqire.do")
	public String quizInqire(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("qzCategoryVO") QzCategoryVO qzCategoryVO,
			@ModelAttribute("qzSubjectVO") QzSubjectVO qzSubjectVO, Model model) throws Exception {

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

		// 퀴즈 카테고리 정보
		model.addAttribute("categoryList", quizService.selectCategoryList(qzCategoryVO));

		// 퀴즈 정보
		if (qzSubjectVO.getCategoryKey() != null) {
			model.addAttribute("resultList", quizService.selectQuizList(qzSubjectVO));
		}

		return "kor/kids/quiz/quizInqire";
	}

	/**
	 * 단어찾기 퀴즈1
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/quiz/quizInqireWord1.do")
	public String quizInqireWord1(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
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

		return "kor/kids/quiz/quizInqireWord1";
	}

	/**
	 * 정답 확인1
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/quiz/quizInqireWord1Check.do")
	@ResponseBody
	public String quizInqireWord1Check(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String finalResult = "";

		String answerNo = req.getParameter("answerChoice");
		String answer = req.getParameter("answer");

		if (!StringUtil.isEmpty(answerNo) && !StringUtil.isEmpty(answer)) {
			if (answerNo.equals("0")) {
				if (answer.equals("숯")) {
					finalResult = "/images/old/puzzle/pz1_01_ov.jpg";
				}
			} else if (answerNo.equals("1")) {
				if (answer.equals("식품첨가물")) {
					finalResult = "/images/old/puzzle/pz1_11_ov.jpg^||^/images/old/puzzle/pz1_12_ov.jpg^||^/images/old/puzzle/pz1_13_ov.jpg^||^/images/old/puzzle/pz1_14_ov.jpg^||^/images/old/puzzle/pz1_15_ov.jpg";
				}
			} else if (answerNo.equals("2")) {
				if (answer.equals("톨루엔")) {
					finalResult = "/images/old/puzzle/pz1_22_ov.jpg^||^/images/old/puzzle/pz1_23_ov.jpg^||^/images/old/puzzle/pz1_24_ov.jpg";
				}
			} else if (answerNo.equals("3")) {
				if (answer.equals("진드기")) {
					finalResult = "/images/old/puzzle/pz1_34_ov.jpg^||^/images/old/puzzle/pz1_35_ov.jpg^||^/images/old/puzzle/pz1_36_ov.jpg";
				}
			} else if (answerNo.equals("4")) {
				if (answer.equals("프탈레이트")) {
					finalResult = "/images/old/puzzle/pz1_42_ov.jpg^||^/images/old/puzzle/pz1_43_ov.jpg^||^/images/old/puzzle/pz1_44_ov.jpg^||^/images/old/puzzle/pz1_45_ov.jpg^||^/images/old/puzzle/pz1_46_ov.jpg";
				}
			} else if (answerNo.equals("5")) {
				if (answer.equals("농약")) {
					finalResult = "/images/old/puzzle/pz1_53_ov.jpg^||^/images/old/puzzle/pz1_54_ov.jpg";
				}
			} else if (answerNo.equals("6")) {
				if (answer.equals("피비디이")) {
					finalResult = "/images/old/puzzle/pz1_62_ov.jpg^||^/images/old/puzzle/pz1_63_ov.jpg^||^/images/old/puzzle/pz1_64_ov.jpg^||^/images/old/puzzle/pz1_65_ov.jpg";
				}
			} else if (answerNo.equals("7")) {
				if (answer.equals("피레스로이드")) {
					finalResult = "/images/old/puzzle/pz1_71_ov.jpg^||^/images/old/puzzle/pz1_72_ov.jpg^||^/images/old/puzzle/pz1_73_ov.jpg^||^/images/old/puzzle/pz1_74_ov.jpg^||^/images/old/puzzle/pz1_75_ov.jpg^||^/images/old/puzzle/pz1_76_ov.jpg";
				}
			}
		} else {
			finalResult = "failure";
		}

		return finalResult;
	}

	/**
	 * 단어찾기 퀴즈2
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/quiz/quizInqireWord2.do")
	public String quizInqireWord2(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
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

		return "kor/kids/quiz/quizInqireWord2";
	}

	/**
	 * 정답 확인2
	 * 
	 * @param req
	 * @param res
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/quiz/quizInqireWord2Check.do")
	@ResponseBody
	public String quizInqireWord2Check(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String finalResult = "";

		String answerNo = req.getParameter("answerChoice");
		String answer = req.getParameter("answer");

		if (!StringUtil.isEmpty(answerNo) && !StringUtil.isEmpty(answer)) {
			if (answerNo.equals("0")) {
				if (answer.equals("방부제")) {
					finalResult = "/images/old/puzzle/pz2_01_ov.jpg^||^/images/old/puzzle/pz2_02_ov.jpg^||^/images/old/puzzle/pz2_03_ov.jpg";
				}
			} else if (answerNo.equals("1")) {
				if (answer.equals("새집증후군")) {
					finalResult = "/images/old/puzzle/pz2_12_ov.jpg^||^/images/old/puzzle/pz2_13_ov.jpg^||^/images/old/puzzle/pz2_14_ov.jpg^||^/images/old/puzzle/pz2_15_ov.jpg^||^/images/old/puzzle/pz2_16_ov.jpg";
				}
			} else if (answerNo.equals("2")) {
				if (answer.equals("세제")) {
					finalResult = "/images/old/puzzle/pz2_24_ov.jpg^||^/images/old/puzzle/pz2_25_ov.jpg";
				}
			} else if (answerNo.equals("3")) {
				if (answer.equals("수은")) {
					finalResult = "/images/old/puzzle/pz2_32_ov.jpg^||^/images/old/puzzle/pz2_33_ov.jpg";
				}
			} else if (answerNo.equals("4")) {
				if (answer.equals("스모그")) {
					finalResult = "/images/old/puzzle/pz2_43_ov.jpg^||^/images/old/puzzle/pz2_44_ov.jpg^||^/images/old/puzzle/pz2_45_ov.jpg";
				}
			} else if (answerNo.equals("5")) {
				if (answer.equals("환경호르몬")) {
					finalResult = "/images/old/puzzle/pz2_51_ov.jpg^||^/images/old/puzzle/pz2_52_ov.jpg^||^/images/old/puzzle/pz2_53_ov.jpg^||^/images/old/puzzle/pz2_54_ov.jpg^||^/images/old/puzzle/pz2_55_ov.jpg";
				}
			} else if (answerNo.equals("6")) {
				if (answer.equals("유기농")) {
					finalResult = "/images/old/puzzle/pz2_64_ov.jpg^||^/images/old/puzzle/pz2_65_ov.jpg^||^/images/old/puzzle/pz2_66_ov.jpg";
				}
			} else if (answerNo.equals("7")) {
				if (answer.equals("염소")) {
					finalResult = "/images/old/puzzle/pz2_72_ov.jpg^||^/images/old/puzzle/pz2_73_ov.jpg";
				}
			}
		} else {
			finalResult = "failure";
		}

		return finalResult;
	}

}
