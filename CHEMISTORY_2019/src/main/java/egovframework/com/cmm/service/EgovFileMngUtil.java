package egovframework.com.cmm.service;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.channels.FileChannel;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.Errors;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


/**
 * @Class Name  : EgovFileMngUtil.java
 * @Description : 메시지 처리 관련 유틸리티
 * @Modification Information
 *
 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2009.02.13       이삼섭                  최초 생성
 *   2011.08.09       서준식                  utl.fcc패키지와 Dependency제거를 위해 getTimeStamp()메서드 추가
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 02. 13
 * @version 1.0
 * @see
 *
 */
@Component("EgovFileMngUtil")
public class EgovFileMngUtil {

    public static final int BUFF_SIZE = 2048;

    //프로퍼티값 로드시 에러발생하면 반환되는 에러문자열
  	public static final String ERR_CODE =" EXCEPTION OCCURRED";
  	public static final String ERR_CODE_FNFE =" EXCEPTION(FNFE) OCCURRED";
  	public static final String ERR_CODE_IOE =" EXCEPTION(IOE) OCCURRED";

    @Resource(name = "egovFileIdGnrService")
    private EgovIdGnrService idgenService;

    private static final Logger LOG = Logger.getLogger(EgovFileMngUtil.class.getName());

    /**
     * 첨부파일에 대한 목록 정보를 취득한다.
     *
     * @param files
     * @return
     * @throws Exception
     */
    public List<FileVO> parseFileInf(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String storePath, FileVO thumbInfo) throws Exception {
	int fileKey = fileKeyParam;

	String storePathString = "";
	String atchFileIdString = "";

	if ("".equals(storePath) || storePath == null) {
	    storePathString = EgovProperties.getProperty("Globals.fileStorePath");
	} else {
	    storePathString = EgovProperties.getProperty(storePath);
	}

	if ("".equals(atchFileId) || atchFileId == null) {
	    atchFileIdString = idgenService.getNextStringId();
	} else {
	    atchFileIdString = atchFileId;
	}

	storePathString = storePathString.replaceAll("\\\\.","");
	storePathString = storePathString.replaceAll("&","");
	
	File saveFolder = new File(EgovWebUtil.filePathBlackList(storePathString));
	// 수정 : 권한 설정
	saveFolder.setExecutable(true, true);
	saveFolder.setReadable(true);
	saveFolder.setWritable(true, true);
		
	if (!saveFolder.exists() || saveFolder.isFile()) {
	    saveFolder.mkdirs();
	}

	Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
	MultipartFile file;
	String filePath = "";
	List<FileVO> result  = new ArrayList<FileVO>();
	FileVO fvo;

	while (itr.hasNext()) {
	    Entry<String, MultipartFile> entry = itr.next();

	    file = entry.getValue();
	    String orginFileName = file.getOriginalFilename();

	    //--------------------------------------
	    // 원 파일명이 없는 경우 처리
	    // (첨부가 되지 않은 input file type)
	    //--------------------------------------
	    if ("".equals(orginFileName)) {
		continue;
	    }
	    ////------------------------------------

	    int index = orginFileName.lastIndexOf(".");
	    //String fileName = orginFileName.substring(0, index);
	    String fileExt = orginFileName.substring(index + 1);
	    String newName = KeyStr + getTimeStamp() + fileKey;
	    newName = newName.replaceAll("/","");
	    newName = newName.replaceAll("\\\\.","");
	    newName = newName.replaceAll("&","");
	    
	    long _size = file.getSize();

	    if (!"".equals(orginFileName)) {
		filePath = storePathString + File.separator + newName;
		file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
		
		// thumb파일 생성
		if (thumbInfo.getThumbnailYn() != null && "Y".equals(thumbInfo.getThumbnailYn())) {
			if ("jpg".equals(fileExt) || "gif".equals(fileExt) || "png".equals(fileExt) || "jpeg".equals(fileExt)) {
				String thumbPath = filePath + "_thumb";
				resizeImageJpg(filePath, thumbPath, thumbInfo);
			}
		}
	    }
	    fvo = new FileVO();
	    fvo.setFileExtsn(fileExt);
	    fvo.setFileStreCours(storePathString);
	    fvo.setFileMg(Long.toString(_size));
	    fvo.setOrignlFileNm(orginFileName);
	    fvo.setStreFileNm(newName);
	    fvo.setAtchFileId(atchFileIdString);
	    fvo.setFileSn(String.valueOf(fileKey));

	    //writeFile(file, newName, storePathString);
	    result.add(fvo);

	    fileKey++;
	}

	return result;
    }

