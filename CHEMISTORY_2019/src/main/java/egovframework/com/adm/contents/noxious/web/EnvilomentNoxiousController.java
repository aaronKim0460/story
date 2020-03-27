package egovframework.com.adm.contents.noxious.web;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hsqldb.lib.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.adm.contents.noxious.service.EnvilomentNoxiousService;
import egovframework.com.adm.contents.noxious.vo.EnvilomentNoxiousVO;
import egovframework.com.adm.contents.noxious.vo.SearchEnvNoxious;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class EnvilomentNoxiousController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="envilomentNoxiousService")
	private EnvilomentNoxiousService envilomentNoxiousService;
	
	@Resource(name="EgovFileMngService")
    private EgovFileMngService fileMngService;
	
	@Resource(name="EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;
	
	@Resource(name="insertEnvilmentNoxiousIdGnrService")
    private EgovIdGnrService insertEnvilmentNoxiousIdGnrService;
	
	@Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
	 * 환경 유해인자 DB 목록
	 */
	@RequestMapping(value="/adm/contents/noxious/EnvilomentNoxiousList.do")
	public ModelAndView EnvilomentNoxiousList (HttpServletRequest req, HttpServletResponse res, @ModelAttribute("srchVo") SearchEnvNoxious srchVo) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//System.out.println("test checking aaa");
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(srchVo.getPageIndex());
		paginationInfo.setRecordCountPerPage(srchVo.getPageUnit());
		paginationInfo.setPageSize(srchVo.getPageSize());
		
		srchVo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		srchVo.setLastIndex(paginationInfo.getLastRecordIndex());
		srchVo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<EnvilomentNoxiousVO> voList = envilomentNoxiousService.selectEnvNotxiousList(srchVo);
		
		mv.addObject("enviloList", voList);
		
		int totCnt = envilomentNoxiousService.selectEnvilomentNoxiousListCnt(srchVo);
		paginationInfo.setTotalRecordCount(totCnt);
		mv.addObject("paginationInfo", paginationInfo);	
		
		mv.setViewName("egovframework/com/adm/noxious/envilomentnoxiouslist");
		
		
		return mv;
	}
	
	/**
	 * 환경 유해인자 DB 상세 화면
	 */
	@RequestMapping(value="/adm/contents/noxious/detailEnviloNox.do")
	public String detailEnviloNox(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("srchVo") SearchEnvNoxious srchVo, Model model, EnvilomentNoxiousVO envo) throws Exception{
		EnvilomentNoxiousVO detailVo = envilomentNoxiousService.selectEnviloNoxDetail(envo);
		
		model.addAttribute("detail", detailVo);
		
		return "egovframework/com/adm/noxious/detailEnviloNox";
	}
	
	/**
	 * 환경 유해인자 DB 등록 화면
	 */
	@RequestMapping(value="/adm/contents/noxious/AddNoxiousList.do")
	public ModelAndView AddEnviloNoxious (HttpServletRequest req, HttpServletResponse res, @ModelAttribute("srchVo") SearchEnvNoxious srchVo) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//System.out.println("insert page start");
		
		mv.setViewName("egovframework/com/adm/noxious/addEnvilomentNoxious");
		
		
		return mv;
	}
	
	/**
	 * 환경 유해인자 DB 수정 화면
	 */
	@RequestMapping("/adm/contents/noxious/modifyEnvilomentNoxious.do")
	public String modifyEnvilomentNoxious(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("srchVo") SearchEnvNoxious srchVo, Model model, EnvilomentNoxiousVO envo) throws Exception{
		EnvilomentNoxiousVO detailVo = envilomentNoxiousService.selectEnviloNoxDetail(envo);
		model.addAttribute("detail", detailVo);
		
		
		if(StringUtils.isNotEmpty(detailVo.getAttachFileId())){
			FileVO vo = new FileVO();
			vo.setAtchFileId(detailVo.getAttachFileId());
			List<FileVO> fvo = fileMngService.selectFileInfs(vo);
			model.addAttribute("fvo", fvo);
		}
		
		return "egovframework/com/adm/noxious/modifyEnviloNox";
	}
	
	 @RequestMapping("/adm/contents/selectFileInfsForUpdate.do")
	    public String selectBbsFileInfsForUpdate(@ModelAttribute("searchVO") FileVO fileVO, Map<String, Object> commandMap,
	    //SessionVO sessionVO,
	    ModelMap model) throws Exception {	    	
		
			List<FileVO> result = fileService.selectFileInfs(fileVO);
			
			model.addAttribute("fileList", result);
			model.addAttribute("updateFlag", "Y");
			model.addAttribute("fileListCnt", result.size());
			model.addAttribute("atchFileId", fileVO.getAtchFileId());
			
			
			return "egovframework/com/cmm/fms/noxiousThumbFileList";
	 }
	
	/**
	 * 환경 유해인자 DB 등록
	 */
	@RequestMapping(value="/adm/contents/noxious/insertAdmEnvilomentNoxious.do")
	@ResponseBody
	public String insertAdmEnvilomentNoxious(final MultipartHttpServletRequest multiRequest, @ModelAttribute("noxVo") EnvilomentNoxiousVO noxVo,
			BindingResult bindingResult) throws Exception{
		String finalResult = "";
		int checkInsert = 0;
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();	
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		noxVo = this.settingCh(noxVo);
		beanValidator.validate(noxVo, bindingResult);
		
		
		if(isAuthenticated){
			if (bindingResult.hasErrors()) {    		
				finalResult = "validateErr";
			}else{
				List<FileVO> result = null;

		    	String uploadFolder = "";
		    	String bannerImage = "";
		    	String bannerImageFile = "";
		    	String atchFileId = "";
		    	
		    	// 썸네일 설정
		    	FileVO thumbVO = new FileVO();
		    	thumbVO.setThumbnailYn("Y");
				thumbVO.setThumbnailWidth(214);
				thumbVO.setThumbnailHeight(145);
		    	
		    	final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    	
		    	if(!files.isEmpty()){
		    	    result = fileUtil.parseFileInfNier(files, "NOX_", 0, "", uploadFolder, "noxious", thumbVO);
		    	    atchFileId = fileMngService.insertFileInfs(result);
		    	}
		    	
		    	/*System.out.println("atchFileId ==> " + atchFileId);
		    	System.out.println("bannerImage ==> " + bannerImage);
		    	System.out.println("bannerImageFile ==> " + bannerImageFile);*/
		    	 
		    	if(!"".equals(atchFileId)){
		    		noxVo.setAttachFileId(atchFileId);
		    	}
		    	
		    	noxVo.setIdx(insertEnvilmentNoxiousIdGnrService.getNextStringId());
		    	
		    	checkInsert = envilomentNoxiousService.insertEnviloNoxious(noxVo);
		    	
		    	if(checkInsert > 0){
		    		finalResult = "success";
		    	}
		    	
			}
		}
		
		
		
		return finalResult;
	}
	
	@RequestMapping(value="/adm/contents/noxious/updateAdmEnvilomentNoxious.do")
	@ResponseBody
	public String updateAdmEnvilomentNoxious (final MultipartHttpServletRequest multiRequest, @ModelAttribute("noxVo") EnvilomentNoxiousVO noxvo,
			BindingResult bindingResult) throws Exception{
		String finalResult = "";
		int checkInsert = 0;
		
		noxvo = this.settingCh(noxvo);
		beanValidator.validate(noxvo, bindingResult);
		
		//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();	
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if(isAuthenticated){
			if (bindingResult.hasErrors()) {    		
				finalResult = "validateErr";
			}else{
				
				List<FileVO> result = null;

		    	String uploadFolder = "";		    	
		    	String atchFileId = "";
		    	
		    	// 썸네일 설정
		    	FileVO thumbVO = new FileVO();
		    	thumbVO.setThumbnailYn("Y");
				thumbVO.setThumbnailWidth(214);
				thumbVO.setThumbnailHeight(145);
		    	
		    	final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    	
		    	if(!files.isEmpty()){
		    	    result = fileUtil.parseFileInfNier(files, "NOX_", 0, "", uploadFolder, "noxious", thumbVO);
		    	    atchFileId = fileMngService.insertFileInfs(result);
		        	noxvo.setAttachFileId(atchFileId);
		    	}
				
				checkInsert = envilomentNoxiousService.updateAdmEnvilomentNoxious(noxvo);
				if(checkInsert > 0){
		    		finalResult = "success";
		    	}
			}
		}
		
		return finalResult;
	}
	
	@RequestMapping(value="/adm/contents/noxious/deleteAdmEnvilomentNoxious.do")
	@ResponseBody
	public String deleteAdmEnvilomentNoxious (HttpServletRequest req, HttpServletResponse res, @ModelAttribute("noxVo") EnvilomentNoxiousVO noxvo) throws Exception{
		String finalResult = "";
		int checkInsert = 0;
		
		
		//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();	
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(isAuthenticated){
			checkInsert = envilomentNoxiousService.deleteAdmEnvilomentNoxious(noxvo);
			
			if(checkInsert > 0){
	    		finalResult = "success";
	    	}
		}
		
		
		
		return finalResult;
	}
	
	
	
	
	private EnvilomentNoxiousVO settingCh(EnvilomentNoxiousVO vo) throws Exception{
		if(StringUtils.isEmpty(vo.getBasicCh())){vo.setBasicCh("N");}
		if(StringUtils.isEmpty(vo.getControlGCh())){vo.setControlGCh("N");}
		if(StringUtils.isEmpty(vo.getControlGReCh())){vo.setControlGReCh("N");}
		if(StringUtils.isEmpty(vo.getInfoAttentionChildCh())){vo.setInfoAttentionChildCh("N");}
		if(StringUtils.isEmpty(vo.getInfoAttentionManCh())){vo.setInfoAttentionManCh("N");}
		if(StringUtils.isEmpty(vo.getInfoExpoChildCh())){vo.setInfoExpoChildCh("N");}
		if(StringUtils.isEmpty(vo.getInfoMatterChildCh())){vo.setInfoMatterChildCh("N");}
		if(StringUtils.isEmpty(vo.getMediumCh())){vo.setMediumCh("N");}
		if(StringUtils.isEmpty(vo.getOutlineCh())){vo.setOutlineCh("N");}
		if(StringUtils.isEmpty(vo.getOutlineReCh())){vo.setOutlineReCh("N");}
		if(StringUtils.isEmpty(vo.getOverGCh())){vo.setOverGCh("N");}
		if(StringUtils.isEmpty(vo.getOverGReCh())){vo.setOverGReCh("N");}
		if(StringUtils.isEmpty(vo.getOverMCh())){vo.setOverMCh("N");}
		if(StringUtils.isEmpty(vo.getOverMReCh())){vo.setOverMReCh("N");}
		if(StringUtils.isEmpty(vo.getPlanGCh())){vo.setPlanGCh("N");}
		if(StringUtils.isEmpty(vo.getPlanGReCh())){vo.setPlanGReCh("N");}
		if(StringUtils.isEmpty(vo.getPlanMCh())){vo.setPlanMCh("N");}
		if(StringUtils.isEmpty(vo.gettInfoCh())){vo.settInfoCh("N");}
		if(StringUtils.isEmpty(vo.getTraitCh())){vo.setTraitCh("N");}
		if(StringUtils.isEmpty(vo.gettSafeCh())){vo.settSafeCh("N");}		
		
		return vo;
	}
	
}


