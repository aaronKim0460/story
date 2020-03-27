<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript">
<!--

function fnInit(){
}

function fnList(){
	location.href = "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeList.do' />";
}

function fnModify(){
	var varForm				 = document.getElementById("Form");
	varForm.action           = "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeModify.do'/>";
	varForm.codeId.value     = "<c:out value='${result.codeId}'/>";
	varForm.submit();
}

function fnDelete(){
	if (confirm("<spring:message code='common.delete.msg'/>")) {
		var varForm				 = document.getElementById("Form");
		varForm.action           = "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeRemove.do'/>";
		varForm.codeId.value     = "<c:out value='${result.codeId}'/>";
		varForm.submit();
	}
}
-->
</script>

<body>

<div class="content-body">
<div class="board-list">
	<table  class="board-write">	
	<CAPTION>공통코드 상세조회</CAPTION>
		<colgroup>
		    <col style="width:15%" />
		    <col />
		</colgroup>
		<tr>
			<th class="board-write-th">분류코드명</th>
			<td class="board-write-td"><c:out value='${result.clCodeNm}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">코드ID</th>
			<td class="board-write-td"><c:out value='${result.codeId}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">코드ID명</th>
			<td class="board-write-td"><c:out value='${result.codeIdNm}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">코드ID설명</th>
			<td class="board-write-td">
			<textarea class="textarea"  cols="50" rows="10" disabled id="codeIdDc"><c:out value='${result.codeIdDc}'/></textarea>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">사용여부</th>
			<td class="board-write-td">
			<select name="useAt" disabled id="useAt" class="board-search-select">
				<option value="Y" <c:if test="${result.useAt == 'Y'}">selected="selected"</c:if> >사용</option>
				<option value="N" <c:if test="${result.useAt == 'N'}">selected="selected"</c:if> >미사용</option>
			</select>
		  </td>
		</tr>
	</table>
</div>
</div>

<div class="text-center">
	<input type="submit" value="목록" onclick="fnList(); return false;" class="btn btn-default" />
	<input type="submit" value="수정" onclick="fnModify(); return false;" class="btn btn-primary" />
	<c:if test="${result.useAt == 'Y'}">
	<input type="submit" value="미사용" onclick="fnDelete(); return false;" class="btn btn-warning" />
	</c:if>
</div>

<form name="Form" id="Form" method="post" action="">
	<input name="codeId" type="hidden">
	<input type="submit" id="invisible" class="invisible"/>
</form>

</body>
</html>
