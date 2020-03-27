<%
 /**
  * @Class Name : EgovWordDicaryDetailInqure.jsp
  * @Description : EgovWordDicaryDetailInqure 화면
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
<link rel="stylesheet" type="text/css" href="/css/css2/sub_content.css" media="screen" />
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_worddicary(){



}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_worddicarylist() {

	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>";
	document.WordDicaryForm.submit();

}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_worddicary(wordId){

	// Update하기 위한 키값(wordId)을 셋팅
	document.WordDicaryForm.wordId.value = wordId;
	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/WordDicaryUpdtView.do'/>";
	document.WordDicaryForm.submit();

}

/* ********************************************************
 * 삭제처리화면
 ******************************************************** */
function fn_egov_delete_worddicary(wordId){

	if	(confirm("<spring:message code="common.delete.msg" />"))	{

		// Delete하기 위한 키값(wordId)을 셋팅
		document.WordDicaryForm.wordId.value = wordId;
		document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/WordDicaryDelete.do'/>";
		document.WordDicaryForm.submit();
	}

}
</script>
</head>

<body onLoad="fn_egov_initl_worddicary();">
<!-- 상단타이틀 -->
<form name="WordDicaryForm" action="<c:url value='/uss/olh/wor/WordDicaryUpdtView.do'/>" method="post">
	<input type="hidden" name="searchKeyword" value="<c:out value="${searchVO.searchKeyword}" />">
	<input type="hidden" name="searchCondition" value="<c:out value="${searchVO.searchCondition}" />">
	<input type="hidden" name="firstAlphabet" value="<c:out value="${searchVO.firstAlphabet}" />">
	<input type="hidden" name="firstChar" value="<c:out value="${searchVO.firstChar}" />">
	<input type="hidden" name="pageIndex" value="<c:out value="${searchVO.pageIndex}" />">

<div class="content-body">
<div class="board-list">
<h2 class="adminH2">환경용어사전</h2>
<table class="board-write" summary="용어사전에 대한 정보를 조회합니다.">
<caption>용어사전상세조회</caption>
<colgroup>
    <col style="width:20%" />
    <col style="width:80%" />
</colgroup>
<tbody>	
  <tr>
    <th class="board-write-th" nowrap >용어명&nbsp;&nbsp;</th>
    <td class="board-write-td">
    	<c:out value="${result.wordNm}"/>
    </td>
  </tr>

  <tr>
    <th class="board-write-th" >영문명&nbsp;&nbsp;</th>
    <td class="board-write-td">
    	<c:out value="${result.engNm}"/>
    </td>
  </tr>

  <tr>
    <th class="board-write-th" ><label for="wordDc">용어설명&nbsp;&nbsp;</label></th>
    <td class="board-write-td"><c:out value="${result.wordDc}" escapeXml="false" /></td>
  </tr>

  <tr>
    <th class="board-write-th" >동의어&nbsp;&nbsp;</th>
    <td class="board-write-td">
    	<c:out value="${result.synonm}"/>
    </td>
  </tr>

  <tr>
    <th class="board-write-th" >등록일자&nbsp;&nbsp;</th>
    <td class="board-write-td">
    	<c:out value="${result.frstRegisterPnttm}"/>
    </td>
  </tr>

  <tr>
    <th class="board-write-th" >등록자&nbsp;&nbsp;</th>
    <td class="board-write-td">
    	<c:out value="${result.emplyrNm}"/>
    </td>
  </tr>
</tbody>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10px"></td>
</tr>
</table>

<input name="wordId" type="hidden" value="">
</form>
</div>

<div class="text-center">
	<a href="<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>" onclick="fn_egov_inqire_worddicarylist(); return false;" class="btn btn-default"><spring:message code="button.list" /></a>
	<a href="<c:url value='/uss/olh/wor/WordDicaryDelete.do'/>?wordId=<c:out value='${result.wordId}'/>" onclick="fn_egov_delete_worddicary('<c:out value="${result.wordId}"/>'); return false;" class="btn btn-primary"><spring:message code="button.delete" /></a>
	<input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_worddicary('<c:out value="${result.wordId}"/>'); return false;" class="btn btn-primary">
</div>

</body>
</html>
