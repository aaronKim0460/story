<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovNoticeInqire.jsp
  * @Description : 게시물 조회 화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.23   이삼섭          최초 생성
  * @ 2009.06.26   한성곤          2단계 기능 추가 (댓글관리, 만족도조사)
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.23
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/cmm/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />"></script>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
	function onloading() {
		if ("<c:out value='${msg}'/>" != "") {
			alert("<c:out value='${msg}'/>");
		}
	}

	function fn_egov_select_noticeList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs${prefix}/selectNoLoginBoardList.do'/>";
		document.frm.submit();
	}

	function fn_egov_delete_notice() {
		if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
			alert('등록시 사용한 패스워드를 입력해 주세요.');
			document.frm.password.focus();
			return;
		}

		if (confirm('<spring:message code="common.delete.msg" />')) {
			document.frm.action = "<c:url value='/cop/bbs${prefix}/deleteNierBoardArticle.do'/>";
			document.frm.submit();
		}
	}

	function fn_egov_moveUpdt_notice() {
		if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
			alert('등록시 사용한 패스워드를 입력해 주세요.');
			document.frm.password.focus();
			return;
		}

		document.frm.action = "<c:url value='/cop/bbs${prefix}/forNierUpdateBoardArticle.do'/>";
		document.frm.submit();
	}

	function fn_egov_addReply() {
		document.frm.action = "<c:url value='/cop/bbs${prefix}/addReplyBoardArticle.do'/>";
		document.frm.submit();
	}
</script>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<c:if test="${useComment == 'true'}">
<c:import url="/cop/cmt/selectCommentList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useSatisfaction == 'true'}">
<c:import url="/cop/stf/selectSatisfactionList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useScrap == 'true'}">
<script type="text/javascript">
	function fn_egov_addScrap() {
		document.frm.action = "<c:url value='/cop/scp/addScrap.do'/>";
		document.frm.submit();
	}
</script>
</c:if>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<title><c:out value='${result.bbsNm}'/> - 글조회</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body onload="onloading();">
<form name="frm" method="post" action="">
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" />
<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" />
<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" />
<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" />

<div id="content">
	<!-- description -->
	<c:if test="${fn:length(brdMstrVO.bbs_desc_img_nm) > 1 }">
	<p class="desc"><img src="<c:url value='${ brdMstrVO.bbs_desc_img_path}${ brdMstrVO.bbs_desc_img_nm}' />" alt="교통환경연구소의 공지사항을 알려드립니다.원하시는 자료를 제목, 내용, 담당자로 검색할 수 있습니다." /></p>
	</c:if>
	<!-- //description -->
	<!-- view -->
	<div class="view">
		<!-- 작성관련 제목과 내용 -->
		<table>
		<colgroup>
			<col width="14%" /><col width="25%" />
			<col width="12%" /><col width="25%" />
			<col width="12%" /><col width="12%" />
		</colgroup>
		<tr>
			<th scope="row">제목</th>
			<td colspan="5" class="subject"><c:out value="${result.nttSj}" /></td>
		</tr>
		<tr>
			<th scope="row">담당자</th>
			<td>
			<c:choose>
	    	<c:when test="${anonymous == 'true'}">
	    		******
	    	</c:when>
	    	<c:when test="${result.ntcrNm == null || result.ntcrNm == ''}">
	    		<c:out value="${result.frstRegisterNm}" />
	    	</c:when>
	    	<c:otherwise>
	    		<c:out value="${result.ntcrNm}" />
	    	</c:otherwise>
	    	</c:choose>
			</td>
			<th scope="row">등록일</th>
			<td><c:out value="${result.ntceDate}" /></td>
			<th scope="row">조회</th>
			<td><c:out value="${result.inqireCo}" /></td>
		</tr>
		<tr>
			<th scope="row">첨부파일</th>
			<td colspan="5">
				<c:import url="/cmm/fms/selectNoLoginFileInfs.do" charEncoding="utf-8">
					<c:param name="param_atchFileId" value="${result.atchFileId}" />
				</c:import>				
			</td>
		</tr>
		</table>
		<!-- //작성관련 제목과 내용 -->
	</div>
	<!-- //view -->

	<!-- 표 내용 -->
	<div class="view_cont">

		<c:out value="${result.nttCn}" escapeXml="false" />

	</div>
	<!-- //표 내용 -->

	<!-- 버튼 -->
	<div class="btn_right">
		<a href="javascript:fn_egov_select_noticeList('1');"><img src='<c:url value='/han/images/board/btn_list.gif' />' alt='목록' /></a>
		
		<c:if test="${result.frstRegisterId == sessionUniqId}">
		<a href='board-edit.do?boardId=GMRVCF04&command=WRITE'><img src="<c:url value='/han/images/board/btn_registeration.gif' />" alt="등록" /></a>
		<a href="javascript:fn_egov_moveUpdt_notice();"><img src="<c:url value='/han/images/board/btn_modify.gif' />" alt="수정" /></a>
		<a href="javascript:fn_egov_delete_notice();"><img src="<c:url value='/han/images/board/btn_delete.gif' />" alt="삭제"/></a>
		</c:if>
	
	</div>
	<!-- //버튼 -->

	<!-- view -->
	<div class="view">
		<!-- 이전 다음글 -->
		<table class="other">
		<caption>이전글과 다음글 링크표</caption>
		<colgroup><col width="14%" /><col width="*" /></colgroup>
	

		</table>
		<!-- //이전 다음글 -->
	</div>
	<!-- //view -->
</div>
</form>
</body>
</html>
