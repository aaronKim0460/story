<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp"%>
<script type="text/javascript">
	
	// enter로 검색하기
	function press(event) {
		if (event.keyCode==13) {
			fn_search_list();
		}
	}

	// 목록 이동하기
	function fn_move_select_List() {
		location.href = "<c:url value='/com/kids/calender/calenderList.do'/>";
	}
	
	function fn_search_list() {
		$('#frm').attr("action","<c:url value='/com/kids/calender/calenderView.do'/>");
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
		$(".cal_unvisible").show();
		$("#id_"+key).show();
	}
	
	// 상세 내용 닫기
	function fn_close_detail() {
		$("[id^='id_']").hide();
		$(".cal_unvisible").hide();
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
				center: 'title',
				right: '',
			},
			editable: false,
			events: [
				<c:forEach var="row" items="${resultList}" varStatus="i">
					<c:choose>
						<c:when test="${i.count eq 1}">
							{
								title : "(<c:out value="${row.gubun}" />)<c:out value="${row.title}" />",
								start: new Date('<c:out value="${fn:substring(row.sDate,0,4)}"/>',<c:out value="${fn:substring(row.sDate,5,7)}"/>-1,'<c:out value="${fn:substring(row.sDate,8,10)}"/>'),
								end: new Date('<c:out value="${fn:substring(row.eDate,0,4)}"/>',<c:out value="${fn:substring(row.eDate,5,7)}"/>-1,'<c:out value="${fn:substring(row.eDate,8,10)}"/>'),
								url : 'javascript:fn_detail_view("<c:out value="${row.idx}"/>");'
							}
						</c:when>
						<c:otherwise>
							,{
								title : "(<c:out value="${row.gubun}" />)<c:out value="${row.title}" />",
								start: new Date('<c:out value="${fn:substring(row.sDate,0,4)}"/>',<c:out value="${fn:substring(row.sDate,5,7)}"/>-1,'<c:out value="${fn:substring(row.sDate,8,10)}"/>'),
								end: new Date('<c:out value="${fn:substring(row.eDate,0,4)}"/>',<c:out value="${fn:substring(row.eDate,5,7)}"/>-1,'<c:out value="${fn:substring(row.eDate,8,10)}"/>'),
								url : 'javascript:fn_detail_view("<c:out value="${row.idx}"/>");'
							}
						</c:otherwise>
					</c:choose>
				</c:forEach>
			]
		});
		
		$('#calendar').fullCalendar('gotoDate',<c:out value="${calenderVO.srchYear}"/>,(<c:out value="${calenderVO.srchMonth}"/>-1));
	});
</script>
<link href='/css/old/fullcalendar.css' rel='stylesheet' />
<link href='/css/old/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/js/old/fullcalendar.js'></script>
</head>
<body>
<div id="contents" class="con3">
	<div class="tableBtn clearfix">
		<div class="btn_left big">
			<a href="javascript:fn_move_select_List();" class="btn seablue">목록 보기</a>
		</div>
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
								<option value="">선택하세요</option>
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
	<div id="calendar"></div>
	<div class="conR">
		<dl class="conRList">
			<dt class="cal_unvisible" style="display: none;">일정확인</dt>
			<c:forEach var="row" items="${resultList}" varStatus="i">
				<dd id="id_<c:out value="${row.idx}" />" style="display: none;">
					<dl>
						<dt>주제</dt>
						<dd><c:out value="${row.title}" /></dd>
						<dt>구분</dt>
						<dd><c:out value="${row.gubun}" /></dd>
						<dt>내용</dt>
						<dd>
							<input type="hidden" name="content" value="<c:out value="${row.contents}" />" />
							<span class="showTextArea"></span>
						</dd>
					</dl>
				</dd>
			</c:forEach>
		</dl>
		<div class="t_center mt10 cal_unvisible" style="display: none;">
			<a href="javascript:fn_close_detail();" class="btn gray">닫기</a>
		</div>
	</div>
</div>
</body>
</html>