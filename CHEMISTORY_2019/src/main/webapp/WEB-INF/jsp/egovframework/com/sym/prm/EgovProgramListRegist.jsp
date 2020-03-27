<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<%--
  //String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
 // String imagePath_button = "/images/egovframework/com/sym/prm/button/";
--%>

<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>

<validator:javascript formName="progrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script language="javascript1.2" type="text/javaScript">
<!--

function insertProgramListManage(form) {
	if(confirm("<spring:message code="common.save.msg"/>")){
		if(!validateProgrmManageVO(form)){
			return;
		}else{

			form.submit();
		}
	}
}

function selectList(){
	location.href = "<c:url value='/sym/prm/EgovProgramListManageSelect.do' />";
}

/* ********************************************************
 * focus 시작점 지정함수
 ******************************************************** */
 function fn_FocusStart(){
		var objFocus = document.getElementById('F1');
		objFocus.focus();
	}


<c:if test="${!empty resultMsg}">alert("<c:out value='${resultMsg}'/>");</c:if>
-->
</script>

<body>

<form:form commandName="progrmManageVO" method="post" >
<input name="cmd" type="hidden" value="<c:out value='insert'/>"/>

<div class="content-body">
<div class="board-list">
	<table class="board-write">
   	<caption>프로그램목록 등록</caption>
		<colgroup>
		    <col style="width:20%" />
		    <col style="width:80%" />
		</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">프로그램파일명</th>
				<td class="board-write-td">
					<form:input path="progrmFileNm" class="input-text full"  maxlength="50" id="F1" />
					<form:errors path="progrmFileNm" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">저장경로</th>
				<td class="board-write-td">
					<form:input path="progrmStrePath" class="input-text full"  maxlength="60" />
					<form:errors path="progrmStrePath" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">한글명</th>
				<td class="board-write-td">
					<form:input path="progrmKoreanNm" class="input-text full"   maxlength="60" />
					<form:errors path="progrmKoreanNm"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">URL</th>
				<td class="board-write-td">
					<form:input path="URL" class="input-text full" maxlength="500" />
					<form:errors path="URL"/>	
				</td>
			</tr>
			<tr>
				<th class="board-write-th"></th>
				<td class="board-write-td">
				* 단순 페이지 링크인경우 /EgovPageLink.do?link=/guide/helloWorld 형식으로 입력
				</td>
			</tr>
			<!-- <tr>
				<th class="board-write-th">IFRAME URL</th>
				<td class="board-write-td">
					<form:input path="iframeUrl" class="input-text full" maxlength="500" />
					<form:errors path="iframeUrl"/>
				</td>
			</tr>
			 -->
			<tr>
				<th class="board-write-th">프로그램설명</th>
				<td class="board-write-td">
					<form:textarea path="progrmDc" rows="14" cols="75" cssClass="txaClass" />
					<form:errors path="progrmDc"/>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<a href="<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>" onclick="selectList(); return false;" class="btn btn-default">목록</a>
	<input type="submit" value="등록" onclick="insertProgramListManage(document.forms[0]); return false;" class="btn btn-primary">
</div>

</form:form>

</body>
</html>

