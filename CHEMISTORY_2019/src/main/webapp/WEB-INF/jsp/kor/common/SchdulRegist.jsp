<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>
<script language="javascript1.2" type="text/javaScript">
//alert("KorSchdulRegist.jsp");
<!--
/* ********************************************************
 * 입력 처리 함수
 ******************************************************** */

 function fn_egov_regist_schdul() {
	
	var departCd = $('#departCd').val();
	var sectCd = $('#sectCd').val();
	var seq = $('#seq').val();
	var time= $('#time').val();
	var place= $('#place').val();
	
	if($.trim($('#regDt').val()) == ''){
		alert('일시를 선택해주세요.');
		$('#regDtView').focus();
		return false;
	}
	if(departCd == '' || departCd == '0000'){
		alert('부서명을 선택해주세요.');
		$('#departCd').focus();
		return false;
	}
	if(sectCd == ''){
		alert('과명을 선택해주세요.');
		$('#sectCd').focus();
		return false;
	}
	if(seq == ''){
		alert('순서을 입력해주세요.');
		$('#seq').focus();
		return false;
	}
	if(time == ''){
		alert('시간을 입력해주세요.');
		$('#time').focus();
		return false;
	}
	if(place == ''){
		alert('장소을 입력해주세요.');
		$('#place').focus();
		return false;
	}	
	
	if (confirm('<spring:message code="common.regist.msg" />')) {
		document.frm.action = "<c:url value='/cop/com/insertScheduleRegist.do'/>";
		document.frm.submit();
	}
}
/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function fn_egov_select_schdulList(){
	location.href = "<c:url value='/cop/com/selectScheduleList.do'/>";
}

/* ********************************************************
 * focus 시작점 지정함수
 ******************************************************** */
 function fn_FocusStart(){
	var objFocus = document.getElementById('F1');
	objFocus.focus();
 }

$('document').ready(function(){
	if($("#regDtView").length < 1)return;

	$("#regDtView").datepicker();
	
	$("#regDtView").change(function(){
		
		var date = ($.trim($(this).val())).replaceAll("-","");
		$("#regDt").val(date);
	});	
	
	//관리자 게시판 등록시 개시일자 오늘 날짜로 세팅
	if($.trim($('#regDt').val()) == ''){
		var newDate = new Date();
		var yyyy = newDate.getFullYear();
		var mm = newDate.getMonth()+1;
		var dd = newDate.getDate();
		
        if (("" + mm).length == 1) { mm = "0" + mm; }
        if (("" + dd).length   == 1) { dd   = "0" + dd;   }
        
		var toDay = yyyy + "-" + mm + "-" + dd;
		
		$('#regDt').val(toDay);
		$('#regDtView').val(toDay);
	}	
});

<c:if test="${!empty resultMsg}">alert("<c:out value='${resultMsg}'/>");</c:if>
-->
</script>
<form name="frm" method="post" >
<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
<input name="cmd" type="hidden" value="<c:out value='insert'/>"/>
<div id="contents">
	<table class="bbs_default write" border="1">
	<caption>글 등록</caption>
	<colgroup>
			<col width="20%" />
			<col width="80%" />
	</colgroup>
	<tbody>
		<tr>
		    <th scope="row"><label for="">일시</label></th>
		    <td> 
		    	<input id="regDt" name="regDt" type="hidden" value="" />
				<input name="regDtView" id="regDtView" type="text" class="search-date-picker" style="width:140px" value="" readOnly />
		    </td>
		</tr>
		<tr>
		  	<th scope="row"><label for="">부서명</label></th>
		  	<td>
				<select name="departCd" id="departCd" class="board-search-select" style="width:140px">
	  				<option value="">선택</option>
	  				<c:forEach var="departVO" items="${resultDptList }" varStatus="status">
	  					<option value="<c:out value='${departVO.departCd }'/>"><c:out value='${departVO.departNm }'/></option>
	  				</c:forEach>
	  			</select>
	  		</td>
		</tr>		
		<tr>
		  	<th scope="row"><label for="">과명</label></th>
		  	<td>
				<select name="sectCd" id="sectCd" class="board-search-select" style="width:140px">
		  			<option value="0000">선택</option>
		  			<c:forEach var="sectVO" items="${resultSectList }" varStatus="status">
		  				<option value="<c:out value='${sectVO.sectCd }'/>"><c:out value='${sectVO.sectNm }'/></option>
		  			</c:forEach>
		  		</select>
	  		</td>
		</tr>
		<tr>
			<th scope="row"><label for="">순서</label><span title="필수입력">*</span></th>
			<td>
				<input name="seq" id="seq" type="text" style="width:140px" value="" class="input-text full" maxlength="50" title="순서">
				<br/><form:errors path="nttSj" />
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="">시간</label><span title="필수입력">*</span></th>
			<td>
				<input name="time" id="time" type="text" value="" style="width:140px" class="input-text full" maxlength="50" title="시간">
				<br/><form:errors path="nttSj" />
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="">장소</label><span title="필수입력">*</span></th>
			<td>
				<input name="place" id="place" type="text" value="" style="width:700px" class="input-text full" maxlength="50" title="장소">
				<br/><form:errors path="nttSj" />
			</td>
		</tr>				
		<tr>
			<td class="board-write-editor" colspan="2">
				<textarea id="explane" name="explane" class="textarea-board" cols="50" rows="6"></textarea>
			</td>
		</tr>	
	</tbody>
	</table>
	<div class="t_center mt20">
		<a href="#" onclick="fn_egov_select_schdulList(); return false;" class="btn gray">목록</a>
		<a href="#" onclick="fn_egov_regist_schdul(); return false;" class="btn seablue">등록</a>
	</div>	
</div>
</form>

