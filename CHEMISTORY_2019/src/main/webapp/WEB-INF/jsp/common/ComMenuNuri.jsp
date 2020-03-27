<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>

<c:choose>
	<c:when test="${menuManageVO.publicNuriTy  == 1}">
	<div id="menuNuri" class="origin">
		<span class="img"><a href="http://kogl.or.kr/" target="_blank" title="공공누리 새창 열림"><img src="/assets/kor/images/common/img_opentype01.png" alt="출처표시" /></a></span> 
		<a href="http://www.kogl.or.kr/open/info/license_info/by.do" target="_blank" title="공공누리 - 출처표시 조건 안내 새창 열림">본 저작물은 "공공누리" <em>출처표시</em></a> 조건에 따라 이용 할 수 있습니다.	
	</div>
	</c:when>
	 			
	<c:when test="${menuManageVO.publicNuriTy  == 2}">
	<div id="menuNuri" class="origin">
		<span class="img"><a href="http://kogl.or.kr/" target="_blank" title="공공누리 새창 열림"><img src="/assets/kor/images/common/img_opentype02.png" alt="출처표시-상업적 이용금지" /></a></span> 
		<a href="http://www.kogl.or.kr/open/info/license_info/nc.do" target="_blank" title="공공누리 - 출처표시 조건 안내 새창 열림">본 저작물은 "공공누리" <em>출처표시-상업적 이용금지</em></a> 조건에 따라 이용 할 수 있습니다.	
	</div>
	</c:when>
	 
	<c:when test="${menuManageVO.publicNuriTy  == 3}">
	<div id="menuNuri" class="origin">
		<span class="img"><a href="http://kogl.or.kr/" target="_blank" title="공공누리 새창 열림"><img src="/assets/kor/images/common/img_opentype03.png" alt="출처표시+변경금지" /></a></span> 
		<a href="http://www.kogl.or.kr/open/info/license_info/nd.do" target="_blank" title="공공누리 - 출처표시 조건 안내 새창 열림">본 저작물은 "공공누리" <em>출처표시+변경금지</em></a> 조건에 따라 이용 할 수 있습니다.	
	</div>
	</c:when>
	
	<c:when test="${menuManageVO.publicNuriTy  == 4}">
	<div id="menuNuri" class="origin">
		<span class="img"><a href="http://kogl.or.kr/" target="_blank" title="공공누리 새창 열림"><img src="/assets/kor/images/common/img_opentype04.png" alt="공공누리 4유형(출처표시-상업적 이용금지-변경금지)" /></a></span> 
		<a href="http://kogl.or.kr/open/info/license_info/all.do" target="_blank" title="공공누리 - 출처표시 조건 안내 새창 열림">본 저작물은 "공공누리" <em>출처표시+상업적 이용금지+변경금지</em></a> 조건에 따라 이용 할 수 있습니다.	
	</div>
	</c:when>
</c:choose>
