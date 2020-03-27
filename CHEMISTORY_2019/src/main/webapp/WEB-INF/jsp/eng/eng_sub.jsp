<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/eng/eng_include.jsp" %>

<script type="text/javascript">
</script>
<body>


<div id="wrap">

	<c:import url="/sym/mnu/mpm/EgovNoLoginMainMenuHead.do?vSiteType=ENG"/> 

	<div id="container">
		
		<div id="sidebar">
			<c:import url="/sym/mnu/mpm/EgovNoLoginMenuLeft.do?movePage=${menuManageVO.progrmFileNm }&moveSite=ENG"/> 
		</div>

	<div id="content" class="sub">
		<div class="content-head">
			<h2 class="content-head-title"><c:out value='${menuManageVO.menuNm}'/></h2>
			<div class="content-head-path">
			<ul>
				<li class="first"><a class="path-home">Home</a></li>
				<c:if test="${menuManageVO.menuOrdr == 2 }">
				<li><c:out value='${menuManageVO.upMenuNm }'/></li>
				</c:if>
				<li><c:out value='${menuManageVO.menuNm }'/></li>
			</ul>
			
			</div>
			
			<div class="content-snstools">
				<button class="ico-twitter" title="트위터" onclick="javascript:shareSns('twitter');">
					<span class="hide">트위터</span>
				</button>
				<button class="ico-facebook" title="페이스북" onclick="javascript:shareSns('facebook');">
					<span class="hide">페이스북</span>
				</button>
				<button class="ico-google" title="구글플러스" onclick="javascript:shareSns('google');">
					<span class="hide">구글플러스</span>
				</button>
			</div>
		</div>
		
		<iframe name='IframePortlet_7876' id='IframePortlet_7876' title='<c:out value='${menuManageVO.menuNm }'/>' onload='iframe_autoresize(this)' src='<c:url value="${menuManageVO.menuUrl}" />' width='100%' height='425px' scrolling='no' frameborder='0' ></iframe>
		
		<c:import url="../common/ComMenuNuri.jsp"/>
		
		<div class="content-officer">
			<div id="div_bbs2"></div>
		</div>
	</div>
	</div>
</div>

</div>

	<c:import url="./eng_bottom.jsp"/>
	
</body>
</html>
