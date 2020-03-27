<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/eng/main.css' />"/>
</head>

<body style="background:url('') repeat-x top ;">
<c:forEach var="result" items="${resultList}" varStatus="status">
<a href="/EgovMovePageMain.do?linkPage=<c:out value='${brdMstrVO.progrmFileNm}'/>&nId=<c:out value='${result.nttId }'/>&Command=READ" target="_top"><div class="img"><img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>" width="250px" height="120px"/></div>
<c:choose>
<c:when test="${fn:length(result.nttSj) > 145 }">
	<p><c:out value='${fn:substring(result.nttSj,20,fn:length(result.nttSj))}'/>...</p>
</c:when>
<c:otherwise>
	<p><c:out value='${result.nttSj}'/></p>
</c:otherwise>
</c:choose>
<c:out value='${result.nttCn}'/>
</a>			
</c:forEach>
</body>
</html>
