<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>

<validator:javascript formName="progrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script language="javascript1.2" type="text/javaScript">

<!--
function insertProgramListManage(form) {
	if(confirm("<spring:message code="common.save.msg"/>")){
		if(!validateProgrmManageVO(form)){
			return;
		}else{

			form.submit();
		}
	}
}

function selectList(){
	location.href = "<c:url value='/sym/prm/EgovProgramFileListManageSelect.do' />";
}

function fn_FocusStart(){
	var objFocus = document.getElementById('F1');
	objFocus.focus();
}

function makeFileAttachment(){
	 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), 1 );
	 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
}

<c:if test="${!empty resultMsg}">alert("<c:out value='${resultMsg}'/>");</c:if>
-->
</script>

<body onLoad="HTMLArea.init(); HTMLArea.onload = initEditor; makeFileAttachment();">

<form:form commandName="progrmManageVO" method="post" enctype="multipart/form-data">
<input name="cmd" type="hidden" value="<c:out value='insert'/>"/>

<div class="content-body">
<div class="board-list">
	<table class="board-write">
   	<caption>프로그램 파일 등록</caption>
		<colgroup>
		    <col style="width:20%" />
		    <col style="width:80%" />
		</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">관리대상명</th>
				<td class="board-write-td">
					<form:input path="fileMgmName" size="50" class="input-text" maxlength="50" id="F1" />
					<form:errors path="fileMgmName" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">프로그램설명</th>
				<td class="board-write-td">
					<form:textarea path="fileMgmDc" rows="8" cols="75" class="textarea-board"/>
					<form:errors path="fileMgmDc"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">파일 첨부</th>
				<td class="board-write-td">
					<input name="file_1" id="egovComFileUploader" type="file" title="첨부파일입력" />
					<div id="egovComFileList"></div>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">
		<a href="<c:url value='/sym/prm/EgovProgramFileListManageSelect.do'/>" onclick="selectList(); return false;" class="btn btn-default">목록</a>
		<input type="submit" value="등록" onclick="insertProgramListManage(document.forms[0]); return false;" class="btn btn-primary">
	</div>
</div>


</form:form>

</body>
</html>

