<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>

<validator:javascript formName="progrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2" type="text/javaScript">
<!--

function updateProgramListManage(form) {
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateProgrmManageVO(form)){
			return;
		}else{
            form.action="<c:url value='/sym/prm/EgovProgramListDetailSelectUpdt.do' />";
			form.submit();
		}
	}
}

function deleteProgramListManage(form) {
	if(confirm("<spring:message code="common.delete.msg" />")){
        form.action="<c:url value='/sym/prm/EgovProgramListManageDelete.do' />";
		form.submit();
	}
}

function selectList(){
	location.href = "<c:url value='/sym/prm/EgovProgramListManageSelect.do' />";
}
<c:if test="${!empty resultMsg}">alert("<c:out value='${resultMsg}'/>");</c:if>
-->
</script>

<body>

<form:form commandName="progrmManageVO" method="post">
<input name="cmd" type="hidden" value="<c:out value='update'/>"/>

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
					<form:input  path="progrmFileNm" class="input-text full"  maxlength="50" />
					<form:errors path="progrmFileNm"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">저장경로</th>
				<td class="board-write-td">
					<form:input  path="progrmStrePath" class="input-text full"  maxlength="50" />
					<form:errors path="progrmStrePath"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">한글명</th>
				<td class="board-write-td">
					<form:input path="progrmKoreanNm" class="input-text full"  maxlength="60" />
					<form:errors path="progrmKoreanNm" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">URL</th>
				<td class="board-write-td">
					<form:input path="URL" class="input-text full" maxlength="200" />
					<form:errors path="URL" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th"></th>
				<td class="board-write-td">
				* 단순 페이지 링크인경우 /EgovPageLink.do?link=/guide/helloWorld 형식으로 입력
				</td>
			</tr>
			<!--  <tr>
				<th class="board-write-th">IFRAME URL</th>
				<td class="board-write-td">
					<form:input path="iframeUrl" class="input-text full" maxlength="200" />
					<form:errors path="iframeUrl" />
				</td>
			</tr>
			-->
			<tr>
				<th class="board-write-th">프로그램설명</th>
				<td class="board-write-td">
					<form:textarea path="progrmDc" rows="14" cols="75" />
					<form:errors path="progrmDc"/>
				</td>
			</tr>
  		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<a href="<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>" onclick="selectList(); return false;" class="btn btn-default">목록</a>
	<input type="submit" value="저장" onclick="updateProgramListManage(document.forms[0]); return false;" class="btn btn-primary">  
	<a href="<c:url value='/sym/prm/EgovProgramListManageDelete.do'/>?progrmFileNm=<c:out value="${progrmManageVO.progrmFileNm  }"/>" onclick="deleteProgramListManage(document.forms[0]); return false;" class="btn btn-warning">삭제</a>
</div>

</form:form>

</body>
</html>

