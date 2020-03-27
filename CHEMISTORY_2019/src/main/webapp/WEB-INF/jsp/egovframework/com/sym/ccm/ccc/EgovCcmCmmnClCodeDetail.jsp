<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript">
<!--

function fnInit(){
}

function fnList(){
	location.href = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeList.do' />";
}

function fnModify(){
	var varForm				 = document.getElementById("Form");
	varForm.action           = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeModify.do'/>";
	varForm.clCode.value     = "<c:out value='${result.clCode}'/>";
	varForm.submit();
}

function fnDelete(){
	if (confirm("<spring:message code="common.delete.msg" />")) {
		var varForm				 = document.getElementById("Form");
		varForm.action           = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeRemove.do'/>";
		varForm.clCode.value     = "<c:out value='${result.clCode}'/>";
		varForm.submit();
	}
}
-->
</script>
</head>

<body>
<div class="content-body">
<div class="board-list">
	<table  class="board-write">
	<caption>공통분류코드 상세조회</caption>
		<colgroup>
		    <col style="width:15%" />
		    <col />
		</colgroup>
		<tr>
			<th class="board-write-th">분류코드</th>
			<td class="board-write-td"><c:out value='${result.clCode}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">분류코드명</th>
			<td class="board-write-td"><c:out value='${result.clCodeNm}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">분류코드설명</th>
			<td class="board-write-td">
			<textarea cols="50" rows="10" title="<c:out value='${result.clCodeDc}'/>"><c:out value='${result.clCodeDc}'/></textarea>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">사용여부</th>
			<td class="board-write-td">
			<select name="useAt" disabled="disabled" id="useAt" class="board-search-select">
				<option value="Y" <c:if test="${result.useAt == 'Y'}">selected="selected"</c:if> >사용</option>
				<option value="N" <c:if test="${result.useAt == 'N'}">selected="selected"</c:if> >미사용</option>
			</select>
			</td>
		</tr>
	</table>
</div>
</div>

<div class="text-center">
	<a href="#noscript" onclick="fnList(); return false;" class="btn btn-default">목록</a></td>
	<a href="#noscript" onclick="fnModify(); return false;" class="btn btn-primary">수정</a></td>
	<c:if test="${result.useAt == 'Y'}">
	<a href="#noscript" onclick="fnDelete(); return false;" class="btn btn-warning">삭제</a></td>
	</c:if>
</div>

<form name="Form" id="Form" method="post" action="">
	<input name="clCode" type="hidden">
	<input type="submit" id="invisible" class="invisible">
</form>

</body>
</html>
