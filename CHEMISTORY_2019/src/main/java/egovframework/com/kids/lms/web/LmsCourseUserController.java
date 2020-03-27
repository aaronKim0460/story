/**
 * @Name : LmsCourseUserController.java
 * @Description : 사용자 과정 controller.
 * @author 이한구
 * @since 2016. 12. 1.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 12. 1.	이한구. 최초 생성.
 */
package egovframework.com.kids.lms.web;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.hsqldb.lib.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.kids.common.vo.NewsLetterVo;
import egovframework.com.kids.lms.service.LmsCourseManageService;
import egovframework.com.kids.lms.service.LmsSugangManageService;
import egovframework.com.kids.lms.vo.LmsChasiVO;
import egovframework.com.kids.lms.vo.LmsCourseVO;
import egovframework.com.kids.lms.vo.LmsQuestionVO;
import egovframework.com.kids.lms.vo.LmsSugangChasiResultVO;
import egovframework.com.kids.lms.vo.LmsSugangVO;
import egovframework.com.kids.lms.vo.LmsTestResultVO;
import egovframework.com.kids.lms.vo.MemberInformationVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.com.uss.umt.service.EgovUserManageService;

@Controller
public class LmsCourseUserController {

	@Resource(name = "lmsSugangManageService")
	private LmsSugangManageService lmsSugangManageService;

	@Resource(name = "lmsCourseManageService")
	private LmsCourseManageService lmsCourseManageService;

	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
	private EgovMenuManageService menuManageService;

    /** EgovUserManageService */
    @Resource(name="userManageService")
    EgovUserManageService userMngService;
	
	
	
