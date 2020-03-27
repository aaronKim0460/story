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
			fn_move_select_List('1');
		}
	}

	// 검색하기
	function fn_move_select_List(pageNo) {
		$('#pageIndex').val(pageNo);
		$('#frm').attr("action","<c:url value='/user/com/kids/calender/calenderList.do'/>");
		$('#frm').submit();
	}

	// 상세화면으로 이동
	function fn_move_inqire(idx) {
		$('#idx').val(idx);
		$('#frm').attr("action","<c:url value='/user/com/kids/calender/calenderInqire.do'/>");
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
				html.push("<option value='" + i + "' selected='selected'>" + i + "</option>")
			} else {
				html.push("<option value='" + i + "' >" + i + "</option>")
			}
		}
		$("#srchYear").append(html.join(""));
	}
	
	// 달력형식으로 보기 이동
	function fn_move_calendarView() {
		$('#frm').attr("action","<c:url value='/user/com/kids/calender/calenderView.do'/>");
		$('#frm').submit();
	}
	
	$(document).ready(function(){
		setSrchYear();
	});
</script>
</head>
<body>
<div id="contents">
	<!-- 
	<div class="contentTab">
		<ul class="Tab01">
			<li><a href="javascript:fn_move_calendarView();">달력보기</a></li>
			<li><a class="on" href="javascript:fn_move_select_List();">목록 보기</a></li>
		</ul>
	</div>
	 -->
	<div class="tableBtn clearfix">
		<div class="btn_left big">
			총 <span class="point"><c:out value='${paginationInfo.totalRecordCount }' /></span>건
			, 현재페이지 <span class="point"><c:out value='${paginationInfo.currentPageNo }' /></span>
			/<c:out value='${paginationInfo.totalPageCount }' />
		</div>
		<form name="frm" id="frm" action="<c:url value='/com/kids/recall/selectRecallBBSList.do'/>" method="post">
			<div class="btn_right">
				<div class="board_search">
					<input type="hidden" name="idx" id="idx"  />
					<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${calenderVO.pageIndex}'/>" />
					<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
					<fieldset>
						<legend>달력 검색</legend>
						<span>
							<select name="srchYear" id="srchYear" class="select_list">
								<option value="">선택하세요</option>
							</select>
						</span>
						<span>
							<select name="srchMonth" class="select_list">
								<option value="">선택하세요</option>
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
						<input type="image" src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" onClick="fn_move_select_List('1'); return false;" />
					</fieldset>
				</div>
			</div>
		</form>
	</div>
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
		<tbody id="body_list" class="t_center list">
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td class="ac">
						<c:out value="${paginationInfo.totalRecordCount - ((calenderVO.pageIndex -1)* calenderVO.pageSize + status.index)}" />
					</td>
					<td class="ac">
						<c:out value="${result.gubun}" />
					</td>
					<td class="subject">
						<a href="javascript:void(0);" onclick="fn_move_inqire('<c:out value="${result.idx}"/>')"><c:out value="${result.title}" /></a>
					</td>
					<td class="board-default-td-date">
						<c:out value="${result.sDate}" /> ~ <c:out value="${result.eDate}" />
					</td>
				</tr>
			</c:forEach>

			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="4" class="no_data" align="center">작성된 게시물이 없습니다.</td>
				</tr>
			</c:if>

		</tbody>
	</table>

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image"
			jsFunction="fn_move_select_List" />
	</div>
</div>
</body>
</html>