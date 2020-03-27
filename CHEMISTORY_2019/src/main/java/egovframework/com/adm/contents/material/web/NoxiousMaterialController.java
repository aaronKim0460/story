package egovframework.com.adm.contents.material.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.adm.contents.material.service.NoxiousMaterialService;
import egovframework.com.adm.contents.material.vo.EnviloMentVO;
import egovframework.com.adm.contents.material.vo.NoxiousInfoVO;
import egovframework.com.adm.contents.material.vo.NoxiousMaterialMappingVO;
import egovframework.com.adm.contents.material.vo.NoxiousMaterialVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class NoxiousMaterialController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="noxiousMaterialService")
	private NoxiousMaterialService noxiousMaterialService;
	
	@Resource(name="insertNoxiousInfoIdGnrService")
    private EgovIdGnrService insertNoxiousInfoIdGnrService;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@RequestMapping(value="/adm/contents/material/NoxiousMaterialList.do")
	public String NoxiousMaterialList(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		List<EnviloMentVO> volist = noxiousMaterialService.selectEnviloList();
		model.addAttribute("envlist", volist);
		
		return "egovframework/com/adm/noxiousmaterial/noxiousMaterialList";
	}
	
	@RequestMapping(value="/adm/contents/material/NoxiousMaterialListData.do")
	public String NoxiousMaterialListData(HttpServletRequest req, HttpServletResponse res, Model model, 
			@ModelAttribute("nVo") NoxiousMaterialVO nVo) throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(nVo.getPageIndex());
		paginationInfo.setRecordCountPerPage(30);		//2016.12.14 강제 페이징
		paginationInfo.setPageSize(30);
		
		nVo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		nVo.setLastIndex(paginationInfo.getLastRecordIndex());
		nVo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<NoxiousMaterialVO> nvo = noxiousMaterialService.selectNoxMaterialList(nVo);
		model.addAttribute("nvolist", nvo);
		int totCnt = noxiousMaterialService.selectNoxMaterialListCnt(nVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "egovframework/com/adm/noxiousmaterial/noxiousMaterialListData";
	}
	
	/**
	 * 유해인자 목록 리스트 화면 - 팝업
	 * 
	 * @param req
	 * @param res
	 * @param npVo
	 * @param nVo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/adm/contents/material/materialListPopup.do")
	public String materialListPopup(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("npVo") NoxiousMaterialMappingVO npVo, 
			@ModelAttribute("nVo") NoxiousMaterialVO nVo, Model model) throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(npVo.getPageIndex2());
		paginationInfo.setRecordCountPerPage(5);
		paginationInfo.setPageSize(npVo.getPageSize());
		
		npVo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		npVo.setLastIndex(paginationInfo.getLastRecordIndex());
		npVo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<NoxiousMaterialMappingVO> npvo = noxiousMaterialService.selectEnvNotxiousList(npVo);		
		model.addAttribute("npvolist", npvo);
		int totCnt = noxiousMaterialService.selectEnvNotxiousListCnt(npVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "egovframework/com/adm/noxiousmaterial/materialListPopup";
	}
	
	@RequestMapping(value="/adm/contents/material/addEnvMaterial.do")
	public String addEnvMaterial(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("npVo") NoxiousMaterialMappingVO npVo, 
			@ModelAttribute("nVo") NoxiousMaterialVO nVo, Model model) throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(npVo.getPageIndex2());
		paginationInfo.setRecordCountPerPage(5);
		paginationInfo.setPageSize(npVo.getPageSize());
		
		npVo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		npVo.setLastIndex(paginationInfo.getLastRecordIndex());
		npVo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<NoxiousMaterialMappingVO> npvo = noxiousMaterialService.selectEnvNotxiousList(npVo);		
		model.addAttribute("npvolist", npvo);
		int totCnt = noxiousMaterialService.selectEnvNotxiousListCnt(npVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "egovframework/com/adm/noxiousmaterial/addEnvMaterialPopup";
	}
	
	@RequestMapping(value="/adm/contents/material/insertMatMapping.do")
	@ResponseBody
	public String insertMatMapping(HttpServletRequest req, HttpServletResponse res, NoxiousMaterialMappingVO npvo) throws Exception{
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		String finalResult = "";
		int checkInsert = 0;
		
		if(isAuthenticated){
			// 중복 체크
			int existCheck = noxiousMaterialService.existCheckMapping(npvo);
			if(existCheck == 0){
				checkInsert = noxiousMaterialService.insertMatMapping(npvo);
				if(checkInsert > 0){
					finalResult = "success";
				}
			}else{
				finalResult = "exist";
			}
		}
		
		return finalResult;
	}
	
	@RequestMapping(value="/adm/contents/material/deleteMatMapping.do")
	@ResponseBody
	public String deleteMatMapping(HttpServletRequest req, HttpServletResponse res, NoxiousMaterialMappingVO npvo) throws Exception{
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		String finalResult = "";
		int checkDelete = 0;
		
		if(isAuthenticated){
			checkDelete = noxiousMaterialService.deleteMatMapping(npvo);
			if(checkDelete > 0){
				finalResult = "success";
			}
		}
		
		return finalResult;
	}
	
	@RequestMapping(value="/adm/contents/material/NoxiousInfoList.do")
	public String NoxiousInfoList(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("ivo") NoxiousInfoVO ivo) throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(ivo.getPageIndex());
		paginationInfo.setRecordCountPerPage(ivo.getPageUnit());		
		paginationInfo.setPageSize(ivo.getPageSize());
		
		ivo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ivo.setLastIndex(paginationInfo.getLastRecordIndex());
		ivo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<NoxiousInfoVO> volist = noxiousMaterialService.selectNoxiousInfoList(ivo);
		model.addAttribute("list", volist);
		
		int totCnt = noxiousMaterialService.selectNoxiousInfoListCnt(ivo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "egovframework/com/adm/noxiousmaterial/noxiousInfoList";
	}
	
	@RequestMapping(value="/adm/contents/material/addNoxiousInfo.do")
	public String addNoxiousInfo(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("ivo") NoxiousInfoVO ivo) throws Exception{
		
		Calendar cal = Calendar.getInstance();
		int nyear = cal.get(cal.YEAR);
		List<Integer> yearlist = new ArrayList();
		for(int i=0; i<=30; i++){
			yearlist.add(nyear+i);
		}
		
		model.addAttribute("yearlist", yearlist);
		
		
		return "egovframework/com/adm/noxiousmaterial/addNoxiousInfo";
		
	}
	
	@RequestMapping(value="/adm/contents/material/insertNoxiousInfo.do")
	@ResponseBody
	private String insertNoxiousInfo(HttpServletRequest req, HttpServletResponse res, NoxiousInfoVO ivo, BindingResult bindingResult) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();	
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		String finalResult = "";
		int chkInsert = 0;
		
		ivo = this.settingCh(ivo);
		beanValidator.validate(ivo, bindingResult);
		
		if(isAuthenticated){
			if (bindingResult.hasErrors()) {    		
				finalResult = "validateErr";
			}else{
				ivo.setRdIdx(insertNoxiousInfoIdGnrService.getNextStringId());
				chkInsert = noxiousMaterialService.insertNoxiousInfo(ivo);
				if(chkInsert > 0){
		    		finalResult = "success";
		    	}
			}
		}
		
		
		return finalResult;
	}
	
	@RequestMapping(value="/adm/contents/material/addMaterialForInfo.do")
	public String addMaterialForInfo(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("npVo") NoxiousMaterialMappingVO npVo, 
			Model model) throws Exception{
		
		npVo.setPageSize(5);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(npVo.getPageIndex2());
		paginationInfo.setRecordCountPerPage(5);
		paginationInfo.setPageSize(npVo.getPageSize());
		
		npVo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		npVo.setLastIndex(paginationInfo.getLastRecordIndex());
		npVo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<NoxiousMaterialMappingVO> npvo = noxiousMaterialService.selectEnvNotxiousList(npVo);		
		model.addAttribute("npvolist", npvo);
		int totCnt = noxiousMaterialService.selectEnvNotxiousListCnt(npVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "egovframework/com/adm/noxiousmaterial/addMaterialForInfoPopup";
	}
	
	@RequestMapping(value="/adm/contents/material/detailNoxiousInfo.do")
	public String detailNoxiousInfo(HttpServletRequest req, HttpServletResponse res, Model model,@ModelAttribute("ivo") NoxiousInfoVO ivo) throws Exception{
		
		NoxiousInfoVO detail = noxiousMaterialService.detailNoxiousInfo(ivo);
		model.addAttribute("detail", detail);
		
		return "egovframework/com/adm/noxiousmaterial/detailNoxiousInfo";
	}
	
	@RequestMapping(value="/adm/contents/material/modifyNoxiousInfo.do")
	public String modifyNoxiousInfo(HttpServletRequest req, HttpServletResponse res, Model model,@ModelAttribute("ivo") NoxiousInfoVO ivo) throws Exception{
		NoxiousInfoVO detail = noxiousMaterialService.detailNoxiousInfo(ivo);
		model.addAttribute("detail", detail);
		
		Calendar cal = Calendar.getInstance();
		int nyear = cal.get(cal.YEAR);
		List<Integer> yearlist = new ArrayList();
		for(int i=0; i<=30; i++){
			yearlist.add(nyear+i);
		}
		
		model.addAttribute("yearlist", yearlist);
		
		return "egovframework/com/adm/noxiousmaterial/modifyNoxiousInfo";
	}
	
	@RequestMapping(value="/adm/contents/material/deleteNoxiousInfo.do")
	@ResponseBody
	private String deleteNoxiousInfo(HttpServletRequest req, HttpServletResponse res, NoxiousInfoVO ivo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();	
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();		
		String finalResult = "";
		int chkDelete = 0;
		
		if(isAuthenticated){
			chkDelete = noxiousMaterialService.deleteNoxiousInfo(ivo);
			if(chkDelete > 0){
	    		finalResult = "success";
	    	}
		}
		
		
		return finalResult;
	}
	
	@RequestMapping(value="/adm/contents/material/updateNoxiousInfo.do")
	@ResponseBody
	private String updateNoxiousInfo(HttpServletRequest req, HttpServletResponse res, NoxiousInfoVO ivo, BindingResult bindingResult) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();	
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		String finalResult = "";
		int chkUpdate = 0;
		
		ivo = this.settingCh(ivo);
		beanValidator.validate(ivo, bindingResult);
		
		if(isAuthenticated){
			if (bindingResult.hasErrors()) {    		
				finalResult = "validateErr";
			}else{
				chkUpdate = noxiousMaterialService.updateNoxiousInfo(ivo);
				if(chkUpdate > 0){
		    		finalResult = "success";
		    	}
			}
		}
		
		
		return finalResult;
	}
	
	private NoxiousInfoVO settingCh(NoxiousInfoVO vo) throws Exception{
		if(StringUtils.isEmpty(vo.getRdEtcCh())){vo.setRdEtcCh("N");}
		if(StringUtils.isEmpty(vo.getRdInCh())){vo.setRdInCh("N");}
		if(StringUtils.isEmpty(vo.getRdPlanCh())){vo.setRdPlanCh("N");}
		if(StringUtils.isEmpty(vo.getRdSourceCh())){vo.setRdSourceCh("N");}
		return vo;
	}
	
}
