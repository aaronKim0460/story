<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>


<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
});


function linkPage(pageNo){
    $("#pageIndex").val(pageNo);
    document.listForm.action = "<c:url value='/adm/contents/kidsGround/selectKidsGroundRelief.do'/>";
    document.listForm.submit();
};

doDeatil = function(sn){
	$("#crtfcSn").val(sn);
	document.listForm.action = "<c:url value='/adm/contents/kidsGround/detailKidsGroundRelief.do'/>";
	document.listForm.submit();
};

doSearch = function(){
	$("#pageIndex").val(1);
	document.listForm.action = "<c:url value='/adm/contents/kidsGround/selectKidsGroundRelief.do'/>";
    document.listForm.submit();
};

doExcelDownLoad = function(){	
	document.listForm.action = "<c:url value='/adm/contents/kidsGround/getSelectKidsGroundReliefExcel.do'/>";
    document.listForm.submit();
};

doExcelUpload = function(){
	var popupid = "excleUPload";
	var popupurl = "/adm/contents/kidsGround/doOpenExcelUploadReliefPopup.do";
	var feature = "left=" + "100" + ",top=" + "50" + ",width=" + "1024" + ",height=" + "500" + ",scrollbars=yes,location=no";
	window.open(popupurl, popupid, feature);
};

doList = function(){
	location.href = "adm/contents/kidsGround/selectKidsGroundRelief.do"
}
</script>

<style type="text/css">
.notPointer{
	cursor:default !important;
}
</style>

<body>

<div class="board-search" style="float: left; text-align: left;">
<h2 class="adminH2">어린이활동공간 환경안심인증현황</h2>
<form id="listForm" name="listForm" method="post">
<input type="hidden" id=crtfcSn name="crtfcSn" value=""/>
<input type="hidden" id="pageIndex" name="pageIndex" value="<c:if test="${empty krvo.pageIndex }">1</c:if><c:if test="${!empty krvo.pageIndex }"><c:out value='${krvo.pageIndex}'/></c:if>">

	<fieldset>
		<legend>목록검색</legend>
		시설유형&nbsp;
		<select id="searchArea" name="searchArea">
			<option value="">전체</option>
			<option value="FTC001" <c:if test="${krvo.searchArea == 'FTC001'}">selected="selected"</c:if>  >어린이놀이시설</option>
			<option value="FTC002" <c:if test="${krvo.searchArea == 'FTC002'}">selected="selected"</c:if>  >어린이집</option>
			<option value="FTC003" <c:if test="${krvo.searchArea == 'FTC003'}">selected="selected"</c:if>  >유치원</option>
			<option value="FTC004" <c:if test="${krvo.searchArea == 'FTC004'}">selected="selected"</c:if>  >특수학교</option>
			<option value="FTC005" <c:if test="${krvo.searchArea == 'FTC005'}">selected="selected"</c:if>  >초등학교</option>
			<option value="FTC006" <c:if test="${krvo.searchArea == 'FTC006'}">selected="selected"</c:if>  >초등학교 도서관</option>			
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
		<select name="searchCnd" id="searchCnd" class="board-search-select">					   
			<option value="fct" <c:if test="${krvo.searchCnd == 'fct'}">selected="selected"</c:if> >시설명</option>
			<option value="fix" <c:if test="${krvo.searchCnd == 'fix'}">selected="selected"</c:if> >인증번호</option>			
		</select>
		<input name="searchKeyword" type="text" value="<c:out value="${krvo.searchKeyword}"/>" size="25" onkeypress="press();" id="searchKeyword" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="doSearch(); return false;" />
	</fieldset>
	
</form>
</div>

<br/><br/>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>



<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:16%" />
			<col style="width:18%" />
			<col style="width:16%" />
			<col style="width:*" />
			<col style="width:16%" />			
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">순번</th>
				<th class="board-default-th-title">시설명</th>
				<th class="board-default-th-title"">시설유형</th>
				<th class="board-default-th-title">주소</th>								
				<th class="board-default-th-title">인증번호</th>								
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="kvo" items="${kvoList}" varStatus="status">
			<tr class="notPointer">
				<td class="board-default-td-no detailMove">
					<c:out value="${kvo.crtfcSn}"/>
				</td>	
				<td class="board-default-td-title" style="cursor: pointer;" onclick="doDeatil('<c:out value='${kvo.crtfcSn}'/>');"><c:out value='${kvo.fcltyNm}'/></td>
				<td class="board-default-td-title">
					<c:choose>
						<c:when test="${kvo.fcltyTy eq 'FTC001'}">어린이놀이시설</c:when>
						<c:when test="${kvo.fcltyTy eq 'FTC002'}">어린이집</c:when>
						<c:when test="${kvo.fcltyTy eq 'FTC003'}">유치원</c:when>
						<c:when test="${kvo.fcltyTy eq 'FTC004'}">특수학교</c:when>
						<c:when test="${kvo.fcltyTy eq 'FTC005'}">초등학교</c:when>
						<c:when test="${kvo.fcltyTy eq 'FTC006'}">초등학교 도서관</c:when>
					</c:choose>
				</td>
				<td class="board-default-td-title"><c:out value="${kvo.locplc}"/></td>			
				<td class="board-default-td-title"><c:out value="${kvo.crtfcNo}"/></td>			
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(kvoList) == 0}">
			<tr>
				<td class="lt_text3" colspan="9">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<c:if test="${!empty krvo.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
    </div>
</div>
</c:if>


<div class="board-detail-foot">
	<div class="btns clear fr">
		<input type="button" onclick="doExcelDownLoad(); return false;" class="btn btn-primary" value="엑셀 다운로드"/>
<!-- 		<input type="button" onclick="doExcelUpload(); return false;" class="btn btn-primary" value="엑셀 업로드 팝업"/> -->
	</div>
</div>

</body>
</html>

