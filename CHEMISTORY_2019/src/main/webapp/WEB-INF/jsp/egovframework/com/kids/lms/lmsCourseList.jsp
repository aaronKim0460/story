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
			fn_move_select_List('1');
		}
	}

	// 등록화면으로 이동
	function fn_move_regist() {
		$('#frm').attr("action","<c:url value='/com/kids/lms/lmsCourseRegist.do'/>");
		$('#frm').submit();
	}

	// 검색하기
	function fn_move_select_List(pageNo) {
		$('#pageIndex').val(pageNo);
		$('#frm').attr("action","<c:url value='/com/kids/lms/lmsCourseList.do'/>");
		$('#frm').submit();
	}

	// 상세화면으로 이동
	function fn_move_inqire(courseId) {
		$('#courseId').val(courseId);
		$('#frm').attr("action","<c:url value='/com/kids/lms/lmsCourseInqire.do'/>");
		$('#frm').submit();
	}

	// 차시관리로 이동
	function fn_move_chasi(courseId) {
		$('#courseId').val(courseId);
		$('#frm').attr("action","<c:url value='/com/kids/lms/lmsChasiManage.do'/>");
		$('#frm').submit();
	}

	// 문항관리로 이동
	function fn_move_question(courseId) {
		$('#courseId').val(courseId);
		$('#frm').attr("action","<c:url value='/com/kids/lms/lmsQuestionManage.do'/>");
		$('#frm').submit();
	}
</script>
</head>
<body>

<div id="contents">
	<h2 class="adminH2">환경보건 교육</h2>
	<div class="tableBtn clearfix">
		<div class="btn_left big">
			총 <span class="point"><c:out value='${paginationInfo.totalRecordCount }' /></span>건
			, 현재페이지 <span class="point"><c:out value='${paginationInfo.currentPageNo }' /></span>
			/<c:out value='${paginationInfo.totalPageCount }' />
		</div>
		<form name="frm" id="frm" action="<c:url value='/com/kids/lms/lmsCourseList.do'/>" method="post">
			<div class="btn_right">
				<div class="board_search">
					<input type="hidden" name="courseId" id="courseId"  />
					<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${lmsCourseVO.pageIndex}'/>" />
					<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
					<fieldset>
						<legend>과정 검색</legend>
						<span>
							<select name="searchCondition" class="select_list">
								<option value="title" <c:if test="${lmsCourseVO.searchCondition == 'title'}">selected="selected"</c:if>>과정명</option>
								<option value="nm" <c:if test="${lmsCourseVO.searchCondition == 'nm'}">selected="selected"</c:if>>작성자</option>
							</select>
						</span>
						<span>
							<label for="" class="skip">검색단어입력</label>
							<input name="searchKeyword" type="text" value='<c:out value="${lmsCourseVO.searchKeyword}"/>' class="text" title="검색어 입력" onKeyPress="press(event);" />
						</span>
						<input type="image" src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" onClick="fn_move_select_List('1'); return false;" />
					</fieldset>
				</div>
			</div>
		</form>
	</div>
	<table class="bbs_default list">
		<colgroup>
			<col style="width: 7%" />
			<col style="width: 15%" />
			<col style="width: 13%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 7.5%" />
			<col style="width: 7.5%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">과정명</th>
				<th scope="col">화면</th>
				<th scope="col">사용여부</th>
				<th scope="col">차시</th>
				<th scope="col">평가</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">차시관리</th>
				<th scope="col">문항관리</th>
			</tr>
		</thead>
		<tbody id="body_list" class="t_center list">
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td>
						<c:out value="${paginationInfo.totalRecordCount - ((lmsCourseVO.pageIndex -1)* lmsCourseVO.pageSize + status.index)}" />
					</td>
					<td class="subject">
						<a href="javascript:void(0);" onclick="fn_move_inqire('<c:out value="${result.courseId}"/>')"><c:out value="${result.courseNm}" /></a>
					</td>
					<td class="board-default-td-name">
						<c:choose>
							<c:when test="${empty result.screenWidth or empty result.screenHeight}">
								-
							</c:when>
							<c:otherwise>
								<c:out value="${result.screenWidth}" /> * <c:out value="${result.screenHeight}" />
							</c:otherwise>
						</c:choose>
					</td>
					<td class="board-default-td-name">
						<c:choose>
							<c:when test="${result.useYn eq 'Y'}">사용</c:when>
							<c:otherwise>미사용</c:otherwise>
						</c:choose>
					</td>
					<td class="board-default-td-name">
						<c:choose>
							<c:when test="${result.chasiCount eq '0'}">
								미등록
							</c:when>
							<c:otherwise>
								<c:out value="${result.chasiCount}" /> 차시
							</c:otherwise>
						</c:choose>
					</td>
					<td class="board-default-td-name">
						<c:choose>
							<c:when test="${result.questionCount eq '0'}">
								미출제
							</c:when>
							<c:otherwise>
								출제
							</c:otherwise>
						</c:choose>
					</td>
					<td class="board-default-td-name">
						<c:out value="${result.regNm}" />
					</td>
					<td class="board-default-td-date">
						<c:out value="${result.regDt}" />
					</td>
					<td class="board-default-td-name">
						<a href="javascript:void(0);" onclick="fn_move_chasi('<c:out value="${result.courseId}"/>')" class="btn gray">관리</a>
					</td>
					<td class="board-default-td-name">
						<a href="javascript:void(0);" onclick="fn_move_question('<c:out value="${result.courseId}"/>')" class="btn gray">관리</a>
					</td>
				</tr>
			</c:forEach>

			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="10" class="no_data" align="center">작성된 게시물이 없습니다.</td>
				</tr>
			</c:if>

		</tbody>
	</table>

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image"
			jsFunction="fn_move_select_List" />
	</div>

	<div class="t_center mt20">
		<c:if test="${fn:length(sessionUniqId) > 0}">
			<a href="javascript:fn_move_regist();" class="btn seablue">등록</a>
		</c:if>
	</div>

</div>
</body>
</html>