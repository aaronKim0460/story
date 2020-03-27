package egovframework.com.cmm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONSerializer;

import org.apache.log4j.Logger;
import org.hsqldb.lib.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.adm.contents.noxious.service.EnvilomentNoxiousService;
import egovframework.com.adm.contents.noxious.vo.EnvilomentNoxiousVO;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.kids.recall.service.RecallBBSService;
import egovframework.com.kids.recall.vo.RecallBBSVO;

/**
 * 파일 조회, 삭제, 다운로드 처리를 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.3.25  이삼섭          최초 생성
 *
 * </pre>
 */
@Controller
public class EgovFileMngController {
	
	 
	 

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;
    
    @Resource(name = "recallBBSService")
	private RecallBBSService recallBBSService;
    
    @Resource(name="envilomentNoxiousService")
	private EnvilomentNoxiousService envilomentNoxiousService;

    private static final Logger LOG = Logger.getLogger(EgovFileMngController.class.getName());

    /**
     * 첨부파일에 대한 목록을 조회한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/selectFileInfs.do")
    public String selectFileInfs(@ModelAttribute("searchVO") FileVO fileVO, Map<String, Object> commandMap, ModelMap model) throws Exception {
    	
		String atchFileId = (String)commandMap.get("param_atchFileId");
	
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileService.selectFileInfs(fileVO);
	
		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "N");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);
		
		return "egovframework/com/cmm/fms/EgovFileList";
    }

    /**
     * 첨부파일 변경을 위한 수정페이지로 이동한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/selectFileInfsForUpdate.do")
    public String selectFileInfsForUpdate(@ModelAttribute("searchVO") FileVO fileVO, Map<String, Object> commandMap,
    //SessionVO sessionVO,
    ModelMap model) throws Exception {

		String atchFileId = (String)commandMap.get("param_atchFileId");
	
		fileVO.setAtchFileId(atchFileId);
	
		List<FileVO> result = fileService.selectFileInfs(fileVO);
		
		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "Y");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);
		
		return "egovframework/com/cmm/fms/EgovFileList";
	    }

    /**
     * 첨부파일에 대한 삭제를 처리한다.
     * 
     * @param fileVO
     * @param returnUrl
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/deleteFileInfs.do")
    public String deleteFileInf(@ModelAttribute("searchVO") FileVO fileVO, @RequestParam("returnUrl") String returnUrl,
    //SessionVO sessionVO,
    HttpServletRequest request, ModelMap model) throws Exception {

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		if (isAuthenticated) {
		    fileService.deleteFileInf(fileVO);
		    fileService.updateBBSFileInf(fileVO);
		}
	
		//--------------------------------------------
		// contextRoot가 있는 경우 제외 시켜야 함
		//--------------------------------------------
		////return "forward:/cmm/fms/selectFileInfs.do";
		//return "forward:" + returnUrl;
		
		if ("".equals(request.getContextPath()) || "/".equals(request.getContextPath())) {
		    return "forward:" + returnUrl;
		}
		
		if (returnUrl.startsWith(request.getContextPath())) {
		    return "forward:" + returnUrl.substring(returnUrl.indexOf("/", 1));
		} else {
		    return "forward:" + returnUrl;
		}
		////------------------------------------------
    }

    /**
     * 이미지 첨부파일에 대한 목록을 조회한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/selectImageFileInfs.do")
    public String selectImageFileInfs(@ModelAttribute("searchVO") FileVO fileVO, Map<String, Object> commandMap, //SessionVO sessionVO, 
	ModelMap model) throws Exception {

		String atchFileId = (String)commandMap.get("atchFileId");
	
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileService.selectImageFileList(fileVO);
		
		model.addAttribute("fileList", result);
	
		return "egovframework/com/cmm/fms/EgovImgFileList";
    }
    
    @RequestMapping("/cmm/fms/selectNoLoginFileInfs.do")
    public String selectNoLoginFileInfs(@ModelAttribute("searchVO") FileVO fileVO, Map<String, Object> commandMap, ModelMap model) throws Exception {
    	
		String atchFileId = (String)commandMap.get("param_atchFileId");
		String userTp = (String)commandMap.get("userTp");
	
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileService.selectFileInfs(fileVO);
	
		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "N");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);
		model.addAttribute("userTp", userTp);
		
		return "common/ComFileList";
    }
    
    /**
     * 게시판 첨부파일 변경을 위한 수정페이지로 이동한다. - 썸네일의 경우를 대비해서 jsp 분리
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectFileInfsForUpdate.do")
    public String selectBbsFileInfsForUpdate(@ModelAttribute("searchVO") FileVO fileVO, Map<String, Object> commandMap,
    //SessionVO sessionVO,
    ModelMap model) throws Exception {

    	String returnURL = "egovframework/com/cmm/fms/EgovFileList";
    	
		String atchFileId = (String)commandMap.get("param_atchFileId");
		String thumbYn = (String)commandMap.get("param_thumbYn");
		fileVO.setAtchFileId(atchFileId);
	
		List<FileVO> result = fileService.selectFileInfs(fileVO);
		
		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "Y");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);
		
		if (!StringUtil.isEmpty(thumbYn)) {
			returnURL = "egovframework/com/cmm/fms/thumbFileList";
		}
		
		return returnURL;
	    }
    
	/**
	 * 파일 삭제시 다른게시판에 같은 파일ID가 있는지 체크
	 * @param board
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/selectBBSFileIdCount.do")
	public void selectBBSFileIdCount(@ModelAttribute("searchVO") FileVO fileVO, HttpServletResponse response, ModelMap model)  throws Exception{
		
		int resultCnt = fileService.selectBBSFileIdCount(fileVO);
		
		Map<String, String> resultMap = new HashMap<String, String>();

		if(resultCnt > 1){
			resultMap.put("result", "Y");
		}else{
			resultMap.put("result", "N");
		}

		String rtnVal = JSONSerializer.toJSON(resultMap).toString();
		EgovWebUtil.sendMessage(response, rtnVal);
 
	}
	
	/**
	 * 게시판 첨부 파일을 삭제한다.
	 * @param fileVO
	 * @param returnUrl
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/deleteFileInfs.do")
    public String deleteBbsFileInf(@ModelAttribute("searchVO") FileVO fileVO, @RequestParam("returnUrl") String returnUrl,
	    //SessionVO sessionVO,
	    HttpServletRequest request,
	    ModelMap model) throws Exception {

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		if (isAuthenticated) {
		    fileService.deleteFileInf(fileVO);
		    fileService.updateBBSFileInf(fileVO);
		}
	
		//--------------------------------------------
		// contextRoot가 있는 경우 제외 시켜야 함
		//--------------------------------------------
		////return "forward:/cmm/fms/selectFileInfs.do";
		
		if (returnUrl==null || returnUrl.equals("")) {
			returnUrl = "/cop/bbs/forUpdateBoardArticle.do";
		}
		
		return "forward:" + returnUrl;
		////------------------------------------------
    }
	
	/**
	 * 썸네일파일을 삭제한다.
	 * 
	 * @param fileVO
	 * @param returnUrl
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/deleteThumbFileInfs.do")
    public String deleteThumbFileInfs(@ModelAttribute("searchVO") FileVO fileVO, @RequestParam("returnUrl") String returnUrl, @RequestParam("deleteTable") String deleteTable,
	    HttpServletRequest request,
	    ModelMap model) throws Exception {

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		if (isAuthenticated) {
			String table = deleteTable;
			
			// 구분값에 따라 썸네일을 삭제한다.
			if (StringUtil.isEmpty(table)) {
				fileVO.setAtchFileId(fileVO.getThumbFileId());
				fileVO.setFileSn(fileVO.getThumbFileSn());
				
				fileService.deleteBBSThumbFile(fileVO);
			} else if (!StringUtil.isEmpty(table) && "recall".equals(table)) {
				RecallBBSVO deleteVO = new RecallBBSVO();
				deleteVO.setAtchFileId(fileVO.getThumbFileId());
				
				recallBBSService.deleteRecallBBSAtchFileId(deleteVO);
			} else if (!StringUtil.isEmpty(table) && "noxious".equals(table)) {				
				EnvilomentNoxiousVO deleteVO = new EnvilomentNoxiousVO();
				deleteVO.setIdx(request.getParameter("idx"));
				
				envilomentNoxiousService.deleteNoxiousAttachFileId(deleteVO);
			}
		}
	
		if (returnUrl==null || returnUrl.equals("")) {
			returnUrl = "/cop/bbs/forUpdateBoardArticle.do";
		}
		
		return "forward:" + returnUrl;
    }
}
