<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/kor/kor_include.jsp" %>
<title>미리보기</title>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 닫기
		$("#btn_close").click(function(){
			self.close();
		});
		
	});
	
</script>

<body style="background:none;">

<div class="board-detail-content">
	<c:out value="${nttCn}" escapeXml="false" />
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">
		<a id="btn_close" name="btn_close" href="#" class="btn btn-default">닫기</a>
	</div>
</div>


</body>
</html>