/*SELECT m_idx, m_ename, m_kname, m_cas, 
m_trait, m_trait_ch, m_medium, m_outline, 
m_outline_ch, m_outline_re, m_outline_re_ch, m_basic, 
m_basic_ch, m_basic_re, m_basic_re_ch, m_t_info, 
m_t_info_ch, m_t_info_re, m_t_info_re_ch, m_t_safe, 
m_t_safe_ch, m_t_safe_re, m_t_safe_re_ch, m_over_g, 
m_over_g_ch, m_over_g_re, m_over_g_re_ch, m_over_m, 
m_over_m_ch, m_over_m_re, m_over_m_re_ch, m_plan_g, 
m_plan_g_ch, m_plan_g_re, m_plan_g_re_ch, m_plan_m, 
m_plan_m_ch, m_plan_m_re, m_plan_m_re_ch, m_mana_g, 
m_mana_g_ch, m_mana_g_re, m_mana_g_re_ch, m_control_g, 
m_control_g_ch, m_control_g_re, m_control_g_re_ch, m_control_m, 
m_control_m_ch, m_control_m_re, m_control_m_re_ch, m_bad_about, 
m_info_matter_child, m_info_expo_child, m_info_attention_child, 
m_info_matter_man, m_info_expo_man, m_info_attention_man, 
m_info_matter_child_ch, m_info_expo_child_ch, m_info_attention_child_ch, 
m_info_matter_man_ch, m_info_expo_man_ch, m_info_attention_man_ch, 
m_flag, TO_CHAR(M_REG_DATE, 'YYYY.MM.DD') M_REG_DATE 		
FROM TT_MATERIAL WHERE M_IDX=?
;
해당 테이블로 가져옴 
*/