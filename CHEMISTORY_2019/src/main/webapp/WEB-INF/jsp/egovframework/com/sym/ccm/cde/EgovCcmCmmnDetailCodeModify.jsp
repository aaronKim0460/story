<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cmmnDetailCode" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--

function fn_egov_list_CmmnDetailCode(){
	location.href = "<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeList.do' />";
}

function fn_egov_modify_CmmnDetailCode(form){
	if(confirm("<spring:message code='common.save.msg'/>")){
		if(!validateCmmnDetailCode(form)){
			return;
		}else{
			form.cmd.value = "Modify";
			form.submit();
		}
	}
}
-->
</script>

<body>

<form:form commandName="cmmnDetailCode" name="cmmnDetailCode" method="post">
<input name="cmd" type="hidden" value="Modify">
<form:hidden path="codeId"/>
<form:hidden path="code"/>
<div class="content-body">
<div class="board-list">

	<table class="board-write">
	<CAPTION>공통상세코드 수정</CAPTION>
		<colgroup>
		    <col style="width:15%" />
		    <col />
		</colgroup>
		<tr>
			<th class="board-write-th">코드ID</th>
			<td class="board-write-td"><c:out value='${cmmnDetailCode.codeIdNm}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">코드</th>
			<td class="board-write-td"><c:out value='${cmmnDetailCode.code}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">코드명</th>
			<td class="board-write-td">
				<form:input  path="codeNm" size="60" maxlength="60" id="codeNm" class="input-text full"/>
				<form:errors path="codeNm"/>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">코드설명</th>
			<td class="board-write-td">
				<form:textarea path="codeDc" rows="10" cols="60" id="codeDc"/>
				<form:errors   path="codeDc"/>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">추가설정항목</th>
			<td class="board-write-td">
				<form:input  path="codeVal" maxlength="60" size="50" id="codeVal" class="input-text"/>
				<form:errors path="codeVal"/>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">사용여부</th>
			<td class="board-write-td">
				<form:select path="useAt" id="useAt" class="board-search-select">
					<form:option value="Y" label="사용"/>
					<form:option value="N" label="미사용"/>
				</form:select>
			</td>
		</tr>
	</table>
	
</div>
</div>

<div class="text-center">
	<input type="submit" value="목록" onclick="fn_egov_list_CmmnDetailCode(); return false;" class="btn btn-default"/>
	<input type="submit" value="저장" onclick="fn_egov_modify_CmmnDetailCode(document.cmmnDetailCode); return false;"  class="btn btn-primary"/>
</div>

</form:form>
</body>
</html>
