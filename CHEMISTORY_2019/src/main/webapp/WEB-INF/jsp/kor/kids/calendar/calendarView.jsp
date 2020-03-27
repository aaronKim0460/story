<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
	
	// enter로 검색하기
	function press(event) {
		if (event.keyCode==13) {
			fn_search_list();
		}
	}

	// 목록 이동하기
	function fn_move_select_List() {
		$('#frmList').attr("action","<c:url value='/user/com/kids/calender/calenderList.do'/>");
		$('#frmList').submit();
	}
	
	function fn_search_list() {
		$('#frm').attr("action","<c:url value='/user/com/kids/calender/calenderView.do'/>");
		$('#frm').submit();
	}

	// 셀렉트박스 연도 설정
	function setSrchYear() {
		var now = new Date();
		var currentYear = now.getFullYear();
		var srchYear = '<c:out value="${calenderVO.srchYear}" />';
		
		var html = [];
		for (var i = 2010; i <= currentYear + 1; i++) {
			if (srchYear == i) {
				html.push("<option value='" + i + "' selected='selected'>" + i + "</option>");
			} else {
				html.push("<option value='" + i + "' >" + i + "</option>");
			}
		}
		$("#srchYear").append(html.join(""));
	}
	
	// 상세내용 보기
	function fn_detail_view(key) {
		$("[id^='id_']").hide();
		$(".popupLayout").show();
		$("#id_"+key).show();
	}
	
	// 상세 내용 닫기
	function fn_close_detail() {
		$("[id^='id_']").hide();
		$(".popupLayout").hide();
	}
	
	// 상세 내용 텍스트 데이터 세팅
	function setContentsData() {
		$("input[name='content']").each(function() {
			var element = jQuery(this);
			element.closest("dd").find(".showTextArea").html(element.val().replace(/\n/g, "<br>"));
		})
	}
	
	$(document).ready(function(){
		setSrchYear();
		
		setContentsData();
		
		$('#calendar').fullCalendar({
			header: {
				left: '',
				center: 'prev,title,next',
				right: '',
			},
			editable: false,
			events: [
				<c:forEach var="row" items="${resultList}" varStatus="i">
					<c:choose>
						<c:when test="${i.count eq 1}">
							{
								title : "(<c:out value="${row.gubun}" />)<c:out value="${row.title}" escapeXml='false'/>",
								start: new Date('<c:out value="${fn:substring(row.sDate,0,4)}"/>',<c:out value="${fn:substring(row.sDate,5,7)}"/>-1,'<c:out value="${fn:substring(row.sDate,8,10)}"/>'),
								end: new Date('<c:out value="${fn:substring(row.eDate,0,4)}"/>',<c:out value="${fn:substring(row.eDate,5,7)}"/>-1,'<c:out value="${fn:substring(row.eDate,8,10)}"/>'),
								url : 'javascript:fn_detail_view("<c:out value="${row.idx}"/>");'
								<c:choose>
									<c:when test="${row.gubun == '교육'}">
										, borderColor : '#5bb2d8', backgroundColor : '#50bbe9', textColor: '#ffffff'
									</c:when>
									<c:when test="${row.gubun == '행사'}">
										, borderColor : '#ed807f', backgroundColor : '#f58a89', textColor: '#ffffff'
									</c:when>
									<c:when test="${row.gubun == '세미나'}">
										, borderColor : '#31adac', backgroundColor : '#41b9b8', textColor: '#ffffff'
									</c:when>
									<c:when test="${row.gubun == '공모전'}">
										, borderColor : '#e79c5e', backgroundColor : '#f7af73', textColor: '#ffffff'
									</c:when>
									<c:otherwise>
										, borderColor : '#9e61e7', backgroundColor : '#b176f7', textColor: '#ffffff'
									</c:otherwise>
								</c:choose>
							}
						</c:when>
						<c:otherwise>
							,{
								title : "(<c:out value="${row.gubun}" />)<c:out value="${row.title}" escapeXml='false'/>",
								start: new Date('<c:out value="${fn:substring(row.sDate,0,4)}"/>',<c:out value="${fn:substring(row.sDate,5,7)}"/>-1,'<c:out value="${fn:substring(row.sDate,8,10)}"/>'),
								end: new Date('<c:out value="${fn:substring(row.eDate,0,4)}"/>',<c:out value="${fn:substring(row.eDate,5,7)}"/>-1,'<c:out value="${fn:substring(row.eDate,8,10)}"/>'),
								url : 'javascript:fn_detail_view("<c:out value="${row.idx}"/>");'
								<c:choose>
									<c:when test="${row.gubun == '교육'}">
										, borderColor : '#5bb2d8', backgroundColor : '#50bbe9', textColor: '#ffffff'
									</c:when>
									<c:when test="${row.gubun == '행사'}">
										, borderColor : '#ed807f', backgroundColor : '#f58a89', textColor: '#ffffff'
									</c:when>
									<c:when test="${row.gubun == '세미나'}">
										, borderColor : '#31adac', backgroundColor : '#41b9b8', textColor: '#ffffff'
									</c:when>
									<c:when test="${row.gubun == '공모전'}">
										, borderColor : '#e79c5e', backgroundColor : '#f7af73', textColor: '#ffffff'
									</c:when>
									<c:otherwise>
										, borderColor : '#9e61e7', backgroundColor : '#b176f7', textColor: '#ffffff'
									</c:otherwise>
								</c:choose>
							}
						</c:otherwise>
					</c:choose>
				</c:forEach>
			]
		});
		
		$('#calendar').fullCalendar('gotoDate',<c:out value="${calenderVO.srchYear}"/>,(<c:out value="${calenderVO.srchMonth}"/>-1));
		
		$('.fc-text-arrow').parent().click(function(){
			return false;
			var yearData = $('.fc-header-title h2').text().split('년')[0];
			var monthData = $('.fc-header-title h2').text().split('년')[1].replace('월', '').trim();
			$('[name=srchYear]').val(yearData);
			$('[name=srchMonth]').val(monthData);
			
			fn_search_list();	
		});
	});
	
	function cDataS(n){
		var clickTab = n;
		var gijun = 0;
		var yearData = Number($('.fc-header-title h2').text().split('년')[0]);
		var monthData = Number($('.fc-header-title h2').text().split('년')[1].replace('월', '').trim());
		
		if(clickTab == 'prev'){
			if(monthData == 1){
				yearData = yearData - 1; 
				monthData = 12;
			}else{
				monthData = monthData - 1;
			}
			
		}else{				
			if(monthData == 12){
				yearData = yearData + 1; 
				monthData = 1;
			}else{
				monthData = monthData + 1;
			}
		}
		
		$('[name=srchYear]').val(yearData);
		$('[name=srchMonth]').val(monthData < 10 ? '0' + String(monthData) : String(monthData));
		
		fn_search_list();	
	};

	function fn_click_today(){
		var now = new Date();
		var yearData = now.getFullYear();
		var monthData = now.getMonth() + 1;
		
		$('[name=srchYear]').val(yearData);
		$('[name=srchMonth]').val(monthData < 10 ? '0' + String(monthData) : String(monthData));
		
		fn_search_list();	
	}
