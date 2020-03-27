<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>

<script type="text/javascript">
	// 등록하기
	function fn_do_regist() {
		if ($("#title").val() == null || $("#title").val() == '') {
			alert("주제를 입력해 주시기 바랍니다.");
			return;
		}else{
			if($("#title").val().match('"')){
				alert("쌍따옴표를 사용하면 달력이 정상적으로 호출되지 않습니다.\n다른 문자를 사용해 주세요.");
				return;
			}
		}
		if ($("#sDate").val() == null || $("#sDate").val() == '') {
			alert("시작일을 입력해 주시기 바랍니다.");
			return;
		}
		if ($("#eDate").val() == null || $("#eDate").val() == '') {
			alert("종료일을 입력해 주시기 바랍니다.");
			return;
		}
		if ($(".textarea-board").val() == null || $(".textarea-board").val() == '') {
			alert("내용을 입력해 주시기 바랍니다.");
			return;
		}
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.calender.action = "<c:url value='/com/kids/calender/calenderInsert.do'/>";
		
			document.calender.submit();
		} 
	};

	// 목록으로 이동
	function fn_move_select_List() {
		document.calender.action = "<c:url value='/com/kids/calender/calenderList.do'/>";
		document.calender.submit();
	};
	
	$(document).ready(function(){
		$("#sDate").datepicker({dateFormat: "yy.mm.dd"});
		$("#eDate").datepicker({dateFormat: "yy.mm.dd"});
	});
</script>

<form id="calender" name="calender" method="post">
	<input name="pageIndex" type="hidden" value="<c:out value='${calenderVO.pageIndex}'/>"/>
	<input name="menuNo" type="hidden" value="<c:out value='${menuManageVO.menuNo}'/>"/>
	<input name="searchCondition" type="hidden" value="<c:out value='${calenderVO.searchCondition}'/>"/>
	<input name="searchKeyword" type="hidden" value="<c:out value='${calenderVO.searchKeyword}'/>"/>
	<input name="srchYear" type="hidden" value="<c:out value='${calenderVO.srchYear}'/>"/>
	<input name="srchMonth" type="hidden" value="<c:out value='${calenderVO.srchMonth}'/>"/>
	<input name="srchGubun" type="hidden" value="<c:out value='${calenderVO.srchGubun}'/>"/>
	
	<div id="contents">
		<h2 class="adminH2">환경보건 행사</h2>
		<table class="bbs_default write" border="1">
			<caption>달력 등록</caption>
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="">주제</label><span title="필수입력">*</span></th>
					<td>
						<input name="title" id="title" type="text" value="" class="input-text full" title="주제 입력">
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">구분</label><span title="필수입력">*</span></th>
					<td>
						<input type="radio" name="gubun" value="교육" checked="checked" /> 교육 &nbsp;
						<input type="radio" name="gubun" value="행사" /> 행사 &nbsp;
						<input type="radio" name="gubun" value="세미나" /> 세미나 &nbsp;
						<input type="radio" name="gubun" value="공모전" /> 공모전 &nbsp;
						<input type="radio" name="gubun" value="이벤트" /> 이벤트
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">기간</label><span title="필수입력">*</span></th>
					<td>
						<input name="sDate" id="sDate" type="text" class="search-date-picker" style="width:140px" value="" readOnly />
						<div></div>
						<input name="eDate" id="eDate" type="text" class="search-date-picker" style="width:140px" value="" readOnly />
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">내용</label><span title="필수입력">*</span></th>
					<td>
						<textarea name="contents" class="textarea-board" cols="50" rows="2" title="내용 입력"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="t_center mt20">
			<a href="javascript:fn_move_select_List();" class="btn gray">목록</a>
			<a href="javascript:fn_do_regist();" class="btn seablue">등록</a>
		</div>
	</div>
	
</form>