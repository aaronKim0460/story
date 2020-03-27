package egovframework.com.kor.space.condition.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.kor.space.condition.service.KidsGroundKorService;
import egovframework.com.kor.space.condition.vo.KidsGroundFaciltyKorVO;
import egovframework.com.kor.space.condition.vo.KidsGroundReliefKorVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class KidsGorundKorController {
	
	@Resource(name="kidsGroundKorService")
	private KidsGroundKorService kidsGroundKorService;
	
	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
	private EgovMenuManageService menuManageService;
	
	/**
	 * 어린이 활동공간 현황/시설 목록
	 */
	@RequestMapping(value="kor/space/condition.do")
	public String selectKidsGroundKorCurrentList(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("kfvo") KidsGroundFaciltyKorVO kfvo) throws Exception{
		
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
		paginationInfo.setCurrentPageNo(kfvo.getPageIndex());
		paginationInfo.setRecordCountPerPage(kfvo.getPageUnit());		
		paginationInfo.setPageSize(kfvo.getPageSize());
		
		kfvo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		kfvo.setLastIndex(paginationInfo.getLastRecordIndex());
		kfvo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KidsGroundFaciltyKorVO> kvo =  kidsGroundKorService.selectKidsGroundFaciltyKorList(kfvo);
		model.addAttribute("kvoList", kvo);
		
		int totCnt = kidsGroundKorService.selectKidsGroundFaciltyKorListCnt(kfvo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "kor/space/condition/selectKidsGroundKorCurrentList";
	}
	
	/**
	 * 어린이 활동공간 현황/시설 상세
	 */
	@RequestMapping(value="/kor/space/conditionDetail.do")
	public String detailKidsGroundKorCurrent(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("kfvo") KidsGroundFaciltyKorVO kfvo) throws Exception{
		
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
		
		KidsGroundFaciltyKorVO detail = kidsGroundKorService.detailKidsGroundCurrent(kfvo);
		model.addAttribute("detail", detail);
		
		return "kor/space/condition/detailKidsGroundKorCurrent";
	}
	
	/**
	 * 어린이 활동공간 환경안심인증현황 목록
	 */
	@RequestMapping(value="/kor/space/conditionRelief.do")
	public String selectKidsGroundRelief(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("krvo") KidsGroundReliefKorVO krvo ) throws Exception{
		
		
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
		paginationInfo.setCurrentPageNo(krvo.getPageIndex());
		paginationInfo.setRecordCountPerPage(krvo.getPageUnit());		
		paginationInfo.setPageSize(krvo.getPageSize());
		
		krvo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		krvo.setLastIndex(paginationInfo.getLastRecordIndex());
		krvo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KidsGroundReliefKorVO> kvo = kidsGroundKorService.selectKidsGroundReliefKorList(krvo);
		model.addAttribute("kvoList", kvo);
		
		int totCnt = kidsGroundKorService.selectKidsGroundReliefKorListCnt(krvo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		
		return "kor/space/condition/selectKidsGroundReliefKorList";
	}
	

	/**
	 * 어린이 활동공간 환경안심인증현황 상세(팝업)
	 */
	@RequestMapping(value="/kor/space/conditionReliefDetail.do")
	public String detailKidsGroundReliefKor(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("krvo") KidsGroundReliefKorVO krvo ) throws Exception{
		
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
		
		
		
		KidsGroundReliefKorVO detail = kidsGroundKorService.detailKidsGroundReliefKor(krvo);
		model.addAttribute("detail", detail);
		
		return "ajax/kor/kids/detailKidsGroundReliefKor";
	}
	
	
}
