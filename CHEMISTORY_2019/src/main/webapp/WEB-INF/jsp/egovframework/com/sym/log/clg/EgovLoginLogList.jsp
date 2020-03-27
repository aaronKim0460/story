<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript">
	function fn_egov_select_loginLog(pageNo){

		//alert(document.frm.loginMthdType.value);
		//document.frm.searchWrd.value = document.frm.loginMthdType.value;
		var fromDate = document.frm.searchBgnDe.value;
		var toDate = document.frm.searchEndDe.value;

		if(fromDate > toDate) {
	        alert("종료일자는 시작일자보다  이후날짜로 선택하세요.");
	        //return false;
	    } else {
			document.frm.pageIndex.value = pageNo;
			document.frm.action = "<c:url value='/sym/log/clg/SelectLoginLogList.do'/>";
			document.frm.submit();
	    }
	}

	function fn_egov_inqire_loginLog(logId){
		var url = "<c:url value='/sym/log/clg/InqireLoginLog.do' />?logId="+logId;

		var openParam = "scrollbars=yes,toolbar=0,location=no,resizable=0,status=0,menubar=0,width=750,height=240,left=0,top=0";
		window.open(url,"p_loginLogInqire", openParam);
	}
	
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

<body>
<h2 class="adminH2">접속로그조회</h2>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="frm" action ="<c:url value='/sym/log/clg/SelectLoginLogList.do'/>" method="post">
<div class="board-search">
<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
<input name="searchBgnDe" id="searchBgnDe"  type="hidden"  value="<c:out value='${searchVO.searchBgnDe}'/>">
<input name="searchEndDe" id="searchEndDe" type="hidden"  value="<c:out value='${searchVO.searchEndDe}'/>">

	<fieldset>
		<legend>게시물 통계 검색</legend>
		<table style="width: 800px; float:right;">
		<tr>
			<td style="padding-right:10px;">발생일자</td>
			<td><input name="searchBgnDeView" id="fromDate" value="" type="text" class="search-date-picker" style="width:120px;" readonly="readonly" />
				<span class="search-date-span">~</span>
				<input name="searchEndDeView" id="toDate" value="" type="text" class="search-date-picker" style="width:120px;" readonly="readonly" /></td>
			<td>로그유형
		  	<select name="searchWrd" id="searchWrd" class="board-search-select">
		  		<option value="">--선택--</option>
		  		<option value="I" <c:if test="${fn:trim(searchVO.searchWrd) =='I' }">selected</c:if>>로그인</option>
		  		<option value="O" <c:if test="${fn:trim(searchVO.searchWrd) =='O' }">selected</c:if>>로그아웃</option>
		  	</select>			
			<input type="submit" id="board-search-submit" class="btn btn-sm btn-default" onclick="javascript:fn_egov_select_webLog('1');return false;" value="검색"></span>
			</td>
		</tr>
		</table>
	</fieldset>
</div>
	
<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:5%" />
			<col />
			<col style="width:30%" />
			<col style="width:11%" />
			<col style="width:11%" />
			<col style="width:14%" />
		</colgroup>
 		<thead>
			<tr>
				<!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
				<th class="board-default-th-no">번호</th>
				<th class="board-default-th-no">로그ID</th>
				<th class="board-default-th-no">발생일자</th>
				<th class="board-default-th-no">로그유형</th>
				<th class="board-default-th-no">요청자</th>
				<th class="board-default-th-no">요청자IP</th>
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
				<!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
				<td class="board-default-td-no"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
				<td class="board-default-td-no"><c:out value="${result.logId}"/></td>
				<td class="board-default-td-no"><c:out value="${result.creatDt}"/></td>
				<td class="board-default-td-no">
				<c:choose>
				<c:when test="${fn:trim(result.loginMthd) == 'I' }">
					로그인
				</c:when>
				<c:otherwise>
					로그아웃
				</c:otherwise>
				</c:choose>
				</td>
			    <td class="board-default-td-no"><c:out value="${result.loginNm}"/></td>
			    <td class="board-default-td-no"><c:out value="${result.loginIp}"/></td>
			    <!--<td class="lt_text3" nowrap>
			    <a href="javascript:fn_egov_inqire_loginLog('<c:out value="${result.logId}"/>');"
			    	style="selector-dummy:expression(this.hideFocus=false);">
			    	<img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif'/>"
			    	     alt="상세보기"	width="15" height="15" align="middle"></a>
			    </td>-->
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_loginLog" />
	</div>
</div>

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	
</form>
</body>
</html>
