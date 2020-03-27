<%
 /**
  * @Class Name : EgovWordDicaryRegist.jsp
  * @Description : EgovWordDicaryRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *
  *  @author 공통서비스팀
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
<link rel="stylesheet" type="text/css" href="/css/css2/sub_content.css" media="screen" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="wordDicaryVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_worddicary(){

	// 첫 입력란에 포커스..
	wordDicaryVO.wordNm.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_worddicary(form){

	// 서버사이드 테스트용
/*
	form.action = "<c:url value='/uss/olh/wor/WordDicaryRegist.do'/>";
	form.submit();
	return;
*/

	if (!validateWordDicaryVO(form)) {

		return;

	} else {
		document.getElementById('wordDc').value = CKEDITOR.instances.wordDc.getData();
		
		form.action = "<c:url value='/uss/olh/wor/WordDicaryRegist.do'/>";
		form.submit();

	}

}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_worddicarylist() {

	wordDicaryVO.action = "<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>";
	wordDicaryVO.submit();


}
</script>
<script type="text/javascript">
_editor_area = "wordDc";
</script>
</head>
<body onLoad="fn_egov_initl_worddicary();">
<form:form commandName="wordDicaryVO"   action="${pageContext.request.contextPath}/uss/olh/wor/WordDicaryRegist.do"  method="post">
	<input type="hidden" name="searchKeyword" value="<c:out value="${searchVO.searchKeyword}" />">
	<input type="hidden" name="searchCondition" value="<c:out value="${searchVO.searchCondition}" />">
	<input type="hidden" name="firstAlphabet" value="<c:out value="${searchVO.firstAlphabet}" />">
	<input type="hidden" name="firstChar" value="<c:out value="${searchVO.firstChar}" />">
	<input type="hidden" name="pageIndex" value="<c:out value="${searchVO.pageIndex}" />">


<div class="content-body">
<div class="board-list">
<h2 class="adminH2">환경용어사전</h2>
<table class="board-write">
<caption>용어사전등록</caption>
<colgroup>
	<col style="width:20%" />
	<col style="width:80%" />
</colgroup>
<tbody>		
  <tr>
    <th class="board-write-th" ><label for="wordNm">용어명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
   <td class="board-write-td">
        <form:input path="wordNm" size="60" maxlength="60" cssClass="input-text" title="용어명" />
    	<div><form:errors path="wordNm"/></div>
    </td>
  </tr>

  <tr>
    <th class="board-write-th" ><label for="engNm">영문명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
   <td class="board-write-td">
      <form:input path="engNm" size="60" maxlength="60" cssClass="input-text" title="영문명"  />
      <div><form:errors path="engNm"/></div>
    </td>
  </tr>

  <tr>
		<td class="board-write-editor" colspan="2">
				<textarea id="wordDc" name="wordDc" class="textarea-board" cols="75" rows="20"></textarea>
				<form:errors path="wordDc" /> 
				<script type="text/javascript">
				CKEDITOR.replace( 'wordDc',{
				  'filebrowserUploadUrl':'/html/ckeditor/upload.jsp?'
				    +'realUrl=/ImgTemp/'
				    +'&realDir=ImgTemp'
				});
				</script>
		</td>
  </tr>

  <tr>
    <th class="board-write-th" ><label for="synonm">동의어</label>&nbsp;&nbsp;</th>
   <td class="board-write-td">
      <form:input path="synonm" size="60" maxlength="60" cssClass="input-text"  title="동의어" />
      <div><form:errors path="synonm"/></div>
    </td>
  </tr>
</tbody>
</table>
</div>
</div>

<div class="text-center">
	<a href="<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>" onclick="fn_egov_inqire_worddicarylist(); return false;" class="btn btn-default"><spring:message code="button.list" /></a>
	<input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_regist_worddicary(document.forms[0]); return false;" class="btn btn-primary" />
</div>

</form:form>


</body>
</html>
