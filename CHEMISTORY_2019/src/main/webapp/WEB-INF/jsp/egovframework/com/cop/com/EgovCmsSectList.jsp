<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
   	
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_userInfo('1');
		}
	}

	function fn_egov_select_sectInfo(pageIndex) {
		var _target = document.frm.targetMethod.value;
		document.frm.pageIndex.value = pageIndex;
		document.frm.action = "<c:url value='/cop/com/selectCmsSectList.do'/>";
		document.frm.submit();
	}

	function fn_egov_CmsSectDel(sectId) {

		if (confirm('삭제 하시겠습니까?')) {

			document.frm.sectCd.value = sectId;
			document.frm.action = "<c:url value='/cop/com/selectCmsSectDelete.do'/>";
			document.frm.submit();
		}
	}

	function fn_egov_registCmsSect(){

		if (confirm('<spring:message code="cop.reregist.msg" />')) {
			document.frm.action = "<c:url value='/cop/com/selectCmsSectRegist.do'/>";
			document.frm.submit();
		}
	}

	function fn_egov_CmsSectInqire(departId) {
		document.frm.departCd.value = departId;
		document.frm.action = "<c:url value='/cop/com/selectCmsSectDetailSelect.do'/>";
		document.frm.submit();
	}
</script>

<body>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="frm" action ="" method="post">
<input type="hidden" name="targetMethod" value="<c:out value='${targetMethod}'/>" />
<input type="hidden" name="trgetId" value="<c:out value='${trgetId}'/>" />
<input type="hidden" name="sectCd" />
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div class="board-search">
	<fieldset>
	<legend>목록검색</legend>	
		<select name="departCd" id="departCd" class="board-search-select" style="width:120px">
			<option value="" >선택</option> 
			<c:forEach var="departV" items="${ resultDptList}" varStatus="status">
			<option value="${departV.departCd }" <c:if test="${departV.departCd eq searchVO.departCd}">selected="selected"</c:if>>${departV.departNm }</option>
			</c:forEach>
		</select>
   		<select name="searchCnd" class="board-search-select">
		   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >과명</option>
		   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >과 영문명</option>
		</select>		
		<input name="searchWrd" type="text" class="board-search-keyword" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" />
		<input type="submit" id="board-search-submit" class="btn btn-sm btn-default" value="검색" onclick="javascript:fn_egov_select_sectInfo('1');return false;" />
</div>
		  
<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:8%" />
			<col style="width:12%" />
			<col style="width:12%" />
			<col style="width:30%" />
			<col  />
			<col style="width:8%" />
			<col style="width:8%" />
		</colgroup>
	 	<thead>
			<tr>
				<th class="board-default-th-no">번호</th>
				<th class="board-default-th-title">부서명</th>
				<th class="board-default-th-title">과 명</th>
				<th class="board-default-th-title">과 영문명</th>
				<th class="board-default-th-title">설명</th>
				<th class="board-default-th-title">순서</th>
				<th class="board-default-th-title">비고</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td class="board-default-td-no"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
				<td class="board-default-td-no" onclick="fn_egov_CmsSectInqire('<c:out value="${result.sectCd}"/>');"><c:out value="${result.departNm}" /></td>
				<td class="board-default-td-no" onclick="fn_egov_CmsSectInqire('<c:out value="${result.sectCd}"/>');"><c:out value="${result.sectNm}" /></td>
				<td class="board-default-td-no"><c:out value="${result.sectEng}" /></td>
				<td class="board-default-td-no"><c:out value="${result.stComment}" /></td>
				<td class="board-default-td-no"><c:out value="${result.staffOrdr}" /></td>
				<td class="board-default-td-no">
					<input type="button" value="삭제"  onClick="javascript:fn_egov_CmsSectDel('<c:out value="${result.sectCd}"/>')" class="btn btn-sm btn-warning" />
				</td>
			</tr>
			</c:forEach>
		 
		 	<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td class="lt_text3 board-default-td-no" nowrap colspan="7" ><spring:message code="common.nodata.msg" /></td>
			</tr>
		 	</c:if>

		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_sectInfo" />
	</div>
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">	
        <a href="<c:url value='/cop/com/selectCmsSectRegist.do'/>" class="btn btn-primary">등록</a>
	</div>
</div>

</form>
</body>
</html>
