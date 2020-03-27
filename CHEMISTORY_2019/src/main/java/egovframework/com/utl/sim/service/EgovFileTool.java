/**
 *  Class Name : EgovFileTool.java
 *  Description : 시스템 디렉토리 정보를 확인하여 제공하는  Business class
 *  Modification Information
 *
 *     수정일         수정자                   수정내용
 *   -------    --------    ---------------------------
 *   2009.01.13    조재영          최초 생성
 *
 *  @author 공통 서비스 개발팀 조재영,박지욱
 *  @since 2009. 01. 13
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
package egovframework.com.utl.sim.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.utl.fcc.service.EgovStringUtil;

public class EgovFileTool {

	// 파일사이즈 1K
	static final long BUFFER_SIZE = 1024L;
	// 파일구분자
	static final char FILE_SEPARATOR = File.separatorChar;
	// 윈도우시스템 파일 접근권한
	static final char ACCESS_READ = 'R'; // 읽기전용
	static final char ACCESS_SYS = 'S'; // 시스템
	static final char ACCESS_HIDE = 'H'; // 숨김
	// 최대 문자길이
	static final int MAX_STR_LEN = 1024;

	// Log
	//protected static final Log log = LogFactory.getLog(EgovFileTool.class);

	/**
	 * <pre>
	 * Comment : 파일을 생성한다.
	 * </pre>
	 *
	 * @param String fileName 파일의 절대경로 +파일명
	 * @param String content 저장할 문자열입니다. c:/test/test1/test44.txt
	 *
	 */
	public static String createNewFile(String filePath) {

		// 인자값 유효하지 않은 경우 블랭크 리턴
		if (filePath == null || filePath.equals("")) {
			return "";
		}

		File file = new File(EgovWebUtil.filePathBlackList(filePath));
		// 수정 : 권한 설정
//		file.setExecutable(false, true);
		file.setReadable(true);
//		file.setWritable(false, true);
		file.setExecutable(true, true);
		file.setWritable(true, true);
				
		String result = "";
		try {
			if (file.exists()) {
				result = filePath;
			} else {
				// 존재하지 않으면 생성함
				new File(file.getParent()).mkdirs();
				if (file.createNewFile()) {
					result = file.getAbsolutePath();
				}
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		return result;
	}
	
	/**
	 * <pre>
	 * Comment : 디렉토리를 생성한다.
	 * </pre>
	 *
	 * @param dirPath 생성하고자 하는 절대경로
	 * @return 성공하면 새성된 절대경로, 아니면 블랭크
	 */

	public static String createNewDirectory(String dirPath) {

		// 인자값 유효하지 않은 경우 블랭크 리턴
		if (dirPath == null || dirPath.equals("")) {
			return "";
		}

		File file = new File(EgovWebUtil.filePathBlackList(dirPath));
		// 수정 : 권한 설정
		file.setExecutable(true, true);
		file.setReadable(true);
		file.setWritable(true, true);
				
		String result = "";
		// 없으면 생성
		if (file.exists()) {
			// 혹시 존재해도 파일이면 생성 - 생성되지 않는다.(아래는 실질적으로는 진행되지 않음)
			if (file.isFile()) {
				//new File(file.getParent()).mkdirs();
				if (file.mkdirs()) {
					result = file.getAbsolutePath();
				}
			} else {
				result = file.getAbsolutePath();
			}
		} else {
			// 존해하지 않으면 생성
			if (file.mkdirs()) {
				result = file.getAbsolutePath();
			}
		}

		return result;
	}
	
	/**
	 * 디렉토리 내부 하위목록들 중에서 파일을 찾는 기능(모든 목록 조회)
	 *
	 * @param File[] fileArray 파일목록
	 * @return ArrayList list 파일목록(절대경로)
	 * @exception Exception
	 */
	public static List<String> getSubFilesByAll(File[] fileArray) throws Exception {

		ArrayList<String> list = new ArrayList<String>();

		for (int i = 0; i < fileArray.length; i++) {
			// 디렉토리 안에 디렉토리면 그 안의 파일목록에서 찾도록 재귀호출한다.
			if (fileArray[i].isDirectory()) {
				File[] tmpArray = fileArray[i].listFiles();
				list.addAll(getSubFilesByAll(tmpArray));
				// 파일이면 담는다.
			} else {
				list.add(fileArray[i].getAbsolutePath());
			}
		}

		return list;
	}
	
	/**
	 * 파일을 특정 구분자(',', '|', 'TAB')로 파싱하는 기능
	 *
	 * @param String parFile 파일
	 * @param String parChar 구분자(',', '|', 'TAB')
	 * @param int parField 필드수
	 * @return Vector parResult 파싱결과 구조체
	 * @exception Exception
	 */
	public static Vector<List<String>> parsFileByChar(String parFile, String parChar, int parField) throws Exception {

		// 파싱결과 구조체
		Vector<List<String>> parResult = new Vector<List<String>>();

		// 파일 오픈
		String parFile1 = parFile.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
		File file = new File(EgovWebUtil.filePathBlackList(parFile1));
		BufferedReader br = null;
		try {
			// 파일이며, 존재하면 파싱 시작
			if (file.exists() && file.isFile()) {

				// 1. 파일 텍스트 내용을 읽어서 StringBuffer에 쌓는다.
				br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
				StringBuffer strBuff = new StringBuffer();
				String line = "";
				while ((line = br.readLine()) != null) {
					if (line.length() < MAX_STR_LEN)
						strBuff.append(line);
				}

				// 2. 쌓은 내용을 특정 구분자로 파싱하여 String 배열로 얻는다.
				String[] strArr = EgovStringUtil.split(strBuff.toString(), parChar);

				// 3. 필드 수 만큼 돌아가며 Vector<ArrayList> 형태로 만든다.
				int filedCnt = 1;
				List<String> arr = new ArrayList<String>();
				for (int i = 0; i < strArr.length; i++) {

					if (parField != 1) {
						if ((filedCnt % parField) == 1) {
							if (strArr[i] != null) {
								arr.add(strArr[i]);
							}
							if (i == (strArr.length - 1)) {
								parResult.add(arr);
							}
						} else if ((filedCnt % parField) == 0) {
							if (strArr[i] != null) {
								arr.add(strArr[i]);
								parResult.add(arr);
							}
						} else {
							if (strArr[i] != null) {
								arr.add(strArr[i]);
								if (i == (strArr.length - 1)) {
									parResult.add(arr);
								}
							}
						}
					} else {
						arr = new ArrayList<String>();
						if (strArr[i] != null) {
							arr.add(strArr[i]);
						}
						parResult.add(arr);
					}

					filedCnt++;
				}
			}
		} finally {
			EgovResourceCloseHelper.close(br);
		}

		return parResult;
	}

}
