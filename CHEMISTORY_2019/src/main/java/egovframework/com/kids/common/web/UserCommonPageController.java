/**
 * @Name : UserCommonPageController.java
 * @Description : api 및 일반 페이지용 controller.
 * @author 이한구
 * @since 2016. 12. 8.
 * @version 1.0
 * @see Copyright (C) All right reserved.
 *
 * @Modification Information
 * 2016. 12. 8.	이한구. 최초 생성.
 */
package egovframework.com.kids.common.web;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.StringReader;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.kids.common.service.GreenProductService;
import egovframework.com.kids.common.vo.GreenProductVo;
import egovframework.com.kids.common.vo.NewsLetterVo;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class UserCommonPageController {
	@Autowired
	private DefaultBeanValidator beanValidator;

	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
	private EgovMenuManageService menuManageService;
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    /** EgovUserManageService */
    @Resource(name="userManageService")
    EgovUserManageService userMngService;
    
    @Resource(name="greenProductService")
    GreenProductService greenProductService;

	/**
	 * 어린이활동공간시설행정처분현황
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/common/kidsPlaygroundApi.do")
	public String kidsPlaygroundApi(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
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
		
		ArrayList list = null;
	    ArrayList sidolist = null;
		    
	    //지역 구군 까지 검색 할 수 있음.(동은 검색할 수 없음 API 서비스 불가)
	    String searchArea =   req.getParameter("searchArea");	//"1100000000"(서울);
	    String searchAreaNm = req.getParameter("searchAreaNm");	//서울,부산,대구,인천, 광주, 대전, 울산, 세종, 경기, 강원, 충북, 충남, 전북, 전남, 경북, 경남, 제주	    
	    String searchGuGun =  req.getParameter("searchGuGun");	//"1111000000"(종로구);
	    String searchGuGunNm = req.getParameter("searchGuGunNm");
	    String searchPage = req.getParameter("currentPage");
	    
	    // 설치장소 검색 
	    String searchCode = req.getParameter("searchCode");
	    
	    //동명 , 시설명 검색
	    String schDongCiName = req.getParameter("schDongCiName");
	    String searchField = req.getParameter("searchField");

	    //decode	    
	    //String searchAreaNmKR = URLDecoder.decode(searchAreaNm,"UTF-8");
	    //searchGuGunNm = URLDecoder.decode(searchGuGunNm,"UTF-8");
	    
	    String apiurl = "http://openapi.cpf.go.kr/openapi/service/rest/ChildPlyFcltExaathrInfoService/getExaathrInfo?ServiceKey=";
	    //String apicodeurl = "http://openapi.cpf.go.kr/openapi/service/rest/CodeInfoService/getAdministzoneCodeInfo?ServiceKey=";	//행정구역코드 api서비스

	    //기존 실서버
	    String servicekey = "PKC5kcuyZPBtsiWDrwkhvIrvSx5QMJzs5m%2F0ZJd%2FIhT4JsBTToFj6RRvl76WTcExJKgEvzdDCVEjaFTd1pi%2B5A%3D%3D";
	    servicekey = URLEncoder.encode(servicekey,"UTF-8");
	    
	    ArrayList<String[]> childPlyInfo = new ArrayList<String[]>();
	    
	    apiurl = apiurl + servicekey; //+ parameter;
		System.out.println("apiurl : "+apiurl);
	    
	    HttpURLConnection conn = null;
	    URL url = new URL(apiurl);
		conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("accept-language","ko");
//        System.out.println("test1: ssssssssssssssssssssss");
        DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
        
        byte[] bytes = new byte[4096];
        InputStream in = conn.getInputStream();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
//        System.out.println("test1: ddddddddddddddddddddddd");
        while(true){
            int red = in.read(bytes);
            if(red < 0)
                break;
            baos.write(bytes, 0, red);
        }
        String xmlData = baos.toString("UTF-8");
        
        baos.close();
        in.close();
        conn.disconnect();	
        
        Document doc = docBuilder.parse(new InputSource(new StringReader(xmlData)));
//        System.out.println("test1: 11111111");
        Element el = (Element)doc.getElementsByTagName("response").item(0);
        System.out.println("태그명: "+el.getNodeName());
//        System.out.println("test1: 2222222");
        Node header = el.getChildNodes().item(0);
        System.out.println("태그명: "+header.getNodeName());
//        System.out.println("test1: 3333333");
        //Node bodyitem = 
        //System.out.println("태그명: "+el.getFirstChild().getChildNodes().item(0));
        //System.out.println("태그명: "+el.getFirstChild().getChildNodes().item(1));
        //Element elBody = (Element)doc.getElementsByTagName("body").item(0);
        //System.out.println("바디태크 찾기 : "+elBody.getNodeName());
        if(el.getAttributes().getNamedItem("body") == null){
        	
        }else{
        Node xmlitems = el.getAttributes().getNamedItem("body").getChildNodes().item(0);
//        System.out.println("test1: 4444444");
        //총 게시물 수 
        //Node xmltotalCount = el.getChildNodes().item(1).getChildNodes().item(3);
        //System.out.println("태그명: "+xmltotalCount.getNodeName());
        //String totalCount = xmltotalCount.getFirstChild().getNodeValue();
        //System.out.println(totalCount);
        
        if(el.getFirstChild().getNodeName().equals("header")){
            String code = el.getFirstChild().getChildNodes().item(0).getFirstChild().getNodeValue();
            System.out.println("code="+code);
            if(code.equals("01")){
            	//request.setAttribute("code", code);
            }else if(code.equals("00")){
            	//System.out.println(xmlitems.getChildNodes().getLength());
            	for(int i=0; i<xmlitems.getChildNodes().getLength(); i++){
            		//System.out.println("i ="+i);
	                Node node = xmlitems.getChildNodes().item(i); 
	                //System.out.println("태그명: "+node.getNodeName());
	                /*if(node.getNodeName().equals("item")){
	                    continue;
	                }*/
	                //System.out.println("item 자식 태그수 ="+node.getChildNodes().getLength());
	                
	                String ciName = "";
	                String ciNaddr1 = "";
	                String ciNaddr2 = "";
	                String ciRaddr1 = "";
	                String ciRaddr2 = "";
	                String ciSeq = "";
	                String name1 = "";
	                
	                for(int y=0; y<node.getChildNodes().getLength(); y++){
	                	
	                	//System.out.println("y ==== " + y);
	                	
	                	if("ciName".equals(node.getChildNodes().item(y).getNodeName())){
	                		ciName = node.getChildNodes().item(y).getFirstChild().getNodeValue();
	                	}
	                	
	                	if("ciNaddr1".equals(node.getChildNodes().item(y).getNodeName())){
	                		ciNaddr1 = node.getChildNodes().item(y).getFirstChild().getNodeValue();
	                	}
	                	
	                	if("ciNaddr2".equals(node.getChildNodes().item(y).getNodeName())){
	                		ciNaddr2 = node.getChildNodes().item(y).getFirstChild().getNodeValue();
	                	}
	                	
	                	if("ciRaddr1".equals(node.getChildNodes().item(y).getNodeName())){
	                		ciRaddr1 = node.getChildNodes().item(y).getFirstChild().getNodeValue();
	                	}
	                	
	                	if("ciRaddr2".equals(node.getChildNodes().item(y).getNodeName())){
	                		ciRaddr2 = node.getChildNodes().item(y).getFirstChild().getNodeValue();
	                	}
	                	
	                	if("ciSeq".equals(node.getChildNodes().item(y).getNodeName())){
	                		ciSeq = node.getChildNodes().item(y).getFirstChild().getNodeValue();
	                	}
	                	
	                	if("name1".equals(node.getChildNodes().item(y).getNodeName())){
	                		name1 = node.getChildNodes().item(y).getFirstChild().getNodeValue();
	                	}
	                	
	                }
	                
//	                System.out.println("ciName : "+ciName);
//	                System.out.println("ciNaddr1 : "+ciNaddr1);
//	                System.out.println("ciNaddr2 : "+ciNaddr2);
//	                System.out.println("ciRaddr1 : "+ciRaddr1);
//	                System.out.println("ciRaddr2 : "+ciRaddr2);
//	                System.out.println("ciSeq : "+ciSeq);
//	                System.out.println("name1 : "+name1);
	                
	                //System.out.println("ciName ====== " + ciName);
	                
	                if(!"".equals(ciName)){    	                	
	                	//childPlyInfo.add(new SpaceDT(ciName, ciNaddr1, ciNaddr2, ciRaddr1, ciRaddr2, ciSeq, name1, "", "", "", "", "", ""));    	                	
	                }
	                
	                continue;
	            }
            }
            
        }
        
        }

		return "kor/kids/common/kidsPlaygroundApi";
	}
	
	/**
	 * 이슈&뉴스 국내환경뉴스
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/kids/common/withinNews.do")
	public String withinNews(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
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

		return "kor/kids/common/withinNews";
	}
	
	/**
	 * 홈페이지 이용안내 > 뉴스레터 신청
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return
	 * @throws Exception
	 * EgovUserManage_SQL_Oracle.xml
	 */
	@RequestMapping(value = "/user/com/newsletterApplication.do")
	public String newsletterApplication(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
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
		
		return "kor/kids/common/NewsletterUserApplication";
	}
	
	/**
	 * 홈페이지 이용안내 > 뉴스레터 신청 / 구독 신청 or 취소 체크
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return ajax(kor/kids/common/NewsletterUserApplication)
	 * @throws Exception
	 * EgovUserManage_SQL_Oracle.xml
	 */
	@RequestMapping(value = "/user/com/newsletterSubscriptionChk.do")
	@ResponseBody
	public String newsletterSubscriptionChk(HttpServletRequest req, HttpServletResponse res, Model model, 
			@ModelAttribute("nvo") NewsLetterVo nlvo,
			@RequestParam("subscriptionYn") String subscriptionYn) throws Exception {
		int count;
		String result = "";
    	
		try {
			count = userMngService.selectEmailData(nlvo);
			
	    	if(count > 0){//email 있음
	    		if(subscriptionYn.equals("apply"))		result = subscriptionYn + "_00"; 
	    		else if(subscriptionYn.equals("drop"))	result = subscriptionYn + "_03";
	    	}else{//없음
	    		if(subscriptionYn.equals("apply"))		result = subscriptionYn + "_01";
	    		else if(subscriptionYn.equals("drop"))	result = subscriptionYn + "_02";
	    	}
		} catch (Exception e) {
			result = subscriptionYn + "_04";
		}
		return result;
	}
	
	/**
	 * 홈페이지 이용안내 > 뉴스레터 신청 / 구독 신청 or 취소
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return ajax(kor/kids/common/NewsletterUserApplication)
	 * @throws Exception
	 * EgovUserManage_SQL_Oracle.xml
	 */
	@RequestMapping(value = "/user/com/newsletterSubscription.do")
	@ResponseBody
	public String newsletterSubscription(HttpServletRequest req, HttpServletResponse res, Model model, 
			@ModelAttribute("nvo") NewsLetterVo nlvo,
			@RequestParam("subscriptionYn") String subscriptionYn) throws Exception {
		String result = "N";
		
		try {
			if(subscriptionYn.equals("drop"))		result = userMngService.deleteEmailData(nlvo) == 0 ? "N" : "Y";
			else									result = userMngService.insertEmailData(nlvo) == 0 ? "N" : "Y";
			
		} catch (Exception e) {
			result = "N";
		}
		
    	return result;
	}
	
	/**
     * 홈페이지 이용안내 > 뉴스레터 신청 목록 조회
     * 
     * @param req
     * @param res
     * @param model
     * @return
     * @throws Exception
     * EgovUserManage_SQL_Oracle.xml
     */
    @RequestMapping(value = "/user/comn/newsLetterList.do")
    public String newsletterList(HttpServletRequest req, HttpServletResponse res, Model model, 
    		@ModelAttribute("nlvo") NewsLetterVo nlvo ) throws Exception{
            
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(nlvo.getPageIndex());
        paginationInfo.setRecordCountPerPage(nlvo.getPageUnit());        
        paginationInfo.setPageSize(nlvo.getPageSize());
        
        nlvo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        nlvo.setLastIndex(paginationInfo.getLastRecordIndex());
        nlvo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        
        List<NewsLetterVo> kvo = userMngService.selectNewsLetterList(nlvo);
        model.addAttribute("nlvoList", kvo);
        
        int totCnt = userMngService.selectNewsLetterListCnt(nlvo);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "egovframework/com/adm/newsLetterList";
    }
	
	@RequestMapping(value="/user/comn/newsLetterListExcel.do")
	public void getSelectKidsGroundCurrentExcel(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("nlvo") NewsLetterVo nlvo ) throws Exception{
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String getToday = formatter.format(calendar.getTime());
		
		String fileName = "뉴스레터신청목록_" + getToday + ".xls";
		String sheetName = "신청목록";
		
		List<NewsLetterVo> kvo = userMngService.selectNewsLetterListExcel(nlvo);
		
		int totCnt = kvo.size();
		int maxCnt = 65000;
		
//		System.out.println("totCnt 카운트 ===> " + totCnt);
		
		int sheetCnt = (int)(1+Math.ceil(totCnt/maxCnt));
		
//		System.out.println("sheet 카운트 ===> " + sheetCnt);
		
		if(kvo != null){
			HSSFWorkbook workbook = new HSSFWorkbook();
			for(int i = 1; i<=sheetCnt;i++){
				
				HSSFSheet sheet = workbook.createSheet(sheetName+i);
				
				HSSFCellStyle style = workbook.createCellStyle();
				style.setAlignment((short)HSSFCellStyle.ALIGN_CENTER);
				style.setFillPattern((short)HSSFCellStyle.SOLID_FOREGROUND);
				style.setFillForegroundColor((short)HSSFColor.YELLOW.index);
				style.setBorderTop((short)HSSFCellStyle.BORDER_MEDIUM);
				style.setBorderLeft((short)HSSFCellStyle.BORDER_MEDIUM);
				style.setBorderRight((short)HSSFCellStyle.BORDER_MEDIUM);
				style.setBorderBottom((short)HSSFCellStyle.BORDER_MEDIUM);
				
				HSSFRow row = sheet.createRow(0);
				row.createCell(0).setCellValue("이메일");			
				row.createCell(1).setCellValue("신청일자");
				row.createCell(2).setCellValue("신청여부");
								
				for(int j=0; j< kvo.size(); j++){
					
//					System.out.println("리스트 사이즈 ==== > " + kvo.size());
					
					NewsLetterVo evo = kvo.get(j);
					row = sheet.createRow(j+1);
					row.createCell(0).setCellValue(evo.getEmail());
					if(evo.getUseAt().equals("Y"))			row.createCell(1).setCellValue(evo.getFirstRegistPnttm());
					else if(evo.getUseAt().equals("N"))		row.createCell(1).setCellValue(evo.getLastUpdtPnttm());
					row.createCell(2).setCellValue(evo.getUseAt());
					
//					System.out.println("j번째 ===> " + j);
					
					if(j == maxCnt) {
//						System.out.println("삭제 시작");
						Class klass = kvo.getClass();
						Class[] paramTypes = { Integer.TYPE, Integer.TYPE };
						Method m = klass.getDeclaredMethod("removeRange", paramTypes);
						Object[] arguments = { new Integer(0), new Integer(maxCnt+1) };
						m.setAccessible(true);
						m.invoke(kvo, arguments);
//						System.out.println("삭제 완료");
						break;
					}
				}
				
			}
			
			ServletOutputStream sos = null;
			
			try{
				
				String downName = null;
				String browser = req.getHeader("User-Agent");
				if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){        		
				 downName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
				} else {        		
					 downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
				}				
				
				String contentType = "application/octet-stream";
				sos = res.getOutputStream();
				res.setContentType(contentType);
				res.setHeader("Content-Type", contentType);
				res.setHeader("Content-Disposition", "attachment;filename=" + downName + ";");
				res.setHeader("Content-Transfer-Encoding", "binary");
				res.setHeader("Pragma", "no-cache");
				res.setHeader("Expires", "0");
				workbook.write(sos);
				sos.flush();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if (sos != null) {
					sos.close();
				}
			}
		}
	}
	
    
    
    
    
	/**
	 * 예방&건강 환경표지인증제품
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/certificationList.do")
	public String certificationList(HttpServletRequest req, HttpServletResponse res, Model model
			, @ModelAttribute("gvo") GreenProductVo gvo) throws Exception {
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
		
		//기본 데이터 최대값
		if (StringUtils.isEmpty(req.getParameter("pageUnit")))		gvo.setPageUnit(5);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(gvo.getPageIndex());
		paginationInfo.setRecordCountPerPage(gvo.getPageUnit());
		paginationInfo.setPageSize(gvo.getPageSize());

		gvo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		gvo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		/*String apiUrl = "http://openapi.greenproduct.go.kr/openapi-data/service/EnvironmentSignalRecognitionInformationInquiryService/getEnvironmentSignalGoodsInfomation"
				+ "?ServiceKey=9TVZHqJn1pmmpaSucLnkOiQiqTXbQbLfXUr%2FGD9Tc60inFM2ua%2F9atlxEOCPEG%2FIxi0WgO3xD0X3iQlM63RQUg%3D%3D"
				+ "&numOfRows=1000&prod_gubn=3&prod_value=20140605";
		
		if(gvo.getProdPrnm().length() > 0)		apiUrl += "&prodPrnm=" + gvo.getProdPrnm();//상표명
		if(gvo.getProdG2sn().length() > 0)		apiUrl += "&prodG2sn=" + gvo.getProdG2sn();//인증번호
		if(gvo.getProdG2sn().length() > 0)		apiUrl += "&prodG2sn=" + gvo.getProdG2sn();//용도
		if(gvo.getProdG2sn().length() > 0)		apiUrl += "&prodG2sn=" + gvo.getProdG2sn();//g2b 식별번호
		if(gvo.getVendVcnm().length() > 0)		apiUrl += "&vendVcnm=" + gvo.getVendVcnm();//업체명
		if(gvo.getProdG2sn().length() > 0)		apiUrl += "&prodG2sn=" + gvo.getProdG2sn();//지역
		//if(gvo.getProdG2sn().length() > 0)		apiUrl += "&prodG2sn=" + gvo.getProdG2sn();//대분류
		//if(gvo.getProdG2sn().length() > 0)		apiUrl += "&prodG2sn=" + gvo.getProdG2sn();//중분류
		
		URL setUrl = new URL(apiUrl);
		URLConnection conn = setUrl.openConnection();
		DocumentBuilderFactory docFac = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docFac.newDocumentBuilder(); 
		Document doc = docBuilder.parse(conn.getInputStream());
		NodeList nodes = doc.getElementsByTagName("item"); 
		
		for(int i = 0; i < nodes.getLength(); i++){
			for(Node node = nodes.item(i).getFirstChild(); node != null; node = node.getNextSibling()){
				System.out.println("!!! get =="+node.getTextContent());
			}
		}*/
		
		List list = greenProductService.selectProductList(gvo);
		model.addAttribute("list", list);
		
		int totCnt = greenProductService.selectProductListCnt(gvo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "kor/kids/common/certificationList";
	}
	
	/**
	 * 예방&건강 환경표지인증제품
	 * 
	 * @param req
	 * @param res
	 * @param model
	 * @return ajax
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/com/middleCategory.do")
	@ResponseBody
	public String selectMiddleCategoryList(HttpServletRequest req, HttpServletResponse res, Model model
			, @ModelAttribute("gvo") GreenProductVo gvo) throws Exception {
		List<Map<String, Object>> data = greenProductService.selectMiddleCategoryList(gvo);
		String html = "";
		int idx = 0;
		
		for(Map<String, Object> map : data){
			for(Map.Entry<String, Object> entry : map.entrySet()){
				String key = entry.getKey();
				Object value = entry.getValue();
				map.put(key, value);
			}
			idx++;
			
			html += "size_" + data.size() + "##num_" + map.get("ecomEcom") + "##name_" + URLEncoder.encode(map.get("ecomClnm").toString(), "UTF-8") + "@@";
		}
		return html;
	}
}

			
				
					
				
