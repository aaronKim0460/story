<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="어린이 환경과 건강포털,한강물환경연구소,낙동강물환경연구소,금강물환경연구소,영산강물환경연구소,교통환경연구소" />
	<title>어린이 환경과 건강포털</title>
	
<link rel="stylesheet" type="text/css" href="/assets/kor/css/sub.css" />
<!-- <link rel="stylesheet" type="text/css" href="/css/css2/sub.css" media="screen" /> -->
<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" media="screen" />
	
<script type="text/javascript" src="/assets/kor/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/assets/kor/js/common.js"></script>
<script type="text/javascript" src="/assets/kor/js/sub.js"></script>
<script type="text/javascript" src="/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/js/menu.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<!--[if lt IE 8]>
<script src="/js/jquery.pseudo.js"></script>
<link rel="stylesheet" type="text/css" href="/css/ie7.css" media="screen" />
<![endif]-->



<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function() {
    var html = $("#contents",opener.document).html();
    $('#printView').html(html);
    window.print();
    setTimeout(function() { self.close(); }, 500);
});
</script>
</head>
<body id="section1">
	<div id="printView">
	
	</div>
</body>
</html>