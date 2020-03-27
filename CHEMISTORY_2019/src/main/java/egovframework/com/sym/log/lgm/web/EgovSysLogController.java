package egovframework.com.sym.log.lgm.web;

import java.util.HashMap;
import java.util.List;
import java.lang.reflect.Method;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.Calendar;

import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.sym.log.lgm.service.EgovSysLogService;
import egovframework.com.sym.log.lgm.service.SysLog;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : EgovSysLogController.java
 * @Description : 시스템 로그정보를 관리하기 위한 컨트롤러 클래스
 * @Modification Information
 *
 *    수정일        수정자         수정내용
 *    -------       -------     -------------------
 *    2009. 3. 11.  이삼섭         최초생성
 *    2011. 7. 01.  이기하         패키지 분리(sym.log -> sym.log.lgm)
 *    2011.8.26	정진오			IncludedInfo annotation 추가
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 3. 11.
 * @version
 * @see
 *
 */

@Controller
public class EgovSysLogController {

	@Resource(name="EgovSysLogService")
	private EgovSysLogService sysLogService;

	@Resource(name="propertiesService")
	protected EgovPropertyService propertyService;

	/**
	 * 시스템 로그 목록 조회
	 *
	 * @param sysLog
	 * @return sym/log/lgm/EgovSysLogList
	 * @throws Exception
	 */
	@IncludedInfo(name="로그관리", listUrl="/sym/log/lgm/SelectSysLogList.do", order = 1030 ,gid = 60)
	@RequestMapping(value="/sym/log/lgm/SelectSysLogList.do")
	public String selectSysLogInf(@ModelAttribute("searchVO") SysLog sysLog,
			ModelMap model) throws Exception{

		sysLog.setPageUnit(propertyService.getInt("pageUnit"));
		sysLog.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(sysLog.getPageIndex());
		paginationInfo.setRecordCountPerPage(sysLog.getPageUnit());
		paginationInfo.setPageSize(sysLog.getPageSize());

		sysLog.setFirstIndex(paginationInfo.getFirstRecordIndex());
		sysLog.setLastIndex(paginationInfo.getLastRecordIndex());
		sysLog.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		HashMap _map = (HashMap)sysLogService.selectSysLogInf(sysLog);
		int totCnt = Integer.parseInt((String)_map.get("resultCnt"));

		model.addAttribute("resultList", _map.get("resultList"));
		model.addAttribute("resultCnt", _map.get("resultCnt"));
		model.addAttribute("frm", sysLog);

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/sym/log/lgm/EgovSysLogList";
	}
	
	/**
	 * 시스템 로그 엑셀다운로드
	 *
	 * @param sysLog
	 * @return /sym/log/lgm/SelectSysLogList
	 * @throws Exception
	 */
	@RequestMapping(value="/sym/log/lgm/getSelectSysLogExcel.do")
	public void getSelectSysLogExcel(HttpServletRequest req, HttpServletResponse res, Model model,
			@ModelAttribute("searchVO") SysLog sysLog ) throws Exception 
	{
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String getToday = formatter.format(calendar.getTime());
		
		String fileName = "개인정보조회 로그" + getToday + ".xls";
		String sheetName = "개인정보조회 로그";
		
		List<SysLog> sysLogList = sysLogService.selectSysLogExcelList(sysLog);
		
		int totCnt = sysLogList.size();
		int maxCnt = 65000;
				
		
		int sheetCnt = (int)(1+Math.ceil(totCnt/maxCnt));
		
		
		
		
		
		if(sysLogList != null){
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
				row.createCell(0).setCellValue("번호");			
				row.createCell(1).setCellValue("발생일자");
				row.createCell(2).setCellValue("메뉴경로");
				row.createCell(3).setCellValue("처리구분");
				row.createCell(4).setCellValue("요청자ID");
				row.createCell(5).setCellValue("요청자이름");
				row.createCell(6).setCellValue("아이피");				
				
				for(int j=0; j< sysLogList.size(); j++){
														
					SysLog evo = sysLogList.get(j);
					row = sheet.createRow(j+1);
					row.createCell(0).setCellValue(j+1);
					row.createCell(1).setCellValue(evo.getOccrrncDe());
					row.createCell(2).setCellValue(evo.getMenuNm());
					row.createCell(3).setCellValue(evo.getProcessSeCodeNm());
					row.createCell(4).setCellValue(evo.getRqesterId());
					row.createCell(5).setCellValue(evo.getRqsterNm());
					row.createCell(6).setCellValue(evo.getRqesterIp());
										
					
					if(j == maxCnt) {
						System.out.println("삭제 시작");
						Class klass = sysLogList.getClass();
						Class[] paramTypes = { Integer.TYPE, Integer.TYPE };
						Method m = klass.getDeclaredMethod("removeRange", paramTypes);
						Object[] arguments = { new Integer(0), new Integer(maxCnt+1) };
						m.setAccessible(true);
						m.invoke(sysLogList, arguments);
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
	
	

	/**
	 * 시스템 로그 상세 조회
	 *
	 * @param sysLog
	 * @param model
	 * @return sym/log/lgm/EgovSysLogInqire
	 * @throws Exception
	 */
	@RequestMapping(value="/sym/log/lgm/InqireSysLog.do")
	public String selectSysLog(@ModelAttribute("searchVO") SysLog sysLog,
			@RequestParam("requstId") String requstId,
			ModelMap model) throws Exception{

		sysLog.setRequstId(requstId.trim());

		SysLog vo = sysLogService.selectSysLog(sysLog);
		model.addAttribute("result", vo);
		return "egovframework/com/sym/log/lgm/EgovSysLogInqire";
	}

}
