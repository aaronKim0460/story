<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>

<script type="text/javascript">
	// 등록하기
	function fn_do_update() {
		if ($("#courseNm").val() == null || $("#courseNm").val() == '') {
			alert("과정명을 입력해 주시기 바랍니다.");
			return;
		}
		
		if (confirm('<spring:message code="common.update.msg" />')) {
			document.calender.action = "<c:url value='/com/kids/lms/lmsCourseUpdate.do'/>";
		
			document.calender.submit();
		} 
	};

	// 목록으로 이동
	function fn_move_select_List() {
		document.calender.action = "<c:url value='/com/kids/lms/lmsCourseList.do'/>";
		document.calender.submit();
	};
	
	$(document).ready(function(){
		
	});
	
</script>

<form id="calender" name="calender" method="post">
	<input name="pageIndex" type="hidden" value="<c:out value='${lmsCourseVO.pageIndex}'/>"/>
	<input name="menuNo" type="hidden" value="<c:out value='${menuManageVO.menuNo}'/>"/>
	<input name="searchCondition" type="hidden" value="<c:out value='${lmsCourseVO.searchCondition}'/>"/>
	<input name="searchKeyword" type="hidden" value="<c:out value='${lmsCourseVO.searchKeyword}'/>"/>
	<input type="hidden" name="courseId" id="courseId" value="<c:out value='${result.courseId}'/>" />
	
	<div id="contents">
		<h2 class="adminH2">환경보건 교육</h2>
		<table class="bbs_default write" border="1">
			<caption>과정 수정</caption>
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="">과정명</label><span title="필수입력">*</span></th>
					<td>
						<input name="courseNm" id="courseNm" type="text" value="<c:out value="${result.courseNm}" />" class="input-text full" title="과정 입력">
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">화면사이즈</label></th>
					<td>
						폭 : <input name="screenWidth" id="screenWidth" class="input-text" value="<c:out value="${result.screenWidth}" />" />&nbsp;
						높이 : <input name="screenHeight" id="screenHeight" class="input-text" value="<c:out value="${result.screenHeight}" />" />
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">사용여부</label><span title="필수입력">*</span></th>
					<td>
						<input type="radio" name="useYn" value="Y" <c:if test="${result.useYn eq 'Y'}"> checked="checked"</c:if> /> 사용&nbsp;
						<input type="radio" name="useYn" value="N" <c:if test="${result.useYn eq 'N'}"> checked="checked"</c:if> /> 미사용
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">과정안내</label></th>
					<td>
						<textarea name="courseContent" class="textarea-board" cols="50" rows="2" title="내용 입력"><c:out value="${result.courseContent}" /></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="t_center mt20">
			<a href="javascript:fn_move_select_List();" class="btn gray">목록</a>
			<a href="javascript:fn_do_update();" class="btn seablue">수정</a>
		</div>
	</div>
	
</form>