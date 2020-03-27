<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript">
    //alert("EgovBoardUseInfList.jsp");
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_bbsUseInfs('1');
		}
	}

	function fn_egov_select_bbsUseInfs(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/com/selectBBSUseInfs.do'/>";
		document.frm.submit();
	}
	
	$(document).on('click', '.btn-viewall.btn.btn-sm.btn-link', function(){
		$('.board-search-keyword').val('');
		document.frm.pageIndex.value = 1;
		document.frm.submit();
	});
	
	function fn_egov_insert_addbbsUseInf(){
		document.frm.action = "<c:url value='/cop/com/addBBSUseInf.do'/>";
		document.frm.submit();
	}
	
	function fn_egov_select_bbsUseInf(bbsId, trgetId){
		document.frm.bbsId.value = bbsId;
		document.frm.trgetId.value = trgetId;
		document.frm.action = "<c:url value='/cop/com/selectBBSUseInf.do'/>";
		document.frm.submit();
	}

</script>

<body>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="frm" method="post" action = "<c:url value='/cop/com/selectBBSUseInfs.do'/>" >
<input type="hidden" name="bbsId" value="<c:out value="${result.bbsId}"/>" />
<input type="hidden" name="trgetId" value="<c:out value="${result.trgetId}"/>" />
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />

<div class="board-search">

	<fieldset>
		<legend>목록검색</legend>	
   		<select name="searchUseAt" id="searchUseAt" class="board-search-select">
		   <option value="" <c:if test="${searchVO.searchUseAt == ''}">selected="selected"</c:if> >전체</option>
		   <option value="Y" <c:if test="${searchVO.searchUseAt == 'Y'}">selected="selected"</c:if> >사용</option>
		   <option value="N" <c:if test="${searchVO.searchUseAt == 'N'}">selected="selected"</c:if> >사용중지</option>
		</select>
		<select name="searchCnd" class="board-search-select">
			<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >게시판명</option>
			<c:if test="${useCommunity == 'true'}">
			<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >사용 커뮤니티명</option>
			<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >사용 동호회명</option>
			</c:if>
		</select>
	    <input name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}" />'  maxlength="35" onkeypress="press(event);" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="fn_egov_select_bbsUseInfs('1'); return false;" />
		<input type="button" id="button" class="btn-viewall btn btn-sm btn-link" value="전체보기" />
	</fieldset>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:10%" />
		  	<c:choose>
	    	<c:when test="${useCommunity == 'true'}">
			<col style="width:30%" />
			<col style="width:20%" />
			<col style="width:15%" />
			</c:when>
			<c:otherwise>
			<col style="width:65%" />
    		</c:otherwise>
	    	</c:choose>
			<col style="width:15%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">번호</th>
				<c:choose>
				<c:when test="${useCommunity == 'true'}">
				<th class="board-default-th-title">게시판명</th>
				<th class="board-default-th-title">사용 커뮤니티 명</th>
				<th class="board-default-th-title">사용 동호회 명</th>
				</c:when>
				<c:otherwise>
				<th class="board-default-th-title">게시판명</th>
				</c:otherwise>
				</c:choose>
				<th class="board-default-th-no">등록일시</th>
				<th class="board-default-th-no">사용여부</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td class="board-default-td-no">
					<c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/>
				</td>
				<c:choose>
				<c:when test="${useCommunity == 'true'}">
				<td class="board-default-td-title">
				<a href="#none" onclick="fn_egov_select_bbsUseInf('<c:out value='${result.bbsId}'/>', '<c:out value='${result.trgetId}'/>');">
				<c:out value="${result.bbsNm}"/>
				</a>
			  	</td>
				<td class="board-default-td-title"><c:out value="${result.cmmntyNm}"/></td>
				<td class="board-default-td-title"><c:out value="${result.clbNm}"/></td>
				</c:when>
				<c:otherwise>
				<td class="board-default-td-title">
				<a href="#none" onclick="fn_egov_select_bbsUseInf('<c:out value='${result.bbsId}'/>', '<c:out value='${result.trgetId}'/>');">
					<c:out value="${result.bbsNm}"/>
				</a>
				</td>
				</c:otherwise>
				</c:choose>
				<td class="board-default-th-no">
					<c:out value="${result.frstRegisterPnttm}"/>
				</td>
				<td class="board-default-th-no">
					<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
					<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
				</td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td colspan="6" style="text-align:center"><spring:message code="common.nodata.msg" /></td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image2" jsFunction="fn_egov_select_bbsUseInfs" />
	</div>
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">	
		<a href="<c:url value='/cop/com/addBBSUseInf.do'/>" onclick="fn_egov_insert_addbbsUseInf(); return false;" class="btn btn-primary">등록</a>
 	</div>
</div>

</form>
</body>
</html>
