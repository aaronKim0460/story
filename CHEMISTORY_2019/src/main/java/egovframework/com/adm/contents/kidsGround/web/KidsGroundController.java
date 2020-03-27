package egovframework.com.adm.contents.kidsGround.web;

import java.io.File;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.terracotta.agent.repkg.de.schlichtherle.io.FileInputStream;

import egovframework.com.adm.contents.kidsGround.service.KidsGroundService;
import egovframework.com.adm.contents.kidsGround.vo.KidsGroundFaciltyVO;
import egovframework.com.adm.contents.kidsGround.vo.KidsGroundReliefVO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class KidsGroundController {
	
	@Resource(name="kidsGroundService")
	private KidsGroundService kidsGroundService;
	
	@RequestMapping(value="/adm/contents/kidsGround/SelectKidsGroundCurrent.do")
	public String selectKidsGroundCurrent(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("kfvo") KidsGroundFaciltyVO kfvo ) throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(kfvo.getPageIndex());
		paginationInfo.setRecordCountPerPage(kfvo.getPageUnit());		
		paginationInfo.setPageSize(kfvo.getPageSize());
		
		kfvo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		kfvo.setLastIndex(paginationInfo.getLastRecordIndex());
		kfvo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KidsGroundFaciltyVO> kvo = kidsGroundService.selectKidsGroundFaciltyList(kfvo);
		model.addAttribute("kvoList", kvo);
		
		int totCnt = kidsGroundService.selectKidsGroundFaciltyListCnt(kfvo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "egovframework/com/adm/kidsGround/SelectKidsGroundCurrent";
	}
	
	@RequestMapping(value="/adm/contents/kidsGround/detailKidsGroundCurrent.do")
	public String detailKidsGroundCurrent(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("kfvo") KidsGroundFaciltyVO kfvo ) throws Exception{
		
		KidsGroundFaciltyVO detail = kidsGroundService.detailKidsGroundCurrent(kfvo);
		model.addAttribute("detail", detail);
		
		return "egovframework/com/adm/kidsGround/detailKidsGroundCurrent";
	}
	
	@RequestMapping(value="/adm/contents/kidsGround/getSelectKidsGroundCurrentExcel.do")
	public void getSelectKidsGroundCurrentExcel(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("kfvo") KidsGroundFaciltyVO kfvo ) throws Exception{
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String getToday = formatter.format(calendar.getTime());
		
		String fileName = "어린이 활동공간 현황/시설_" + getToday + ".xls";
		String sheetName = "현황_시설";
		
		List<KidsGroundFaciltyVO> kvo = kidsGroundService.selectKidsGroundFaciltyExcelList(kfvo);
		
		int totCnt = kvo.size();
		int maxCnt = 65000;
		
		System.out.println("totCnt 카운트 ===> " + totCnt);
		
		int sheetCnt = (int)(1+Math.ceil(totCnt/maxCnt));
		
		System.out.println("sheet 카운트 ===> " + sheetCnt);
		
		
		
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
				row.createCell(0).setCellValue("시설순번");			
				row.createCell(1).setCellValue("시설번호");
				row.createCell(2).setCellValue("시설명");
				row.createCell(3).setCellValue("주소1");
				row.createCell(4).setCellValue("주소2");
				row.createCell(5).setCellValue("설치일자");
				row.createCell(6).setCellValue("설치장소");
				row.createCell(7).setCellValue("운영구분");
				row.createCell(8).setCellValue("지역분류");
				row.createCell(9).setCellValue("민공구분");
				row.createCell(10).setCellValue("실내실외구분");
				row.createCell(11).setCellValue("시설구분");
				row.createCell(12).setCellValue("설립년도");
				row.createCell(13).setCellValue("학교급");
				row.createCell(14).setCellValue("교육지원청");
				row.createCell(15).setCellValue("본분교");
				row.createCell(16).setCellValue("설립구분");
				row.createCell(17).setCellValue("학교상태");
				row.createCell(18).setCellValue("시설유형");
				row.createCell(19).setCellValue("연면적_총계");
				row.createCell(20).setCellValue("연면적_보육실");
				row.createCell(21).setCellValue("연면적_목욕실");
				row.createCell(22).setCellValue("연면적_화장실");
				row.createCell(23).setCellValue("연면적_조리실");
				row.createCell(24).setCellValue("연면적_사무실");
				row.createCell(25).setCellValue("연면적_양호실");
				row.createCell(26).setCellValue("연면적_기타");
				row.createCell(27).setCellValue("연면적_실내놀이터");
				row.createCell(28).setCellValue("등록일");
				row.createCell(29).setCellValue("등록자");
				row.createCell(30).setCellValue("수정일");
				row.createCell(31).setCellValue("수정자");
				row.createCell(32).setCellValue("지역분류상세");
				row.createCell(33).setCellValue("AR_ABOVE_AT");
				
				for(int j=0; j< kvo.size(); j++){
					
					System.out.println("리스트 사이즈 ==== > " + kvo.size());
					
					KidsGroundFaciltyVO evo = kvo.get(j);
					row = sheet.createRow(j+1);
					row.createCell(0).setCellValue(evo.getFcltySn());
					row.createCell(1).setCellValue(evo.getFcltyNo());
					row.createCell(2).setCellValue(evo.getFcltyNm());
					row.createCell(3).setCellValue(evo.getAdres1());
					row.createCell(4).setCellValue(evo.getAdres2());
					row.createCell(5).setCellValue(evo.getInstlDt());
					row.createCell(6).setCellValue(evo.getPlcstra());
					row.createCell(7).setCellValue(evo.getOperSe());
					row.createCell(8).setCellValue(evo.getAreaCl());
					row.createCell(9).setCellValue(evo.getPublicSe());
					row.createCell(10).setCellValue(evo.getInoutSe());
					row.createCell(11).setCellValue(evo.getFcltySe());
					row.createCell(12).setCellValue(evo.getInstlYaar());
					row.createCell(13).setCellValue(evo.getSchulClsf());
					row.createCell(14).setCellValue(evo.getOfcdc());
					row.createCell(15).setCellValue(evo.getPcpskl());
					row.createCell(16).setCellValue(evo.getFondSe());
					row.createCell(17).setCellValue(evo.getSchulSttus());
					row.createCell(18).setCellValue(evo.getFcltyTy());
					row.createCell(19).setCellValue(evo.getArTotal());
					row.createCell(20).setCellValue(evo.getArNrtrRoom());
					row.createCell(21).setCellValue(evo.getArBathRoom());
					row.createCell(22).setCellValue(evo.getArToilet());
					row.createCell(23).setCellValue(evo.getArCookRoom());
					row.createCell(24).setCellValue(evo.getArOffm());
					row.createCell(25).setCellValue(evo.getArMdlrtRoom());
					row.createCell(26).setCellValue(evo.getArEtc());
					row.createCell(27).setCellValue(evo.getArPlyRoom());
					row.createCell(28).setCellValue(evo.getResistDt());
					row.createCell(29).setCellValue(evo.getResisterId());
					row.createCell(30).setCellValue(evo.getUpdtDt());
					row.createCell(31).setCellValue(evo.getUdptId());
					row.createCell(32).setCellValue(evo.getAreaDetailCl());
					row.createCell(33).setCellValue(evo.getArAboveAt());					
					
					System.out.println("j번째 ===> " + j);
					
					if(j == maxCnt) {
						System.out.println("삭제 시작");
						Class klass = kvo.getClass();
						Class[] paramTypes = { Integer.TYPE, Integer.TYPE };
						Method m = klass.getDeclaredMethod("removeRange", paramTypes);
						Object[] arguments = { new Integer(0), new Integer(maxCnt+1) };
						m.setAccessible(true);
						m.invoke(kvo, arguments);
						System.out.println("삭제 완료");
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
	
	@RequestMapping("/adm/contents/kidsGround/doOpenExcelUploadPopup.do")
	public String doOpenExcelUploadPopup(HttpServletRequest req, HttpServletResponse res, Model model)throws Exception{
		return "egovframework/com/adm/kidsGround/doOpenExcelUploadPopup";
	}
	
	@RequestMapping("/adm/contents/kidsGround/insertExcelFcltyData.do")
	@ResponseBody
	public String insertExcelFcltyData(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		
		System.out.println("체크 엑셀 업로드 1");
		
		String finalResult = "";
		
		File saveFile = null;
		
		//final Map<String, MultipartFile> files = req.getFileMap();
		
		MultipartRequest multipart = (MultipartRequest) req;
		System.out.println("체크 엑셀 업로드 2");
		MultipartFile file = multipart.getFile("excelData");
		Map<String, Object> retVal = new HashMap<String, Object>();
		//MultipartFile file = (MultipartFile) req;
		//MultipartFile file = req.getFile( "smsData" );
		
		
		if (file != null) {
			System.out.println("체크 엑셀 업로드 3");
			
			String extension = "";
			String stordFilePath = EgovProperties.getProperty("Globals.fileStorePath");
			String physixPath = "/excelUpload/";
			
			int index = file.getOriginalFilename().lastIndexOf(".");
			if(index > -1){
				extension = file.getOriginalFilename().substring(index);
			}
			
			System.out.println("확장자 ==>" + extension);
			
			File savePath = new File(stordFilePath+physixPath);
			if(savePath.exists() == false){
				savePath.mkdirs();
			}
			
			saveFile = new File(savePath.getAbsolutePath() + File.separator + this.getRandomString(20));
			file.transferTo(saveFile);
			
			
			List<KidsGroundFaciltyVO> datalist = new ArrayList<KidsGroundFaciltyVO>();
			
			
			if(".xls".equals(extension)){
				
				System.out.println("!!!!!!!!!!! 확장자가 xls 일때 !!!!!!!!!!");
				
				HSSFWorkbook workbook = null; // xls인경우
				HSSFSheet sheet = null;
				
				workbook = new HSSFWorkbook(new FileInputStream(saveFile));
				
				if(workbook != null){
					sheet = workbook.getSheetAt(0);
					if(sheet != null){
						int startRowIndex = 1;
						int lastRowIndex = sheet.getLastRowNum();
						
						System.out.println("********** lastRowIndex *************** =" + lastRowIndex);
						
						for (int rowIndex = startRowIndex; rowIndex <= lastRowIndex; rowIndex++) {
							HSSFRow row = sheet.getRow(rowIndex);
							String valueStr = "";
							KidsGroundFaciltyVO tempvo = new KidsGroundFaciltyVO();
							if (row != null) {								
								
								int lastCellIndex = row.getLastCellNum();
								
								for (int cellIndex = 0; cellIndex <= lastCellIndex; cellIndex++) {
									HSSFCell cell = row.getCell(cellIndex);
									if (cell != null) {
										switch(cell.getCellType()){
										case HSSFCell.CELL_TYPE_STRING :
											valueStr = cell.getStringCellValue();
											break;
										case HSSFCell.CELL_TYPE_NUMERIC : // 날짜 형식이든 숫자 형식이든 다 CELL_TYPE_NUMERIC으로 인식함.
											if(DateUtil.isCellDateFormatted(cell)){ // 날짜 유형의 데이터일 경우,
												SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
												String formattedStr = dateFormat.format(cell.getDateCellValue());
												valueStr = formattedStr;
												break;
											}else{ // 순수하게 숫자 데이터일 경우,
												Double numericCellValue = cell.getNumericCellValue();
												if(Math.floor(numericCellValue) == numericCellValue){ // 소수점 이하를 버린 값이 원래의 값과 같다면,,
													valueStr = numericCellValue.intValue() + ""; // int형으로 소수점 이하 버리고 String으로 데이터 담는다.
												}else{
													valueStr = numericCellValue + "";
												}
												break;
											}
										case HSSFCell.CELL_TYPE_BOOLEAN :
											valueStr = cell.getBooleanCellValue() + "";
											break;
										}
										
										switch (cellIndex) {
											case 0 : tempvo.setFcltySn(valueStr); // 담아줘야할 DTO 객체의 메서드 타입에 따라 String을 형변환 
											break;
											case 1 : tempvo.setFcltyNo(valueStr); break;
											case 2 : tempvo.setFcltyNm(valueStr); break;											
											case 3 : tempvo.setAdres1(valueStr); break;
											case 4 : tempvo.setAdres2(valueStr); break;
											case 5 : tempvo.setInstlDt(valueStr); break;
											case 6 : tempvo.setPlcstra(valueStr); break;
											case 7 : tempvo.setOperSe(valueStr);; break;
											case 8 : tempvo.setAreaCl(valueStr); break;
											case 9 : tempvo.setPublicSe(valueStr); break;
											case 10 : tempvo.setInoutSe(valueStr); break;
											case 11 : tempvo.setFcltySe(valueStr); break;
											case 12 : tempvo.setInstlYaar(valueStr); break;
											case 13 : tempvo.setSchulClsf(valueStr); break;
											case 14 : tempvo.setOfcdc(valueStr); break;
											case 15 : tempvo.setPcpskl(valueStr); break;
											case 16 : tempvo.setFondSe(valueStr); break;
											case 17 : tempvo.setSchulSttus(valueStr); break;
											case 18 : tempvo.setFcltyTy(valueStr); break;
											case 19 : tempvo.setArTotal(valueStr); break;
											case 20 : tempvo.setArNrtrRoom(valueStr); break;
											case 21 : tempvo.setArBathRoom(valueStr); break;
											case 22 : tempvo.setArToilet(valueStr); break;
											case 23 : tempvo.setArCookRoom(valueStr); break;
											case 24 : tempvo.setArOffm(valueStr); break;
											case 25 : tempvo.setArMdlrtRoom(valueStr); break;
											case 26 : tempvo.setArEtc(valueStr); break;
											case 27 : tempvo.setArPlyRoom(valueStr); break;
											case 28 : tempvo.setResistDt(valueStr); break;
											case 29 : tempvo.setResisterId(valueStr); break;
											case 30 : tempvo.setUpdtDt(valueStr); break;
											case 31 : tempvo.setUdptId(valueStr); break;
											case 32 : tempvo.setAreaDetailCl(valueStr); break;
											case 33 : tempvo.setArAboveAt(valueStr); break;											
											
										} // switch end
										
										
										
									}// if (cell != null) END
								}
								datalist.add(tempvo);
								
							}//if (row != null) End
						}// for Rowindex End
						
						//add 된 사이즈
						System.out.println("datalist.size =======>    "+ datalist.size());
						
					}
				}
				
				if(datalist.size()>0){
					finalResult = kidsGroundService.insertFcltyData(datalist);
				}
				
			}else if(".xlsx".equals(extension)){
				
				System.out.println("extension xlsx");
				
				XSSFWorkbook workbook = null;
				XSSFSheet sheet = null;
				
				workbook = new XSSFWorkbook(new FileInputStream(saveFile));
				
				if(workbook != null){
					sheet = workbook.getSheetAt(0);
					if(sheet != null){
						int startRowIndex = 1;
						int lastRowIndex = sheet.getLastRowNum();
						
						System.out.println("lastRowIndex=" + lastRowIndex);
						
						for (int rowIndex = startRowIndex; rowIndex <= lastRowIndex; rowIndex++) {
							XSSFRow row = sheet.getRow(rowIndex);
							String valueStr = "";
							KidsGroundFaciltyVO tempvo = new KidsGroundFaciltyVO();
							if (row != null) {
								
								
								int lastCellIndex = row.getLastCellNum();
								
								for (int cellIndex = 0; cellIndex <= lastCellIndex; cellIndex++) {
									XSSFCell cell = row.getCell(cellIndex);
									if (cell != null) {
										switch(cell.getCellType()){
										case HSSFCell.CELL_TYPE_STRING :
											valueStr = cell.getStringCellValue();
											break;
										case HSSFCell.CELL_TYPE_NUMERIC : // 날짜 형식이든 숫자 형식이든 다 CELL_TYPE_NUMERIC으로 인식함.
											if(DateUtil.isCellDateFormatted(cell)){ // 날짜 유형의 데이터일 경우,
												SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
												String formattedStr = dateFormat.format(cell.getDateCellValue());
												valueStr = formattedStr;
												break;
											}else{ // 순수하게 숫자 데이터일 경우,
												Double numericCellValue = cell.getNumericCellValue();
												if(Math.floor(numericCellValue) == numericCellValue){ // 소수점 이하를 버린 값이 원래의 값과 같다면,,
													valueStr = numericCellValue.intValue() + ""; // int형으로 소수점 이하 버리고 String으로 데이터 담는다.
												}else{
													valueStr = numericCellValue + "";
												}
												break;
											}
										case HSSFCell.CELL_TYPE_BOOLEAN :
											valueStr = cell.getBooleanCellValue() + "";
											break;
										}
										
										switch (cellIndex) {
											case 0 : tempvo.setFcltySn(valueStr); // 담아줘야할 DTO 객체의 메서드 타입에 따라 String을 형변환 
											break;
											case 1 : tempvo.setFcltyNo(valueStr); break;
											case 2 : tempvo.setFcltyNm(valueStr); break;											
											case 3 : tempvo.setAdres1(valueStr); break;
											case 4 : tempvo.setAdres2(valueStr); break;
											case 5 : tempvo.setInstlDt(valueStr); break;
											case 6 : tempvo.setPlcstra(valueStr); break;
											case 7 : tempvo.setOperSe(valueStr);; break;
											case 8 : tempvo.setAreaCl(valueStr); break;
											case 9 : tempvo.setPublicSe(valueStr); break;
											case 10 : tempvo.setInoutSe(valueStr); break;
											case 11 : tempvo.setFcltySe(valueStr); break;
											case 12 : tempvo.setInstlYaar(valueStr); break;
											case 13 : tempvo.setSchulClsf(valueStr); break;
											case 14 : tempvo.setOfcdc(valueStr); break;
											case 15 : tempvo.setPcpskl(valueStr); break;
											case 16 : tempvo.setFondSe(valueStr); break;
											case 17 : tempvo.setSchulSttus(valueStr); break;
											case 18 : tempvo.setFcltyTy(valueStr); break;
											case 19 : tempvo.setArTotal(valueStr); break;
											case 20 : tempvo.setArNrtrRoom(valueStr); break;
											case 21 : tempvo.setArBathRoom(valueStr); break;
											case 22 : tempvo.setArToilet(valueStr); break;
											case 23 : tempvo.setArCookRoom(valueStr); break;
											case 24 : tempvo.setArOffm(valueStr); break;
											case 25 : tempvo.setArMdlrtRoom(valueStr); break;
											case 26 : tempvo.setArEtc(valueStr); break;
											case 27 : tempvo.setArPlyRoom(valueStr); break;
											case 28 : tempvo.setResistDt(valueStr); break;
											case 29 : tempvo.setResisterId(valueStr); break;
											case 30 : tempvo.setUpdtDt(valueStr); break;
											case 31 : tempvo.setUdptId(valueStr); break;
											case 32 : tempvo.setAreaDetailCl(valueStr); break;
											case 33 : tempvo.setArAboveAt(valueStr); break;											
											
										} // switch end
									}
								}
								datalist.add(tempvo);
							}
						}
					}
				}
				if(datalist.size()>0){
					finalResult = kidsGroundService.insertFcltyData(datalist);
				}
			}
			
			saveFile.delete();
		}
		return finalResult;
	}
	
	@RequestMapping(value="/adm/contents/kidsGround/selectKidsGroundRelief.do")
	public String selectKidsGroundRelief(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("krvo") KidsGroundReliefVO krvo ) throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(krvo.getPageIndex());
		paginationInfo.setRecordCountPerPage(krvo.getPageUnit());		
		paginationInfo.setPageSize(krvo.getPageSize());
		
		krvo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		krvo.setLastIndex(paginationInfo.getLastRecordIndex());
		krvo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<KidsGroundFaciltyVO> kvo = kidsGroundService.selectKidsGroundRelief(krvo);
		model.addAttribute("kvoList", kvo);
		
		int totCnt = kidsGroundService.selectKidsGroundReliefCnt(krvo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "egovframework/com/adm/kidsGround/selectKidsGroundRelief";
	}
	
	@RequestMapping(value="/adm/contents/kidsGround/getSelectKidsGroundReliefExcel.do")
	public void getSelectKidsGroundReliefExcel(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("krvo") KidsGroundReliefVO krvo ) throws Exception{
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String getToday = formatter.format(calendar.getTime());
		
		String fileName = "환경안심인증현황_" + getToday + ".xls";
		String sheetName = "인즌현황";
		
		List<KidsGroundReliefVO> kvo = kidsGroundService.selectKidsGroundReliefExcel(krvo);
		
		int totCnt = kvo.size();
		int maxCnt = 65000;
		
		//System.out.println("totCnt 카운트 ===> " + totCnt);
		
		int sheetCnt = (int)(1+Math.ceil(totCnt/maxCnt));
		
		//System.out.println("sheet 카운트 ===> " + sheetCnt);
		
		
		
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
				row.createCell(0).setCellValue("인증결과순번");
				row.createCell(1).setCellValue("유예시설대상여부");
				row.createCell(2).setCellValue("적용년도");				
				row.createCell(3).setCellValue("인증번호");
				row.createCell(4).setCellValue("시설명");
				row.createCell(5).setCellValue("대표자");
				row.createCell(6).setCellValue("소재지");
				row.createCell(7).setCellValue("인증시작일");
				row.createCell(8).setCellValue("인증종료일");				
				row.createCell(9).setCellValue("설치일자");
				row.createCell(10).setCellValue("운영구분");
				row.createCell(11).setCellValue("지역분류");
				row.createCell(12).setCellValue("지역상세분류");
				row.createCell(13).setCellValue("시설유형");
				row.createCell(14).setCellValue("등록일");
				row.createCell(15).setCellValue("등록자");
				row.createCell(16).setCellValue("수정일");
				row.createCell(17).setCellValue("수정자");			
				
				for(int j=0; j< kvo.size(); j++){
					
					System.out.println("리스트 사이즈 ==== > " + kvo.size());
					
					KidsGroundReliefVO evo = kvo.get(j);
					row = sheet.createRow(j+1);
					row.createCell(0).setCellValue(evo.getCrtfcSn());
					row.createCell(1).setCellValue(evo.getPostpneAt());
					row.createCell(2).setCellValue(evo.getApplcYear());					
					row.createCell(3).setCellValue(evo.getCrtfcNo());
					row.createCell(4).setCellValue(evo.getFcltyNm());
					row.createCell(5).setCellValue(evo.getRprsntv());
					row.createCell(6).setCellValue(evo.getLocplc());
					row.createCell(7).setCellValue(evo.getCrtfcBgnde());
					row.createCell(8).setCellValue(evo.getCrtfcEndde());					
					row.createCell(9).setCellValue(evo.getInstlDt());
					row.createCell(10).setCellValue(evo.getOperSe());
					row.createCell(11).setCellValue(evo.getAreaCl());
					row.createCell(12).setCellValue(evo.getAreaDetailCl());
					row.createCell(13).setCellValue(evo.getFcltyTy());
					row.createCell(14).setCellValue(evo.getRegistDt());
					row.createCell(15).setCellValue(evo.getRegisterId());
					row.createCell(16).setCellValue(evo.getUpdtDt());
					row.createCell(17).setCellValue(evo.getUpdtId());										
					
					System.out.println("j번째 ===> " + j);
					
					if(j == maxCnt) {
						System.out.println("삭제 시작");
						Class klass = kvo.getClass();
						Class[] paramTypes = { Integer.TYPE, Integer.TYPE };
						Method m = klass.getDeclaredMethod("removeRange", paramTypes);
						Object[] arguments = { new Integer(0), new Integer(maxCnt+1) };
						m.setAccessible(true);
						m.invoke(kvo, arguments);
						System.out.println("삭제 완료");
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
	
	@RequestMapping("/adm/contents/kidsGround/doOpenExcelUploadReliefPopup.do")
	public String doOpenExcelUploadReliefPopup(HttpServletRequest req, HttpServletResponse res, Model model)throws Exception{
		return "egovframework/com/adm/kidsGround/doOpenExcelUploadReliefPopup";
	}
	
	@RequestMapping("/adm/contents/kidsGround/insertExcelReliefData.do")
	@ResponseBody
	public String insertExcelReliefData(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		
		System.out.println("체크 엑셀 업로드 1");
		
		String finalResult = "";
		
		File saveFile = null;
		
		//final Map<String, MultipartFile> files = req.getFileMap();
		
		MultipartRequest multipart = (MultipartRequest) req;
		System.out.println("체크 엑셀 업로드 2");
		MultipartFile file = multipart.getFile("excelData");
		Map<String, Object> retVal = new HashMap<String, Object>();
		//MultipartFile file = (MultipartFile) req;
		//MultipartFile file = req.getFile( "smsData" );
		
		
		if (file != null) {
			System.out.println("체크 엑셀 업로드 3");
			
			String extension = "";
			String stordFilePath = EgovProperties.getProperty("Globals.fileStorePath");
			String physixPath = "/excelUpload/";
			
			int index = file.getOriginalFilename().lastIndexOf(".");
			if(index > -1){
				extension = file.getOriginalFilename().substring(index);
			}
			
			System.out.println("확장자 ==>" + extension);
			
			File savePath = new File(stordFilePath+physixPath);
			if(savePath.exists() == false){
				savePath.mkdirs();
			}
			
			saveFile = new File(savePath.getAbsolutePath() + File.separator + this.getRandomString(20));
			file.transferTo(saveFile);
			
			
			List<KidsGroundReliefVO> datalist = new ArrayList<KidsGroundReliefVO>();
			
			
			if(".xls".equals(extension)){
				
				System.out.println("!!!!!!!!!!! 확장자가 xls 일때 !!!!!!!!!!");
				
				HSSFWorkbook workbook = null; // xls인경우
				HSSFSheet sheet = null;
				
				workbook = new HSSFWorkbook(new FileInputStream(saveFile));
				
				if(workbook != null){
					sheet = workbook.getSheetAt(0);
					if(sheet != null){
						int startRowIndex = 1;
						int lastRowIndex = sheet.getLastRowNum();
						
						System.out.println("********** lastRowIndex *************** =" + lastRowIndex);
						
						for (int rowIndex = startRowIndex; rowIndex <= lastRowIndex; rowIndex++) {
							HSSFRow row = sheet.getRow(rowIndex);
							String valueStr = "";
							KidsGroundReliefVO tempvo = new KidsGroundReliefVO();
							if (row != null) {								
								
								int lastCellIndex = row.getLastCellNum();
								
								for (int cellIndex = 0; cellIndex <= lastCellIndex; cellIndex++) {
									HSSFCell cell = row.getCell(cellIndex);
									if (cell != null) {
										switch(cell.getCellType()){
										case HSSFCell.CELL_TYPE_STRING :
											valueStr = cell.getStringCellValue();
											break;
										case HSSFCell.CELL_TYPE_NUMERIC : // 날짜 형식이든 숫자 형식이든 다 CELL_TYPE_NUMERIC으로 인식함.
											if(DateUtil.isCellDateFormatted(cell)){ // 날짜 유형의 데이터일 경우,
												SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
												String formattedStr = dateFormat.format(cell.getDateCellValue());
												valueStr = formattedStr;
												break;
											}else{ // 순수하게 숫자 데이터일 경우,
												Double numericCellValue = cell.getNumericCellValue();
												if(Math.floor(numericCellValue) == numericCellValue){ // 소수점 이하를 버린 값이 원래의 값과 같다면,,
													valueStr = numericCellValue.intValue() + ""; // int형으로 소수점 이하 버리고 String으로 데이터 담는다.
												}else{
													valueStr = numericCellValue + "";
												}
												break;
											}
										case HSSFCell.CELL_TYPE_BOOLEAN :
											valueStr = cell.getBooleanCellValue() + "";
											break;
										}
										
										switch (cellIndex) {
											case 0 :	tempvo.setCrtfcSn(valueStr);		break;
											case 1 :	tempvo.setPostpneAt(valueStr);		break;
											case 2 :	tempvo.setApplcYear(valueStr);		break;											
											case 3 :	tempvo.setCrtfcNo(valueStr);		break;
											case 4 :	tempvo.setFcltyNm(valueStr);		break;
											case 5 :	tempvo.setRprsntv(valueStr);		break;
											case 6 :	tempvo.setLocplc(valueStr);			break;
											case 7 :	tempvo.setCrtfcBgnde(valueStr);		break;
											case 8 :	tempvo.setCrtfcEndde(valueStr);		break;
											case 9 :	tempvo.setInstlDt(valueStr);		break;
											case 10 :	tempvo.setOperSe(valueStr);			break;
											case 11 :	tempvo.setAreaCl(valueStr);			break;
											case 12 :	tempvo.setAreaDetailCl(valueStr);	break;
											case 13 :	tempvo.setFcltyTy(valueStr);		break;
											case 14 :	tempvo.setRegistDt(valueStr);		break;
											case 15 :	tempvo.setRegisterId(valueStr);		break;
											case 16 :	tempvo.setUpdtDt(valueStr);			break;
											case 17 :	tempvo.setUpdtId(valueStr);			break;
																						
											
										} // switch end
										
										
										
									}// if (cell != null) END
								}
								datalist.add(tempvo);
								
							}//if (row != null) End
						}// for Rowindex End
						
						//add 된 사이즈
						System.out.println("datalist.size =======>    "+ datalist.size());
						
					}
				}
				
				if(datalist.size()>0){
					finalResult = kidsGroundService.insertFcltyReliefData(datalist);
				}
				
			}else if(".xlsx".equals(extension)){
				
				System.out.println("extension xlsx");
				
				XSSFWorkbook workbook = null;
				XSSFSheet sheet = null;
				
				workbook = new XSSFWorkbook(new FileInputStream(saveFile));
				
				if(workbook != null){
					sheet = workbook.getSheetAt(0);
					if(sheet != null){
						int startRowIndex = 1;
						int lastRowIndex = sheet.getLastRowNum();
						
						System.out.println("lastRowIndex=" + lastRowIndex);
						
						for (int rowIndex = startRowIndex; rowIndex <= lastRowIndex; rowIndex++) {
							XSSFRow row = sheet.getRow(rowIndex);
							String valueStr = "";
							KidsGroundReliefVO tempvo = new KidsGroundReliefVO();
							if (row != null) {
								
								
								int lastCellIndex = row.getLastCellNum();
								
								for (int cellIndex = 0; cellIndex <= lastCellIndex; cellIndex++) {
									XSSFCell cell = row.getCell(cellIndex);
									if (cell != null) {
										switch(cell.getCellType()){
										case HSSFCell.CELL_TYPE_STRING :
											valueStr = cell.getStringCellValue();
											break;
										case HSSFCell.CELL_TYPE_NUMERIC : // 날짜 형식이든 숫자 형식이든 다 CELL_TYPE_NUMERIC으로 인식함.
											if(DateUtil.isCellDateFormatted(cell)){ // 날짜 유형의 데이터일 경우,
												SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
												String formattedStr = dateFormat.format(cell.getDateCellValue());
												valueStr = formattedStr;
												break;
											}else{ // 순수하게 숫자 데이터일 경우,
												Double numericCellValue = cell.getNumericCellValue();
												if(Math.floor(numericCellValue) == numericCellValue){ // 소수점 이하를 버린 값이 원래의 값과 같다면,,
													valueStr = numericCellValue.intValue() + ""; // int형으로 소수점 이하 버리고 String으로 데이터 담는다.
												}else{
													valueStr = numericCellValue + "";
												}
												break;
											}
										case HSSFCell.CELL_TYPE_BOOLEAN :
											valueStr = cell.getBooleanCellValue() + "";
											break;
										}
										
										switch (cellIndex) {
										case 0 :	tempvo.setCrtfcSn(valueStr);		break;
										case 1 :	tempvo.setPostpneAt(valueStr);		break;
										case 2 :	tempvo.setApplcYear(valueStr);		break;											
										case 3 :	tempvo.setCrtfcNo(valueStr);		break;
										case 4 :	tempvo.setFcltyNm(valueStr);		break;
										case 5 :	tempvo.setRprsntv(valueStr);		break;
										case 6 :	tempvo.setLocplc(valueStr);			break;
										case 7 :	tempvo.setCrtfcBgnde(valueStr);		break;
										case 8 :	tempvo.setCrtfcEndde(valueStr);		break;
										case 9 :	tempvo.setInstlDt(valueStr);		break;
										case 10 :	tempvo.setOperSe(valueStr);			break;
										case 11 :	tempvo.setAreaCl(valueStr);			break;
										case 12 :	tempvo.setAreaDetailCl(valueStr);	break;
										case 13 :	tempvo.setFcltyTy(valueStr);		break;
										case 14 :	tempvo.setRegistDt(valueStr);		break;
										case 15 :	tempvo.setRegisterId(valueStr);		break;
										case 16 :	tempvo.setUpdtDt(valueStr);			break;
										case 17 :	tempvo.setUpdtId(valueStr);			break;
											
										} // switch end
									}
								}
								datalist.add(tempvo);
							}
						}
					}
				}
				if(datalist.size()>0){
					finalResult = kidsGroundService.insertFcltyReliefData(datalist);
				}
			}
			
			saveFile.delete();
		}
		return finalResult;
	}
	
	@RequestMapping(value="/adm/contents/kidsGround/detailKidsGroundRelief.do")
	public String detailKidsGroundRelief(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("krvo") KidsGroundReliefVO krvo ) throws Exception{
		
		KidsGroundReliefVO detail = kidsGroundService.detailKidsGroundRelief(krvo);
		model.addAttribute("detail", detail);
		
		return "egovframework/com/adm/kidsGround/detailKidsGroundRelief";
	}
	
	
	public String getRandomString(int length)
    {
        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        String ret = "";
        for(int i = 0; i < length; i++)
            ret = (new StringBuilder(String.valueOf(ret))).append(chars.charAt((int)(Math.random() * 100D) % chars.length())).toString();

        return ret;
    }
	
}
