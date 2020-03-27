<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<%@ page import="egovframework.com.cmm.*"%>
<%@ page import="egovframework.com.cmm.EgovWebUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="keywords" content="national institute of environmental research" />
<meta name="description" content="national institute of environmental research" />
<title>CMS3.1</title>
<tiles:insertAttribute name="css"/>
<tiles:insertAttribute name="script"/>

<script type="text/javascript">
$(function() {
	gnb_subbg_height = 320;
	gnb_height = 390;

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

function shareSns(key){
	
	//var menuUrl = 'http://www.nier.go.kr/EgovMovePage.do?menuNo=' + '<c:out value="${menuManageVO.menuNo }" />'; 운영
	//var menuUrl = 'http://localhost:8080/EgovMovePage.do?menuNo=' + '<c:out value="${menuManageVO.menuNo }" />'; // 개발
	<%PageUtil pu = new PageUtil(request);%>
	var menuUrl = 'http://www.nier.go.kr'+'<%= EgovWebUtil.clearXSSMinimum((String)request.getAttribute(RequestDispatcher.FORWARD_REQUEST_URI)) %>'+'<%=EgovWebUtil.clearXSSMinimum((String)pu.getRequestSNSURL())%>';
	
	var menuDc = encodeURI('<c:out value="${menuManageVO.menuDc }" />');
	var summary = encodeURI($('title').text());
	
	if(key == 'twitter'){
		
		var url = 'http://twitter.com/share?text=' + menuDc + '&url=' + encodeURIComponent(menuUrl);
		
		window.open(url, 'twitter', 'width=650, height=450');	
	
	}else if(key == 'facebook'){
		
		var url = 'http://www.facebook.com/share.php?s=100&amp;p[summary]=' + summary + '&amp;p[title]=' + menuDc + '&amp;p[url]=' + encodeURIComponent(menuUrl);
		
		window.open(url, 'facebook', 'width=650, height=450');
		
	}else if(key == 'google'){
		
		var url = 'https://plus.google.com/share?url=' + encodeURIComponent(menuUrl);
		
		window.open(url, 'google', 'width=650, height=450');
	}
	
}
</script>
<script type="text/javascript" src="/js/menu.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<!--[if lte IE 8]>
<script src="/js/selectivizr-min.js"></script>
<![endif]-->
<!--[if lte IE 7]>
<script src="/js/jquery.pseudo.js"></script>
<link rel="stylesheet" type="text/css" href="/css/ie7.css" media="screen" />
<![endif]-->
</head>

<body>
<div class="skip-nav"><a href="#content">Skip to Content</a></div>
<!-- wrap -->
<div id="wrap">
	<!-- header -->
	<c:import url="/sym/mnu/mpm/EgovNoLoginMainMenuHead.do?vSiteType=ENG"/>
	<!-- //header -->
	<!-- container -->
	<div id="container">
		<div id="sidebar">
			<c:set var="moveParam" value=""/>
			<c:if test="${empty param.moveSite}">
				<c:set var="moveParam" value="&moveSite=ENG"/>
			</c:if>
			<c:import url="/sym/mnu/mpm/EgovNoLoginMenuLeft.do?movePage=${menuManageVO.progrmFileNm }${moveParam}"/> 
		</div><!-- //sidebar -->
		<div id="content" class="sub">
			<!-- content-head -->
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
				</div><!-- //content-head-path -->
				
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
				</div><!-- //content-snstools -->
			</div><!-- //content-head -->
			
			<!-- content-body -->
			<tiles:insertAttribute name="content"/>
			<!-- //content-body -->
		</div><!-- //content -->
	</div><!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/eng/eng_bottom.jsp" %>
	<!-- //footer -->
</div><!-- //wrap -->
</body>
</html>