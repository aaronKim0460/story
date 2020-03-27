package egovframework.com.cmm.web;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.sym.prm.service.EgovProgrmManageService;
import egovframework.com.sym.prm.service.ProgrmManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @Class Name : EgovComUtlController.java
 * @Description : 공통유틸리티성 작업을 위한 Controller
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.03.02    조재영          최초 생성
 * @ 2011.10.07    이기하          .action -> .do로 변경하면서 동일 매핑이 되어 삭제처리
 *
 *  @author 공통서비스 개발팀 조재영
 *  @since 2009.03.02
 *  @version 1.0
 *  @see
 *
 */
@Controller
public class EgovComUtlController {

    //@Resource(name = "egovUserManageService")
    //private EgovUserManageService egovUserManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    /** EgovProgrmManageService */
	@Resource(name = "progrmManageService")
    private EgovProgrmManageService progrmManageService;

    /**
	 * JSP 호출작업만 처리하는 공통 함수
	 */
	@RequestMapping(value="/EgovPageLink.do")
	public String moveToPage(@RequestParam("link") String linkPage){
		String link = linkPage;
		// service 사용하여 리턴할 결과값 처리하는 부분은 생략하고 단순 페이지 링크만 처리함
		if (linkPage==null || linkPage.equals("")){
			link="egovframework/com/cmm/egovError";
		}
		return link;
	}

    /**
	 * validato rule dynamic Javascript
	 */
	@RequestMapping("/validator.do")
	public String validate(){
		return "egovframework/com/cmm/validator";
	}

	@RequestMapping(value="/EgovcmmNierFileDownload.do")
	 public void cmmNierFileDownload(
			 	HttpServletRequest request, HttpServletResponse response,ModelMap model)
	            throws Exception { 
	    	
		String stordFilePath = EgovProperties.getProperty("Globals.fileStorePath");
		 
		// 저장된 파일명
		String filename = request.getParameter("filename");
		// 첨부된 원 파일명
		String original = request.getParameter("original");
		 
		if ("".equals(original)) {
			original = filename;
		}
		 
		request.setAttribute("downFile", stordFilePath + filename);
		request.setAttribute("orgFileName", original);
		request.setAttribute("orginFile", original);
		 
		EgovFileMngUtil.downFile(request, response);
	        
	        
	 }
	
	 @RequestMapping(value="/EgovcmmNierCFileDownload.do")
	 public String cmmNierFileDownload_C(
			 	HttpServletRequest request, HttpServletResponse response,ModelMap model)
	            throws Exception { 
	    
		 ComDefaultVO searchVO = new ComDefaultVO();
		searchVO.setSearchKeyword(request.getParameter("nttId"));
		ProgrmManageVO progrmManageVO =progrmManageService.selectProgrmFile_N(searchVO);
		 
		String stordFilePath = progrmManageVO.getFileStreCours();
		 
		// 저장된 파일명
		String filename = progrmManageVO.getStreFileNm();
		// 첨부된 원 파일명
		String original = progrmManageVO.getOrignlFileNm();
		 
		if ("".equals(original)) {
			original = filename;
		}
		 
		request.setAttribute("downFile", stordFilePath + filename);
		request.setAttribute("orgFileName", original);
		request.setAttribute("orginFile", original);
		//EgovFileMngUtil.downFile(request, response);
		return "forward:/cmm/fms/NoLoginFileConDown.do";
	        
	        
	 }
	 
	@RequestMapping(value="/EgovNierSmsSend.do")
	public String nierSmsSend( @ModelAttribute("smsVo") Board board, ModelMap model) throws UnsupportedEncodingException{
		
		String cateVal = "";
		if(board.getCateval() == 1){
			cateVal = "실내공기";
		}else if(board.getCateval() == 2){
			cateVal = "라돈";
		}else if(board.getCateval() == 3){
			cateVal = "소음";
		}else if(board.getCateval() == 4){
			cateVal = "악취";
		}else{
			cateVal = "기타";
		}
		
		String mms = URLEncoder.encode("에코벨민원접수가 완료되었습니다. 접수번호:["+ board.getExtStr3() +"]", "UTF-8");
		String mms2 = URLEncoder.encode("에코벨민원접수가 완료되었습니다. 접수번호:[" + cateVal + ":" + board.getExtStr3() +"]", "UTF-8");

		InputStream is = null;
		InputStreamReader isr = null;
		BufferedReader br = null;

		String buffer = null;
		String XMLresult = "";

		try{

			URL url = new URL("http", "sms.nicesms.co.kr", 80, "/cpsms_utf8/cpsms.aspx?userid=ucube&password=075718cd95f3e851f1f132fa1bbd57af&msgcnt=1&msg1="+ mms +"&receivers="+board.getSmsNo()+"&sender=0325607114");
			URLConnection connection = url.openConnection();
			is = connection.getInputStream();
			isr = new InputStreamReader(is,"UTF-8");
			br = new BufferedReader(isr);

			while(true){
				buffer = br.readLine();
				if(buffer == null){
					break;
				}else{
				XMLresult = XMLresult + buffer;
				}
			}


			URL url2 = new URL("http", "sms.nicesms.co.kr", 80, "/cpsms_utf8/cpsms.aspx?userid=ucube&password=075718cd95f3e851f1f132fa1bbd57af&msgcnt=1&msg1="+ mms2 +"&receivers="+board.getSmsNo2()+"&sender=0325607114");
			URLConnection connection2 = url2.openConnection();
			is = connection2.getInputStream();
			isr = new InputStreamReader(is,"UTF-8");
			br = new BufferedReader(isr);

			while(true){
				buffer = br.readLine();
				if(buffer == null){
					break;
				}else{
				XMLresult = XMLresult + buffer;
				}
			}

			if(!board.getSmsNo2().equals(board.getSmsNo3())){

				URL url3 = new URL("http", "sms.nicesms.co.kr", 80, "/cpsms_utf8/cpsms.aspx?userid=ucube&password=075718cd95f3e851f1f132fa1bbd57af&msgcnt=1&msg1="+ mms2 +"&receivers="+board.getSmsNo3()+"&sender=0325607114");
				URLConnection connection3 = url3.openConnection();
				is = connection3.getInputStream();
				isr = new InputStreamReader(is,"UTF-8");
				br = new BufferedReader(isr);

				while(true){
					buffer = br.readLine();
					if(buffer == null){
						break;
					}else{
					XMLresult = XMLresult + buffer;
					}
				}
			}
		}catch (Exception e) {
			System.out.println("커넥션 닫기 오류발생");
		}finally{
			EgovResourceCloseHelper.close(br, isr, is);
		}
		
		model.addAttribute("resultboard", board);
		return "kor/rf/nier-rf-2903";
	}
}