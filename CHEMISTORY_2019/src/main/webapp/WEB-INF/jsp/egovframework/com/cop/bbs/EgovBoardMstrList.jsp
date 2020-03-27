<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript">
    //alert("EgovBoardMstrList.jsp");
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_brdMstr('1');
		}
	}

	function fn_egov_insert_addBrdMstr(){
		document.frm.action = "<c:url value='/cop/bbs/addBBSMaster.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_brdMstr(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>";
		document.frm.submit();
	}
	
	$(document).on('click', '.btn-viewall.btn.btn-sm.btn-link', function(){
		$("#siteId").val("");
		$('.board-search-keyword').val('');
		document.frm.pageIndex.value = 1;
		document.frm.submit();
	});

	function fn_egov_inqire_brdMstr(bbsId){
		document.frm.bbsId.value = bbsId;
		document.frm.action = "<c:url value='/cop/bbs/SelectBBSMasterInf.do'/>";
		document.frm.submit();
	}
	
	$(document).ready(function(){
		
		// 사이트 변경
		$("#siteId").change(function(){
			fn_egov_select_brdMstr('1');
		});
		
		// 상세보기
		$("tbody tr").click(function(){
			
			$(location).attr("href", "<c:url value='/cop/bbs/SelectBBSMasterInf.do'/>?bbsId="+$(this).attr("bId")+"&pageIndex=<c:out value='${searchVO.pageIndex}'/>&siteId=" + $("#siteId").val() + "&searchCnd=" + $("#searchCnd").val() + "&searchWrd=" + $("#searchWrd").val());
		});
		
		
	});
	
</script>

<body>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="frm" action="<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>" method="post" >
<input type="hidden" name="bbsId" />
<input type="hidden" name="trgetId" />
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
<div class="board-search">
	
	<fieldset>
		<legend>목록검색</legend>	
		<select id="siteId" name="siteId" class="board-search-select">
			<option value="" <c:if test="${searchVO.siteId == ''}">selected</c:if> >전체</option>
		
			<c:forEach var="siteList" items="${siteList}" varStatus="status">
				<option value="<c:out value='${siteList.code }'/>" <c:if test="${searchVO.siteId == siteList.code}">selected</c:if> ><c:out value='${siteList.codeNm }'/></option>
			</c:forEach>
		
		</select>	
   		<select name="searchCnd" id="searchCnd" class="board-search-select">
		   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >게시판명</option>
		   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >게시판유형</option>
		</select>
	    <input  name="searchWrd" id="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}" />' maxlength="35" onkeypress="press(event);" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="fn_egov_select_brdMstr('1'); return false;" />
		<input type="button" id="button" class="btn-viewall btn btn-sm btn-link" value="전체보기" />
	</fieldset>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:10%" />
			<col style="width:20%" />
			<col style="width:*" />
			<col style="width:10%" />
			<col style="width:10%" />
			<col style="width:10%" />
			<col style="width:8%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">번호</th>
				<th class="board-default-th-no">게시판ID</th>
				<th class="board-default-th-title">게시판명</th>
				<th class="board-default-th-no">게시판유형</th>
				<th class="board-default-th-no">게시판속성</th>
				<th class="board-default-th-no">생성일</th>
				<th class="board-default-th-no">사용여부</th>
				<th class="board-default-th-no">사이트</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr bId="<c:out value='${result.bbsId}'/>">
				<td class="board-default-td-no">
					<c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/>
				</td>
				<td class="board-default-th-title">
					<c:out value="${result.bbsId}"/>
				</td>
				<td class="board-default-th-title">
					<c:out value="${result.bbsNm}"/>
				</td>
				<td class="board-default-td-no">
					<c:out value="${result.bbsTyCodeNm}"/>
				</td>
				<td class="board-default-td-no">
					<c:out value="${result.bbsAttrbCodeNm}"/>
				</td>
				<td class="board-default-td-no">
					<c:out value="${result.ntceDate}"/>
				</td>
				<td class="board-default-td-no">
					<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
					<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
				</td>
				<td class="board-default-td-no">
					<c:out value='${result.codeNm }'/>
				</td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td class="lt_text3 board-default-td-no" nowrap colspan="8"><spring:message code="common.nodata.msg" /></td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image2" jsFunction="fn_egov_select_brdMstr" />
	</div>
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">	
		<a href="<c:url value='/cop/bbs/addBBSMaster.do'/>" onclick="fn_egov_insert_addBrdMstr(); return false;" class="btn btn-primary">등록</a>
 	</div>
</div>

</form>
</body>
</html>
