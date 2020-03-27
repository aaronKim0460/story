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
	if (form.find("#questionNum").val() == null || form.find("#questionNum").val() == '') {
		alert("문제번호를 입력해 주시기 바랍니다.");
		return;
	}
	if (form.find("#questionTitle").val() == null || form.find("#questionTitle").val() == '') {
		alert("문제제목을 입력해 주시기 바랍니다.");
		return;
	}
	if (form.find("#questionType").val() == 'select4') {
		if (form.find("#item1").val() == null || form.find("#item1").val() == '') {
			alert("보기1을 입력해 주시기 바랍니다.");
			return;
		}
		if (form.find("#item2").val() == null || form.find("#item2").val() == '') {
			alert("보기2을 입력해 주시기 바랍니다.");
			return;
		}
		if (form.find("#item3").val() == null || form.find("#item3").val() == '') {
			alert("보기3을 입력해 주시기 바랍니다.");
			return;
		}
		if (form.find("#item4").val() == null || form.find("#item4").val() == '') {
			alert("보기4을 입력해 주시기 바랍니다.");
			return;
		}
	}
	
	if (confirm('저장하시겠습니까?')) {
		form.find("#courseId").val($("#frm").find("#courseId").val());
		
		$.ajax({
            url: "<c:url value='/com/kids/lms/lmsQuestionSave.do'/>",
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
	$('#frm').attr("action","<c:url value='/com/kids/lms/lmsQuestionManage.do'/>");
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

// 문제 형식 변경
function fn_change_view(typeValue) {
	var form = $("#formInsert");
	
	form.find("#item1").val('');
	form.find("#item2").val('');
	form.find("#item3").val('');
	form.find("#item4").val('');
	
	if (typeValue == 'select4') {
		form.find(".choice").show();
		form.find("#rightAnswer option").remove();
		form.find("#rightAnswer").html("<option value='1' selected='selected'>1번</option><option value='2'>2번</option><option value='3'>3번</option><option value='4'>4번</option>");
	} else {
		form.find(".choice").hide();
		form.find("#rightAnswer option").remove();
		form.find("#rightAnswer").html("<option value='1' selected='selected'>O</option><option value='2'>X</option>");
	}
}

// 폼 리셋
function fn_reset_form() {
	var form = $("#formInsert");
	
	form.find("#questionId").val('');
	form.find("#courseId").val('');
	form.find("input:radio[name=questionType]:input[value='select4']").attr("checked", true);
	form.find("#questionNum").val('');
	form.find("#questionTitle").val('');
	fn_change_view('select4');
}


// 수정 데이터 바이딩
function fn_update_question(id) {
	var form = $("#formAction");
	form.find("#questionId").val(id);
	
	$.ajax({
        url: "<c:url value='/com/kids/lms/lmsQuestionDetail.do'/>",
        data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
        type: 'POST',
        dataType: 'html',
        success: function(result){
        	$("#insertArea").html('');
        	$("#insertArea").html(result);
        }
	});
}

// 문제 삭제
function fn_delete_question(seq) {
	if (confirm('<spring:message code="common.delete.msg" />')) {
		var form = $("#formAction");
		form.find("#questionId").val(seq);
		$.ajax({
            url: "<c:url value='/com/kids/lms/lmsQuestionDelete.do'/>",
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

<form name="formAction" id="formAction" method="post">
	<input type="hidden" name="questionId" id="questionId">
</form>

<div id="contents" class="con3">		
	<form name="formInsert" id="formInsert" method="post">
		<div id="insertArea">
			<input type="hidden" name="questionId" id="questionId">
			<input type="hidden" name="courseId" id="courseId"/>
			<table class="bbs_default write" border="1">
				<caption>문제 등록</caption>
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="">문항유형</label><span title="필수입력">*</span></th>
						<td>
							<input name="questionType" type="radio" value="select4" checked="checked" title="문항유형" onclick="fn_change_view(this.value)"> 4지선택 &nbsp;
							<input name="questionType" type="radio" value="ox" title="문항유형" onclick="fn_change_view(this.value)"> O X
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="">문제번호</label><span title="필수입력">*</span></th>
						<td>
							<input name="questionNum" id="questionNum" type="text" value="" class="input-text" title="문제번호 입력" onkeydown="return showKeyCode(event)">
							<br>
							<font color="red"><strong>※숫자로 입력해 주세요.</strong></font>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="">문제제목</label><span title="필수입력">*</span></th>
						<td>
							<input name="questionTitle" id="questionTitle" type="text" value="" class="input-text full" title="문제제목 입력">
						</td>
					</tr>
					<tr class="choice">
						<th scope="row" rowspan="4"><label for="">보기</label><span title="필수입력">*</span></th>
						<td>
							<input name="item1" id="item1" type="text" value="" class="input-text full" title="보기1 입력">
						</td>
					</tr>
					<tr class="choice">
						<td>
							<input name="item2" id="item2" type="text" value="" class="input-text full" title="보기2 입력">
						</td>
					</tr>
					<tr class="choice">
						<td>
							<input name="item3" id="item3" type="text" value="" class="input-text full" title="보기3 입력">
						</td>
					</tr>
					<tr class="choice">
						<td>
							<input name="item4" id="item4" type="text" value="" class="input-text full" title="보기4 입력">
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="">문항정답</label><span title="필수입력">*</span></th>
						<td>
							<select id="rightAnswer" name="rightAnswer">
								<option value="1" selected="selected">1번</option>
								<option value="2">2번</option>
								<option value="3">3번</option>
								<option value="4">4번</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	
	<div class="t_center mt20">
		<a href="javascript:fn_do_regist();" class="btn seablue">저장</a>
		<a href="javascript:fn_reset_form();" class="btn orange">리셋</a>
	</div>
	
	<div class="t_left mt20">
		※수정 버튼을 누르면 정보가 위의 등록폼에 노출되며 수정후 저장버튼을 누르시면 변경된 내용이 저장됩니다.
		<br>
		※학습자가 응시한 문제는 삭제할 수 없습니다.
	</div>
	
	<table class="bbs_default list mt20">
		<colgroup>
			<col width="15%" />
			<col width="20%" />
			<col width="45%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th>문제번호</th>
				<th>문제유형</th>
				<th>문제제목</th>
				<th colspan="2">관리</th>
			</tr>
		</thead>
		<tbody class="t_center list">
			<c:forEach var="row" items="${resultList}" varStatus="i">
				<tr>
					<td><c:out value="${row.questionNum}" /></td>
					<td class="board-default-td-name">
						<c:choose>
							<c:when test="${row.questionType eq 'ox'}">OX</c:when>
							<c:otherwise>4지선다형</c:otherwise>
						</c:choose>
					</td>
					<td class="subject"><c:out value="${row.questionTitle}" /></td>
					<td class="board-default-td-name">
						<a href="javascript:void(0);" onclick="fn_update_question('<c:out value='${row.questionId}'/>')" class="btn gray">수정</a>
					</td>
					<td class="board-default-td-name">
						<c:if test="${row.useCount eq 0}">
							<a href="javascript:void(0);" onclick="fn_delete_question('<c:out value="${row.questionId}"/>')" class="btn gray">삭제</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="5">등록된 문제가 없습니다.</td>
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