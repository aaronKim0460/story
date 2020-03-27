<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript">
<!--

function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeList.do'/>";
   	document.listForm.submit();
}

function fnSearch(){
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}

function fnRegist(){
	location.href = "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeRegist.do' />";
}

function fnModify(){
	location.href = "";
}

function fnDetail(codeId){
	var varForm				 = document.getElementById("Form");
	varForm.action           = "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeDetail.do'/>";
	varForm.codeId.value     = codeId;
	varForm.submit();
}

function fnDelete(){
	//
}
-->
</script>

<body>

<form name="listForm" action="<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeList.do'/>" method="post">
<div class="board-search">
	<fieldset>
	<legend>목록검색</legend>
	   	<select name="searchCondition" id="searchCondition" class="board-search-select" style="width:120px">
			<option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>코드ID</option>
			<option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>코드ID명</option>
		</select>
		<input name="searchKeyword" type="text" size="35" value="${searchVO.searchKeyword}"  maxlength="35" class="board-search-keyword" />
		<input type="submit" value="검색" onclick="fnSearch(); return false;" id="board-search-submit" class="btn btn-sm btn-default" />
	</fieldset>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:10%" />
			<col style="width:30%" />
			<col style="width:15%" />
			<col style="width:30%" />
			<col style="width:15%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">순번</th>
				<th class="board-default-th-title">분류명</th>
				<th class="board-default-th-no">코드ID</th>
				<th class="board-default-th-title">코드ID명</th>
				<th class="board-default-th-no">사용여부</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<tr onclick="javascript:fnDetail('${resultInfo.codeId}');">
				<td class="board-default-td-no"><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
				<td class="board-default-td-title">${resultInfo.clCodeNm}</td>
				<td class="board-default-td-no">${resultInfo.codeId}</td>
				<td class="board-default-td-title">
					<span class="link">
						<a href="<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeDetail.do'/>?codeId=<c:out value='${resultInfo.codeId}'/>" ><c:out value='${resultInfo.codeIdNm}'/></a>
					</span>
				</td>
				<td class="board-default-td-no"><c:if test="${resultInfo.useAt == 'Y'}">사용</c:if><c:if test="${resultInfo.useAt == 'N'}">미사용</c:if></td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td class="lt_text3" colspan=5>
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
		<input type="submit" onclick="fnRegist(); return false;" class="btn btn-primary" value="등록"/>
	</div>
</div>

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form>

<form name="Form" id="Form" method="post" action="">
	<input type=hidden name="codeId">
	<input type="submit" id="invisible" class="invisible"/>
</form>

</body>
</html>
