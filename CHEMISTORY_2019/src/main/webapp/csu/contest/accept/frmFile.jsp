<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import = "kr.go.chemistory.contest.framework.CommonUtil"%>
<%
	String strFPath = CommonUtil.nullCheck(request.getParameter("fp")) ;
	String strCallBack = CommonUtil.nullCheck(request.getParameter("callback")) ;
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta name="author" content="" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<title>케미스토리</title> 
<link rel="stylesheet" type="text/css" href="/csu/contest/css/contents.css"/>
<script type="text/javascript">
// <![CDATA[

function fileCheck(obj) {
	var pathpoint = obj.lastIndexOf('.');
	var filepoint = obj.substring(pathpoint+1,obj.length);
	var filetype = filepoint.toLowerCase();
	if( filetype =='exe' || filetype =='asp' || filetype =='jsp' || filetype =='js' || filetype =='dll' ) {
		alert('선택하신 파일은 올리실수 없습니다.1');
		return false;
	}
}
function submitImageUploadForm(uploadForm)
{
	var theFrm = document.form1;

	fileName = theFrm.update_image.value;
	if (fileName == "") {
		alert('파일을 선택해주세요.');
		return;
	}
	pathpoint = fileName.lastIndexOf('.');
	filepoint = fileName.substring(pathpoint+1,fileName.length);
	filetype = filepoint.toLowerCase();
	if( filetype =='exe' || filetype =='asp' || filetype =='jsp' || filetype =='js' || filetype =='dll' ) {
		alert('선택하신 파일은 올리실수 없습니다.');
		self.close();
		return;
	}
	try {
		theFrm.submit();
	}catch(e) {
		theFrm.reset();
		alert('파일을 업로드할 수 없습니다.2');
		return;
	}
}
function closeWindow() {
	top.opener = self;
	top.close();
}

// ]]>
</script>
</head>
<body>

<form id="form1" name="form1" action="/csu/contest/accept/fileUpload.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="fp" value="<%= strFPath%>" />
<input type="hidden" name="callback" value="<%= strCallBack %>" />
	<div id="pop">
    	<div id="pop_top">
        	<h3>파일 업로드</h3>
            <div id="close">
            	<p><a href="#none" title="닫기" onclick="closeWindow();"><img src="/csu/contest/images/btn/btn_close.gif" alt="닫기" /></a></p>
            </div>
        </div>
        <!-- con -->
        <div class="con w_450">
        	<div class="file_upload">
                <ul>
                    <li class="input"><input type="file" name="update_image" style="width:350px;height:25px;ime-mode:disabled;position:relative;cursor:pointer;" onchange="fileCheck(this.value);" onkeydown="return false" /></li>
                </ul>
                <p class="file"><a href="#none" title="파일등록" onclick="submitImageUploadForm();" ><img src="/csu/contest/images/btn/btn_fileRegister.gif" alt="파일등록" /></a></p>
            </div>
        </div>
    </div>
</form>
</body>
</html>
