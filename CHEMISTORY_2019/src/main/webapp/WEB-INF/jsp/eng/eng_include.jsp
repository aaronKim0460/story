<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="keywords" content="어린이 환경과 건강포털" />
<meta name="description" content="어린이 환경과 건강포털,한강물환경연구소,낙동강물환경연구소,금강물환경연구소,영산강물환경연구소,교통환경연구소" />
<title>어린이 환경과 건강포털</title>


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-138744497-1"></script>
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-748958555"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-138744497-1');
  gtag('config', 'AW-748958555');
</script>



<link rel="stylesheet" type="text/css" href="<c:url value='/css/common-en.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common-ui.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/font-awesome.min.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery.bxslider.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/board.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/layout-en.css' />" media="screen" />

<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/js/jquery.gsap.min.js"></script>
<script type="text/javascript" src="/js/menu.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
</head>

<script type="text/javascript">

$(function() {
	gnb_subbg_height = 320;
	gnb_height = 390;
	
});

function shareSns(key){
	
	//var menuUrl = 'http://www.nier.go.kr/EgovMovePage.do?menuNo=' + '<c:out value="${menuManageVO.menuNo }" />'; 운영
	
	var menuUrl = 'http://localhost:8080/EgovMovePage.do?menuNo=' + '<c:out value="${menuManageVO.menuNo }" />'; // 개발
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
