<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>


<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
});

doAddNoxiousInsert = function(){	
	location.href = "<c:url value='/adm/contents/noxious/AddNoxiousList.do'/>";
};

doDeatil = function(idx){
	$("#idx").val(idx);
	document.listForm.action = "<c:url value='/adm/contents/noxious/detailEnviloNox.do'/>";
	document.listForm.submit();
};

doSearch = function(){
	$("#pageIndex").val(1);
	document.listForm.action = "<c:url value='/adm/contents/noxious/EnvilomentNoxiousList.do'/>";
    document.listForm.submit();
};
</script>

<style type="text/css">
.notPointer{
	cursor:default !important;
}
</style>

<body>
<h2 class="adminH2">환경 유해인자 DB</h2>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<div class="board-search">
<form id="listForm" name="listForm" method="post">
<input type="hidden" id="idx" name="idx" value=""/>
<input type="hidden" name="pageIndex" value="<c:if test="${empty srchVo.pageIndex }">1</c:if><c:if test="${!empty srchVo.pageIndex }"><c:out value='${srchVo.pageIndex}'/></c:if>">
<input type="hidden" name="searchCondition" value="1">

	<fieldset>
	<legend>목록검색</legend>
		물질명&nbsp;<input name="searchKeyword" type="text" value="<c:out value="${srchVo.searchKeyword}"/>" size="25" onkeypress="press();" id="searchKeyword" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="doSearch(); return false;" />
		<!-- <input type="button" id="button" class="btn-viewall btn btn-sm btn-link" value="전체보기" /> -->
	</fieldset>
</form>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:16%" />
			<col style="width:16%" />
			<col style="width:16%" />
			<col style="width:18%" />
			<col style="width:*" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">썸네일</th>
				<th class="board-default-th-title">물질 명</th>
				<th class="board-default-th-title"">영문</th>
				<th class="board-default-th-title">cas 번호</th>
				<th class="board-default-th-title">특성</th>				
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="env" items="${enviloList}" varStatus="status">
			<tr class="notPointer">
				<td class="board-default-td-no detailMove">
					<c:choose>
						<c:when test="${empty env.attachFileId}"></c:when>
						<c:otherwise><img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${env.attachFileId}'/>" width="30%" alt="썸네일이미지"/></c:otherwise>
					</c:choose>
				</td>	
				<td class="board-default-td-title" style="cursor: pointer;" onclick="doDeatil('<c:out value='${env.idx}'/>');"><c:out value='${env.kName}'/></td>
				<td class="board-default-td-title" style="cursor: pointer;" onclick="doDeatil('<c:out value='${env.idx}'/>');"><c:out value="${env.eName}"/></td>
				<td class="board-default-td-title"><c:out value="${env.cas}"/></td>
				<td class="board-default-td-title"><c:out value="${env.trait}"/></td>				
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(enviloList) == 0}">
			<tr>
				<td class="lt_text3" colspan="9">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<c:if test="${!empty srchVo.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
    </div>
</div>
</c:if>

<div class="board-detail-foot" style="text-align: center;">
	<div class="btns clear fr">	
		<a onclick="doAddNoxiousInsert(); return false;" class="btn btn-primary">등록</a>
 	</div>
</div>

<!-- <div class="t_center mt20" style="text-align: center;">
	<a href="javascript:doAddNoxiousInsert();" class="btn seablue">등록</a>
</div> -->

</body>
</html>

