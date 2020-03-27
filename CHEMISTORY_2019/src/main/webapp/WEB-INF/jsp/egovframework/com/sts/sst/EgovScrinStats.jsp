<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<link rel="stylesheet" href="<c:url value='/css/zTree/zTreeStyle.css' />" type="text/css">

<script type="text/javascript" src="<c:url value='/js/zTree/jquery.ztree.core-3.5.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/zTree/jquery.ztree.excheck-3.5.js' />"></script>

<script type="text/javascript" src="<c:url value='/js/jsapi.js'/>"></script>
<script type="text/javaScript" language="javascript">

var tempSearchStr = "";
var searchLength = 0;
var searchIdx = 0;

var setting = {
	check: {
		enable: false
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		onClick : fnSearch
	}	
};

var zNodes =[];

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
	
	// 메뉴명 찾기
	$("#btn_search_menu").click(function(){
		
		var searchStr = $("#searchStr").val();
		
		var zTree = $.fn.zTree.getZTreeObj("menuTree");		
		var nodeList = zTree.getNodesByParamFuzzy("name", searchStr);
		
		if(nodeList.length > 0){
			
			if(tempSearchStr == searchStr){
				searchIdx++;
			}else{
				searchIdx = 0;
			}
			
			if(searchIdx >= nodeList.length){
				searchIdx = 0;
			}
			
			zTree.selectNode(nodeList[searchIdx]);
			
			searchLength = nodeList.length;
			tempSearchStr = searchStr;
			
		}else{
			searchIdx = 0;
			searchLength = 0;
			tempSearchStr = "";
		}
		
		$("#searchStr").focus();
		
	});
	
	// 메뉴명 찾기 엔터 
	$("#searchStr").keyup(function(e){
		
		if(e.keyCode == 13 && $(this).val() != "")$("#btn_search_menu").click();
	});
	
	// 검색조건 변경
	$("#pdKind, #fromDate, #toDate").change(function(){
		
		fnSearch();
	});
	
	// 조회
	$("#btn_search").click(function(){
		fnSearch();
	});
	
	// 오늘 날짜 설정
	$('#fromDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
	$('#toDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
	
	// 메뉴 트리 생성
	fnGetMenuTree();
	
	//fnSearch();
	
});

function fnGetMenuTree(){
	
	fnGetSyncAjaxData("<c:url value='/sts/sst/menuTree.do'/>", "", fnCbSetMenuTree, false, "조회중입니다." );
} 

function fnCbSetMenuTree(data){
	
	zNodes = new Array(data.resultMap.length);

	for (var i = 0; i < data.resultMap.length ;i ++){

		zNodes[i] = {
				id:data.resultMap[i].menuNo,
				pId:data.resultMap[i].upperMenuNo,
				name:data.resultMap[i].menuNm,
				fileNm:data.resultMap[i].progrmFileNm
		};
	}
	
	$.fn.zTree.init($("#menuTree"), setting, zNodes);
}

// 조회
function fnSearch(){
	
	if($.trim($('#fromDate').val()) == "" && $.trim($('#toDate').val())){
		alert("조회기간이 지정되지 않았습니다.");
		return;
	}
	
	var selectNode = $.fn.zTree.getZTreeObj("menuTree").getSelectedNodes();
	
	if(selectNode == null || selectNode.length < 1)return;
	
	var detailStatsKind = selectNode[0].fileNm;
	
	if(detailStatsKind == "")return;
	
	$("#detailStatsKind").val(detailStatsKind);
	
	fnGetAjaxData("<c:url value='/sts/sst/getScrinStats.do' />", "listForm", fnCBSearch, false);
	
}

// 조회 후처리
function fnCBSearch(dt){
	
	// 조회수 
	if(dt != null && dt.viewList != null && dt.viewList.length > 0){
		
		fnDrawChart(dt.viewList, "페이지뷰", "viewChart", "#76A7FA");
		
	}else{
		
		$("#viewChart").text("조회 결과가 없습니다.");
	}
	
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

</script>
</head>
<body>
<h2 class="adminH2">화면상세통계</h2>
<div class="board-search">
<form id="listForm" name="listForm" method="post">
<input type="hidden" id="detailStatsKind" name="detailStatsKind" />
	<fieldset>
		<legend>화면 통계 검색</legend>
		<table style="width: 800px; float:right;">
		<tr>
			<td style="padding-right:10px;">기간</td>
			<td><input name="fromDate" id="fromDate" type="text" class="search-date-picker" style="width:120px;" readonly="readonly" />
				<span class="search-date-span">~</span>
				<input name="toDate" id="toDate" type="text" class="search-date-picker" style="width:120px;" readonly="readonly" /></td>
			<td>구분</td>
			<td><select id="pdKind" name="pdKind" class="board-search-select" title="기간구분" >
					<option value='Y'>연도별</option>
					<option value='M'>월별</option>
					<option value='W'>주별</option>
					<option value='D'>일별</option>
				</select></td>
			<td><input id="btn_search" type="button" class="btn btn-sm btn-default" value="조회" />
			</td>
		</tr>
		</table>
	</fieldset>

</form>
</div>

<div style="width:100%;">
	<div style="width: 20%; float:left;  margin-top: 100px;">
		<ul>
			<li>
				<input id="searchStr" name="searchStr" type="text" size="20"  maxlength="30" title="게시판명" />
		    	<a href="#" id="btn_search_menu" class="btn-sm btn-primary">찾기</a>
			</li>
		</ul>
		<ul id="menuTree" class="ztree" style="margin:0 auto; overflow-y:auto;"></ul>
	</div>
	<div id="viewChart" style="width: 78%; float:right; height:500px; text-align:center; line-height: 500px;"></div>
</div>
	
</body>
</html>
