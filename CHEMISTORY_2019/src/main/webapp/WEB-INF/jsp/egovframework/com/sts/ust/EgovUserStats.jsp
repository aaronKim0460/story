<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript" src="<c:url value='/js/jsapi.js'/>"></script>
<script type="text/javaScript" language="javascript">

// 구글 차트
google.load("visualization", "1", {packages:["corechart"]});

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
	
	// 조회
	$("#btn_search").click(function(){
		fnSearch();
	});
	
	// 오늘 날짜 설정
	$('#fromDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
	$('#toDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
	
	fnSearch();

	
});

//조회
function fnSearch(){
	
	if($.trim($('#fromDate').val()) == "" && $.trim($('#toDate').val())){
		alert("조회기간이 지정되지 않았습니다.");
		return;
	}
	
	fnGetAjaxData("<c:url value='/sts/ust/selectUserStatsList.do' />", "listForm", fnCBSearch, false);
	
}

//조회 후처리
function fnCBSearch(dt){
	
	if(dt != null && dt.userList != null && dt.userList.length > 0){
		
		fnDrawChart(dt.userList, "사용자수", "userChart", "#76A7FA");
		
	}else{
		
		$("#userChart").text("조회 결과가 없습니다.");
	}
	
}

//차트 생성
function fnDrawChart(dt, title, objId, colorCode){
	
	var arr = new Array();
	var dtArr = new Array();
	
	arr.push(title);
	arr.push(title);
	arr.push({ role: "style" });
	dtArr.push(arr);
	
	for(var i in dt){
		
		arr = new Array();
		arr.push(dt[i].statsDate);
		arr.push(Number(dt[i].statsCo));
		arr.push(colorCode);
		
		dtArr.push(arr);
	}
	
	var data = google.visualization.arrayToDataTable(dtArr);
	
	var view = new google.visualization.DataView(data);

	var options = {
	  chart: {
	    title: title
	  },
	  colors:[colorCode]
	
	};

	var chart = new google.visualization.ColumnChart(document.getElementById(objId));
    chart.draw(view, options);
	
}

</script>

<body>

<div class="board-search">
<form id="listForm" name="listForm" method="post">

	<fieldset>
		<legend>사용자 통계 검색</legend>
		<table style="width: 600px; float:right;">
		<tr>
			<td style="padding-right:10px;">기간</td>
			<td><input name="fromDate" id="fromDate" type="text" class="search-date-picker" style="width:120px;" value="" readonly="readonly" />
				<span class="search-date-span">~</span>
				<input name="toDate" id="toDate" type="text" class="search-date-picker" style="width:120px;" value="" readonly="readonly" /></td>
			<td>회원유형</td>
			<td><select id="detailStatsKind" name="detailStatsKind" class="board-search-select" style="width: auto;" title="회원유형" >
					<option selected value=''>전체</option>
				    <c:forEach var="result" items="${COM012}" varStatus="status">
					<option value='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></option>
					</c:forEach>
			    </select></td>
			<td><input type="button" id="btn_search" class="btn btn-sm btn-default" value="검색" /></td>
		</tr>
		</table>
	</fieldset>

</form>
</div>

<div style="width:100%;height: 520px;">
	<div id="userChart" style="width: 98%; height: 100%; float:left; text-align:center; line-height: 500px;"></div>
</div>
		
</body>
</html>