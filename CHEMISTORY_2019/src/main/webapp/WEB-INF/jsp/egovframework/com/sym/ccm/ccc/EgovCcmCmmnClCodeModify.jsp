<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cmmnClCode" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_CmmnClCode(){
	location.href = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_CmmnClCode(form){
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateCmmnClCode(form)){
			return;
		}else{
			form.submit();
		}
	}
}
-->
</script>

<body>

<form:form commandName="cmmnClCode" name="cmmnClCode" method="post">
<input name="cmd" type="hidden" value="Modify">
<form:hidden path="clCode"/>
<div class="content-body">
<div class="board-list">

	<table class="board-write">
	<caption>공통분류코드 수정</caption>
		<colgroup>
		    <col style="width:15%" />
		    <col />
		</colgroup>
		<tr>
			<th class="board-write-th">분류코드</th>
			<td class="board-write-td"><c:out value='${cmmnClCode.clCode}'/></td>
		</tr>
		<tr>
			<th class="board-write-th">분류코드명</th>
			<td class="board-write-td">
				<form:input  path="clCodeNm" size="60" maxlength="60" id="clCodeNm" class="input-text"/>
				<form:errors path="clCodeNm"/>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">분류코드설명</th>
			<td class="board-write-td">
				<form:textarea path="clCodeDc" rows="10" cols="60" id="clCodeDc"/>
				<form:errors   path="clCodeDc"/>
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
	<input type="submit" value="목록" onclick="fn_egov_list_CmmnClCode(); return false;" class="btn btn-default" />
	<input type="submit" value="저장" onclick="fn_egov_modify_CmmnClCode(document.cmmnClCode); return false;" class="btn btn-primary" />
	<!-- 
	<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="목록" width="8" height="20"></td>
	<td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fn_egov_list_CmmnClCode(); return false;">목록</a></td>
	<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="목록" width="8" height="20"></td>
	<td width="10"></td>
	 -->
</div>

</form:form>
</body>
</html>
