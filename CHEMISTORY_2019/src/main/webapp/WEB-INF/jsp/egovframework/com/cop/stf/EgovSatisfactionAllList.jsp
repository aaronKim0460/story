<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovProgramListManage.jsp
  * @Description : 프로그램목록 조회 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/prm/button/";
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/button.css' />" type="text/css">
<title>메뉴평가리스트</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

<script language="javascript1.2" type="text/javaScript">

function linkPage(pageNo){
	document.stfgListForm.subPageIndex.value = pageNo;
	document.stfgListForm.action = "<c:url value='/cop/stf/selectSatisfactionAllList.do'/>";
   	document.stfgListForm.submit();
}

<!--
/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.progrmManageForm.checkField;
    if(document.progrmManageForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectProgramListManage() {
	document.progrmManageForm.pageIndex.value = 1;
	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>";
	document.progrmManageForm.submit();
}
/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertProgramListManage() {
   	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListRegist.do'/>";
   	document.progrmManageForm.submit();
}
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtProgramListDetail(progrmFileNm) {
	document.progrmManageForm.tmp_progrmNm.value = progrmFileNm;
   	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListDetailSelect.do'/>";
   	document.progrmManageForm.submit();
}

-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->

<form name="stfgListForm" action ="<c:url value='/cop/stf/selectSatisfactionAllList.do' />" method="post">
<input name="subPageIndex" type="hidden" value="<c:out value='${satisfactionVO.subPageIndex}'/>"/> 
<input name="checkedProgrmFileNmForDel" type="hidden" />
<DIV id="main" style="display:">

<table width="791" cellpadding="8" cellspacing="1" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;메뉴평가 목록</h1></td>
 </tr>
</table>
<table width="791" border="0" cellpadding="0" cellspacing="1">
 <tr>
  <td width="100%">
    <table width="100%" border="0" cellspacing="1" class="table-register" summary="프로그램목록관리 검색조건">
   	<caption>프로그램목록관리</caption>
      <tr>
        <th width="20%" height="40" class="" scope="row">
        	<select name="searchCnd" class="select" title="검색조건선택">
			   <option value="0" <c:if test="${satisfactionVO.searchCnd == '0'}">selected="selected"</c:if> >부서/과</option>
			   <option value="1" <c:if test="${satisfactionVO.searchCnd == '1'}">selected="selected"</c:if> >프로그램명</option>
			</select>
        </th>
        <td width="80%">
          <table border="0" cellspacing="0" cellpadding="0" align="left">
            <tr>
              <td><input name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' size="30" class="input_txt" onkeypress="press(event);" title="put search word" /></td>
              <td width="5%"></td>
              <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="selectProgramListManage(); return false;" /></span></td>
              <td width="5%"></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
   </td>
 </tr>
</table>
<table width="791" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="75%">&nbsp;</td>
    <td width="25%" height="10">&nbsp;
    </td>
  </tr>
</table>
<table width="791" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10">&nbsp; </td>
  </tr>
</table>
<table width="717" cellpadding="8" class="table-line" style="table-layout:fixed" summary="프로그램목록관리 목록으로 프로그램파일명, 프로그램명, url,프로그램설명 으로 구성">
   	<caption>프로그램목록관리 목록</caption>
 <thead>
  <tr>
    <th class="title" width="120" scope="col">부서/과</th>
    <th class="title" width="150" scope="col">페이지코드</th>
    <th class="title" scope="col">프로그램명</th>
    <th class="title" width="80" scope="col">평점</th>
    <th class="title" width="80" scope="col">건수</th>
  </tr>
 </thead>
 <tbody>
 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
 <c:if test="${fn:length(resultList) == 0}">
 <tr>
 <td class="lt_text3" colspan="5">
	<spring:message code="common.nodata.msg" />
 </td>
 </tr>
 </c:if>
 <c:forEach var="result" items="${resultList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap><c:out value="${result.menuAdminDpt}"/></td>
    <td class="lt_text" style="cursor:hand;" nowrap><c:out value="${result.progrmFileNm}"/></td>
    <td class="lt_text" nowrap><c:out value="${result.menuNm}"/></td>
    <td class="lt_text" nowrap><c:out value="${result.stsfdgAv}"/></td>
    <td class="lt_text" nowrap><c:out value="${result.stsfdgCn}"/></td>
  </tr>
 </c:forEach>
 </tbody>
 <!--tfoot>
  <tr class="">
   <td colspan=6 align="center"></td>
  </tr>
 </tfoot -->
</table>
<table width="717" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
  <tr>
    <td height="10">
<!-- 페이징 시작 -->
<div align="center">
  <div>
	<ui:pagination paginationInfo = "${paginationInfo}"	type="image" jsFunction="linkPage"/>
  </div>
</div>
<!-- 페이징 끝 -->
    </td>
  </tr>
</table>


</DIV>


<input type="hidden" name="cmd">
<input type="hidden" name="tmp_progrmNm">
</form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</DIV>
</body>
</html>

