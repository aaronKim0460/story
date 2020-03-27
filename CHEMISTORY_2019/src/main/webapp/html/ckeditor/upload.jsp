<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File, java.util.List, java.io.IOException"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.http.*"%>
<%@page import="egovframework.com.cmm.service.*"%>
<%@page import="egovframework.com.utl.fcc.service.EgovNumberUtil"%>
<%@page import="egovframework.com.utl.fcc.service.EgovStringUtil"%>
<%@page import="egovframework.com.utl.fcc.service.EgovFormBasedFileUtil"%>

<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>upload</title>
</head>
<body>
	<%
		boolean isMultipart = ServletFileUpload.isMultipartContent(request); //multipart로 전송되었는가 체크

		if (isMultipart) {

			String strTemp = "";
			// 설정단계
			//File temporaryDir = new File("/data/new_nier/images/ImgTemp/"); //업로드된 파일의 임시 저장 폴더
			File temporaryDir = new File(EgovProperties.getProperty("Globals.fileImgTempStorePath")); //업로드된 파일의 임시 저장 폴더
			out.println("[temporaryDir] : "+ temporaryDir +"<br/>");
			// 	String realDir = config.getServletContext().getRealPath(request.getParameter("realDir"));  //실제 저장될 파일경로
			String realDir = config.getServletContext().getRealPath("/images/upload/editor2/"); //실제 저장될 파일경로
			String sFunc = request.getParameter("CKEditorFuncNum");
			// 		String realUrl = request.getParameter("realUrl");
			//String realUrl = "http://www.nier.go.kr/images/upload/editor2/";
			String realUrl = "/images/upload/editor2/";

			// 디스크 기반의 파일 아이템 팩토리 생성
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1 * 1024 * 1024); //최대 메모리 크기
			factory.setRepository(temporaryDir); // 임시저장폴더 연결

			// 구현단계
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(10 * 1024 * 1024); //최대 업로드 크기
			List<FileItem> items = upload.parseRequest(request); //이 부분에서 파일이 생성
			Iterator iter = items.iterator();

			while (iter.hasNext()) {
				FileItem fileItem = (FileItem) iter.next();
				if (fileItem.isFormField()) { // File 컴포넌트가 아닌 일반 컴포넌트일 경우
					out.println(fileItem.getFieldName() + "=" + fileItem.getString("utf-8") + "<br/>");
				} else {
					if (fileItem.getSize() > 0) { //파일이 업로드 되었나 안되었나 체크
						String fieldName = fileItem.getFieldName();
						String fileName = fileItem.getName();
						String contentType = fileItem.getContentType();
						boolean isInMemory = fileItem.isInMemory();
						long sizeInBytes = fileItem.getSize();
						
						/*
						out.println("[realDir] : "+ realDir +"<br/>");
						out.println("[fieldName] : "+ fieldName +"<br/>");
						out.println("[fileName] : "+ fileName +"<br/>");
						out.println("[getName] : "+ fileItem.getName() +"<br/>");
						out.println("[contentType] : "+ contentType +"<br/>");
						out.println("[isInMemory] : "+ isInMemory +"<br/>");
						out.println("[sizeInBytes] : "+ sizeInBytes +"<br/>");  
						*/
						
						try {
							if(fileName !=null && !((fileName.endsWith(".jsp"))||(fileName.endsWith(".php"))||(fileName.endsWith(".exe"))||(fileName.endsWith(".asp"))||(fileName.endsWith(".html"))||(fileName.endsWith(".htm")))){
								fileName = fileName.substring(fileName.lastIndexOf("\\")+1, fileName.length());
								//out.println("[fileName] : "+ fileName +"<br/>");
								
								String fileExt = fileName.substring(fileName.lastIndexOf("."), fileName.length());
								//out.println("[fileExt] : "+ fileExt +"<br/>");
								
								String fileId = EgovFormBasedFileUtil.getPhysicalFileName();
								//out.println("[fileId] : "+ fileId +"<br/>");
								
								String newFileName = fileId+fileExt;
								//out.println("[newFileName] : "+ newFileName +"<br/>");
								fileName = newFileName;
								
								File uploadedFile = new File(realDir, fileName);
								fileItem.write(uploadedFile); //실제 디렉토리에 카피
								//	fileItem.delete();   //temp폴더의 파일 제거

								//파일 타입이 image인가 체크
								String fileTypeCheck[] = contentType.split("/");
								if("image".equals(fileTypeCheck[0])){
									out.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + sFunc + ", '"+ realUrl + fileName + "', '업로드 완료.');</script>");
								} else {
						 			out.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + sFunc + ", '', '이미지 파일만 업로드 가능합니다.');</script>");
									break;
								}
							}else{
								out.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + sFunc + ", '', '이미지, 문서, 압축 파일만 업로드 가능합니다.');</script>");
							}
						} catch (IOException ex) {
							out.println("error : " + ex + "<br/>");
						}
					}
				}
			}

		} else {
			System.out.println("인코딩 타입이 multipart/form-data 가 아님.");
		}
	%>
</body>
</html>