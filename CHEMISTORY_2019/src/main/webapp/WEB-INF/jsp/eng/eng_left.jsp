<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="lnb">
	<c:forEach var="result" items="${list_menulist }" varStatus="status">
		<c:if test="${ result.menuNo == selectedTop  }">
			<h2 class="lnb-title"><c:out value='${result.menuNm }'/></h2>	
		</c:if>
	</c:forEach>
	<ul>
	<c:forEach var="result" items="${list_menulist }" varStatus="status">
		<c:choose>
			<c:when test="${result.menuOrdr ==  2 && result.menuNo == selectedUp ||  result.menuOrdr ==  2 && result.menuNo == selectedNo }">
				<c:set var="upperID" value="${result.menuNo }"/>
				<li class="active"><a href="<c:url value="/EgovMovePage.do" />?menuNo=<c:out value='${result.menuNo}'/>"  target="_self"><c:out value='${result.menuNm }'/></a>
				</li>
			</c:when>
			<c:when test="${result.menuOrdr ==  2}">
				<c:set var="upperID2" value="${result.menuNo }"/>
				<li><a href="<c:url value="/EgovMovePage.do" />?menuNo=<c:out value='${result.menuNo}'/>"  target="_self"><c:out value='${result.menuNm }'/></a>
				</li>
			</c:when>
		</c:choose>
	</c:forEach>
	</ul>
</div>
