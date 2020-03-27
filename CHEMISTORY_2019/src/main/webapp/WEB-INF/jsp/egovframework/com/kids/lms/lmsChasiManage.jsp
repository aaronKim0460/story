<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>
<script type="text/javascript">
// 등록하기
function  fn_do_regist() {
	var form = $("#formInsert");
	if (form.find("#chasi").val() == null || form.find("#chasi").val() == '') {
		alert("차시를 입력해 주시기 바랍니다.");
		return;
	}
	if (form.find("#chasiNm").val() == null || form.find("#chasiNm").val() == '') {
		alert("차시명을 입력해 주시기 바랍니다.");
		return;
	}
	if (form.find("#startUrl").val() == null || form.find("#startUrl").val() == '') {
		alert("시작URL을 입력해 주시기 바랍니다.");
		return;
	}
	
	if (confirm('저장하시겠습니까?')) {
		form.find("#courseId").val($("#frm").find("#courseId").val());
		
		$.ajax({
            url: "<c:url value='/com/kids/lms/lmsCharsiSave.do'/>",
            data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
            type: 'POST',     
            success: function(result){
	         	if("success" == result){
	         		alert("저장되었습니다.");
	         		fn_do_refresh();
	         	}else if("failure" == result){
	         		alert("저장중 오류가 발생하였습니다.");
	         	}
            }
 		});
	} 
}

// 새로 고침
function fn_do_refresh() {
	$('#frm').attr("action","<c:url value='/com/kids/lms/lmsChasiManage.do'/>");
	$('#frm').submit();
}

//목록화면으로 이동
function fn_move_select_List() {
	$('#frm').attr("action","<c:url value='/com/kids/lms/lmsCourseList.do'/>");
	$('#frm').submit();
}

//숫자만 입력
function showKeyCode(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ){
		return;
	} else {
		return false;
	}
}

// 폼 리셋
function fn_reset_form() {
	var form = $("#formInsert");
	form.find("input").val('');
}


// 수정 데이터 바이딩
function fn_update_chasi(courseId, id, num, nm, url) {
	var form = $("#formInsert");
	form.find("#courseId").val(courseId);
	form.find("#chasiId").val(id);
	form.find("#chasi").val(num);
	form.find("#chasiNm").val(nm);
	form.find("#startUrl").val(url);
}

// 차시 삭제
function fn_delete_chasi(seq) {
	if (confirm('<spring:message code="common.delete.msg" />')) {
		var form = $("#formDelete");
		form.find("#chasiId").val(seq);
		$.ajax({
            url: "<c:url value='/com/kids/lms/lmsCharsiDelete.do'/>",
            data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
            type: 'POST',     
            success: function(result){
	         	if("success" == result){
	         		alert("삭제되었습니다.");
	         		fn_do_refresh();
	         	}else if("failure" == result){
	         		alert("삭제중 오류가 발생하였습니다.");
	         	}
            }
 		});
	} 
}

$(document).ready(function(){
	
});
</script>

<form name="frm" id="frm" method="post">
	<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${lmsCourseVO.pageIndex}'/>" />
	<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
	<input type="hidden" name="searchCondition" id="searchCondition" value="<c:out value='${lmsCourseVO.searchCondition}'/>" />
	<input type="hidden" name="searchKeyword" id="searchKeyword" value="<c:out value='${lmsCourseVO.searchKeyword}'/>" />
	<input type="hidden" name="courseId" id="courseId" value="<c:out value='${result.courseId}'/>" />
</form>

<form name="formDelete" id="formDelete" method="post">
	<input type="hidden" name="chasiId" id="chasiId">
</form>

<div id="contents" class="con3">		
	<form name="formInsert" id="formInsert" method="post">
		<input type="hidden" name="chasiId" id="chasiId">
		<input type="hidden" name="courseId" id="courseId"/>
		<table class="bbs_default write" border="1">
			<caption>차시 등록</caption>
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="">차시</label><span title="필수입력">*</span></th>
					<td>
						<input name="chasi" id="chasi" type="text" value="" class="input-text" title="차시 입력" onkeydown="return showKeyCode(event)">
						<br>
						<font color="red"><strong>※숫자로 입력해 주세요.</strong></font>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">차시명</label><span title="필수입력">*</span></th>
					<td>
						<input name="chasiNm" id="chasiNm" type="text" value="" class="input-text full" title="차시명 입력">
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">시작URL</label><span title="필수입력">*</span></th>
					<td>
						<input name="startUrl" id="startUrl" type="text" value="" class="input-text full" title="시작URL 입력">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<div class="t_center mt20">
		<a href="javascript:fn_do_regist();" class="btn seablue">저장</a>
		<a href="javascript:fn_reset_form();" class="btn orange">리셋</a>
	</div>
	
	<div class="t_left mt20">
		※수정 버튼을 누르면 정보가 위의 등록폼에 노출되며 수정후 저장버튼을 누르시면 변경된 내용이 저장됩니다.
	</div>
	
	<table class="bbs_default list mt20">
		<colgroup>
			<col width="15%" />
			<col width="30%" />
			<col width="35%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th>차시</th>
				<th>차시명</th>
				<th>시작URL</th>
				<th colspan="2">관리</th>
			</tr>
		</thead>
		<tbody class="t_center list">
			<c:forEach var="row" items="${resultList}" varStatus="i">
				<tr>
					<td><c:out value="${row.chasi}" /></td>
					<td class="subject"><c:out value="${row.chasiNm}" /></td>
					<td class="board-default-td-name"><c:out value="${row.startUrl}" /></td>
					<td class="board-default-td-name">
						<a href="javascript:void(0);" onclick="fn_update_chasi('<c:out value='${result.courseId}'/>', '<c:out value="${row.chasiId}"/>', '<c:out value="${row.chasi}"/>', '<c:out value="${row.chasiNm}"/>', '<c:out value="${row.startUrl}"/>')" class="btn gray">수정</a>
					</td>
					<td class="board-default-td-name">
						<a href="javascript:void(0);" onclick="fn_delete_chasi('<c:out value="${row.chasiId}"/>')" class="btn gray">삭제</a>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="5">등록된 차시가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	
	<div class="conR">
		<div class="t_center">
		<a href="javascript:fn_move_select_List('<c:out value='${lmsCourseVO.pageIndex }'/>')" class="btn gray">목록</a>
		</div>
		<dl class="conRList">
			<dt>과정정보</dt>
			<dd>
				<dl>
					<dt>과정명</dt>
					<dd><c:out value="${result.courseNm}" /></dd>
					<dt>화면사이즈</dt>
					<dd>
						<c:choose>
							<c:when test="${empty result.screenWidth or empty result.screenHeight}">
								-
							</c:when>
							<c:otherwise>
								<c:out value="${result.screenWidth}" /> * <c:out value="${result.screenHeight}" />
							</c:otherwise>
						</c:choose>
					</dd>
					<dt>사용여부</dt>
					<dd>
						<c:choose>
							<c:when test="${result.useYn eq 'Y'}">사용</c:when>
							<c:otherwise>미사용</c:otherwise>
						</c:choose>
					</dd>
				</dl>
			</dd>
		</dl>
		<div class="t_center mt10 cal_unvisible" style="display: none;">
			<a href="javascript:fn_close_detail();" class="btn gray">닫기</a>
		</div>
	</div>
	
</div><!-- //contents -->