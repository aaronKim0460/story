<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cmmnCode" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">
<!--

function fn_egov_list_CmmnCode(){
	location.href = "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeList.do' />";
}

 function fn_egov_regist_CmmnCode(form){
	if(confirm("<spring:message code='common.save.msg'/>")){
		if(!validateCmmnCode(form)){ 			
			return;
		}else{
			form.submit();
		}
	}
}
-->
</script>

<body>

<!--  상단타이틀 -->
<form:form commandName="cmmnCode" name="cmmnCode" method="post">
<div class="content-body">
<div class="board-list">
	<table class="board-write">
	<CAPTION>공통코드 등록</CAPTION>
		<colgroup>
		    <col style="width:15%" />
		    <col />
		</colgroup>
		<tr>
			<th class="board-write-th">분류코드</th>          
			<td class="board-write-td">
				<select name="clCode" id="clCode" class="board-search-select" style="width:215px">
					<c:forEach var="result" items="${cmmnClCode}" varStatus="status">
					<option value='<c:out value="${result.clCode}"/>'><c:out value="${result.clCodeNm}"/></option>
					</c:forEach>			  		   
				</select>
			</td>
		</tr> 
		<tr>
			<th class="board-write-th">코드ID</th>          
			<td class="board-write-td">
				<form:input  path="codeId"  maxlength="6" id="codeId" class="input-text"/>
				<form:errors path="codeId"/>
			</td>
		</tr> 
		<tr>
			<th class="board-write-th">코드ID명</th>          
			<td class="board-write-td">
				<form:input  path="codeIdNm" size="50" maxlength="60" id="codeIdNm" class="input-text"/>
				<form:errors path="codeIdNm"/>
			</td>    
		</tr> 
		<tr> 
			<th class="board-write-th">코드ID설명</th>
			<td class="board-write-td">
				<form:textarea path="codeIdDc" cols="50" rows="10" id="codeIdDc"/>
				<form:errors   path="codeIdDc"/>
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
	<input type="submit" value="목록" onclick="fn_egov_list_CmmnCode(); return false;" class="btn btn-default" />
	<input type="submit" value="저장" onclick="fn_egov_regist_CmmnCode(document.cmmnCode); return false;" class="btn btn-primary" />  
</div>

<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</body>
</html>
