<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="keywords" content="케미스토리 어린이 환경과 건강포털" />
<meta name="description" content="케미스토리 어린이 환경과 건강포털" />
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

<link rel="stylesheet" type="text/css" href="/css/common.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/common-ui.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/flexslider.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/board.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/layout-nier.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/template.css" media="screen" />

<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="/js/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/js/jquery.gsap.min.js"></script>
<script type="text/javascript" src="/js/menu.js"></script>
<script type="text/javascript" src="/html/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
</head>

<script type="text/javascript">
var preLoc = document.referrer.replace('http://', '');
//preLoc = preLoc.replace('http://', '');
var preDo = preLoc.split('/');

var mobileKeyWords = new Array('iPhone','iPod','BlackBerry','Android','Windows CE','LG','MOT','SAMSUNG','SonyEricsson');
for(var word in mobileKeyWords){

//if(navigator.userAgent.match(mobileKeyWords[word])!=null){
//if(preDo[0] != 'm.nier.go.kr'){
//location.href="http://m.nier.go.kr";
//break;
//}
//}
}

$(function(){
	// GNB 애니메이션 높이 지정
	gnb_subbg_height = 350;
	gnb_height = 420;
	
	// 만족도
	$("#div_bbs2").load("<c:url value='/cop/stf/anonymous/selectComSatisfactionList.do'/>?selectMenu=<c:out value='${menuManageVO.menuNo}'/>");
});

function forward(obj){
	if(obj.site.value == "") return false;
	return true;
}

function iframe_autoresize(arg) {
	
	$("iframe").css("height", $("iframe").contents().find("body").height() + 50 + "px");
	
	$("iframe").contents().find("body").click(function(){
		$("iframe").css("height", $("iframe").contents().find("body").height() + 50 + "px");
	});
}

function iframe_autoresize_in2501(obj){
	var iframeObj = document.getElementById("IframePortlet_6396");
	var innerBody = obj;
	var innerHeight = innerBody.scrollHeight + (innerBody.offsetHeight - innerBody.clientHeight);
	var innerWidth = innerBody.scrollWidth + (innerBody.offsetWidth - innerBody.clientWidth);
	if(navigator.appName == "Netscape"){ 
	iframeObj.height = innerHeight;
	iframeObj.width = innerWidth;
	}else{
	iframeObj.style.height = innerHeight;
	iframeObj.style.width = innerWidth;
	}
}

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