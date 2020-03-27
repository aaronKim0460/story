<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cmmnClCode" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

function fn_egov_list_CmmnClCode(){
	location.href = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeList.do' />";
}

 function fn_egov_regist_CmmnClCode(form){
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateCmmnClCode(form)){
			return;
		}else{
			form.submit();
		}
	}
}
 
function fncShowMessg(){
    if("<c:out value='${message}'/>" != ''){
    alert("<c:out value='${message}'/>");
    }
}
</script>

<body onLoad="javascript:fncShowMessg();">

<form:form commandName="cmmnClCode" name="cmmnClCode" method="post">
<div class="content-body">
<div class="board-list">

	<table class="board-write">
	<caption>공통분류코드 등록</caption>
		<colgroup>
		    <col style="width:15%" />
		    <col />
		</colgroup>
		<tr>
			<th class="board-write-th">분류코드</th>
			<td class="board-write-td">
				<form:input  path="clCode" maxlength="3" id="clCode" class="input-text"/>
				<form:errors path="clCode"/>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">분류코드명</th>
			<td class="board-write-td">
			  <form:input  path="clCodeNm" maxlength="60" id="clCodeNm" class="input-text"/>
			  <form:errors path="clCodeNm"/>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">분류코드설명</th>
			<td class="board-write-td">
				<form:textarea path="clCodeDc" id="clCodeDc" cols="50" rows="10"/>
				<form:errors   path="clCodeDc"/>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">사용여부</th>
			<td class="board-write-td">
				<form:select path="useAt" class="board-search-select">
					<form:option value="Y" label="사용"/>
					<form:option value="N" label="미사용"/>
				</form:select>
			</td>
		</tr>
	</table>
</div>
</div>

<div class="text-center">
	<input type="submit" value="목록" onclick="fn_egov_list_CmmnClCode(); return false;" class="btn btn-default" />
	<input type="submit" value="등록" onclick="fn_egov_regist_CmmnClCode(document.cmmnClCode); return false;" class="btn btn-primary" />
</div>

<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</body>
</html>
