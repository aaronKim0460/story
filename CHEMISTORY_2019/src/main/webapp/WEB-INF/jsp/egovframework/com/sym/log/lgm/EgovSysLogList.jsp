<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
<head>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>" ></script>
<script type="text/javascript">
function fn_egov_select_sysLog(pageNo){
	var fromDate = document.frm.searchBgnDe.value;
	var toDate = document.frm.searchEndDe.value;

	if(fromDate > toDate) {
        alert("종료일자는 시작일자보다  이후날짜로 선택하세요.");
        return false;
    } else {
			document.frm.pageIndex.value = pageNo;
			document.frm.action = "<c:url value='/sym/log/lgm/SelectSysLogList.do'/>";
			document.frm.submit();
    }
};

function fn_egov_inqire_sysLog(requstId){
	var url = "<c:url value='/sym/log/lgm/InqireSysLog.do' />?requstId="+requstId;
	var openParam = "scrollbars=yes,toolbar=0,location=no,resizable=0,status=0,menubar=0,width=750,height=500,left=0,top=0";
	window.open(url,"p_sysLogInqire", openParam);
};

$(document).ready(function(){

	$("#fromDate").datepicker({
		onClose: function( selectedDate ) {
			if($("#toDate").val() == "" || $(this).val() == "") return;
			
			if($(this).val().replaceAll("-", "") > $("#toDate").val().replaceAll("-", "")){
				alert("기간 시작일이 종료일보다 이후일 수 없습니다.");
				$(this).val("");
				return;
			}
		}
	});
	
	$("#toDate").datepicker({
		onClose: function( selectedDate ) {
			if($("#fromDate").val() == "" || $(this).val() == "")return;
			
			if($(this).val().replaceAll("-", "") < $("#fromDate").val().replaceAll("-", "")){
				alert("기간 종료일이 시작일보다 이전일 수 없습니다.");
				$(this).val("");
				return;
			}
		}
	});
	
	$("#fromDate").change(function(){
		var date = ($.trim($(this).val())).replaceAll("-","");
		$("#searchBgnDe").val(date);
	});		
	$("#toDate").change(function(){
		var date = ($.trim($(this).val())).replaceAll("-","");
		$("#searchEndDe").val(date);
	});			
	
	<c:if test="${not empty searchVO.searchBgnDe}">
	$('#fromDate').val('<c:out value='${fn:substring(searchVO.searchBgnDe, 0, 4)}'/>-<c:out value='${fn:substring(searchVO.searchBgnDe, 4, 6)}'/>-<c:out value='${fn:substring(searchVO.searchBgnDe, 6, 8)}'/>');
	</c:if>

	<c:if test="${not empty searchVO.searchEndDe}">
	$('#toDate').val('<c:out value='${fn:substring(searchVO.searchEndDe, 0, 4)}'/>-<c:out value='${fn:substring(searchVO.searchEndDe, 4, 6)}'/>-<c:out value='${fn:substring(searchVO.searchEndDe, 6, 8)}'/>');
	</c:if>		
});
</script>
</head>

<body>
<h2 class="adminH2">로그조회</h2>
<div style="overflow:auto; width:100%;">
	<form name="frm" action ="<c:url value='/sym/log/lgm/SelectSysLogList.do'/>" method="post">
	<div class="board-search2" style="min-width:900px;">
	<input name="searchBgnDe" id="searchBgnDe"  type="hidden"  value="<c:out value='${searchVO.searchBgnDe}'/>">
	<input name="searchEndDe" id="searchEndDe" type="hidden"  value="<c:out value='${searchVO.searchEndDe}'/>">
	
		<fieldset>
			<legend>게시물 통계 검색</legend>
			<table style="width: 700px; float:right;">
			<tr>
				<td style="padding-right:10px;">발생일자</td>
				<td><input name="searchBgnDeView" id="fromDate" value="" type="text" class="search-date-picker" style="width:120px;" readonly="readonly" />
					<span class="search-date-span">~</span>
					<input name="searchEndDeView" id="toDate" value="" type="text" class="search-date-picker" style="width:120px;" readonly="readonly" /></td>
				<td>처리구분
			  	<input name="searchWrd" type="text" size="15" class="board-search-keyword" value="<c:out value='${searchVO.searchWrd}'/>"  maxlength="15" id="searchWrd" title="검색단어입력" />			
				<input type="submit" id="board-search-submit" class="btn btn-sm btn-default" onclick="javascript:fn_egov_select_webLog('1');return false;" value="검색"></span>
				</td>
			</tr>
			</table>
		</fieldset>
	</div>
		
	<div class="board-list" style="min-width:900px; clear:both;">
		<div class="board-pages">
			<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
			<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
		</div>
		<table class="board-default">
			<colgroup>
				<col style="width:5%" />			
				<col style="width:10%" />
				<col style="width:35%" />
				<col style="width:10%" />
				<col style="width:10%" />
				<col style="width:10%" />
				<!-- <col style="width:5%" /> -->
			</colgroup>
	 		<thead>
				<tr>
					<th class="board-default-th-no">번호</th>				
					<th class="board-default-th-no">발생일자</th>
					<th class="board-default-th-no">메소드명</th>
					<th class="board-default-th-no">처리구분</th>
					<th class="board-default-th-no">요청자ID</th>
					<th class="board-default-th-no">요청자이름</th>
					<!-- <th class="board-default-th-no">상세보기</th> -->
				</tr>
			</thead>
				
				<c:if test="${fn:length(resultList) == 0}">
				<tr>
				<td class="lt_text3" colspan="7">
					<spring:message code="common.nodata.msg" />
				</td>
				</tr>
				</c:if>
				
			<tbody>	
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td class="board-default-td-no"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>				
					<td class="board-default-td-no"><c:out value="${result.occrrncDe}"/></td>
					<td class="board-default-td-title"><c:out value="${result.methodNm}"/></td>
					<td class="board-default-td-no"><c:out value="${result.processSeCodeNm}"/></td>
					<td class="board-default-td-no"><c:out value="${result.userId}"/></td>
					<td class="board-default-td-no"><c:out value="${result.rqsterNm}"/></td>
					<%-- <td class="board-default-td-no">
						<a href="#noscript" onclick="fn_egov_inqire_sysLog('<c:out value="${result.requstId}"/>'); return false;"
					    	style="selector-dummy:expression(this.hideFocus=false);">
					    	<img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif'/>"  alt="상세보기(새창)"
					    	width="15" height="15" style="vertical-align: middle">
				    	</a>
					</td> --%>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="board-footer">
		<div class="pagenavi">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_sysLog" />
		</div>
	</div>
	
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	
	</form>
</div>
</body>
</html>
