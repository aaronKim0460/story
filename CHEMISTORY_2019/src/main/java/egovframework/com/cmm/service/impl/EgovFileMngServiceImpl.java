package egovframework.com.cmm.service.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.compress.archivers.zip.ZipArchiveEntry; 
import org.apache.commons.compress.archivers.zip.ZipArchiveInputStream; 
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream; 
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.sts.bst.service.EgovBbsStatsService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @Class Name : EgovFileMngServiceImpl.java
 * @Description : 파일정보의 관리를 위한 구현 클래스
 * @Modification Information
 *
 *    수정일       수정자         수정내용
 *    -------        -------     -------------------
 *    2009. 3. 25.     이삼섭    최초생성
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 3. 25.
 * @version
 * @see
 *
 */
@Service("EgovFileMngService")
public class EgovFileMngServiceImpl extends AbstractServiceImpl implements EgovFileMngService {

    @Resource(name = "FileManageDAO")
    private FileManageDAO fileMngDAO;
    
    /** EgovBbsStatsService */
	@Resource(name = "bbsStatsService")
    private EgovBbsStatsService bbsStatsService;

    public static final Logger LOGGER = Logger.getLogger(EgovFileMngServiceImpl.class.getName());

    /**
     * 여러 개의 파일을 삭제한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#deleteFileInfs(java.util.List)
     */
    @SuppressWarnings("unchecked")
    public void deleteFileInfs(List fvoList) throws Exception {
	fileMngDAO.deleteFileInfs(fvoList);
    }

    /**
     * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#insertFileInf(egovframework.com.cmm.service.FileVO)
     */
    public String insertFileInf(FileVO fvo) throws Exception {
	String atchFileId = fvo.getAtchFileId();
	
	fileMngDAO.insertFileInf(fvo);
	
	return atchFileId;
    }

    /**
     * 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#insertFileInfs(java.util.List)
     */
    @SuppressWarnings("unchecked")
    public String insertFileInfs(List fvoList) throws Exception {
	String atchFileId = "";
		
	if (fvoList.size() != 0) {
	    atchFileId = fileMngDAO.insertFileInfs(fvoList);
	}
	if(atchFileId == ""){
		atchFileId = null;
	}
	return atchFileId;
    }

    /**
     * 파일에 대한 목록을 조회한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#selectFileInfs(egovframework.com.cmm.service.FileVO)
     */
    public List<FileVO> selectFileInfs(FileVO fvo) throws Exception {
	return fileMngDAO.selectFileInfs(fvo);
    }

    /**
     * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#updateFileInfs(java.util.List)
     */
    @SuppressWarnings("unchecked")
    public void updateFileInfs(List fvoList) throws Exception {
	//Delete & Insert
	fileMngDAO.updateFileInfs(fvoList);
    }

    /**
     * 하나의 파일을 삭제한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#deleteFileInf(egovframework.com.cmm.service.FileVO)
     */
    public void deleteFileInf(FileVO fvo) throws Exception {
	fileMngDAO.deleteFileInf(fvo);
    }
    
    /**
     * 하나의 파일 삭제시 파일이 없으면 게시판 파일 아이디를 삭제한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#deleteFileInf(egovframework.com.cmm.service.FileVO)
     */
    public void updateBBSFileInf(FileVO fvo) throws Exception {
	fileMngDAO.updateBBSFileInf(fvo);
    }

    /**
     * 파일에 대한 상세정보를 조회한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#selectFileInf(egovframework.com.cmm.service.FileVO)
     */
    public FileVO selectFileInf(FileVO fvo) throws Exception {
	return fileMngDAO.selectFileInf(fvo);
    }

    /**
     * 파일 구분자에 대한 최대값을 구한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#getMaxFileSN(egovframework.com.cmm.service.FileVO)
     */
    public int getMaxFileSN(FileVO fvo) throws Exception {
	return fileMngDAO.getMaxFileSN(fvo);
    }

    /**
     * 전체 파일을 삭제한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#deleteAllFileInf(egovframework.com.cmm.service.FileVO)
     */
    public void deleteAllFileInf(FileVO fvo) throws Exception {
	fileMngDAO.deleteAllFileInf(fvo);
    }

