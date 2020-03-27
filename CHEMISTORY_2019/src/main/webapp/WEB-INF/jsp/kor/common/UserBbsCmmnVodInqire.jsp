<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp" %>
</c:if>
<script type="text/javascript">
	function onloading() {
		if ("<c:out value='${msg}'/>" != "") {
			alert("<c:out value='${msg}'/>");
		}
		<c:if test="${searchVO.preview eq 'Y'}">$(".fileArea").css({"width" : "100%" });</c:if>
	}

	function fn_egov_select_noticeList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/user/cop/bbs${prefix}/selectBoardList.do'/>";
		document.frm.submit();
	}

	function fn_egov_close_notice() {
		self.close();
	}	
	
	function fn_egov_delete_notice() {
		if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
			alert('등록시 사용한 패스워드를 입력해 주세요.');
			document.frm.password.focus();
			return;
		}

		if (confirm('<spring:message code="common.delete.msg" />')) {
			document.frm.action = "<c:url value='/user/cop/bbs${prefix}/deleteBoardArticle.do'/>";
			document.frm.submit();
		}
	}

	function fn_egov_moveUpdt_notice() {
		if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
			alert('등록시 사용한 패스워드를 입력해 주세요.');
			document.frm.password.focus();
			return;
		}

		document.frm.action = "<c:url value='/user/cop/bbs${prefix}/forUpdateBoardArticle.do'/>";
		document.frm.submit();
	}

	function fn_egov_addReply() {
		document.frm.action = "<c:url value='/user/cop/bbs${prefix}/addReplyBoardArticle.do'/>";
		document.frm.submit();
	}
</script>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<c:if test="${useComment == 'true'}">
<c:import url="/user/cop/cmt/selectCommentList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useSatisfaction == 'true'}">
<c:import url="/user/cop/stf/selectSatisfactionList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useScrap == 'true'}">
<script type="text/javascript">
	function fn_egov_addScrap() {
		document.frm.action = "<c:url value='/user/cop/scp/addScrap.do'/>";
		document.frm.submit();
	}
</script>
</c:if>
<!-- 2009.06.29 : 2단계 기능 추가  -->

<form name="frm" method="post" action="">
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" />
<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" />
<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" />
<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" />

<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />

<input type="hidden" name="searchCnd" id="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>" />
<input type="hidden" name="searchWrd" id="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" />
</form>
<div id="content">
	<div class="movie">
		<div class="view">
			<div class="title">
					<div class="subject ngb"><c:out value="${result.nttSj}" /> </div>
					<div class="date">업데이트 : <c:out value="${result.ntceDate}" /></div>
			</div>
		
			<div class="area clearfix">
					<div class="player">
						<object classid="CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95" type="application/x-oleobject" id="player" width="316" height="225">
							<param name="Filename" value="<c:url value='/cmm/fms/FileDown.do?atchFileId=${result.atchFileId}&fileSn=${fileSnStr }'/>">
							<param name="AutoStart" value="1">
						</object>
					</div>
			
					<div class="txt">
							<div class="txt_title">영상 자막</div>
							<div class="text_area" tabindex="0">
								<div>
									<c:out value='${result.nttCn }'/>
								</div>
							</div>
					</div>
			</div>
		</div>
	</div>
	<br />
	<div class="t_center mt20">
		<c:choose>
			<c:when test="${searchVO.preview ne 'Y'}">
				<a href="javascript:fn_egov_select_noticeList('<c:out value='${boardVO.pageIndex }'/>')" target='_self' class="btn seablue">목록</a>
				<a href="" class="btn gray">취소</a>
				<c:if test="${fn:length(sessionUniqId) > 0 }">
				<a href="javascript:fn_egov_moveUpdt_notice()" target='_self' class="btn seablue">수정</a>
				<!-- <a href="javascript:fn_egov_delete_notice()" target='_self'>삭제</a> -->
				</c:if>	
		    </c:when>
		    <c:otherwise>
		    	<a href="javascript:fn_egov_close_notice()" class="btn gray">닫기</a>
		    </c:otherwise>
	    </c:choose>
	</div>
</div>
<br />