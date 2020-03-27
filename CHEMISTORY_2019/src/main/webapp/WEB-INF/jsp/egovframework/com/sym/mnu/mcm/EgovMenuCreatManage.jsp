<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
 /**
  * @Class Name : EgovMenuCreatManage.jsp
  * @Description : 메뉴생성관리 조회 화면
  */

  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/com/sym/mnu/mcm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/mnu/mcm/button/";
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
<script  language="javascript1.2" type="text/javaScript">
<!--
// 전체보기
$(document).on('click', '.btn-viewall.btn.btn-sm.btn-link', function(){
	$('.board-search-keyword').val('');
	document.menuCreatManageForm.pageIndex.value = 1;
	document.menuCreatManageForm.submit();
});


/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuCreatManageSelect(){
    document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>";
    document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.menuCreatManageForm.pageIndex.value = pageNo;
	document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>";
   	document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectMenuCreatManageList() {
	document.menuCreatManageForm.pageIndex.value = 1;
    document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>";
    document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 메뉴생성 화면 호출
 ******************************************************** */
function selectMenuCreat(vAuthorCode) {
	document.menuCreatManageForm.authorCode.value = vAuthorCode;
   	document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatSelect.do'/>";
   	document.menuCreatManageForm.submit();
}

function press() {
    if (event.keyCode==13) {
    	fncSelectAuthorList('1');
    }
}

if ("<c:out value="${resultMsg}" />" != "") {
	alert("<c:out value='${resultMsg}'/>");
}

-->
</script>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<body>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="menuCreatManageForm" action="<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>" method="post" >
<input type="hidden" name="authorCode"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="req_menuNo">

<div class="board-search">
	<!--  검색  -->
	<fieldset>
	<legend>목록 검색</legend>
	권한코드
	<input name="searchKeyword" type="text" value='<c:out value="${searchVO.searchKeyword}"/>' class="board-search-keyword" title="검색어 입력" onkeypress="press(event);">
	<input type="button" id="board-search-submit" class="btn btn-sm btn-default" onclick="selectMenuCreatManageList();" value="검색" />
	<input type="button" id="button" class="btn-viewall btn btn-sm btn-link" value="전체보기" />
	</fieldset>
</div>

<div class="board-list">
<table class="board-default">
	<colgroup>
		<col />
		<col style="width:20%" />
		<col style="width:20%" />
		<col style="width:100px;" />
		<col style="width:80px;" />
	</colgroup>
	<thead>
	  	<tr>
		    <th class="board-default-th-title">권한코드</th>
		    <th class="board-default-th-title">권한명</th>
		    <th class="board-default-th-">설명</th>
		    <th class="board-default-th-title">메뉴생성여부</th>
		    <th class="board-default-th-hit">메뉴생성</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="result" items="${list_menumanage}" varStatus="status">
			<tr <c:if test="${status.count % 2 == 1 }">class="bg"</c:if>>
				<td class="board-default-td-title"><c:out value="${result.authorCode}"/></td>
				<td class="board-default-td-title"><c:out value="${result.authorNm}"/></td>
				<td class="board-default-td-title"><c:out value="${result.authorDc}"/></td>
				<td class="board-default-td-date"><c:out value="${result.chkYeoBu gt 0 ? 'Y' : 'N'}" /></td>
				<td class="board-default-td-hit"><a href="javascript:selectMenuCreat('<c:out value="${result.authorCode}"/>');" class="btn btn-sm btn-primary">메뉴생성</a></td>
			</tr>
		</c:forEach>

		<c:if test="${fn:length(list_menumanage) == 0}">
			<tr class="bg">
				<td colspan="5">검색된 권한이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
	</table>
</div> 
</form>

<div class="board-footer">
	<div class="pagenavi">
	<ui:pagination paginationInfo="${paginationInfo}" type="image2" jsFunction="linkPage" />
	</div>
</div>
</body>
</html>

