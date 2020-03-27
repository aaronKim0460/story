package egovframework.com.kor.contents.noxiousMaterial.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.kor.contents.noxiousMaterial.service.NoxiousMaterialKorService;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiouMaterialBbsVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousEnvilomentVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousInfoKorVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousMaterialKorMapVO;
import egovframework.com.kor.contents.noxiousMaterial.vo.NoxiousMaterialKorVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class NoxiousMaterialKorController {
	
	@Resource(name="noxiousMaterialKorService")
	private NoxiousMaterialKorService noxiousMaterialKorService;
	
	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
	private EgovMenuManageService menuManageService;
	
	
	/**
	 * 어린이 환경 유해인자 정보맵 통계
	 */
	@RequestMapping(value="/kor/material/map.do")
	public String selectNoxiousMaterialMapKorList(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
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
		
		NoxiousMaterialKorMapVO mvo = noxiousMaterialKorService.selectNoxiousMaterialMapKorList();
		model.addAttribute("mvo", mvo);
		
		NoxiousMaterialKorVO nkvo = new NoxiousMaterialKorVO();
		
//		nkvo.setMedium("air");
		nkvo.setMedium("대기");
		nkvo.setNoxiousLevel("H");
		List<NoxiousMaterialKorVO> airHData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("airHData", airHData);
		
		nkvo.setMedium("대기");
		nkvo.setNoxiousLevel("M");
		List<NoxiousMaterialKorVO> airMData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("airMData", airMData);
		
		nkvo.setMedium("대기");
		nkvo.setNoxiousLevel("L");
		List<NoxiousMaterialKorVO> airLData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("airLData", airLData);
		
//		nkvo.setMedium("inAir");
		nkvo.setMedium("실내공기");
		nkvo.setNoxiousLevel("H");
		List<NoxiousMaterialKorVO> inAirHData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("inAirHData", inAirHData);
		
		nkvo.setMedium("실내공기");
		nkvo.setNoxiousLevel("M");
		List<NoxiousMaterialKorVO> inAirMData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("inAirMData", inAirMData);
		
		nkvo.setMedium("실내공기");
		nkvo.setNoxiousLevel("L");
		List<NoxiousMaterialKorVO> inAirLData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("inAirLData", inAirLData);
		
//		nkvo.setMedium("water");
		nkvo.setMedium("먹는물");
		nkvo.setNoxiousLevel("H");
		List<NoxiousMaterialKorVO> waterHData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("waterHData", waterHData);
		
		nkvo.setMedium("먹는물");
		nkvo.setNoxiousLevel("M");
		List<NoxiousMaterialKorVO> waterMData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("waterMData", waterMData);
		
		nkvo.setMedium("먹는물");
		nkvo.setNoxiousLevel("L");
		List<NoxiousMaterialKorVO> waterLData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("waterLData", waterLData);
		
//		nkvo.setMedium("soil");
		nkvo.setMedium("토양");
		nkvo.setNoxiousLevel("H");
		List<NoxiousMaterialKorVO> soilHData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("soilHData", soilHData);
		
		nkvo.setMedium("토양");
		nkvo.setNoxiousLevel("M");
		List<NoxiousMaterialKorVO> soilMData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("soilMData", soilMData);
		
		nkvo.setMedium("토양");
		nkvo.setNoxiousLevel("L");
		List<NoxiousMaterialKorVO> soilLData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("soilLData", soilLData);
		
//		nkvo.setMedium("other");
		nkvo.setMedium("기타");
		nkvo.setNoxiousLevel("H");
		List<NoxiousMaterialKorVO> otherHData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("otherHData", otherHData);
		
		nkvo.setMedium("기타");
		nkvo.setNoxiousLevel("M");
		List<NoxiousMaterialKorVO> otherMData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("otherMData", otherMData);
		
		nkvo.setMedium("기타");
		nkvo.setNoxiousLevel("L");
		List<NoxiousMaterialKorVO> otherLData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("otherLData", otherLData);
		
//		nkvo.setMedium("product");
		nkvo.setMedium("제품");
		nkvo.setNoxiousLevel("H");
		List<NoxiousMaterialKorVO> productHData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("productHData", productHData);
		
		nkvo.setMedium("제품");
		nkvo.setNoxiousLevel("M");
		List<NoxiousMaterialKorVO> productMData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("productMData", productMData);
		
		nkvo.setMedium("제품");
		nkvo.setNoxiousLevel("L");
		List<NoxiousMaterialKorVO> productLData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		model.addAttribute("productLData", productLData);
		
		return "kor/contents/noxiousmaterial/selectNoxiousMaterialKorMapList";
	}
	
	/**
	 * 어린이 환경 유해인자 정보맵 유해인자 리스트
	 */
	@RequestMapping(value="/kor/contents/noxiousmaterial/selectNoxiousMaterialMapKorListData.do")
	public String selectNoxiousMaterialMapKorListData(HttpServletRequest req, HttpServletResponse res, Model model, NoxiousMaterialKorVO nkvo) throws Exception{
		List<NoxiousMaterialKorVO> listData = noxiousMaterialKorService.selectNoxiousMaterialMapKorListData(nkvo);
		
		model.addAttribute("listData", listData);		
		//return "kor/contents/noxiousmaterial/selectNoxiousMaterialMapKorListData";
		return "ajax/kor/noxious/selectNoxiousMaterialMapKorListData";
	}
	
	/**
	 * 어린이 환경 유해인자 DB 목록
	 */
	@RequestMapping(value="/kor/material/db.do")
	public String selectNoxiousMaterialKorList(HttpServletRequest req, HttpServletResponse res, Model model, @ModelAttribute("nvo") NoxiousMaterialKorVO nvo) throws Exception{
		
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
		paginationInfo.setCurrentPageNo(nvo.getPageIndex());
		if(StringUtils.isNotEmpty(req.getParameter("recordCountPerPage"))){paginationInfo.setRecordCountPerPage(Integer.parseInt(req.getParameter("recordCountPerPage")));
		} else {paginationInfo.setRecordCountPerPage(6); }		
		
		paginationInfo.setPageSize(nvo.getPageSize());
		
		nvo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		nvo.setLastIndex(paginationInfo.getLastRecordIndex());
		nvo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		if(StringUtils.isNotEmpty(req.getParameter("searchCnd2nd")))		nvo.setSearchCnd2nd(req.getParameter("searchCnd2nd"));
		
		//검색값 : 국문순, 영문순(empty == true ? kname(default) : req.getParameter("searchCondition4"))
		if(StringUtils.isNotEmpty(req.getParameter("searchCondition4")))	nvo.setSearchCondition4(req.getParameter("searchCondition4"));
		else																nvo.setSearchCondition4("kname");
		
		nvo.setSearchCondition("BBSMSTR_000000000660");
		
		List<NoxiousMaterialKorVO> list = noxiousMaterialKorService.selectNoxiousMaterialKorList(nvo);
		model.addAttribute("list", list);
		
		int totCnt = noxiousMaterialKorService.selectNoxiousMaterialKorListCnt(nvo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "kor/contents/noxiousmaterial/selectNoxiousMaterialKorList";
	}
	
	/**
	 * 멀티미디어로 가기 위한 NTT_ID 받아오기위한 ajax
	 */
	@RequestMapping(value="/kor/contents/noxiousmaterial/selectNttid.do")
	@ResponseBody
	public String selectNttid(HttpServletRequest req, HttpServletResponse res, NoxiouMaterialBbsVO bbsvo) throws Exception{
		String result = "";
		
		result = noxiousMaterialKorService.selectNttid(bbsvo);
		
		return result;
	}
	
	/**
	 * 어린이 환경 유해인자 DB 상세 팝업
	 */
	@RequestMapping(value="/kor/contents/noxiousmaterial/detailNoxiousMaterialKor.do")
	public String detailNoxiousMaterialKor(HttpServletRequest req, HttpServletResponse res, Model model, @ModelAttribute("nvo") NoxiousMaterialKorVO nvo) throws Exception{
		NoxiousMaterialKorVO detail = noxiousMaterialKorService.detailNoxiousMaterialKor(nvo);
		model.addAttribute("detail", detail);
		
		//return "kor/contents/noxiousmaterial/detailNoxiousMaterialKor";
		return "ajax/kor/noxious/detailNoxiousMaterialKor";
	}
	
	/**
	 * 생활 속 유해인자
	 */
	@RequestMapping(value="/kor/material/living.do")
	public String selectNoxiousEnviloMentKorList(HttpServletRequest req, HttpServletResponse res, Model model, @ModelAttribute("evo") NoxiousEnvilomentVO evo) throws Exception{
		
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
		
		List<NoxiousEnvilomentVO> elist = noxiousMaterialKorService.selectNoxiousEnviloMentKorList();
		model.addAttribute("elist", elist);
		return "kor/contents/noxiousmaterial/selectNoxiousEnviloMentKorList";
	}
	
	/**
	 * 생활 속 유해인자 목록
	 */
	@RequestMapping(value="/kor/contents/noxiousmaterial/selectNoxiousEnviloMentKorListData.do")
	public String selectNoxiousEnviloMentKorListData(HttpServletRequest req, HttpServletResponse res, Model model, @ModelAttribute("evo") NoxiousEnvilomentVO evo) throws Exception{
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(evo.getPageIndex());
		paginationInfo.setRecordCountPerPage(evo.getPageUnit());		
		paginationInfo.setPageSize(evo.getPageSize());
		
		evo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		evo.setLastIndex(paginationInfo.getLastRecordIndex());
		evo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<NoxiousEnvilomentVO> maplist = noxiousMaterialKorService.selectNoxiousEnviloMentKorListData(evo);
		model.addAttribute("maplist", maplist);
		
		int totCnt = noxiousMaterialKorService.selectNoxiousEnviloMentKorListDataCnt(evo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "ajax/kor/noxious/selectNoxiousEnviloMentKorListData";
	}
	
	/**
	 * 생활 속 유해인자 상세보기 팝업
	 */
	@RequestMapping(value="/kor/contents/noxiousmaterial/detailNoxiousEnviloMentKor.do")
	public String detailNoxiousEnviloMentKor(HttpServletRequest req, HttpServletResponse res, Model model, @ModelAttribute("evo") NoxiousEnvilomentVO evo, NoxiousMaterialKorVO nvo) throws Exception{
		NoxiousMaterialKorVO detail = noxiousMaterialKorService.detailNoxiousMaterialKor(nvo);
		model.addAttribute("detail", detail);
		
		return "ajax/kor/noxious/detailNoxiousEnviloMentKor"; 		
	}
	
	/**
	 * 유해물질 자료 목록
	 */
	@RequestMapping(value="/kor/material/chemistry.do")
	public String NoxiousInfoList(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("ivo") NoxiousInfoKorVO ivo) throws Exception{

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
		paginationInfo.setCurrentPageNo(ivo.getPageIndex());
		paginationInfo.setRecordCountPerPage(ivo.getPageUnit());		
		paginationInfo.setPageSize(ivo.getPageSize());
		
		ivo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ivo.setLastIndex(paginationInfo.getLastRecordIndex());
		ivo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		if(StringUtils.isNotEmpty(req.getParameter("searchCnd")))			ivo.setSearchCnd(req.getParameter("searchCnd"));
		if(StringUtils.isNotEmpty(req.getParameter("searchCondition1")))	ivo.setSearchCondition1(req.getParameter("searchCondition1"));
		if(StringUtils.isNotEmpty(req.getParameter("searchCondition2")))	ivo.setSearchCondition2(req.getParameter("searchCondition2"));
		
		//검색값 : 국문순, 영문순(empty == true ? kname(default) : req.getParameter("searchCondition4"))
		if(StringUtils.isNotEmpty(req.getParameter("searchCondition4")))	ivo.setSearchCondition4(req.getParameter("searchCondition4"));
		else																ivo.setSearchCondition4("kname");
		
		List<NoxiousInfoKorVO> volist = noxiousMaterialKorService.selectNoxiousInfoList(ivo);
		model.addAttribute("list", volist);
		
		int totCnt = noxiousMaterialKorService.selectNoxiousInfoListCnt(ivo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		
		
		return "kor/contents/noxiousmaterial/selectNoxiousInfoList";
	}
	
	/**
	 * 유해물질 자료 상세
	 */	
	@RequestMapping(value="/kor/contents/noxiousmaterial/detailNoxiousKorInfo.do")
	public String detailNoxiousKorInfo(HttpServletRequest req, HttpServletResponse res, Model model,@ModelAttribute("ivo") NoxiousInfoKorVO ivo) throws Exception{
		
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
		
		NoxiousInfoKorVO detail = noxiousMaterialKorService.detailNoxiousKorInfo(ivo);
		model.addAttribute("detail", detail);
		
		return "kor/contents/noxiousmaterial/detailNoxiousKorInfo";
	}
	
	/**
	 * 유해물질 자료 목록 팝업
	 */
	@RequestMapping(value="/kor/material/chemistryPopup.do")
	public String NoxiousInfoPopupList(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("ivo") NoxiousInfoKorVO ivo) throws Exception{		
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(ivo.getPageIndex());
		paginationInfo.setRecordCountPerPage(ivo.getPageUnit());		
		paginationInfo.setPageSize(ivo.getPageSize());
		
		ivo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ivo.setLastIndex(paginationInfo.getLastRecordIndex());
		ivo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<NoxiousInfoKorVO> volist = noxiousMaterialKorService.selectNoxiousInfoList(ivo);
		model.addAttribute("list", volist);
		
		int totCnt = noxiousMaterialKorService.selectNoxiousInfoListCnt(ivo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		
		
		return "ajax/kor/noxious/NoxiousInfoPopupList";
	}
	
	/**
	 * 유해물질 자료 상세
	 */	
	@RequestMapping(value="/kor/contents/noxiousmaterial/detailNoxiousKorInfoPopup.do")
	public String detailNoxiousKorInfoPopup(HttpServletRequest req, HttpServletResponse res, Model model,@ModelAttribute("ivo") NoxiousInfoKorVO ivo) throws Exception{				
		
		NoxiousInfoKorVO detail = noxiousMaterialKorService.detailNoxiousKorInfo(ivo);
		model.addAttribute("detail", detail);
		
		return "ajax/kor/noxious/detailNoxiousKorInfoPopup";
	}
	
}
