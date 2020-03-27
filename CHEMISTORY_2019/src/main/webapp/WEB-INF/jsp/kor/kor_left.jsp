<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="side_title" />
<c:forEach var="result" items="${list_menulist}" varStatus="status">
	<c:if test="${result.menuOrdr == 1 }"><c:set var="side_title" value="${result.menuNm }" /></c:if>
</c:forEach>
<h2><c:out value="${side_title}" /></h2>
<ul class="subMenuUl"><c:forEach var="result" items="${list_menulist }" varStatus="status">
	<c:if test="${result.menuOrdr == 2}">
	<li <c:if test="${result.menuNo == selectedUp || result.menuNo == selectedNo }">class="on"</c:if>>
		<a href="<c:url value="/EgovMovePage.do" />?menuNo=<c:out value='${result.menuNo}'/>"
			<c:choose>
				<c:when test="${result.menuType=='1'}">target="_blank"</c:when>
				<c:otherwise>target="_self"</c:otherwise>
			</c:choose>> <c:out value='${result.menuNm }'/>
		</a>
		<%--
		<c:if test="${result.menuNo == selectedUp || result.menuNo == selectedNo}">
			<c:set var="isSubMenu" value="0" />
			<c:forEach var="result1" items="${list_menulist }" varStatus="status">
				<c:if test="${result1.upperMenuId == result.menuNo  and result1.tabMenuUseAt ne 'Y' }"><c:set var="isSubMenu" value="${isSubMenu + 1 }" /></c:if>
			</c:forEach>		
			isSubMenu : ${isSubMenu }	
			<c:if test="${isSubMenu gt 0}">
				<ul>
					<c:forEach var="result1" items="${list_menulist }" varStatus="status">
						<c:if test="${result1.upperMenuId == result.menuNo }">
							<li <c:if test="${result1.menuNo == selectedUp || result1.menuNo == selectedNo }">class="on"</c:if>>
								<a href="<c:url value="/EgovMovePage.do" />?menuNo=<c:out value='${result1.menuNo}'/>"
								<c:choose><c:when test="${result1.menuType=='1'}">target="_blank"</c:when>
								<c:otherwise>target="_self"</c:otherwise></c:choose>><c:out value='${result1.menuNm }'/></a>
							</li></c:if></c:forEach>
				</ul></c:if></c:if>
				 --%>
	</li>
	</c:if>
	</c:forEach>
</ul>

