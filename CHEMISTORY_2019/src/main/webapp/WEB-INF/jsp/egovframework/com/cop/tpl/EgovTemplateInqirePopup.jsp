<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_tmplatInfo('1');
		}
	}
	function fn_egov_select_tmplatInfo(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/tpl/selectTemplateInfsPop.do'/>";
		document.frm.submit();
	}

	function fn_egov_returnTmplatInfo(tmplatId, tmplatNm){
		var retVal = tmplatId +"|"+tmplatNm;
		parent.fn_egov_returnValue(retVal);
	}

</script>

<body>

<form name="frm" action ="<c:url value='/cop/tpl/selectTemplateInfsPop.do'/>" method="post">
<div class="board-search">
<input type="hidden" name="tmplatId" value="" />
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	<fieldset>
	<legend>목록검색</legend>	
		<select name="searchCnd" class="board-search-select" style="width:120px">
			<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >템플릿명</option>
			<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >템플릿구분</option>
		</select>
	    <input name="searchWrd" type="text" class="board-search-keyword" value="<c:out value='${searchVO.searchWrd}'/>" onkeypress="press(event);" />
		<input name="typeFlag" type="hidden" value="<c:out value='${typeFlag}'/>"/>
		<input type="submit" value="검색" onclick="fn_egov_select_tmplatInfo('1'); return false;" class="btn btn-sm btn-default" />
	</fieldset>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:10%" />
			<col style="width:30%" />
			<col style="width:20%" />
			<col style="width:30%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
			  <th class="board-default-th-no">번호</th>
			  <th class="board-default-th-title">템플릿명</th>
			  <th class="board-default-th-title">템플릿구분</th>
			  <th class="board-default-th-title">템플릿경로</th>
			  <th class="board-default-th-no">선택</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td class="board-default-td-no"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
				<td class="board-default-td-title"<c:out value="${result.tmplatNm}"/></td>
				<td class="board-default-td-title"><c:out value="${result.tmplatSeCodeNm}"/></td>
				<td class="board-default-td-title"><c:out value="${result.tmplatCours}"/></td>
				<td class="board-default-td-no">
			   		<c:if test="${result.useAt == 'Y'}">
					<input type="button" name="selectTmplat" value="선택" onClick="javascript:fn_egov_returnTmplatInfo('<c:out value="${result.tmplatId}"/>','<c:out value="${result.tmplatNm}"/>')" class="btn btn-sm btn-link"/>
					</c:if>
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
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_select_tmplatInfo" />
	</div>
</div>

<div class="text-center">
	<a href="#LINK" onclick="javascript:parent.close(); return false;" class="btn btn-default">닫기</a>
</div>

</form>

</body>
</html>