    /**
     * 파일명 검색에 대한 목록을 조회한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#selectFileListByFileNm(egovframework.com.cmm.service.FileVO)
     */
    public Map<String, Object> selectFileListByFileNm(FileVO fvo) throws Exception {
	List<FileVO>  result = fileMngDAO.selectFileListByFileNm(fvo);
	int cnt = fileMngDAO.selectFileListCntByFileNm(fvo);

	Map<String, Object> map = new HashMap<String, Object>();
	
	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 이미지 파일에 대한 목록을 조회한다.
     * 
     * @see egovframework.com.cmm.service.EgovFileMngService#selectImageFileList(egovframework.com.cmm.service.FileVO)
     */
    public List<FileVO> selectImageFileList(FileVO vo) throws Exception {
	return fileMngDAO.selectImageFileList(vo);
    }
    
    public int selectBBSFileIdCount(FileVO fvo) throws Exception{
    	return fileMngDAO.selectBBSFileIdCount(fvo);	
    }
    
    /* (non-Javadoc)
     * @see egovframework.com.cmm.service.EgovFileMngService#zipFileDown(java.util.Map, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    public void zipFileDown(Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	
    	Boolean fileUseFlag = true; // zip 파일 생성 여부 
    	String atchFileId = (String)commandMap.get("atchFileId");
    	
    	// 파일 정보
    	List<EgovMap> fileList = fileMngDAO.selectFileList(atchFileId);
    	
    	if(fileList != null && !fileList.isEmpty()){
    		
    		try{
    			
    			// 압축파일 정보 설정
	    		String zipFilePath = fileList.get(0).get("fileStreCours") + "";
	    		String zipFileName = System.currentTimeMillis() + ".zip";
	    		String downFileName = fileList.get(0).get("orignlFileNm") + ".zip"; 
    			
    			// 첨부파일이 1개인 경우 압축하지 않음
	    		if(fileList.size() == 1){
    				
    				zipFileName = fileList.get(0).get("streFileNm") + "";
    				downFileName = fileList.get(0).get("orignlFileNm") + "";
    				
    			}else{
    				
    	    		Boolean fileAddFlag = false; // zip파일에 파일이 추가되었는지 여부
    	    		byte[] buf = new byte[1024];
    	    		//ZipOutputStream zFile = new ZipOutputStream(new FileOutputStream(zipFilePath + zipFileName)); // zip 파일 생성
    	    		//System.out.println("zipFilePath: " + zipFilePath);
    	    		//System.out.println("zipFileName: " + zipFileName);
    	    		ZipArchiveOutputStream zFile = new ZipArchiveOutputStream(new FileOutputStream(zipFilePath + zipFileName)); // zip 파일 생성
    	    		zFile.setEncoding("EUC-KR");
    	    		FileInputStream in = null;
    	    				
    				try{
	    	    		
	    	    		for(int i=0; i<fileList.size(); i++){
	    	    			
	    	    			// 원본 파일 확인
	    	    			File nFile = new File(fileList.get(i).get("fileStreCours") + "", fileList.get(i).get("streFileNm")+"");
	    	    			
	    	    			if(nFile.isFile()) {
		    	    			// 파일 다운 통계 입력
		    	    			bbsStatsService.bbsAtchFileStats(atchFileId, fileList.get(i).get("fileSn")+"");
		    	    			
		    	    			ZipArchiveEntry ze = new ZipArchiveEntry(fileList.get(i).get("orignlFileNm")+"");
		    	                zFile.putArchiveEntry(ze);
		    	                in = new FileInputStream(fileList.get(i).get("fileStreCours") + "" + fileList.get(i).get("streFileNm"));
		    	                int len;
		    	                while((len = in.read(buf)) > 0){
		    	                	zFile.write(buf, 0, len);
		    	                }
		    	                
		    	                fileAddFlag = true;
	    	    			}
	    	    			
	    	    		}

	    	    		zFile.closeArchiveEntry();
    				}catch(Exception e){
    					System.out.println("예외발생 : zipFileDown" );
    				}finally{
    					EgovResourceCloseHelper.close(in, zFile);    					
    				}
    			}
    		
	    		// 생성된 zip 파일 전송
	    		File uFile = new File(zipFilePath, zipFileName);
	    		int fSize = (int)uFile.length();
	    		
	    		System.out.println("uFile.isFile():"+uFile.isFile());
	    		System.out.println("fileList.size():"+fileList.size());
	    		System.out.println("zipFileName:"+zipFileName);
	    		System.out.println("zipFileName indexOf :"+zipFileName.indexOf(".zip"));
	    		
	    		if(uFile.isFile() && fSize > 0){
	    			
	    			String mimetype = "application/x-msdownload";
	    			
	    			response.setContentType(mimetype);
	    			setDisposition(downFileName, request, response);
	    			response.setContentLength(fSize);
	    			
	    			BufferedInputStream in = null;
	    			BufferedOutputStream out = null;
	    			
	    			try {
	    				in = new BufferedInputStream(new FileInputStream(uFile));
	    				out = new BufferedOutputStream(response.getOutputStream());
	    				
	    				FileCopyUtils.copy(in, out);
	    					    				
	    				if(zipFileName.indexOf(".zip")>0){
	    					uFile.delete();
	    				}
	    			} finally {
	    				EgovResourceCloseHelper.close(in, out);
	    				
	    				if(zipFileName.indexOf(".zip")>0){
	    					uFile.delete();
	    				}
	    			}
	    			
	    		}else{
	    			
	    			fileUseFlag = false;
	    		}
    		}catch(Exception e){
    			System.out.println("예외발생");
    			fileUseFlag = false;
    		}
    	}else{
    		fileUseFlag = false;
    	}
    	
    	// 파일 생성 실패
    	if(!fileUseFlag){
    		
    		response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<head>");
			printwriter.println("<script>");
			String errMsg = "요청 파일이 존재하지 않습니다.";
			printwriter.println("alert('"+errMsg+"');");
			printwriter.println("</script>");
			printwriter.println("</head>");
			printwriter.println("<body></body>");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
    	}
    }
    
    /**
     * Disposition 지정하기.
     * 
     * @param filename
     * @param request
     * @param response
     * @throws Exception
     */
    private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);
		
		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;
		
		if ("MSIE".equals(browser)) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if ("Trident".equals(browser)) {		// IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if ("Firefox".equals(browser)) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if ("Opera".equals(browser)) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if ("Chrome".equals(browser)) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString().replaceAll(",", "");
		} else {
			throw new IOException("Not supported browser");
		}
		
		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)){
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
    }
    
    /**
     * 브라우저 구분 얻기.
     * 
     * @param request
     * @return
     */
    private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Trident") > -1) {	// IE11 문자열 깨짐 방지
            return "Trident";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        return "Firefox";
    }
    
    @Override
    public void deleteBBSThumbFile(FileVO vo) throws Exception {
    	// 1.파일정보를 삭제한다. - 데이터 복원을 위해 삭제를 하지 않는것으로 변경 2016.11.04 이한구
//    	fileMngDAO.deleteFileInf(vo);
    	
    	// 2. 게시판의 썸네일파일아이디를 삭제한다.
    	fileMngDAO.updateBBSFileDetailForThumbFileId(vo);
    }
    
    
}
