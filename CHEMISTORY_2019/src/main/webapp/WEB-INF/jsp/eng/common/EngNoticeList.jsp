<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/cop/bbs/"/>
<%
 /**
  * @Class Name : KorNoticeList.jsp
  * @Description : 게시물 목록화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.19   이삼섭          최초 생성
  * @ 2011.11.11   이기하          익명게시판 검색시 작성자 제거
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.19
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
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />" ></script>
<c:choose>
<c:when test="${preview == 'true'}">
<script type="text/javascript">
<!--
	function press(event) {
	}

	function fn_egov_addNotice() {
	}

	function fn_egov_select_noticeList(pageNo) {
	}

	function fn_egov_inqire_notice(nttId, bbsId) {
	}
//-->
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
<!--
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_noticeList('1');
		}
	}

	function fn_egov_addNotice() {
		document.frm.action = "<c:url value='/cop/bbs${prefix}/addNierBoardArticle.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_noticeList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs${prefix}/selectNoLoginBoardList.do'/>";
		document.frm.submit();
	}

	function fn_egov_inqire_notice(i, nttId, bbsId) {
		document.subForm.nttId.value = nttId;
		document.subForm.bbsId.value = bbsId;
		document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectNoLoginBoardArticle.do'/>";
		document.subForm.submit();
	}
//-->
</script>
</c:otherwise>
</c:choose>
<title><c:out value="${brdMstrVO.bbsNm}"/></title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>
<body>



<form name="frm" action ="<c:url value='/cop/bbs${prefix}/selectNoLoginBoardList.do'/>" method="post">
<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
<input type="hidden" name="nttId"  value="0" />
<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<table width="100%" cellpadding="8" class="table-search" border="0" >
 <tr>
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <c:if test="${brdMstrVO.authFlag == 'Y'}">
	      <td class="button" nowrap><a href="<c:url value='/cop/bbs${prefix}/addNierBoardArticle.do'/>" onClick="javascript:fn_egov_addNotice(); return false;"><spring:message code="button.create" /></a></td>
      </c:if>
    </tr>
   </table>
  </th>
 </tr>
 </table>

<c:if test="${fn:length(brdMstrVO.bbs_desc_img_nm) > 1 }">
<p class="desc"><img src="<c:url value='${ brdMstrVO.bbs_desc_img_path}${ brdMstrVO.bbs_desc_img_nm}' />" /></p>
</c:if>

<div class="search_list">
<fieldset>
<legend>목록검색</legend>
<label for="search"><img src="<c:url value='/images/tprc/board/tit_search.gif' />" alt="search" /></label>

<select name="searchCnd" class="select" title="검색조건선택">
   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
   <c:if test="${anonymous != 'true'}">
   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
   </c:if>
</select>
<input name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' class="input_txt" onkeypress="press(event);" title="검색어 입력" />

<input type="image" src="<c:url value='/images/tprc/board/btn_search.gif' />" onclick="fn_egov_select_noticeList('1'); return false;" alt="검색하기"  />
</fieldset>

</div>
</form>


<div class="list">
<p class="total">총:<span><c:out value='${paginationInfo.totalRecordCount }'/> 건</span>, 현재페이지:<span><c:out value='${paginationInfo.currentPageNo }'/>/<c:out value='${paginationInfo.totalPageCount }'/></span></p>
<table width="100%" cellpadding="8" summary="번호, 제목, 게시시작일, 게시종료일, 작성자, 작성일, 조회수   입니다">
 <thead>
  <tr>
    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
    <th scope="col" class="first" width="10%" nowrap>NO</th>
    <th scope="col" nowrap>제목</th>
    <c:if test="${anonymous != 'true'}">
    	<th scope="col" width="15%" nowrap>담당자</th>
    </c:if>
    <th scope="col" width="12%" nowrap>등록일</th>
    <th scope="col" width="5%" nowrap>파일</th>
    <th scope="col" width="7%" nowrap>조회</th>
  </tr>
 </thead>

 <tbody>
	 <c:forEach var="result" items="${resultList}" varStatus="status">
	  <tr class="bg">
	    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
	    <td class="subject" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
	    <td class="subject" nowrap>
	    	<c:choose>
	    		<c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
			    	<c:if test="${result.replyLc!=0}">
			    		<c:forEach begin="0" end="${result.replyLc}" step="1">
			    			&nbsp;
			    		</c:forEach>
			    		<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
			    	</c:if>
	    			<c:out value="${result.nttSj}" />
	    		</c:when>
	    		<c:otherwise>
		    		<form name="subForm" method="post" action="<c:url value='/cop/bbs${prefix}/selectNoLoginBoardArticle.do'/>">
						<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
						<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
						<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
						<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
						<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				    	<c:if test="${result.replyLc!=0}">
				    		<c:forEach begin="0" end="${result.replyLc}" step="1">
				    			&nbsp;
				    		</c:forEach>
				    		<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
				    	</c:if>
			    		<span class="link">
			    			<input type="submit" style="width:320px;border:solid 0px black;text-align:left;" value="<c:out value="${result.nttSj}"/>" ></span>
			    	</form>
	    		</c:otherwise>
	    	</c:choose>
	    </td>
    	<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
		    <td class="subject" nowrap><c:out value="${result.ntceBgnde}"/></td>
		    <td class="subject" nowrap><c:out value="${result.ntceEndde}"/></td>
    	</c:if>
    	<c:if test="${anonymous != 'true'}">
	    	<td class="subject" nowrap><c:out value="${result.frstRegisterNm}"/></td>
	    </c:if>
	    <td class="subject" nowrap><c:out value="${result.ntceDate}"/></td>
	    <c:choose>
	    	<c:when test="${result.atchFileId == '' || result.atchFileId == null }">
	    		<td class="subject" nowrap>&nbsp;</td>
	    	</c:when>
	    	<c:otherwise>
	    		<td class="subject" nowrap><img src="<c:url value='/images/kor/board/ico_file.gif'/>"></td>
	    	</c:otherwise>
	    </c:choose>
	    
	    <td class="subject" nowrap><c:out value="${result.inqireCo}"/></td>
	  </tr>
	 </c:forEach>
	 <c:if test="${fn:length(resultList) == 0}">
	  <tr>
    	<c:choose>
    		<c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
    			<td class="subject" colspan="7" ><spring:message code="common.nodata.msg" /></td>
    		</c:when>
    		<c:otherwise>
    			<c:choose>
    				<c:when test="${anonymous == 'true'}">
		    			<td class="subject" colspan="4" ><spring:message code="common.nodata.msg" /></td>
		    		</c:when>
		    		<c:otherwise>
		    			<td class="subject" colspan="6" ><spring:message code="common.nodata.msg" /></td>
		    		</c:otherwise>
		    	</c:choose>
    		</c:otherwise>
    	</c:choose>
 		  </tr>
	 </c:if>
 </tbody>
</table>
</div> 
<div id="border">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<div align="center">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
</div>

</div>
</body>
</html>
