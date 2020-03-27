<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>

<validator:javascript formName="progrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script language="javascript1.2" type="text/javaScript">
<!--

function updateProgramListManage(form) {
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateProgrmManageVO(form)){
			return;
		}else{
            form.action="<c:url value='/sym/prm/EgovProgramFileListDetailSelectUpdt.do' />";
			form.submit();
		}
	}
}

function deleteProgramListManage(form) {
	if(confirm("<spring:message code="common.delete.msg" />")){
        form.action="<c:url value='/sym/prm/EgovProgramFileListManageDelete.do' />";
		form.submit();
	}
}

function selectList(){
	location.href = "<c:url value='/sym/prm/EgovProgramFileListManageSelect.do' />";
}
<c:if test="${!empty resultMsg}">alert("<c:out value='${resultMsg}'/>");</c:if>
-->
</script>

<body>

<form:form commandName="progrmManageVO" method="post">

<div class="content-body">
<div class="board-list">
	<table class="board-write">
   	<caption>프로그램목록 상세조회 /수정</caption>
 		<colgroup>
		    <col style="width:20%" />
		    <col style="width:80%" />
		</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">관리대상명</th>
				<td class="board-write-td">
					<form:input  path="fileMgmName" size="50" class="input-text" maxlength="50" title="프로그램파일명"/>
					<form:errors path="fileMgmName"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">제공 URL</th>
				<td class="board-write-td">
					<form:input  path="url" size="50" class="input-text" maxlength="50" title="저장경로"/>
					<form:errors path="url"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">파일명</th>
				<td class="board-write-td">
					<form:input  path="orignlFileNm" size="50" class="input-text" maxlength="50" title="저장경로"/>
					<form:errors path="orignlFileNm"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">관심대상설명</th>
				<td class="board-write-td">
					<form:textarea path="fileMgmDc" rows="14" cols="75" title="프로그램설명"/>
					<form:errors path="fileMgmDc"/>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<a href="<c:url value='/sym/prm/EgovProgramFileListManageSelect.do'/>" onclick="selectList(); return false;" class="btn btn-default">목록</a></span></td>
         <%-- <input type="submit" value="<spring:message code="button.update" />" onclick="updateProgramListManage(document.forms[0]); return false;">
 			<a href="<c:url value='/sym/prm/EgovProgramListManageDelete.do'/>?progrmFileNm=<c:out value="${progrmManageVO.progrmFileNm  }"/>" onclick="deleteProgramListManage(document.forms[0]); return false;"><spring:message code="button.delete" /></a> --%>
</div>

</form:form>

</body>
</html>

