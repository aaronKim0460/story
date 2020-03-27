<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
$(function() {

	$('.footer-banner-ul').bxSlider({
		auto:true,
		pager:false,
		minSlides: 3,
		moveSlides:1,
		maxSlides: 5,
		slideWidth: 178 ,
		slideMargin: 10,
		nextSelector: '#slider-next',
		prevSelector: '#slider-prev'
	});
});
</script>

<span id="slider-prev"></span>
<span id="slider-next"></span>
<ul  class="footer-banner-ul">
	<c:forEach var="fileVO" items="${fileList}" varStatus="status">
         <li><a href="<c:out value="${fileVO.linkUrl}"/>" <c:choose><c:when test="${fileVO.targetAt == '0' }">target="_blank"</c:when><c:otherwise>target="_top"</c:otherwise></c:choose>  title="새 창으로 이동" ><img alt="배너 이미지" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.bannerImageFile}"/>'/></a></li>
   	</c:forEach> 
</ul>




