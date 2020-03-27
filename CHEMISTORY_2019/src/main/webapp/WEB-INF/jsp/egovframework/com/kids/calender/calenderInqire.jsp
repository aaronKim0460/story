<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>

<script type="text/javascript">

//목록화면으로 이동
function fn_move_select_List() {
	$('#frm').attr("action","<c:url value='/com/kids/calender/calenderList.do'/>");
	$('#frm').submit();
}

// 삭제하기
function fn_do_delete() {

	if (confirm('<spring:message code="common.delete.msg" />')) {
		$('#frm').attr("method","post");
		$('#frm').attr("action","<c:url value='/com/kids/calender/calenderDelete.do'/>");
		$('#frm').submit();
	}
}

// 수정화면으로 이동
function fn_move_detail() {
	$('#frm').attr("method","post");
	$('#frm').attr("action","<c:url value='/com/kids/calender/calenderDetail.do'/>");
	$('#frm').submit();
}

$(document).ready(function(){
	$("#contentArea").html($('#content').val().replace(/\n/g, "<br>"))
});
</script>

<form name="frm" id="frm" method="post">
<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${calenderVO.pageIndex}'/>" />
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
<input type="hidden" name="searchCondition" id="searchCondition" value="<c:out value='${calenderVO.searchCondition}'/>" />
<input type="hidden" name="searchKeyword" id="searchKeyword" value="<c:out value='${calenderVO.searchKeyword}'/>" />
<input name="srchYear" type="hidden" value="<c:out value='${calenderVO.srchYear}'/>"/>
<input name="srchMonth" type="hidden" value="<c:out value='${calenderVO.srchMonth}'/>"/>
<input name="srchGubun" type="hidden" value="<c:out value='${calenderVO.srchGubun}'/>"/>
<input type="hidden" name="idx" id="idx" value="<c:out value='${result.idx}'/>" />

<div id="contents">
	<h2 class="adminH2">환경보건 행사</h2>		
	<table class="bbs_default view" summary="달력 상세보기로, 주제, 내용 정보 제공" border="0">
		<caption>달력 내용</caption>
		<colgroup>
			<col width="20%" />
				<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">주제</th>
				<td class="subject">
					<c:out value="${result.title}" />
				</td>
			</tr>
			<tr>
				<th scope="row">구분</th>
				<td>
					<c:out value="${result.gubun}" />
				</td>
			</tr>
			<tr>
				<th scope="row">기간</th>
				<td>
					<c:out value="${result.sDate}" /> ~ <c:out value="${result.eDate}" />
				</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td>
					<input type="hidden" id="content" value="<c:out value="${result.contents}" />">
					<span id="contentArea"></span>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="t_center mt20">
		<a href="javascript:fn_move_select_List('<c:out value='${calenderVO.pageIndex }'/>')" class="btn gray">목록</a>
		<a href="javascript:fn_move_detail()" class="btn seablue">수정</a>
		<a href="javascript:fn_do_delete()" class="btn orange">삭제</a>
	</div>
	
</div><!-- //contents -->
</form>