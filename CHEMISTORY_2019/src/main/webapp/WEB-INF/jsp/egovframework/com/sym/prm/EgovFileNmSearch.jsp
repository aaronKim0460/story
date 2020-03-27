<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<%
  String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/prm/button/";
%>

<script language="javascript1.2"  type="text/javaScript">
<!--

function linkPage(pageNo){
	document.progrmManageForm.pageIndex.value = pageNo;
	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListSearch.do'/>";
   	document.progrmManageForm.submit();
}

function selectProgramListSearch() {
	document.progrmManageForm.pageIndex.value = 1;
	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListSearch.do'/>";
	document.progrmManageForm.submit();
}

/* ********************************************************
 * 프로그램목록 선택 처리 함수
 ******************************************************** */
function choisProgramListSearch(vFileNm) {
	//eval("opener.document.all."+opener.document.all.tmp_SearchElementName.value).value = vFileNm;
	//opener.document.menuManageVO.progrmFileNm.value = vFileNm;
	var parentFrom = opener.document.getElementsByTagName('form');
	parentFrom[0].progrmFileNm.value = vFileNm;
	
	try{
		opener.$("#progrmFileNm").change();
	}catch(e){}
    window.close();
}
-->
</script>

<body>
<form name="progrmManageForm" action ="<c:url value='/sym/prm/EgovProgramListSearch.do'/>" method="post">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div class="board-search">
	
	<fieldset>
		<legend>목록검색</legend>
		<select name="searchCnd" class="board-search-select" style="width:120px">
			<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >프로그램명</option>
			<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >파일명</option>
		</select>
		<input name="searchKeyword" type="text" class="board-search-keyword" value="<c:out value='${searchVO.searchKeyword}'/>"  maxlength="60" >
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="selectProgramListSearch(); return false;">
           
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:30%" />
			<col style="width:70%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-title">프로그램파일명</th>
				<th class="board-default-th-title">프로그램명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${list_progrmmanage}" varStatus="status">
			<tr>
				<td class="board-default-td-title">
					<a href="" onclick="choisProgramListSearch('<c:out value="${result.progrmFileNm}"/>'); return false;">
						<c:out value="${result.progrmFileNm}"/>
					</a>
				</td>
				<td class="board-default-td-title">
					<a href="" onclick="choisProgramListSearch('<c:out value="${result.progrmFileNm}"/>'); return false;">
						<c:out value="${result.progrmKoreanNm}"/>
					</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo = "${paginationInfo}"	type="image" jsFunction="linkPage"/>
	</div>
</div>

</form>
</body>
</html>