    /**
	 * 첨부파일을 서버에 저장한다.
	 *
	 * @param file
	 * @param newName
	 * @param stordFilePath
	 * @throws Exception
	 */
	protected void writeUploadedFile(MultipartFile file, String newName, String stordFilePath) throws Exception {
		InputStream stream = null;
		OutputStream bos = null;

		try {
			stream = file.getInputStream();
			File cFile = new File(stordFilePath);

			if (!cFile.isDirectory()) {
				boolean _flag = cFile.mkdir();
				if (!_flag) {
					throw new IOException("Directory creation Failed ");
				}
			}

			bos = new FileOutputStream(stordFilePath + File.separator + newName);

			int bytesRead = 0;
			byte[] buffer = new byte[BUFF_SIZE];

			while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) {
				bos.write(buffer, 0, bytesRead);
			}
		} finally {
			EgovResourceCloseHelper.close(bos, stream);
		}
	}

    /**
     * 서버의 파일을 다운로드한다.
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public static void downFile(HttpServletRequest request, HttpServletResponse response) throws Exception {

    	String downFileName = "";
		String orgFileName = "";
	
		if ((String)request.getAttribute("downFile") == null) {
		    downFileName = "";
		} else {
		    downFileName = (String)request.getAttribute("downFile");
		}
	
		if ((String)request.getAttribute("orgFileName") == null) {
		    orgFileName = "";
		} else {
		    orgFileName = (String)request.getAttribute("orginFile");
		}
	
		orgFileName = orgFileName.replaceAll("\r", "").replaceAll("\n", "");
	
		File file = new File(EgovWebUtil.filePathBlackList(downFileName));
	
		if (!file.exists()) {
		    throw new FileNotFoundException(downFileName);
		}
	
		if (!file.isFile()) {
		    throw new FileNotFoundException(downFileName);
		}
	
		byte[] buffer = new byte[BUFF_SIZE]; //buffer size 2K.
	
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-Disposition:", "attachment; filename=" + new String(orgFileName.getBytes(), "UTF-8"));
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
	
		BufferedInputStream fin = null;
		BufferedOutputStream outs = null;
	
		try {
			fin = new BufferedInputStream(new FileInputStream(file));
			outs = new BufferedOutputStream(response.getOutputStream());
			int read = 0;
	
			while ((read = fin.read(buffer)) != -1) {
				outs.write(buffer, 0, read);
			}
		} finally {
			EgovResourceCloseHelper.close(outs, fin);
		}
    }

    /**
     * 첨부로 등록된 파일을 서버에 업로드한다.
     *
     * @param file
     * @return
     * @throws Exception
     */
    public static HashMap<String, String> uploadFile(MultipartFile file) throws Exception {

	HashMap<String, String> map = new HashMap<String, String>();
	//Write File 이후 Move File????
	String newName = "";
	String stordFilePath = EgovProperties.getProperty("Globals.fileStorePath");
	String orginFileName = file.getOriginalFilename();

	int index = orginFileName.lastIndexOf(".");
	//String fileName = orginFileName.substring(0, _index);
	String fileExt = orginFileName.substring(index + 1);
	long size = file.getSize();

	//newName 은 Naming Convention에 의해서 생성
	newName = getTimeStamp();	// 2012.11 KISA 보안조치
	writeFile(file, newName, stordFilePath);
	//storedFilePath는 지정
	map.put(Globals.ORIGIN_FILE_NM, orginFileName);
	map.put(Globals.UPLOAD_FILE_NM, newName);
	map.put(Globals.FILE_EXT, fileExt);
	map.put(Globals.FILE_PATH, stordFilePath);
	map.put(Globals.FILE_SIZE, String.valueOf(size));

	return map;
    }

    /**
	 * 파일을 실제 물리적인 경로에 생성한다.
	 *
	 * @param file
	 * @param newName
	 * @param stordFilePath
	 * @throws Exception
	 */
	protected static void writeFile(MultipartFile file, String newName, String stordFilePath) throws Exception {
		InputStream stream = null;
		OutputStream bos = null;

		try {
			stream = file.getInputStream();
			File cFile = new File(EgovWebUtil.filePathBlackList(stordFilePath));

			if (!cFile.isDirectory())
				cFile.mkdir();

			bos = new FileOutputStream(EgovWebUtil.filePathBlackList(stordFilePath + File.separator + newName));

			int bytesRead = 0;
			byte[] buffer = new byte[BUFF_SIZE];

			while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) {
				bos.write(buffer, 0, bytesRead);
			}
		} finally {
			EgovResourceCloseHelper.close(bos, stream);
		}
	}

    /**
     * 서버 파일에 대하여 다운로드를 처리한다.
     *
     * @param response
     * @param streFileNm
     *            : 파일저장 경로가 포함된 형태
     * @param orignFileNm
     * @throws Exception
     */
    public void downFile(HttpServletResponse response, String streFileNm, String orignFileNm) throws Exception {
		String downFileName = streFileNm;
		String orgFileName = orignFileNm;
	
		File file = new File(downFileName);
		//log.debug(this.getClass().getName()+" downFile downFileName "+downFileName);
		//log.debug(this.getClass().getName()+" downFile orgFileName "+orgFileName);
	
		if (!file.exists()) {
		    throw new FileNotFoundException(downFileName);
		}
	
		if (!file.isFile()) {
		    throw new FileNotFoundException(downFileName);
		}
	
		//byte[] b = new byte[BUFF_SIZE]; //buffer size 2K.
		int fSize = (int)file.length();
		if (fSize > 0) {
		    BufferedInputStream in = null;
	
		    try {
			in = new BufferedInputStream(new FileInputStream(file));
	
	    	    	String mimetype = "text/html"; //"application/x-msdownload"
	
	    	    	response.setBufferSize(fSize);
			response.setContentType(mimetype);
			response.setHeader("Content-Disposition:", "attachment; filename=" + orgFileName);
			response.setContentLength(fSize);
			//response.setHeader("Content-Transfer-Encoding","binary");
			//response.setHeader("Pragma","no-cache");
			//response.setHeader("Expires","0");
			FileCopyUtils.copy(in, response.getOutputStream());
		    } finally {
				EgovResourceCloseHelper.close(in);
			}
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
		}
	}

    /**
	 * 공통 컴포넌트 utl.fcc 패키지와 Dependency제거를 위해 내부 메서드로 추가 정의함
	 * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서17자리의TIMESTAMP값을 구하는 기능
	 *
	 * @param
	 * @return Timestamp 값
	 * @see
	 */
	private static String getTimeStamp() {

		String rtnStr = null;

		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";

		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		rtnStr = sdfCurrent.format(ts.getTime());

		return rtnStr;
	}
    
    
    public List<FileVO> parseFileInfNier(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String storePath, String storeType, FileVO thumbInfo) throws Exception {
    	int fileKey = fileKeyParam;
    	String storePathString = "";
    	String atchFileIdString = "";

    	if ("".equals(storePath) || storePath == null) {
    	    storePathString = EgovProperties.getProperty("Globals.fileStorePath");
    	} else {
    	    storePathString = EgovProperties.getProperty(storePath);
    	}

    	storePathString += atchFileId + storeType +"/";
    	
    	if ("".equals(atchFileId) || atchFileId == null) {
    	    atchFileIdString = idgenService.getNextStringId();
    	} else {
    	    atchFileIdString = atchFileId;
    	}

    	storePathString = storePathString.replaceAll("\\\\.","");
    	storePathString = storePathString.replaceAll("&","");
    	
    	File saveFolder = new File(EgovWebUtil.filePathBlackList(storePathString));
    	// 수정 : 권한 설정
    	saveFolder.setReadable(true);//읽기
    	saveFolder.setWritable(true, true);//쓰기 - (false, true) 면 파일 업로드 시 사용자 쓰기 권한 떨어짐
    	saveFolder.setExecutable(true, true);//실행 - (false, true) 면 파일 업로드 시 사용자 실행 권한 떨어짐
    	
    	if (!saveFolder.exists() || saveFolder.isFile()) {
    	    saveFolder.mkdirs();
    	}

    	Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
    	MultipartFile file;
    	String filePath = "";
    	List<FileVO> result  = new ArrayList<FileVO>();
    	FileVO fvo;

    	while (itr.hasNext()) {
    	    Entry<String, MultipartFile> entry = itr.next();

    	    file = entry.getValue();
    	    String orginFileName = file.getOriginalFilename();

    	    //--------------------------------------
    	    // 원 파일명이 없는 경우 처리
    	    // (첨부가 되지 않은 input file type)
    	    //--------------------------------------
    	    if ("".equals(orginFileName)) {
    		continue;
    	    }
    	    ////------------------------------------
    	    
    	    int index = orginFileName.lastIndexOf(".");
    	    //String fileName = orginFileName.substring(0, index);
    	    String fileExt = orginFileName.substring(index + 1);
    	    String newName = KeyStr + getTimeStamp() + fileKey;
    	    newName = newName.replaceAll("/","");
    	    newName = newName.replaceAll("\\\\.","");
    	    newName = newName.replaceAll("&","");
    	    
    	    if("jsp".equals(fileExt) || "php".equals(fileExt) || "exe".equals(fileExt) || "asp".equals(fileExt) || "html".equals(fileExt) || "html".equals(fileExt) || "htm".equals(fileExt) ){
    	    	throw new IOException("Not Allowed File Extension");
    	    }
    	    
    	    long _size = file.getSize();
    	    fvo = new FileVO();

    	    if (!"".equals(orginFileName)) {
    		filePath = storePathString + File.separator + newName;
    		file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
    		
	    		// thumb파일 생성
	    		if (thumbInfo.getThumbnailYn() != null && "Y".equals(thumbInfo.getThumbnailYn())) {
	    			if ("jpg".equals(fileExt) || "gif".equals(fileExt) || "png".equals(fileExt) || "jpeg".equals(fileExt)) {
	    				String thumbPath = filePath + "_thumb";
	    				resizeImageJpg(filePath, thumbPath, thumbInfo);
	    			}
	    		}
    	    }
    	    fvo.setFileExtsn(fileExt);
    	    fvo.setFileStreCours(storePathString);
    	    fvo.setFileMg(Long.toString(_size));
    	    fvo.setOrignlFileNm(orginFileName);
    	    fvo.setStreFileNm(newName);
    	    fvo.setAtchFileId(atchFileIdString);
    	    fvo.setFileSn(String.valueOf(fileKey));

    	    //writeFile(file, newName, storePathString);
    	    result.add(fvo);

    	    fileKey++;
    	}

    	return result;
        }
    
    public List<FileVO> parseFileInfCpNier(List<FileVO> fileList, String KeyStr, int fileKeyParam, String atchFileId, String storePath, String storeType) throws Exception {
    	int fileKey = fileKeyParam;

    	String storePathString = "";
    	String atchFileIdString = "";

    	if ("".equals(storePath) || storePath == null) {
    	    storePathString = EgovProperties.getProperty("Globals.fileStorePath");
    	} else {
    	    storePathString = EgovProperties.getProperty(storePath);
    	}

    	storePathString += atchFileId + storeType +"/";
    	
    	if ("".equals(atchFileId) || atchFileId == null) {
    	    atchFileIdString = idgenService.getNextStringId();
    	} else {
    	    atchFileIdString = atchFileId;
    	}

    	storePathString = storePathString.replaceAll("\\\\.","");
    	storePathString = storePathString.replaceAll("&","");
    	
    	File saveFolder = new File(EgovWebUtil.filePathBlackList(storePathString));
    	// 수정 : 권한 설정
    	saveFolder.setExecutable(true, true);
    	saveFolder.setReadable(true);
    	saveFolder.setWritable(true, true);
    	
    	if (!saveFolder.exists() || saveFolder.isFile()) {
    	    saveFolder.mkdirs();
    	}

    	FileInputStream fis = null;
    	FileOutputStream fos = null;
    	List<FileVO> result  = new ArrayList<FileVO>();
    	FileVO fvo;
    	
    	try {
	    	for(int floo=0; floo<fileList.size(); floo++){
	    		
	    		String dstFileNm = KeyStr + getTimeStamp() + fileKey;
	    		dstFileNm = dstFileNm.replaceAll("/","");
	    		dstFileNm = dstFileNm.replaceAll("\\\\.","");
	    		dstFileNm = dstFileNm.replaceAll("&","");
	    		
	    		String srcFile = fileList.get(floo).getFileStreCours() + fileList.get(floo).getStreFileNm();
	    		String dstFile = storePathString +  dstFileNm;
	    		//먼저 실제 복사하고 VO를 만들자
	    		fis = new FileInputStream(srcFile);
			    fos = new FileOutputStream(dstFile);
			   
			    int data = 0;
			    while((data=fis.read())!=-1) {
			     fos.write(data);
			    }
			    
	    		fvo = new FileVO();
	    	    fvo.setFileExtsn(fileList.get(floo).getFileExtsn());
	    	    fvo.setFileStreCours(storePathString);
	    	    fvo.setFileMg(fileList.get(floo).getFileMg());
	    	    fvo.setOrignlFileNm(fileList.get(floo).getOrignlFileNm());
	    	    fvo.setStreFileNm(fileList.get(floo).getStreFileNm());
	    	    fvo.setAtchFileId(atchFileIdString);
	    	    fvo.setFileSn(fileList.get(floo).getFileSn());
	    	    result.add(fvo);
	
	    	    fileKey++;
	    	}
    	} finally {
			EgovResourceCloseHelper.close(fis, fos);
		}
    	return result;
    }
    
    /**
     * 썸네일 파일을 생성한다. 파일명은 같으나 뒤에 '_thumb'이 붙은 파일 하나 더 생성
     * @param sourceFile
     * @param targetFile
     * @param file
     * @return
     * @throws Exception
     */
    public static File resizeImageJpg(String sourceFile, String targetFile, FileVO file) throws Exception {
    	File source = new File(sourceFile);
		if (!source.isFile() || source.length() == 0) {
			return null;
		}

		BufferedImage sourceImage = ImageIO.read(source);

		int width = file.getThumbnailWidth() == 0 ? 150 : file.getThumbnailWidth();
		int height = file.getThumbnailHeight() == 0 ? 100 : file.getThumbnailHeight();
		
		int resizeWidth = 0;
		int resizeHeight = 0;
		double resizeRatio = 1.0;

		if (width > 0 && height > 0) { // 가로/세로 크기 기준으로 비율유지 리사이즈
			double sourceRatio = (double)sourceImage.getWidth() / sourceImage.getHeight();
			double targetRatio = (double)width / height;

			if (targetRatio > 1) { // 가로형으로 만들기
				if (sourceRatio < targetRatio) { // 타겟이 더 가로형일 때.
					resizeRatio = (double)height / sourceImage.getHeight(); // 세로에 맞춘다.(세로의 비율)
					if (resizeRatio > 1) { // 타겟의 세로가 더 클 때 원본 유지.
						resizeRatio = 1.0;
					}

				} else { // 원본이 더 가로형일 때.
					resizeRatio = (double)width / sourceImage.getWidth(); // 가로에 맞춘다.(가로의 비율)
					if (resizeRatio > 1) { // 타겟의 가로가 더 클 때 원본 유지.
						resizeRatio = 1.0;
					}
				}
			} else { // 세로형으로 만들기.
				if (sourceRatio > targetRatio) { // 타겟이 더 세로형일 때.
					resizeRatio = (double)width / sourceImage.getWidth(); // 가로에 맞춘다.(가로의 비율)
					if (resizeRatio > 1) { // 타겟의 가로가 더 클 때 원본 유지.
						resizeRatio = 1.0;
					}

				} else { // 원본이 더 세로형일 때.
					resizeRatio = (double)height / sourceImage.getHeight(); // 세로에 맞춘다.(세로의 비율)
					if (resizeRatio > 1) { // 타겟의 세로가 더 클 때 원본 유지.
						resizeRatio = 1.0;
					}
				}
			}

		} else if (width > 0) { // 가로크기 기준으로(가로만 맞춤) 비율유지 리사이즈
			if (sourceImage.getWidth() > width) {
				resizeRatio = (double)width / sourceImage.getWidth(); // 가로에 맞춘다.(가로의 비율)
			} else { // 타겟의 가로가 더 클 때 원본 유지.
				resizeRatio = 1.0;
			}
		} else if (height > 0) { // 세로크기 기준으로(세로만 맞춤) 비율유지 리사이즈
			if (sourceImage.getHeight() > height) {
				resizeRatio = (double)height / sourceImage.getHeight(); // 세로에 맞춘다.(세로의 비율)
			} else { // 타겟의 세로가 더 클 때 원본 유지.
				resizeRatio = 1.0;
			}
		}
		resizeWidth = (int)(sourceImage.getWidth() * resizeRatio);
		resizeHeight = (int)(sourceImage.getHeight() * resizeRatio);

		if (resizeWidth == sourceImage.getWidth() && resizeHeight == sourceImage.getHeight()) {
			// 원본 복사
			copy(sourceFile, targetFile);
			return new File(targetFile);
		} else {
			File target = new File(targetFile);

			int type = sourceImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : sourceImage.getType();

			BufferedImage destImage = new BufferedImage(resizeWidth, resizeHeight, type);

			Graphics2D graphics = destImage.createGraphics();
			graphics.setComposite(AlphaComposite.Src);
			Image scaleImage = sourceImage.getScaledInstance(resizeWidth, resizeHeight, BufferedImage.SCALE_SMOOTH);
			graphics.drawImage(scaleImage, 0, 0, null);
			graphics.dispose();

			ImageIO.write(destImage, "jpg", target);

			return target;
		}
    }
    
    /**
     * 파일을 복사한다.
     * @param sourceFile
     * @param targetFile
     * @throws Exception
     */
    public static void copy(String sourceFile, String targetFile) throws Exception {
		FileInputStream fis = new FileInputStream(sourceFile);
		FileOutputStream fos = new FileOutputStream(targetFile);
		FileChannel fci = fis.getChannel();
		FileChannel fco = fos.getChannel();
		try {
			fci.transferTo(0, fci.size(), fco);
		} finally {
			EgovResourceCloseHelper.close(fci, fco, fis, fos);
		}
	}
    
    /**
     * 파일을 삭제한다. - 경로 입력 필수
     * @param savePath
     * @throws Exception
     */
    public static void deleteFile(String savePath) throws Exception {
    	// 원본 파일을 삭제한다.
    	File source = new File(savePath);
		if (source.isFile()) {
			source.delete();
		}
		String thumbSavePath = savePath + "_thumb";
		// 썸네일이 있으면 삭제한다.
		File sourceThumb = new File(thumbSavePath);
		if (sourceThumb.isFile()) {
			sourceThumb.delete();
		}
		
    }
}
