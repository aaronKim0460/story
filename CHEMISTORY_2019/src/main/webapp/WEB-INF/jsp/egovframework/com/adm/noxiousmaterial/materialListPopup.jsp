<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>


<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	// 닫기 버튼 실행
	$("#btn_close").click(function(){
		self.close();
	});
});
// 페이지 이동하기
function linkPage(pageNo){
    $("#pageIndex2").val(pageNo);
    document.listForm.action = "<c:url value='/adm/contents/material/materialListPopup.do'/>";
    document.listForm.submit();
};

// 목록 검색하기
doSearch = function(){
	$("#pageIndex2").val(1);
	document.listForm.action = "<c:url value='/adm/contents/material/materialListPopup.do'/>";
    document.listForm.submit();
};

// 선택하기
doSelect = function (idx, kname, mcas) {
	var returnValue = {};
	returnValue = {
			id : idx,
			name : kname,
			cas : mcas
	}
	
	parent.opener.setMeterialValue(returnValue);
	parent.close();
};

</script>

<style type="text/css">
.notPointer{
	cursor:default !important;
}
</style>

<body>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<div class="board-search">
<form id="listForm" name="listForm" method="post">
<input type="hidden" id="envId" name="envId" value="${nVo.envId}"/>
<input type="hidden" id="matId" name="matId" value="${nVo.matId}"/>
<input type="hidden" id="idx" name="idx" value=""/>
<input type="hidden" id="kName" name="kName" value=""/>
<input type="hidden" id="pageIndex2" name="pageIndex2" value="<c:if test="${empty npVo.pageIndex2 }">1</c:if><c:if test="${!empty npVo.pageIndex2 }"><c:out value='${npVo.pageIndex2}'/></c:if>">
<input type="hidden" name="pageIndex" value="<c:if test="${empty nVo.pageIndex }">1</c:if><c:if test="${!empty nVo.pageIndex }"><c:out value='${nVo.pageIndex}'/></c:if>">
	<fieldset>
	<legend>목록검색</legend>
		<select name="searchCnd" id="searchCnd" class="board-search-select">		   
		   <option value="kor" <c:if test="${npVo.searchCnd == 'kor'}">selected="selected"</c:if> >물질명</option>
		   <option value="eng" <c:if test="${npVo.searchCnd == 'eng'}">selected="selected"</c:if> >영문명</option>
		   <option value="cas" <c:if test="${npVo.searchCnd == 'cas'}">selected="selected"</c:if> >cas번호</option>
		</select>
		<input name="searchKeyword" type="text" value="<c:out value="${npVo.searchKeyword}"/>" size="25" onkeypress="press();" id="searchKeyword" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="doSearch(); return false;" />		
	</fieldset>
</form>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:16%" />
			<col style="width:24%" />
			<col style="width:24%" />
			<col style="width:24%" />
			<col style="width:*" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">번호</th>
				<th class="board-default-th-title">물질 명</th>
				<th class="board-default-th-title"">영문</th>
				<th class="board-default-th-title">cas 번호</th>
				<th class="board-default-th-title">비고</th>				
			</tr>
		</thead>
		<tbody>			
			<c:forEach var="env" items="${npvolist}" varStatus="status">
			<tr class="notPointer">
				<td class="board-default-td-no detailMove"><c:out value="${(npVo.pageIndex2-1) * npVo.pageSize + status.count}"/></td>	
				<td class="board-default-td-title"><c:out value='${env.kName}'/></td>
				<td class="board-default-td-title"><c:out value="${env.eName}"/></td>
				<td class="board-default-td-title"><c:out value="${env.cas}"/></td>
				<td class="board-default-td-title"><a href="javascript:void(0);" onclick="doSelect('${env.idx}','${env.kName}','${env.cas}')" class="btn-sm btn-default"><c:out value="선택"/></a></td>				
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(npvolist) == 0}">
			<tr>
				<td class="lt_text3" colspan="9">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<c:if test="${!empty npVo.pageIndex2 }">
<div class="board-footer">
	<div class="pagenavi">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
    </div>
</div>
</c:if>

<div class="board-detail-foot">
	<div class="btns clear fr">
		<a id="btn_close" name="btn_close" href="#" class="btn btn-default">닫기</a>
	</div>
</div>

</body>
</html>

