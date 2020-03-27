<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript">
<!--

function fnInit(){
}

function fnList(){
	location.href = "<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeList.do' />";
}

function fnModify(){
	var varForm				 = document.getElementById("Form");
	varForm.action           = "<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeModify.do'/>";
	varForm.codeId.value     = "<c:out value='${result.codeId}'/>";
	varForm.code.value       = "<c:out value='${result.code}'/>";
	varForm.submit();
}

function fnDelete(){
	if (confirm("<spring:message code='common.delete.msg'/>")) {
		var varForm				 = document.getElementById("Form");
		varForm.action           = "<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeRemove.do'/>";
		varForm.codeId.value     = "<c:out value='${result.codeId}'/>";
		varForm.code.value       = "<c:out value='${result.code}'/>";
		varForm.submit();
	}
}
-->
</script>
</head>
<body>
<div class="content-body">
<div class="board-list">
	<table class="board-write">
		<caption>공통분류코드 상세조회</caption>
		<colgroup>
		    <col style="width:15%" />
		    <col />
		</colgroup>
		<tr>
			<th class="board-write-th">코드ID명</th>
			<td class="board-write-td"><c:out value='${result.codeIdNm}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">코드</th>
			<td class="board-write-td"><c:out value='${result.code}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">코드명</th>
			<td class="board-write-td"><c:out value='${result.codeNm}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">코드설명</th>
			<td class="board-write-td">
				<textarea class="textarea"  cols="75" rows="14"  style="width:450px;" disabled id="codeDc"><c:out value='${result.codeDc}'/></textarea>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">추가설정항목</th>
			<td class="board-write-td"><c:out value='${result.codeVal}'/></td>
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
	<input type="submit" value="미사용" onclick="fnDelete(); return false;" class="btn btn-warning"/>
	</c:if>
</div>

<form name="Form" id="Form" method="post" action="">
	<input type=hidden name="codeId">
	<input type=hidden name="code">
	<input type="submit" id="invisible" class="invisible"/>
</form>
</body>
</html>
