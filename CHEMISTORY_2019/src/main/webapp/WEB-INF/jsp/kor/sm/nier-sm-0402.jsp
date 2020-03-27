<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="context" value="${pageContext.request.contextPath}" />

<script type="text/javascript">

$(document).ready(function(){
	
	$(".sitemap > ul > li").eq(1).addClass("mid");
	$(".sitemap > ul > li").eq(3).addClass("line2");
	$(".sitemap > ul > li").eq(4).addClass("line2");
	$(".sitemap > ul > li").eq(4).addClass("mid");
	$(".sitemap > ul > li").eq(5).addClass("line2");
	$(".sitemap .depth").eq(0).css({"height" : "900px" });
	$(".sitemap .depth").eq(1).css({"height" : "900px" });
	$(".sitemap .depth").eq(2).css({"height" : "900px" });
	$(".sitemap .depth").eq(3).css({"height" : "900px" });
	
});

</script>

<div id="contents">

	<!-- 본문내용 시작  -->
	<div class="siteMap">
		<ul>
		<c:forEach var="result1" items="${list_menulist}" varStatus="status" begin="0" end="5" step="1">
		<c:if test="${result1.menuOrdr == 1 }">
			<li><h3>${result1.menuNm }</h3>
				<ul class="subMap">
				<c:forEach var="result2" items="${list_menulist}" varStatus="status2">
				<c:if test="${result1.menuNo == result2.upperMenuId && result2.menuOrdr == 2}">
				<li><a href="${context}/EgovMovePage.do?menuNo=${result2.menuNo}" target="_top"><c:out value='${result2.menuNm }'/></a></li>
				</c:if>
				</c:forEach>
				</ul>
			</li>
		</c:if>
		</c:forEach>
		</ul>
	</div>
</div>
<!-- //contents -->