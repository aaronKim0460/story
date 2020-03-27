<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>

<script type="text/javascript">
	//alert("KorNewsInqire.jsp");

	$(document).ready(function(){
		onloading();
	});

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

	function goPreNext(nttId) {
		$("input[name=nttId]").val(nttId);
		$("form[name=frm]").attr("action","<c:url value='/cop/bbs/selectNoLoginBoardArticle.do' />").submit();
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

<form name="frm" id="frm" action ="<c:url value='/cop/bbs${prefix}/selectNoLoginBoardList.do'/>" method="get">
<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
<input type="hidden" name="bbsId" id="bbsId" value="<c:out value='${result.bbsId}'/>" />
<input type="hidden" name="nttId" id="nttId" value="<c:out value='${result.nttId}'/>" />
<input type="hidden" name="parnts" id="parnts" value="<c:out value='${result.parnts}'/>" />
<input type="hidden" name="sortOrdr" id="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" />
<input type="hidden" name="replyLc" id="replyLc" value="<c:out value='${result.replyLc}'/>" />
<input type="hidden" name="nttSj" id="nttSj" value="<c:out value='${result.nttSj}'/>" />

<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" />

<input type="hidden" name="searchCnd" id="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>" />
<input type="hidden" name="searchWrd" id="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" />

<div id="contents">
	<table class="bbs_default view" summary="{게시물 제목} 상세보기로, 제목, 작성자, 내용, 첨부파일등 정보 제공" border="0">
	<caption>{게시판 명} 상세보기</caption>
	<colgroup>
		<col width="15%" />
		<col />
		<col width="10%" />
		<col width="10%" />
	</colgroup>
	<tbody>
		<tr>
			<th scope="row" ><span>제목</span></th>
			<td class="subject" colspan="3"><c:out value="${result.nttSj}" /></td>
		</tr>
		<tr>
			<th scope="row"><span>분류</span></th>
			<td>
				<c:choose>
				<c:when test="${result.extStr9 == '01' }">
					과학원30년사
				</c:when>
				<c:when test="${result.extStr9 == '02' }">
					애뉴얼레포트
				</c:when>
				<c:otherwise>
					뉴스 및 보도
				</c:otherwise>
				</c:choose>
			</td>
			<th scope="row" ><span>조회수</span></th>
			<td><c:out value="${result.inqireCo}" /></td>
		</tr>
		<tr>
			<th scope="row"><span>등록일</span></th>
			<td><c:out value="${result.ntceDate}" /></td>
			<th scope="row"><span>관련링크</span></th>
			<td><a href="<c:out value="${result.extStr1}" />" target="_blank"><c:out value="${result.extStr1}" /></a></td>
		</tr>
		<tr>
			<th scope="row"><span>첨부파일</span></th>
			<td colspan="3">
				<c:import url="/cmm/fms/selectNoLoginFileInfs.do" charEncoding="utf-8">
					<c:param name="param_atchFileId" value="${result.atchFileId}" />
				</c:import>				
			</td>
		</tr>
		<tr>
		<td class="substance" colspan="4">
			<c:out value="${result.nttCn}" escapeXml="false" />
		</td>
	</tr>
		<tr>
		<th scope="row"><span>이전 글</span></th>
		<td colspan="3">
			<c:choose>
			<c:when test="${result.preNttId != null}">
				<a href="javascript:goPreNext('<c:out value="${result.preNttId}"/>')"><c:out value="${result.preNttSj}" /></a>
			</c:when>
			<c:otherwise>
				이전 글이 존재하지 않습니다.
			</c:otherwise>
			</c:choose>
		</td>
	</tr>
		<tr>
		<th scope="row" ><span>다음 글</span></th>
		<td colspan="3">
			<c:choose>
			<c:when test="${result.nextNttId != null}">
				<a href="javascript:goPreNext('<c:out value="${result.nextNttId}"/>')"><c:out value="${result.nextNttSj}" /></a>
			</c:when>
			<c:otherwise>
				다음 글이 존재하지 않습니다.
			</c:otherwise>
			</c:choose>
		</td>
	</tr>
	</tbody>
	</table>
	
	<div class="t_center mt20">
		<a href="javascript:fn_egov_select_noticeList('<c:out value='${boardVO.pageIndex }'/>');" class="btn gray">목록</a>
		<c:if test="${sessionUniqId != null && fn:length(sessionUniqId) > 0}">
		<a href="javascript:fn_egov_moveUpdt_notice()" class="btn seablue">수정</a>
		<a href="javascript:fn_egov_delete_notice()" class="btn gray">삭제</a>
	    </c:if>
	</div>
</div>
</form>
