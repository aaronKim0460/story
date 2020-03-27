<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="listVo" items="${list_headmenu }" varStatus="status">
	<c:if test="${status.count == 1 }">
	<c:out value="${listVo.menuNm }"/>/<c:out value="${listVo.menuOrdr }"/>]]]<c:out value="${listVo.menuNo }"/>
	<jsp:forward page="/sym/mnu/mpm/EgovMainMenuIndex.do?menuNo=${listVo.menuNo }&chkURL=folder"/>
	</c:if>
</c:forEach>
