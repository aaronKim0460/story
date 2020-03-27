<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<style>
	.td-ellipsis {
	    max-width: 100px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
</style>

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
	
	// 출력갯수 조회 이벤트
	$("#printLimit").keyup(function(e){
		if(e.keyCode == 13)fnSearch();
	});
	
	// 오늘 날짜 설정
	$('#fromDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
	$('#toDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
	
	fnSearch();
	
});

// 조회
function fnSearch(){
	
	if($.trim($('#fromDate').val()) == "" && $.trim($('#toDate').val())){
		alert("조회기간이 지정되지 않았습니다.");
		return;
	}
	
	if($.trim($("#printLimit").val()) == "")$("#printLimit").val("10");
	
	url = "http://www.konetic.or.kr/main/etc/weweb/20080121/statistics_readCnt.asp"+ "?sDate="+$.trim($('#fromDate').val())+"&eDate="+$.trim($('#toDate').val())+"&pagesize="+$.trim($('#printLimit').val());	
	$("#redCnt_frame").attr('src', url);
	
	fnGetAjaxData("<c:url value='/sts/bst/selectBbsStatsList.do' />", "listForm", fnCBSearch, false);
	
}

// 조회 후처리
function fnCBSearch(dt){	
	
	// 조회수 
	if(dt != null && dt.readList != null && dt.readList.length > 0){			
		
		fnDrawChart(dt.readList, "조회수", "readChart", "#76A7FA");
		//$("#readChart").show();
		
	}else{
		
		$("#readChart").text("조회 결과가 없습니다.");
	}
	
	// 다운수
	if(dt != null && dt.downList != null && dt.downList.length > 0){
		
		fnDrawChart(dt.downList, "다운수", "downChart", "#F4F447");
		//$("#downChart").show();
		
	}else{
		
		$("#downChart").text("조회 결과가 없습니다.");
	}
	
	// 조회수 상위 게시물
	fnSetListData(dt.readListData, "readList");
	
	// 다운수 상위 게시물
	fnSetListData(dt.downListData, "downList");
	
}

// 차트 생성
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

// 상위 게시물 리스트
function fnSetListData(dt, objId){
	
	var strHtml = "";
	
	if(dt == null || dt.length < 1){
		$("#"+objId).html("<tr><td colspan='4'>검색된 통계 자료가 없습니다.</td></tr>");
		return;
	}
	
	for(var i in dt){
		strHtml += "<tr>" + 
			/* "<td class='board-default-td-no'>"+dt[i].siteNm+"</td>"+ */
			"<td class='board-default-td-title'>"+dt[i].bbsNm.replace("환경뉴스","해외환경뉴스")+"</td>" + 
			"<td class='board-default-td-title td-ellipsis'>"+dt[i].nttSj+"</td>" +
			"<td class='board-default-td-no'>"+dt[i].totRdcnt+"</td>"+
			"</tr>";
	}
	
	$("#"+objId).html(strHtml);
	
}

</script>

<body>
<h2 class="adminH2">게시물통계 <a href="http://211.252.157.84:7502/csa/main.do" target="_blank" style="float:right;"><input type="button" class="btn btn-sm btn-default" value="과거 자료 조회" /></a></h2>
<div style="overflow:auto; width:100%;">
	<div class="board-search2" style="min-width:800px;">
	<form id="listForm" name="listForm" method="post">
		<fieldset>
			<legend>게시물 통계 검색</legend>
			<table style="width: 800px; float:right;">
			<tr>
				<td style="padding-right:10px;">기간</td>
				<td><input name="fromDate" id="fromDate" type="text" class="search-date-picker" style="width:120px;" readonly="readonly" />
					<span class="search-date-span">~</span>
					<input name="toDate" id="toDate" type="text" class="search-date-picker" style="width:120px;" readonly="readonly" /></td>
				<%-- <td style="padding-right:10px;">사이트구분</td>
				<td>
			    	<form:select path="siteType" name="siteType" id="siteType" class="board-search-select" title="사이트구분명">
						<option value="">전체</option>
						<c:forEach var="siteResult" items="${siteType}" varStatus="status">
						<option value="<c:out value='${siteResult.code }'/>"><c:out value="${siteResult.codeNm}"/> </option>
						</c:forEach>
		        	</form:select>
				</td> --%>
				<td>구분</td>
				<td><select id="pdKind" name="pdKind" class="board-search-select" title="기간구분" >
						<option value='Y'>연도별</option>
						<option value='M'>월별</option>
						<option value='D'>일별</option>
					</select></td>
				<td>출력개수</td>
				<td>
					<input type="text" id="printLimit" name="printLimit" value="10" class="board-search-keyword" />
					<input id="btn_search" type="button" class="btn btn-sm btn-default" value="조회" />
				</td>
			</tr>
			</table>
		</fieldset>
	</form>
	</div>
	
	<div style="width:100%;height: 220px; min-width:800px;">
		<div id="readChart" style="width: 49%; height: 200px; float:left; text-align:center; line-height: 200px;"></div>
		<div id="downChart" style="width: 49%; height: 200px; float:right; text-align:center; line-height: 200px;"></div>
	</div>
	
	<div style="width:100%; min-width:800px; margin-top: 60px;">
		<div style="width: 49%;float:left;">
			<div class="board-list">
				<h2 class="title_left" style="padding-bottom: 10px;">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
				조회수 상위 게시물</h2>
				<table class="board-default">
					<colgroup>
						<!-- <col style="width:10%;" /> -->
						<col style="width:25%;" />
						<col />
						<col style="width:10%;" />
					</colgroup>
					<thead>
						<tr>
							<!-- <th class="board-default-th-no">사이트</th> -->
						   	<th class="board-default-th-title">게시판명</th>
						   	<th class="board-default-th-title">게시물 제목</th>
						   	<th class="board-default-th-no">조회수</th>
						 </tr>
					</thead>
					<tbody id="readList">
					</tbody>
				</table>
			</div>
		</div>
		<div style="width: 49%;float:right;">
			<div class="board-list">
				<h2 class="title_left" style="padding-bottom: 10px;">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
				다운수 상위 게시물</h2>
				<table class="board-default">
					<colgroup>
						<!-- <col style="width:10%;" /> -->
						<col style="width:25%;" />
						<col />
						<col style="width:10%;" />
					</colgroup>
					<thead>
						<tr>
							<!-- <th class="board-default-th-no">사이트</th> -->
						   	<th class="board-default-th-title">게시판명</th>
						   	<th class="board-default-th-title">게시물 제목</th>
						   	<th class="board-default-th-no">다운수</th>
						 </tr>
					</thead>
					<tbody id="downList">
		
					</tbody>
				</table>
			</div>
		</div>
		<div style="width: 49%;">
			<iframe src="http://www.konetic.or.kr/main/etc/weweb/20080121/statistics_readCnt.asp" name="redCnt_frame" id="redCnt_frame" width="100%" height="600" frameborder="0" marginwidth=0 marginheight=0 allowtransparency="true" title="국내환경뉴스 조회수 상위 게시물" /></iframe>
		</div>
	</div>	
</div>
</body>
</html>
