<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>

<script language="javascript1.2" type="text/javaScript">

function insertCmsDptListManage() {
	
	if($.trim($("#departCd").val()) == ""){
		alert("부서코드를 입력하세요.");
		return false;
	}
	if($.trim($("#departNm").val()) == ""){
		alert("부서명을 입력하세요.");
		return false;
	}
	if($.trim($("#useyn").val()) == ""){
		alert("사용여부를 선택하세요.");
		return false;
	}
	if($.trim($("#orders").val()) == ""){
		alert("순서를 입력하세요.");
		return false;
	}
	
	if(confirm("<spring:message code="common.save.msg"/>")){
		document.frm.action = "<c:url value='/cop/com/selectCmsDptRegist.do'/>";
		document.frm.submit();
	}
}

function selectList(){
	location.href = "<c:url value='/cop/com/selectCmsDptList.do'/>";
}

function fn_FocusStart(){
	var objFocus = document.getElementById('F1');
	objFocus.focus();
}

<c:if test="${!empty resultMsg}">alert("<c:out value='${resultMsg}'/>");</c:if>
</script>

<style type="text/css">
	.required {color:red;padding-left:5px;}
</style>

<body>


<form name="frm" method="post" >
<input name="cmd" type="hidden" value="<c:out value='insert'/>"/>

<div class="content-body">
<div class="board-list">

	<table class="board-write">
   	<caption>부서 등록</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">부서코드<span class="required">*</span></th>
				<td class="board-write-td">
					<input type="text" class="input-text" maxlength="4" name="departCd" id="departCd" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">부서명<span class="required">*</span></th>
				<td class="board-write-td">
					<input type="text" class="input-text" size="50" maxlength="50" name="departNm" id="departNm" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">부서 영문명</th>
				<td class="board-write-td">
					<input type="text" class="input-text" size="50" maxlength="50" name="departEng" id="departEng" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용여부<span class="required">*</span></th>
				<td class="board-write-td">
					<select name="useyn" id="useyn" class="board-search-select">
						<option value="1">사용</option>
						<option value="0">미사용</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">순서</th>
				<td class="board-write-td">
					<input type="text" class="input-text" maxlength="50" name="orders" id="orders" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">설명</th>
				<td class="board-write-td">
					<textarea name="comments" id="comments" rows="8" cols="75" title="프로그램설명"></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	
</div>
</div>

<div class="text-center">
	<a href="<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>" onclick="selectList(); return false;" class="btn btn-default">목록</a>
	<input type="submit" value="등록" onclick="insertCmsDptListManage();" class="btn btn-primary" />
</div>

</form>
</body>
</html>

