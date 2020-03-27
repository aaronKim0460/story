<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript">
<!--

function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeList.do'/>";
   	document.listForm.submit();
}

function fnSearch(){
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}

function fnRegist(){
	location.href = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeRegist.do' />";
}

function fnModify(){
	location.href = "";
}

function fnDetail(clCode){
	var varForm				 = document.getElementById("Form");
	varForm.action           = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeDetail.do'/>";
	varForm.clCode.value     = clCode;
	varForm.submit();
}

function fnDelete(){
	//
}
-->
</script>

<body>

<form name="listForm" action="<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeList.do'/>" method="post">
<div class="board-search">
	<fieldset>
	<legend>목록검색</legend>		
		<select name="searchCondition" class="board-search-select" style="width:120px">
			<option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>분류코드</option>
			<option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>분류코드명</option>
		</select>	   
    	<input name="searchKeyword" type="text" class="board-search-keyword" value="<c:out value='${searchVO.searchKeyword}'/>"  maxlength="35" id="searchKeyword" >
		<input type="submit" id="board-search-submit" class="btn btn-sm btn-default" onclick="fnSearch(); return false;" value="검색">
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:10%" />
			<col style="width:20%" />
			<col style="width:50%" />
			<col style="width:20%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">순번</th>
				<th class="board-default-th-no">분류코드</th>
				<th class="board-default-th-title">분류코드명</th>
				<th class="board-default-th-no">사용여부</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<tr onclick="javascript:fnDetail('<c:out value='${resultInfo.clCode}'/>')">
				<td class="board-default-td-no"><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
				<td class="board-default-td-no"><c:out value='${resultInfo.clCode}'/></td>
				<td class="board-default-td-title">
				<span class="link">
					<a href="<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeDetail.do'/>?clCode=<c:out value='${resultInfo.clCode}'/>" >
					<c:out value='${resultInfo.clCodeNm}'/>
					</a>
				</span>
				</td>
				<td class="board-default-td-no"><c:if test="${resultInfo.useAt == 'Y'}">사용</c:if><c:if test="${resultInfo.useAt == 'N'}">미사용</c:if></td>
			</tr>
			</c:forEach>
	
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td class="lt_text3" colspan=4>
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">
	<a href="javascript:fnRegist();" class="btn btn-primary">등록</a>
	</div>
</div>

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<form name="Form" id="Form" method="post" action="">
	<input type=hidden name="clCode">
	<input type="submit" id="invisible" class="invisible">
</form>

</body>
</html>
