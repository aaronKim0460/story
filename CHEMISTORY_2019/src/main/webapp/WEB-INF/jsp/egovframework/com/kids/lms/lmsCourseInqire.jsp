<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>

<script type="text/javascript">

//목록화면으로 이동
function fn_move_select_List() {
	$('#frm').attr("action","<c:url value='/com/kids/lms/lmsCourseList.do'/>");
	$('#frm').submit();
}

// 삭제하기
function fn_do_delete() {

	if (confirm('<spring:message code="common.delete.msg" />')) {
		$('#frm').attr("method","post");
		$('#frm').attr("action","<c:url value='/com/kids/lms/lmsCourseDelete.do'/>");
		$('#frm').submit();
	}
}

// 수정화면으로 이동
function fn_move_detail() {
	$('#frm').attr("method","post");
	$('#frm').attr("action","<c:url value='/com/kids/lms/lmsCourseDetail.do'/>");
	$('#frm').submit();
}

$(document).ready(function(){
	$("#courseContentArea").html($('#courseContent').val().replace(/\n/g, "<br>"))
});
</script>

<form name="frm" id="frm" method="post">
<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${lmsCourseVO.pageIndex}'/>" />
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
<input type="hidden" name="searchCondition" id="searchCondition" value="<c:out value='${lmsCourseVO.searchCondition}'/>" />
<input type="hidden" name="searchKeyword" id="searchKeyword" value="<c:out value='${lmsCourseVO.searchKeyword}'/>" />
<input type="hidden" name="courseId" id="courseId" value="<c:out value='${result.courseId}'/>" />

<div id="contents">
	<h2 class="adminH2">환경보건 교육</h2>		
	<table class="bbs_default view" summary="과정 상세보기로, 과정명, 내용 정보 제공" border="0">
		<caption>과정 내용</caption>
		<colgroup>
			<col width="20%" />
				<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">과정명</th>
				<td class="subject">
					<c:out value="${result.courseNm}" />
				</td>
			</tr>
			<tr>
				<th scope="row">화면사이즈</th>
				<td class="subject">
					<c:choose>
						<c:when test="${empty result.screenWidth or empty result.screenHeight}">
							-
						</c:when>
						<c:otherwise>
							<c:out value="${result.screenWidth}" /> * <c:out value="${result.screenHeight}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">사용여부</th>
				<td class="subject">
					<c:choose>
						<c:when test="${result.useYn eq 'Y'}">사용</c:when>
						<c:otherwise>미사용</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">과정안내</th>
				<td>
					<input type="hidden" id="courseContent" value="<c:out value="${result.courseContent}" />">
					<span id="courseContentArea"></span>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="t_center mt20">
		<a href="javascript:fn_move_select_List('<c:out value='${lmsCourseVO.pageIndex }'/>')" class="btn gray">목록</a>
		<a href="javascript:fn_move_detail()" class="btn seablue">수정</a>
		<a href="javascript:fn_do_delete()" class="btn orange">삭제</a>
	</div>
	
</div><!-- //contents -->
</form>