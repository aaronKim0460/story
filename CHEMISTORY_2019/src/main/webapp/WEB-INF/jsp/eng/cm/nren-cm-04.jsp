<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/eng/main.css' />"/>
</head>

<body style="background:url('') repeat-x top ;">
	<div id="content">
		<div class="main_left">
			<div class="visual">
				<div id="slides1">
					<div class="slides_container">
					<c:forEach var="fileVO" items="${resultList}" varStatus="status">
						<div class="slide"><a href="/EgovMovePageMain.do?linkPage=<c:out value='${brdMstrVO.progrmFileNm}'/>&nId=<c:out value='${fileVO.nttId }'/>&Command=READ" target="_top"><img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.atchFileId}"/>&fileSn=0" alt="" /></a></div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