	/**
	 * 사용자 과정 목록
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/lms/lmsCourseListForUser.do")
	public String lmsCourseListForUser(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model)
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
		
		//사용자정보 session 저장

		HttpSession httpSession = req.getSession(true);
		Object sesEmail = httpSession.getAttribute("memEmail");
		String memEmail = (String)sesEmail;
		
		if (!StringUtil.isEmpty(memEmail)) {
			
			lmsCourseVO.setUserEmail(memEmail);
		}
		
		
		// 교육 데이터 불러 오기 
		model.addAttribute("resultList", lmsCourseManageService.selectLmsCourseListForUser(lmsCourseVO));

		return "kor/kids/lms/lmsCourseListForUser";
	}

	/**
	 * 학습하기 - popup
	 * 
	 * @param req
	 * @param res
	 * @param lmsCourseVO
	 * @param lmsChasiVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/lms/studyPopup.do")
	public String studyPopup(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO,
			@ModelAttribute("lmsChasiVO") LmsChasiVO lmsChasiVO, Model model) throws Exception {

		
		HttpSession httpSession = req.getSession(true);
		Object sesEmail = httpSession.getAttribute("memEmail");
		String memEmail = (String)sesEmail;
		
		
		if (!StringUtil.isEmpty(memEmail)) {
			// 수강_ID가 없으면 로그인 정보로 확인하고 등록한다.
			
			if (lmsCourseVO.getSugangId() == null) {

				LmsSugangVO insertVO = new LmsSugangVO();
				insertVO.setUserEmail(memEmail);
				insertVO.setCourseId(lmsCourseVO.getCourseId());
	
				LmsSugangVO detailVO = lmsSugangManageService.selectLmsSugang(insertVO);
	
				if (detailVO != null && detailVO.getSugangId() != null) {
					lmsCourseVO.setSugangId(detailVO.getSugangId());
					System.out.println("있다");
				} else {
					lmsSugangManageService.insertLmsSugang(insertVO);
					lmsCourseVO.setSugangId(insertVO.getSugangId());
					System.out.println("없다");
				}
			}
		}

		// 과정 정보
		model.addAttribute("courseResult", lmsCourseManageService.selectLmsCourse(lmsCourseVO));

		// 차시 정보
		model.addAttribute("result", lmsCourseManageService.selectLmsChasi(lmsChasiVO));

		return "kor/kids/lms/studyPopup";
	}

	/**
	 * 수강 차시 완료 처리
	 * 
	 * @param req
	 * @param res
	 * @param lmsSugangChasiResultVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/lms/lmsSugangCharsiResultSave.do")
	@ResponseBody
	public String lmsSugangCharsiResultSave(HttpServletRequest req, HttpServletResponse res, LmsSugangChasiResultVO lmsSugangChasiResultVO, Model model)
			throws Exception {
		String finalResult = "";

		try {
			if (lmsSugangChasiResultVO.getSugangId() != null) {

				int insertCount = lmsSugangManageService.selectLmsSugangChasiResultCount(lmsSugangChasiResultVO);
				

				if (insertCount > 0) {
					finalResult = "already";
				
				} else {
					lmsSugangManageService.insertLmsSugangChasiResult(lmsSugangChasiResultVO);
					finalResult = "insertData";
				}
			} else {
				finalResult = "notSave";
			}
		} catch (Exception e) {
			e.printStackTrace();
			finalResult = "failure"+ e.getMessage();
		}

		return finalResult;
	}

	/**
	 * 이메일 로그인 처리
	 * 
	 * @param req
	 * @param res
	 * @param memberInformationVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/lms/memberInformationProcess.do")
//	@ResponseBody
	public String memberInformationProcess(HttpServletRequest req, HttpServletResponse res, MemberInformationVO memberInformationVO, @ModelAttribute("nvo") NewsLetterVo nlvo, Model model)
			throws Exception {
		String finalResult = "";
		String newsletterYn = req.getParameter("newsletterYn") == null ? "N" : req.getParameter("newsletterYn");

		

		try {
			// 조회 해서 결과가 없으면 등록하고 있으면 비밀번호를 비교한다.
			MemberInformationVO detailVO = lmsSugangManageService.selectMemberInformationByEmail(memberInformationVO);

			
			if (detailVO != null && detailVO.getMemberPw() != null) {

				String password = memberInformationVO.getMemberPw();
				String encodingPassword = md5(password);
				String comparePassword = detailVO.getMemberPw();

				if (encodingPassword.equals(comparePassword)) {
					finalResult = "correct";
				} else {
					finalResult = "incorrect";
				}
			} else {
				String password = memberInformationVO.getMemberPw();
				String encodingPassword = md5(password);
				memberInformationVO.setMemberPw(encodingPassword);

				lmsSugangManageService.insertMemberInformation(memberInformationVO);
				finalResult = "dataInsert";
			}

		} catch (Exception e) {
			e.printStackTrace();
			finalResult = "failure";
		}

		String menuNo = req.getParameter("menuNo");
		String memEmail = req.getParameter("memEmail");
		
		if(!finalResult.equals("incorrect")){
			HttpSession userSession = null;
			userSession = req.getSession(true);
			userSession.setAttribute("memEmail",memEmail);
			
		
			model.addAttribute("userEmail", memEmail);
			
			if (newsletterYn.equals("Y")) {
				
				nlvo.setEmail(memEmail);
				
				int count = userMngService.selectEmailData(nlvo);
				
		    	if(count > 0){//email 있음
		    	}
		    	else{//없음
		    		userMngService.insertEmailData(nlvo);
		    	}

			}
			
		} 
			
		model.addAttribute("menuNo", menuNo);
		model.addAttribute("finalResult", finalResult);
		model.addAttribute("newsletterYn", newsletterYn);

		return //"redirect:http://chemistory.go.kr/user/com/kids/lms/lmsCourseListForUser.do";
				"redirect:/user/com/kids/lms/lmsCourseListForUser.do";
	}

	
	/**
	 * 로그아웃 process
	 * 
	 * @param str
	 */	
	@RequestMapping(value = "/user/com/kids/lms/memberLogout.do")
	public String memberLogout(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		HttpSession session=req.getSession();  
         session.invalidate();  
         
 		String menuNo = req.getParameter("menuNo");
 		return "redirect:/user/com/kids/lms/lmsCourseListForUser.do?menuNo="+menuNo;
	}		
		
	
	/**
	 * 이전 사이트 암호화 process
	 * 
	 * @param str
	 * @return
	 */
	public static String md5(String str) {
		StringBuffer sb = null;

		try {
			byte[] digest = MessageDigest.getInstance("MD5").digest(str.getBytes());
			sb = new StringBuffer();

			for (int i = 0; i < digest.length; i++) {
				sb.append(Integer.toString((digest[i] & 0xf0) >> 4, 16));
				sb.append(Integer.toString(digest[i] & 0x0f, 16));
			}
		} catch (Exception e) {
		}

		return sb.toString();
	}

