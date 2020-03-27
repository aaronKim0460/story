<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/WEB-INF/jsp/eng/eng_include.jsp" %>


	<ul>
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<li>
			<a href="/EgovMovePageMain.do?menuNo=<c:out value="${param.menuNo}" />&nId=<c:out value='${result.nttId }'/>&Command=READ">
			<c:choose>
			<c:when test="${fn:length(result.nttSj) > 40 }">
				<c:out value='${fn:substring(result.nttSj,0,40)}'/>...
			</c:when>
			<c:otherwise>
				<c:out value='${result.nttSj}'/>
			</c:otherwise>
			</c:choose>
			</a>
			<span class="date"><c:out value='${result.ntceDate}'/></span>
		</li>
		</c:forEach>
	</ul>

