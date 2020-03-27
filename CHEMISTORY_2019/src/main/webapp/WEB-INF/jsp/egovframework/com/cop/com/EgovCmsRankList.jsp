<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovCmsRankList.jsp
  * @Description : Cms 과 목록화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.06   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.06
  *  @version 1.0
  *  @see
  *
  */
%>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/cmm/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/cmm/button.css' />" rel="stylesheet" type="text/css">   	
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_userInfo('1');
		}
	}

	function fn_egov_select_rankInfo(pageIndex) {
		var _target = document.frm.targetMethod.value;
		document.frm.pageIndex.value = pageIndex;
		document.frm.action = "<c:url value='/cop/com/selectCmsRankList.do'/>";
		document.frm.submit();
	}

	function fn_egov_CmsRankDel(rankId) {

		if (confirm('삭제 하시겠습니까?')) {

			document.frm.rankCode.value = rankId;
			document.frm.action = "<c:url value='/cop/com/selectCmsRankDelete.do'/>";
			document.frm.submit();
		}
	}

	function fn_egov_registCmsRank(){

		if (confirm('<spring:message code="cop.reregist.msg" />')) {
			document.frm.action = "<c:url value='/cop/com/selectCmsRankRegist.do'/>";
			document.frm.submit();
		}
	}

	function fn_egov_CmsRankInqire(rankCd) {
		document.frm.rankCode.value = rankCd;
		document.frm.action = "<c:url value='/cop/com/selectCmsRankDetailSelect.do'/>";
		document.frm.submit();
	}
</script>
<title>과 목록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
<form name="frm" action ="" method="post">
<input type="hidden" name="targetMethod" value="<c:out value='${targetMethod}'/>" />
<input type="hidden" name="trgetId" value="<c:out value='${trgetId}'/>" />
<input type="hidden" name="rankCode" value="" />

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">
	   &nbsp;직급코드관리 목록</td>
	  <th >
	  </th>
	  <td width="10%" >
	   		<select name="searchCnd" class="select" title="검색조건선택">
			   <!-- option selected value=''--><!--선택하세요--><!-- /option-->
			   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >직급명</option>
			   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >직급 영문명</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색단어입력"/>
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	     	 <td width="5%"></td>
	     	 <td><span class="button"><input type="submit" value="조회" title="조회" onclick="javascript:fn_egov_select_rankInfo('1');return false;"></span></td>
             <td width="5%"></td>
             <td width="20%"><span class="button"><a href="<c:url value='/cop/com/selectCmsRankRegist.do'/>"><spring:message code="button.create" /></a></span></td>
             <td width="5%"></td>
		  
	    </tr>
	   </table>
	  </th>
	 </tr>
	</table>
	<table width="100%" cellpadding="8" class="table-line"  summary="번호, 사용자아이디 , 사용자명, 주소, 이메일, 비고   목록입니다">
	 <thead>
	  <tr>
	    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
	    <th scope="col" class="title" width="8%" nowrap>번호</th>
   	    <th scope="col" class="title" width="12%" nowrap>직급명</th>
	    <th scope="col" class="title" width="35%" nowrap>직급 영문명</th>
	    <th scope="col" class="title" width="8%" nowrap>비고</th>
	  </tr>
	 </thead>
	 <tbody>

		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap><a href="javascript:fn_egov_CmsRankInqire('<c:out value="${result.rankCode}"/>')"><c:out value="${result.rankName}" /></a></td>
		    <td class="lt_text3" nowrap><c:out value="${result.engName}" /></td>
		    <td class="lt_text3" nowrap>
		    	<input type="button" value="삭제"  onClick="javascript:fn_egov_CmsRankDel('<c:out value="${result.rankCode}"/>')" />
		    </td>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="6" ><spring:message code="common.nodata.msg" /></td>
		  </tr>
		 </c:if>

	 </tbody>
	 <!--tfoot>
	  <tr class="">
	   <td colspan=6 align="center"></td>
	  </tr>
	 </tfoot -->
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_rankInfo" />
	</div>
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</div>
</form>
</body>
</html>
