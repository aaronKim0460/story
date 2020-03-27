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

	function fn_egov_insert_addTmplatInfo(){
		document.frm.action = "<c:url value='/cop/tpl/addTemplateInf.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_tmplatInfo(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/tpl/selectTemplateInfs.do'/>";
		document.frm.submit();
	}
	
	$(document).on('click', '.btn-viewall.btn.btn-sm.btn-link', function(){
		$('.board-search-keyword').val('');
		document.frm.pageIndex.value = 1;
		document.frm.submit();
	});
	
	function fn_egov_inqire_tmplatInfor(tmplatId){
		document.frm.tmplatId.value = tmplatId;
		document.frm.action = "<c:url value='/cop/tpl/selectTemplateInf.do'/>";
		document.frm.submit();
	}
</script>

<body>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="frm" action ="" method="post">
<input type="hidden" name="tmplatId" value="" />
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<div class="board-search">
	
	<fieldset>
	<legend>목록검색</legend>	
		<select name="searchCnd" class="board-search-select">
			<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >템플릿명</option>
			<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >템플릿구분</option>
		</select>
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="35" onkeypress="press(event);" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="javascript:fn_egov_select_tmplatInfo('1'); return false;" />
		<input type="button" id="button" class="btn-viewall btn btn-sm btn-link" value="전체보기" />
	</fieldset>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:10%" />
			<col style="width:15%" />
			<col style="width:10%" />
			<col style="width:32%" />
			<col style="width:10%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">번호</th>
				<th class="board-default-th-title">템플릿명</th>
				<th class="board-default-th-no">템플릿구분</th>
				<th class="board-default-th-title">템플릿경로</th>
				<th class="board-default-th-no">사용여부</th>
				<th class="board-default-th-no">등록일자</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td class="board-default-td-no">
					<c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/>
				</td>
				<td class="board-default-td-title">
					<a href="<c:url value='/cop/tpl/selectTemplateInf.do'/>?tmplatId=<c:out value='${result.tmplatId}'/>" onclick="">
					<c:out value="${result.tmplatNm}"/>
					</a>
				</td>
				<td class="board-default-td-no">
					<c:out value="${result.tmplatSeCodeNm}"/>
				</td>
				<td class="board-default-td-title">
					<c:out value="${result.tmplatCours}"/>
				</td>
				<td class="board-default-td-no">
					<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
					<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
				</td>
				<td class="board-default-td-no">
					<c:out value="${result.frstRegisterPnttm}"/>
				</td>
			</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td class="board-default-td-title" colspan="5">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
		
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_tmplatInfo" />
	</div>
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">	
		<input type="submit" value="등록" onclick="javascript:fn_egov_insert_addTmplatInfo();return false;" class="btn btn-primary" />
 	</div>
</div>

</form>
</body>
</html>
