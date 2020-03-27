<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<input type="hidden" id="thumbFileId" name="thumbFileId" value="<c:out value='${atchFileId}'/>" />
<input type="hidden" id="thumbFileSn" name="thumbFileSn" />
<input type="hidden" name="thumbFileListCnt" id="thumbFileListCnt" value="<c:out value='${fileListCnt}'/>" />

<table id="file_list">
	<c:forEach var="fileVO" items="${fileList}" varStatus="status">
	<tr>
		<td style="padding-left:20px;">
		<c:choose>
			<c:when test="${updateFlag=='Y'}">
				<c:out value="${fileVO.orignlFileNm}"/>&nbsp; 
				<a href="javascript:fn_deleteThumbFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>');" name="btn_delete" class="btn-sm btn-warning">삭제</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:fn_thumbDownFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')">
				<c:out value="${fileVO.orignlFileNm}"/>&nbsp; 
				</a>
			</c:otherwise>
		</c:choose>
		</td>
	</tr>
	</c:forEach>
	<c:if test="${fn:length(fileList) == 0}">
		파일 없음
    </c:if>
</table>