	/**
	 * 사용자 과정 평가 목록
	 * 
	 * @param req
	 * @param res
	 * @param lmsQuestionVO
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/lms/questionListPopup.do")
	public String questionListPopup(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsQuestionVO") LmsQuestionVO lmsQuestionVO,
			@ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model) throws Exception {
		// 과정 정보
		model.addAttribute("courseResult", lmsCourseManageService.selectLmsCourse(lmsCourseVO));

		// 과정 문제 목록
		model.addAttribute("resultList", lmsCourseManageService.selectLmsQuestionListByCourseId(lmsQuestionVO));

		return "kor/kids/lms/questionListPopup";
	}

	/**
	 * 시험 결과 등록
	 * 
	 * @param req
	 * @param res
	 * @param lmsTestResultVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/lms/questionResultSave.do")
	@ResponseBody
	public String questionResultSave(HttpServletRequest req, HttpServletResponse res, LmsTestResultVO lmsTestResultVO, LmsQuestionVO lmsQuestionVO, Model model)
			throws Exception {
		String finalResult = "";

		try {
			List<LmsTestResultVO> voList = new ArrayList<LmsTestResultVO>();

			for (int i = 0; i < lmsTestResultVO.getQuestionIds().length; i++) {
				LmsTestResultVO insertVO = new LmsTestResultVO();
				insertVO.setSugangId(lmsTestResultVO.getSugangId());
				insertVO.setQuestionId(lmsTestResultVO.getQuestionIds()[i]);
				insertVO.setChoiceQuestion(lmsTestResultVO.getChoiceQuestions()[i]);

				voList.add(insertVO);
			}

			if (voList != null && voList.size() > 0) {
				lmsSugangManageService.insertLmsTestResultList(voList);
			}

			// 점수 체크하기
			Long sugangId = lmsTestResultVO.getSugangId();

			List<LmsQuestionVO> questionList = lmsCourseManageService.selectLmsQuestionListByCourseId(lmsQuestionVO);
			HashMap<Long, Long> correctAnswers = new HashMap<Long, Long>();
			for (LmsQuestionVO vo : questionList) {
				correctAnswers.put(vo.getQuestionId(), vo.getRightAnswer());
			}

			Double totalQuestionCount = Double.valueOf(voList.size());
			Double perScore = Math.round(100D / totalQuestionCount) / 1D;
			Double totalScore = 100D;

			for (LmsTestResultVO vo : voList) {
				Long correctAnswer = correctAnswers.get(vo.getQuestionId());
				if (vo.getChoiceQuestion() - correctAnswer != 0L) {
					totalScore = totalScore - perScore;
				}
			}

			// 0보다 작을 경우 0으로 등록한다.
			if (totalScore < 0D) {
				totalScore = 0D;
			}

			LmsSugangVO sugangVO = new LmsSugangVO();
			sugangVO.setSugangId(sugangId);
			sugangVO.setTestPoint(totalScore);

			lmsSugangManageService.updateLmsSugangTestPoint(sugangVO);

			finalResult = "success";
		} catch (Exception e) {
			e.printStackTrace();
			finalResult = "failure";
		}

		return finalResult;
	}

	/**
	 * 과정 평가 결과 화면
	 * 
	 * @param req
	 * @param res
	 * @param lmsQuestionVO
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/lms/questionResultListPopup.do")
	public String questionResultListPopup(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsQuestionVO") LmsQuestionVO lmsQuestionVO,
			@ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model) throws Exception {
		// 과정 정보
		model.addAttribute("courseResult", lmsCourseManageService.selectLmsCourse(lmsCourseVO));

		// 과정 문제 결과 목록
		model.addAttribute("resultList", lmsSugangManageService.selectLmsQuestionResult(lmsQuestionVO));

		return "kor/kids/lms/questionResultListPopup";
	}

	/**
	 * 수료증 화면 팝업
	 * 
	 * @param req
	 * @param res
	 * @param lmsSugangVO
	 * @param lmsCourseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/lms/lmsCourseSuryoPopup.do")
	public String lmsCourseSuryoPopup(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("lmsSugangVO") LmsSugangVO lmsSugangVO,
			@ModelAttribute("lmsCourseVO") LmsCourseVO lmsCourseVO, Model model) throws Exception {
		// 과정 정보
		model.addAttribute("courseResult", lmsCourseManageService.selectLmsCourse(lmsCourseVO));

		// 수강 정보
		model.addAttribute("sugangResult", lmsSugangManageService.selectLmsSugang(lmsSugangVO));

		if (lmsSugangVO.getMemberName() != null) {
			model.addAttribute("memberName", lmsSugangVO.getMemberName());
		}
		return "kor/kids/lms/lmsCourseSuryoPopup";
	}

	/**
	 * 수료정보 등록
	 * 
	 * @param req
	 * @param res
	 * @param lmsSugangVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/lms/lmsCourseSuryoUpdate.do")
	@ResponseBody
	public String lmsCourseSuryoUpdate(HttpServletRequest req, HttpServletResponse res, LmsSugangVO lmsSugangVO, Model model) throws Exception {
		String finalResult = "";

		try {
			lmsSugangManageService.updateLmsSugangSuryo(lmsSugangVO);
			finalResult = "success";
		} catch (Exception e) {
			e.printStackTrace();
			finalResult = "failure";
		}

		return finalResult;
	}
}
