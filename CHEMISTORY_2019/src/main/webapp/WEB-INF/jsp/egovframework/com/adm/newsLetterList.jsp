<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>


<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
});

function linkPage(pageNo){
    $("#pageIndex").val(pageNo);
    document.listForm.action = "<c:url value='/user/comn/newsLetterList.do'/>";
    document.listForm.submit();
};

doSearch = function(){
	$("#pageIndex").val(1);
	document.listForm.action = "<c:url value='/user/comn/newsLetterList.do'/>";
    document.listForm.submit();
};

doExcelDownLoad = function(){	
	document.listForm.action = "<c:url value='/adm/contents/kidsGround/getSelectKidsGroundCurrentExcel.do'/>";
	document.listForm.action = "<c:url value='/user/comn/newsLetterListExcel.do'/>";
    document.listForm.submit();
};

doDeatil = function(sn){
	$("#fcltySn").val(sn);
	document.listForm.action = "<c:url value='/adm/contents/kidsGround/detailKidsGroundCurrent.do'/>";
	document.listForm.submit();
};
doExcelUpload = function(){
	var popupid = "excleUPload";
	var popupurl = "/adm/contents/kidsGround/doOpenExcelUploadPopup.do";
	var feature = "left=" + "100" + ",top=" + "50" + ",width=" + "1024" + ",height=" + "500" + ",scrollbars=yes,location=no";
	window.open(popupurl, popupid, feature);
};

doList = function(){
	location.href = "<c:url value='/user/comn/newsLetterList.do'/>";
}
</script>

<style type="text/css">
.notPointer{
	cursor:default !important;
}
</style>

<body>
<h2 class="adminH2">뉴스레터신청조회목록</h2>
<div class="board-search" style="float: right; text-align: right;">
<form id="listForm" name="listForm" method="post">
<!-- <input type="hidden" id=fcltySn name="fcltySn" value=""/> -->
<input type="hidden" id="pageIndex" name="pageIndex" value="<c:if test="${empty nlvo.pageIndex }">1</c:if><c:if test="${!empty nlvo.pageIndex }"><c:out value='${nlvo.pageIndex}'/></c:if>">

	<fieldset>
		<legend>목록검색</legend>
		<input name="searchKeyword" type="text" value="<c:out value="${nlvo.searchKeyword}"/>" size="25" onkeypress="press();" id="searchKeyword" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="doSearch(); return false;" />
	</fieldset>
	
</form>
</div>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>



<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:10%" />
			<col style="width:*" />			
			<col style="width:25%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">번호</th>
				<th class="board-default-th-title">e-mail</th>
				<th class="board-default-th-title">신청일자</th>
				<th class="board-default-th-title">신청여부</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="nlvo" items="${nlvoList}" varStatus="status">
			<tr class="notPointer">
				<td class="board-default-td-no detailMove">
					<c:out value="${paginationInfo.totalRecordCount - (paginationInfo.currentPageNo * 10 + status.index) + 10}"/>
				</td>	
				<td class="board-default-td-title"> <c:out value='${nlvo.email}'/></td>
				<td class="board-default-td-title"> <c:if test="${nlvo.useAt eq 'Y'}"><c:out value="${nlvo.firstRegistPnttm}"/></c:if><c:if test="${nlvo.useAt eq 'N'}"><c:out value="${nlvo.lastUpdtPnttm}"/></c:if></td>
				<td class="board-default-td-title"> <c:out value="${nlvo.useAt}"/></td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(nlvoList) == 0}">
			<tr>
				<td class="lt_text3" colspan="9">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<c:if test="${!empty nlvo.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
    </div>
</div>
</c:if>

<div class="t_center mt20">
		<a href="javascript:doExcelDownLoad();" class="btn seablue">엑셀 다운로드</a>
</div>

</body>
</html>