</script>
<link href='/css/old/fullcalendar.css' rel='stylesheet' />
<link href='/css/old/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/js/old/fullcalendar.js'></script>
</head>
<body>
<div id="contents" class="con3">
	<div class="tableBtn clearfix">
		<!-- 
		<div class="contentTab">
			<ul class="Tab01">
				<li><a class="on" href="javascript:fn_move_calendarView();">달력보기</a></li>
				<li><a href="javascript:fn_move_select_List();">목록 보기</a></li>
			</ul>
		</div>
		-->
		<form name="frm" id="frm" method="post">
			<div class="btn_right">
				<div class="board_search">
					<input type="hidden" name="CalendarViewYn" id="CalendarViewYn" value="Y" />
					<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
					<fieldset>
						<legend>달력 검색</legend>
						<span>
							<select name="srchYear" id="srchYear" class="select_list">
							</select>
						</span>
						<span>
							<select name="srchMonth" class="select_list">
								<c:set var="monthValue" />
								<c:forEach var="row" begin="1" end="12" step="1" varStatus="i">
									<c:choose>
										<c:when test="${i.count lt 10}">
											<c:set var="monthValue" value="0${i.count}" />
										</c:when>
										<c:otherwise>
											<c:set var="monthValue" value="${i.count}" />
										</c:otherwise>
									</c:choose>
									<option value="<c:out value="${monthValue}" />" <c:if test="${monthValue eq calenderVO.srchMonth}"> selected="selected"</c:if>><c:out value="${monthValue}" /></option>
								</c:forEach>
							</select>
						</span>
						<span>
							<select name="srchGubun" class="select_list">
								<option value="">구분</option>
								<option value="교육" <c:if test="${calenderVO.srchGubun == '교육'}">selected="selected"</c:if>>교육</option>
								<option value="행사" <c:if test="${calenderVO.srchGubun == '행사'}">selected="selected"</c:if>>행사</option>
								<option value="세미나" <c:if test="${calenderVO.srchGubun == '세미나'}">selected="selected"</c:if>>세미나</option>
								<option value="공모전" <c:if test="${calenderVO.srchGubun == '공모전'}">selected="selected"</c:if>>공모전</option>
								<option value="이벤트" <c:if test="${calenderVO.srchGubun == '이벤트'}">selected="selected"</c:if>>이벤트</option>
							</select>
						</span>
						<span>
							<select name="searchCondition" class="select_list">
								<option value="title" <c:if test="${calenderVO.searchCondition == 'title'}">selected="selected"</c:if>>주제</option>
								<option value="contents" <c:if test="${calenderVO.searchCondition == 'contents'}">selected="selected"</c:if>>내용</option>
							</select>
						</span>
						<span>
							<label for="" class="skip">검색단어입력</label>
							<input name="searchKeyword" type="text" value='<c:out value="${calenderVO.searchKeyword}"/>' class="text" title="검색어 입력" onKeyPress="press(event);" />
						</span>
						<input type="image" src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" onClick="fn_search_list(); return false;" />
					</fieldset>
				</div>
			</div>
		</form>
	</div>
	<div style="position:absolute; padding-top:3px; right:0px;"><button  onclick="fn_click_today()" type="button" class="btn_s_blue">오늘</button></div>
	<div id="calendar"></div>
	<br/>
	<br/>
	<br/>
	<table class="bbs_default list">
		<colgroup>
			<col style="width: 10%" />
			<col style="width: 20%" />
			<col style="width: 40%" />
			<col style="width: 30%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">구분</th>
				<th scope="col">주제</th>
				<th scope="col">기간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${resultList2}" varStatus="status">
				<tr>
					<td class="ac">
						<c:out value="${status.count}" />
					</td>
					<td class="ac">
						<c:out value="${result.gubun}" />
					</td>
					<td class="subject">
						<a href="javascript:void(0);" onclick="fn_detail_view('<c:out value="${result.idx}"/>')"><c:out value="${result.title}" /></a>
					</td>
					<td class="board-default-td-date">
						<c:out value="${result.sDate}" /> ~ <c:out value="${result.eDate}" />
					</td>
				</tr>
			</c:forEach>

			<c:if test="${fn:length(resultList2) == 0}">
				<tr>
					<td colspan="4" class="no_data" align="center">작성된 게시물이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	
	<div class="popupLayout" style="display: none;">
		<dl>
			<dt class="cal_unvisible">일정확인
				<div class="popupClose"><a href="javascript:fn_close_detail();" ><img src="/assets/kor/images/newMain/bu_close.png" alt="close" /></a></div>
			</dt>
			<c:forEach var="row" items="${resultList}" varStatus="i">
				<dd id="id_<c:out value="${row.idx}" />">
					<table class="bbs_default" summary="일정상세보기 정보를 제공합니다. 주제, 구분, 내용으로 구성되어 있습니다." border="0">
						<caption>일정 상세 내용</caption>
						<colgroup>
							<col width="30%" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<tr>
								<th>주제</th>
								<td class="subject"><c:out value="${row.title}" escapeXml="false"/></td>
							</tr>
							<tr>
								<th>구분</th>
								<td><c:out value="${row.gubun}" /></td>
							</tr>
							<tr>
								<td class="substance" colspan="2">
									<input type="hidden" name="content" value="<c:out value="${row.contents}" />" />
									<span class="showTextArea"></span>
								</td>
							</tr>
						</tbody>
					</table>
				</dd>
			</c:forEach>
		</dl>
		<div class="buttonBox ac">
			<a href="javascript:fn_close_detail();" class="btn gray">닫기</a>
		</div>
	</div>
</div>

<form name="frmList" id="frmList" method="post">
	<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
</form>

</body>
</html>