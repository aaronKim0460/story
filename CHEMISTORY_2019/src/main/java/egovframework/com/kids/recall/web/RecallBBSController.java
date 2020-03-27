/**
 * @Name : RecallBBSController.java
 * @Description : 유해용품 리콜 controller.
 * @author 이한구
 * @since 2016. 11. 17.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 11. 17.	이한구. 최초 생성.
 */
package egovframework.com.kids.recall.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.hsqldb.lib.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.kids.recall.service.RecallBBSService;
import egovframework.com.kids.recall.vo.RecallBBSVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class RecallBBSController {

	@Resource(name = "recallBBSService")
	private RecallBBSService recallBBSService;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
	private EgovMenuManageService menuManageService;

	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/**
	 * 유해용품 리콜 목록
	 * 
	 * @param req
	 * @param res
	 * @param recallBBSVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/recall/selectRecallBBSList.do")
	public String recallBBSList(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("recallBBSVO") RecallBBSVO recallBBSVO, Model model)
			throws Exception {
		// -------- 목록 페이지에서 세션이 있는 경우에만 "등록" 버튼 출력을 위해서 세션 체크
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (user != null) {
			model.addAttribute("sessionUniqId", user.getUniqId());
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(recallBBSVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(recallBBSVO.getPageUnit());
		paginationInfo.setPageSize(recallBBSVO.getPageSize());

		recallBBSVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		recallBBSVO.setLastIndex(paginationInfo.getLastRecordIndex());
		recallBBSVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		model.addAttribute("resultList", recallBBSService.selectRecallBBSList(recallBBSVO));

		paginationInfo.setTotalRecordCount(recallBBSService.selectRecallBBSCount(recallBBSVO));
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/kids/recall/recallBBSList";
	}

	/**
	 * 유해용품 리콜 등록 화면
	 * 
	 * @param req
	 * @param res
	 * @param recallBBSVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/recall/recallBBSRegist.do")
	public String recallBBSRegist(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("recallBBSVO") RecallBBSVO recallBBSVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		ComDefaultCodeVO vo1 = new ComDefaultCodeVO();

		vo1.setCodeId("BCC9");
		List codeResult = cmmUseService.selectCmmCodeDetail(vo1);
		model.addAttribute("productTypeList", codeResult);

		model.addAttribute("result", recallBBSService.selectRecallBBS(recallBBSVO));

		return "egovframework/com/kids/recall/recallBBSRegist";
	}

	/**
	 * 유해용품 리콜 등록
	 * 
	 * @param multiRequest
	 * @param recallBBSVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/recall/recallBBSInsert.do")
	public String recallBBSInsert(final MultipartHttpServletRequest multiRequest, @ModelAttribute("recallBBSVO") RecallBBSVO recallBBSVO, Model model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			recallBBSVO.setFrstRegisterId(user.getUniqId());

			List<FileVO> result = null;
			String atchFileId = "";

			// 썸네일 설정
			FileVO thumbVO = new FileVO();
			thumbVO.setThumbnailYn("Y");
			thumbVO.setThumbnailWidth(214);
			thumbVO.setThumbnailHeight(145);

			final Map<String, MultipartFile> files = multiRequest.getFileMap();

			if (!files.isEmpty()) {

				result = fileUtil.parseFileInfNier(files, "RECALL_", 0, "", "", "recall", thumbVO);

				atchFileId = fileMngService.insertFileInfs(result);
			}

			recallBBSVO.setAtchFileId(atchFileId);

			recallBBSService.insertRecallBBS(recallBBSVO);

			model.addAttribute("resultMsg", "success.common.insert");
			return "forward:/Relay.do?_forward_page=/com/kids/recall/selectRecallBBSList.do?domesticYn="+recallBBSVO.getDomesticYn();
		} else {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
	}

	/**
	 * 관리자 유해용품 리콜 상세 보기
	 * 
	 * @param req
	 * @param res
	 * @param recallBBSVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/recall/recallBBSInqire.do")
	public String recallBBSInqire(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("recallBBSVO") RecallBBSVO recallBBSVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		ComDefaultCodeVO vo1 = new ComDefaultCodeVO();

		vo1.setCodeId("BCC9");

		List codeResult = cmmUseService.selectCmmCodeDetail(vo1);
		model.addAttribute("productTypeList", codeResult);

		// 조회수 증가
		recallBBSVO.setViewCountUpdateYn("Y");

		RecallBBSVO result = recallBBSService.selectRecallBBS(recallBBSVO);
		model.addAttribute("result", result);

		return "egovframework/com/kids/recall/recallBBSInqire";
	}

	/**
	 * 유해용품 리콜 삭제
	 * 
	 * @param req
	 * @param res
	 * @param recallBBSVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/recall/recallBBSDelete.do")
	public String recallBBSDelete(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("recallBBSVO") RecallBBSVO recallBBSVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			recallBBSService.deleteRecallBBS(recallBBSVO);

			model.addAttribute("resultMsg", "success.common.delete");
			return "forward:/Relay.do?_forward_page=/com/kids/recall/selectRecallBBSList.do?domesticYn="+recallBBSVO.getDomesticYn();
		} else {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
	}

	/**
	 * 유해용품 리콜 수정 화면
	 * 
	 * @param req
	 * @param res
	 * @param recallBBSVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/recall/recallBBSDetail.do")
	public String recallBBSDetail(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("recallBBSVO") RecallBBSVO recallBBSVO, Model model)
			throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}

		ComDefaultCodeVO vo1 = new ComDefaultCodeVO();

		vo1.setCodeId("BCC9");
		List codeResult = cmmUseService.selectCmmCodeDetail(vo1);
		model.addAttribute("productTypeList", codeResult);

		model.addAttribute("result", recallBBSService.selectRecallBBS(recallBBSVO));

		return "egovframework/com/kids/recall/recallBBSDetail";
	}

	/**
	 * 유해용품 리콜 수정
	 * 
	 * @param multiRequest
	 * @param recallBBSVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/com/kids/recall/recallBBSUpdate.do")
	public String recallBBSUpdate(final MultipartHttpServletRequest multiRequest, @ModelAttribute("recallBBSVO") RecallBBSVO recallBBSVO, Model model)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			recallBBSVO.setLastUpdusrId(user.getUniqId());

			List<FileVO> result = null;
			String atchFileId = recallBBSVO.getAtchFileId();

			if (StringUtil.isEmpty(atchFileId)) {
				// 썸네일 설정
				FileVO thumbVO = new FileVO();
				thumbVO.setThumbnailYn("Y");
				thumbVO.setThumbnailWidth(214);
				thumbVO.setThumbnailHeight(145);

				final Map<String, MultipartFile> files = multiRequest.getFileMap();

				if (!files.isEmpty()) {

					result = fileUtil.parseFileInfNier(files, "RECALL_", 0, "", "", "recall", thumbVO);

					atchFileId = fileMngService.insertFileInfs(result);
				}

				recallBBSVO.setAtchFileId(atchFileId);
			}

			recallBBSService.updateRecallBBS(recallBBSVO);

			model.addAttribute("resultMsg", "success.common.update");
			return "forward:/Relay.do?_forward_page=/com/kids/recall/selectRecallBBSList.do?domesticYn="+recallBBSVO.getDomesticYn();
		} else {
			model.addAttribute("resultMsg", "fail.url.msg");
			return "forward:/Relay.do?_forward_page=/code404.jsp";
		}
	}

	/**
	 * 사용자 유해용품 리콜 목록
	 * 
	 * @param req
	 * @param res
	 * @param recallBBSVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/recall/selectRecallBBSList.do")
	public String userRecallBBSList(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("recallBBSVO") RecallBBSVO recallBBSVO, Model model)
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
			
			//20170118 국내어린이용품... 탭별 테이블 검색값(기본 = "1100701")
			if(req.getParameter("domesticYn").equals("Y")){
				recallBBSVO.setProductTabCd(menuNo);
			}
		}

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(recallBBSVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(recallBBSVO.getPageUnit());
		paginationInfo.setPageSize(recallBBSVO.getPageSize());

		recallBBSVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		recallBBSVO.setLastIndex(paginationInfo.getLastRecordIndex());
		recallBBSVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		model.addAttribute("resultList", recallBBSService.selectRecallBBSList(recallBBSVO));

		paginationInfo.setTotalRecordCount(recallBBSService.selectRecallBBSCount(recallBBSVO));
		model.addAttribute("paginationInfo", paginationInfo);

		return "kor/kids/recall/recallBBSList";
	}

	/**
	 * 사용자 유해용품 리콜 상세 보기
	 * 
	 * @param req
	 * @param res
	 * @param recallBBSVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/recall/recallBBSInqire.do")
	public String userRecallBBSInqire(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("recallBBSVO") RecallBBSVO recallBBSVO, Model model)
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

		ComDefaultCodeVO vo1 = new ComDefaultCodeVO();

		vo1.setCodeId("BCC9");

		List codeResult = cmmUseService.selectCmmCodeDetail(vo1);
		model.addAttribute("productTypeList", codeResult);

		// 조회수 증가
		recallBBSVO.setViewCountUpdateYn("Y");

		RecallBBSVO result = recallBBSService.selectRecallBBS(recallBBSVO);
		model.addAttribute("result", result);

		return "kor/kids/recall/recallBBSInqire";
	}
}
