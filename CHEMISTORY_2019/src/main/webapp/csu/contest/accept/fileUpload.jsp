<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%//@ page import = "com.common.config.Config"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonUtil"%>
<%
	int MAXFILESIZE = 1024*1024*100;
	String ENCODING = "UTF-8";
	String strSavePath = "" ;
	String strTempPath = "" ;
	boolean blnMultiPart = false ;
	MultipartRequest multiRequest = null ;
	String fileName = "";
	String strErrorCode = "1000";
	String strFileSize = "" ;
	String strNewFileName = "" ;
	String strOrgName = "" ;
	String strCallBack = "" ;
	try {
/* 경로 일단 하드코딩, 만약 프로퍼티 형식으로 바꿀려면 파라미터에 fp 프로퍼티 명을 던지면 그 포로퍼티 읽어옴 */
//		strTempPath = Config.getInstance().getProperty("FILE_TEMP_PATH");
		strTempPath = "/app/src/chemistory/M1/csu/UPLOAD_FILE/handleContest/temp/";

		CommonUtil.makeFolder(strTempPath) ;
		multiRequest = new MultipartRequest(request, strTempPath, MAXFILESIZE, ENCODING
				, new DefaultFileRenamePolicy());
		strCallBack = CommonUtil.nullCheck(multiRequest.getParameter("callback"));
/* 경로 일단 하드코딩, 만약 프로퍼티 형식으로 바꿀려면 파라미터에 fp 프로퍼티 명을 던지면 그 포로퍼티 읽어옴 */
//		String strFPath = CommonUtil.nullCheck(multiRequest.getParameter("fp"));
//		strSavePath = CommonUtil.nullCheck(Config.getInstance().getProperty(strFPath)) ;
		String strFPath = CommonUtil.nullCheck(multiRequest.getParameter("fp"));
		strSavePath = "/app/src/chemistory/M1/csu/UPLOAD_FILE/handleContest/" ;
		blnMultiPart = true;
		if("".equals(strSavePath)) {
			strErrorCode = "1001" ;
			throw new Exception("잘못된 접근입니다.");
		}
		if(blnMultiPart) {
			String[] orgfileName = new String[1];
			String[] savefileName = new String[1];
			CommonUtil.makeFolder(strSavePath) ;
			int i=0;
			try {
				for(Enumeration formNames=multiRequest.getFileNames() ; formNames.hasMoreElements() ;) {
					String formName = (String)formNames.nextElement();
					fileName = multiRequest.getFilesystemName(formName);
					orgfileName[i] = multiRequest.getOriginalFileName(formName);
					strNewFileName = CommonUtil.makeFileName(fileName, session.getId());
					java.io.File fSourceFile = new File(strTempPath + fileName);
					java.io.File fTargetFile = new File(strSavePath + strNewFileName);
					fSourceFile.renameTo(fTargetFile);
					savefileName[i] = fTargetFile.getName();
					strNewFileName = new String(savefileName[0].getBytes("8859_1"),"KSC5601");
					strNewFileName = savefileName[0] ;
					strFileSize = Long.toString(fTargetFile.length()/1024) ;
					if("0".equals(strFileSize)) {
						strFileSize = "1" ;
					}
					i++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				File fb = new File(strTempPath+fileName);
				if(fb.isFile()){
					fb.delete();
				}
			}

		}
	}catch (Exception e) {
		e.printStackTrace();
		blnMultiPart = false;
	}
%>
<script>
function closeWindow() {
	top.opener = self;
	top.close();
}
<%
	if(blnMultiPart) {
		out.println("opener."+strCallBack+"('"+fileName+"', '"+strNewFileName+"', '"+strFileSize+"', '"+strSavePath+"');");
	}else {
		if("1001".equals(strErrorCode)) {
			out.println("alert('잘못된 경로로 접근하셨습니다.');") ;
		}else{
			out.println("alert(\"파일업로드시 에러가 발생했습니다.\");") ;
		}
	}
%>
closeWindow();
</script>