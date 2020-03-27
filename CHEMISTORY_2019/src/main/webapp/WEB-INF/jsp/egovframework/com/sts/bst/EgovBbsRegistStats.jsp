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
	//아이프레임용 URL
	var url;
	
	if($.trim($('#fromDate').val()) == "" && $.trim($('#toDate').val())){
		alert("조회기간이 지정되지 않았습니다.");
		return;
	}
		
	if($.trim($("#printLimit").val()) == "")$("#printLimit").val("10");
	
	url = "http://www.konetic.or.kr/main/etc/weweb/20080121/statistics_bbsCnt.asp"+ "?sDate="+$.trim($('#fromDate').val())+"&eDate="+$.trim($('#toDate').val());	
	$("#bbsCnt_frame").attr('src', url);
	
	fnGetAjaxData("<c:url value='/sts/bst/selectBbsRegistStatsList.do' />", "listForm", fnCBSearch, false);
		
}

// 조회 후처리
function fnCBSearch(dt){
	
	//  게시판별 등록한 게시물 수
	fnSetListData(dt.readListData, "readList");
	
}

// 상위 게시물 리스트
function fnSetListData(dt, objId){
	
	var strHtml = "";
	
	if(dt == null || dt.length < 1){
		$("#"+objId).html("<tr><td colspan='2'>검색된 통계 자료가 없습니다.</td></tr>");
		return;
	}
	
	var totalCount = 0;
	
	for(var i in dt){
		strHtml += "<tr>" + 
			"<td class='board-default-td-title'>"+dt[i].menuNm+"</td>" + 
			"<td class='board-default-td-no'>"+dt[i].totalCount+"</td>"+
			"</tr>";
		totalCount = totalCount + dt[i].totalCount;
	}
	
	$("#"+objId).html(strHtml);
	$("#totalCount").text(totalCount);
}

</script>

<body>
<h2 class="adminH2">게시물등록통계</h2>
<div style="margin-top:40px">
		<div class="board-search" style="float:left; height:80px; text-align:left;">
		<form id="listForm" name="listForm" method="post">
			<fieldset>
				<legend>게시물 통계 검색</legend>
				<div style="height:30px;">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지" />
				기간 검색
				</div>
				<input name="fromDate" id="fromDate" type="text" class="search-date-picker" style="width:120px;" readonly="readonly" />
				 <span class="search-date-span">~</span>
				<input name="toDate" id="toDate" type="text" class="search-date-picker" style="width:120px;" readonly="readonly" />
				<input id="btn_search" type="button" class="btn btn-s+m btn-default" value="조회" style="margin:2px 0px 0px 4px;" />
			</fieldset>
		</form>
		</div>
		<div>
			<div class="board-list">
				<h2 class="title_left" style="padding-bottom: 10px; float:left;">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지" />
				조회 조건 별 게시물 수</h2>
				<div style="float:right;">
					총 : <span id="totalCount">0</span> 건이 등록되었습니다.
				</div>
				<table class="board-default">
					<colgroup>
						<col />
						<col style="width:25%;" />
					</colgroup>
					<thead>
						<tr>
						   	<th class="board-default-th-title">게시판명</th>
						   	<th class="board-default-th-title">게시물 수</th>
						 </tr>
					</thead>
					<tbody id="readList">
					</tbody>
				</table>
			</div>
			
			
			<iframe src="http://www.konetic.or.kr/main/etc/weweb/20080121/statistics_bbsCnt.asp" name="bbsCnt_frame" id="bbsCnt_frame" width="100%" height="300" frameborder="0" marginwidth=0 marginheight=0 allowtransparency="true" title="국내환경뉴스 게시물 수" /></iframe>
			
		</div>
		
		
		
	</div>	
</body>
</html>
