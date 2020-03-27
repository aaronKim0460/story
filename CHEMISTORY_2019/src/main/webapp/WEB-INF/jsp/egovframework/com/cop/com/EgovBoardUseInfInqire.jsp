<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<validator:javascript formName="boardUseInf" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
	function fn_egov_updt_bbsUseInf(){
		if (!validateBoardUseInf(document.boardUseInf)){
			return;
		}

		document.boardUseInf.action = "<c:url value='/cop/com/updateBBSUseInf.do'/>";
		document.boardUseInf.submit();
	}
	function fn_egov_select_bbsUseInfs(){
		document.boardUseInf.action = "<c:url value='/cop/com/selectBBSUseInfs.do'/>";
		document.boardUseInf.submit();
	}

</script>

<body>
<form name="boardUseInf" method="post" action="<c:url value='/cop/com/updateBBSUseInf.do'/>">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송" /></div>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
<input type="hidden" name="bbsId" value="<c:out value='${bdUseVO.bbsId}'/>" />
<input type="hidden" name="trgetId" value="<c:out value='${bdUseVO.trgetId}'/>" />
<input type="hidden" name="searchUseAt" value="<c:out value='${searchVO.searchUseAt}'/>" />
<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>" />
<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>" />
<div class="content-body">
<div class="board-list">

	<table class="board-write">
		<caption>글 등록</caption>
		<colgroup>
		    <col style="width:20%" />
		    <col style="width:80%" />
		</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">게시판명</th>
				<td class="board-write-td">
				<c:out value="${bdUseVO.bbsNm}" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">커뮤니티/동호회명</th>
				<td class="board-write-td">
					<c:choose>
					<c:when test="${not empty bdUseVO.cmmntyNm}">
					<c:out value="${bdUseVO.cmmntyNm}" />
					</c:when>
					<c:when test="${not empty bdUseVO.clbNm}">
					<c:out value="${bdUseVO.clbNm}" />
					</c:when>
					<c:otherwise>(시스템  활용)</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용여부</th>
				<td class="board-write-td">
				 	사용&nbsp;&nbsp;<input type="radio" name="useAt" class="radio2" value="Y" <c:if test="${bdUseVO.useAt == 'Y'}"> checked="checked"</c:if> />&nbsp;&nbsp;
					사용중지&nbsp;&nbsp;<input type="radio" name="useAt" class="radio2" value="N" <c:if test="${bdUseVO.useAt == 'N'}"> checked="checked"</c:if> />
					<br/><form:errors path="useAt" />
				</td>
			</tr>
			<c:choose>
			<c:when test="${not empty bdUseVO.provdUrl}">
			<tr>
				<th class="board-write-th">제공 URL</th>
				<td class="board-write-td">
					<a href="<c:out value="${bdUseVO.provdUrl}" />" target="_new"><c:out value="${bdUseVO.provdUrl}" /></a>
				</td>
			</tr>
			</c:when>
			</c:choose>
		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<a href="<c:url value='/cop/com/selectBBSUseInfs.do'/>" onclick="fn_egov_select_bbsUseInfs(); return false;" class="btn btn-default">목록</a>
	<a href="<c:url value='/cop/com/updateBBSUseInf.do'/>" onclick="fn_egov_updt_bbsUseInf(); return false;" class="btn btn-primary">수정</a>
</div>

</form>
</body>
</html>
