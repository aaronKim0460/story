<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>


<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
});


function linkPage(pageNo){
    $("#pageIndex").val(pageNo);
    document.listForm.action = "<c:url value='/adm/contents/material/NoxiousInfoList.do'/>";
    document.listForm.submit();
};

doDeatil = function(sn){
	$("#rdIdx").val(sn);
	document.listForm.action = "<c:url value='/adm/contents/material/detailNoxiousInfo.do'/>";
	document.listForm.submit();
};

doSearch = function(){
	$("#pageIndex").val(1);
	document.listForm.action = "<c:url value='/adm/contents/material/NoxiousInfoList.do'/>";
    document.listForm.submit();
};

doList = function(){
	location.href = "<c:url value='/adm/contents/material/NoxiousInfoList.do'/>";
};

doAddNoxiousInfo = function(){
	location.href = "<c:url value='/adm/contents/material/addNoxiousInfo.do'/>";
};
</script>

<style type="text/css">
.notPointer{
	cursor:default !important;
}
</style>

<body>
<h2 class="adminH2">유해물질자료</h2>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<div class="board-search">
<form id="listForm" name="listForm" method="post">
<input type="hidden" name="rdIdx" id="rdIdx" value=""/>
<input type="hidden" id="pageIndex" name="pageIndex" value="<c:if test="${empty ivo.pageIndex }">1</c:if><c:if test="${!empty ivo.pageIndex }"><c:out value='${ivo.pageIndex}'/></c:if>">

	<fieldset>
		<legend>목록검색</legend>
		물질명&nbsp;
		<input name="searchKeyword" type="text" value="<c:out value="${ivo.searchKeyword}"/>" size="25" onkeypress="press();" id="searchKeyword" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="doSearch(); return false;" />
	</fieldset>
	
</form>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:10%" />
			<col style="width:10%" />
			<col style="width:*" />
			<col style="width:10%" />
			<col style="width:25%" />
			<col style="width:10%" />			
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">번호</th>
				<th class="board-default-th-title"">물질명</th>
				<th class="board-default-th-title">자료출처</th>
				<th class="board-default-th-title">자료형태</th>								
				<th class="board-default-th-title">노출원</th>								
				<th class="board-default-th-title">노출경로</th>								
			</tr>
		</thead>
		<tbody>			
			<c:forEach var="kvo" items="${list}" varStatus="status">
			<tr class="notPointer">
				<td class="board-default-td-no detailMove">
					<c:out value="${(ivo.pageIndex-1) * ivo.pageSize + status.count}"/>
				</td>	
				<td class="board-default-td-title" style="cursor: pointer;" onclick="doDeatil('<c:out value='${kvo.rdIdx}'/>');">
					<c:out value="${kvo.rdKname}"/>
				</td>
				<td class="board-default-td-title" style="cursor: pointer;" onclick="doDeatil('<c:out value='${kvo.rdIdx}'/>');">
					<c:choose>
						<c:when test="${kvo.rdSourceCh eq 'Y'}"><c:out value="${fn:substring(kvo.rdSource,0 ,40)}" escapeXml="false"/>...</c:when>
						<c:otherwise><c:out value="${fn:substring(kvo.rdSource,0,40)}"/>...</c:otherwise>
					</c:choose>
				</td>
				<td class="board-default-td-title">
					<c:if test="${not empty kvo.rdDataForm}">																
						<c:out value='${fn:substring(kvo.rdDataForm, 0, fn:length(kvo.rdDataForm) -1)}'/>																
					</c:if>				
				</td>
				<td class="board-default-td-title">
					<c:if test="${not empty kvo.rdOver}">																
						<c:out value='${fn:substring(kvo.rdOver, 0, fn:length(kvo.rdOver) -1)}'/>																
					</c:if>		
				</td>
				<td class="board-default-td-title">
					<c:if test="${not empty kvo.rdOverPath}">																
						<c:out value='${fn:substring(kvo.rdOverPath, 0, fn:length(kvo.rdOverPath) -1)}'/>																
					</c:if>	
				</td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(list	) == 0}">
			<tr>
				<td class="lt_text3" colspan="9" style="text-align: center;">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<c:if test="${!empty ivo.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
    </div>
</div>
</c:if>

<div class="board-detail-foot" style="text-align: center;">
	<div class="btns clear fr">
		<a onclick="doAddNoxiousInfo(); return false;" class="btn btn-primary">등록</a>		
	</div>
</div>

</body>
</html>

