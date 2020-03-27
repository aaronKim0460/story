<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#btn_close").click(function(){
		self.close();
	});
});
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_brdMstr('1');
		}
	}
	function fn_egov_select_brdMstr(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs/SelectBBSMasterInfsPop.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_brdMstrInfo(bbsId, bbsNm){
		var retVal = bbsId +"|"+bbsNm;
		parent.opener.document.boardUseInf.bbsId.value = bbsId;
		parent.opener.document.boardUseInf.bbsNm.value = bbsNm;
		parent.close();
	}
</script>
<title>게시판 정보</title>

<body>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="frm" action ="" method="post">
<input type="hidden" name="bbsId" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<div class="board-search">
	
	<fieldset>
		<legend>목록검색</legend>	
		<select name="searchCnd" class="board-search-select" title="검색조건선택" style="width:120px">
			<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >게시판명</option>
			<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >게시판유형</option>
		</select>
		<input name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' class="board-search-keyword" title="검색어 입력" onkeypress="press(event);" />
		<input type="submit" id="board-search-submit" class="btn btn-sm btn-default" onclick="javascript:fn_egov_select_brdMstr('1'); return false;" value="검색" />
	</fieldset>

</div>
	
<div class="board-list">
	<table class="board-default">
	 	<colgroup>
			<col style="width:8%;" />
			<col />
			<col style="width:12%;" />
			<col style="width:12%;" />
			<col style="width:12%;" />
			<col style="width:10%;" />
			<col style="width:8%;" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-hit">번호</th>
				<th class="board-default-th-title">게시판명</th>
				<th class="board-default-th-title">게시판유형</th>
				<th class="board-default-th-title">게시판속성</th>
				<th class="board-default-th-hit">생성일</th>
				<th class="board-default-th-hit">사용여부</th>
				<th class="board-default-th-hit">선택</th>
			</tr>
	 	</thead>
		<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td class="board-default-td-hit"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
				<td class="board-default-td-title"><c:out value="${result.bbsNm}"/></td>
				<td class="board-default-td-title"><c:out value="${result.bbsTyCodeNm}"/></td>
				<td class="board-default-td-title"><c:out value="${result.bbsAttrbCodeNm}"/></td>
				<td class="board-default-td-hit"><c:out value="${result.ntceDate}"/></td>
				<td class="board-default-td-hit">
					<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
					<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
				</td>
				<td class="board-default-td-hit">
					<input type="button" value="선택" onClick="fn_egov_select_brdMstrInfo('<c:out value="${result.bbsId}"/>','<c:out value="${result.bbsNm}"/>');" class="btn-sm btn-link" />
			 	</td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td class="lt_text3" nowrap colspan="7" ><spring:message code="common.nodata.msg" /></td>
			</tr>
			</c:if>
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_brdMstr" />
	</div>
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">
		<a id="btn_close" name="btn_close" href="#" class="btn btn-default">닫기</a>
	</div>
</div>

</form>
</body>
</html>
