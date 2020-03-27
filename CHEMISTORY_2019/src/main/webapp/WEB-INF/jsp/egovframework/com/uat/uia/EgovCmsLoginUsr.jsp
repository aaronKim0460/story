<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.InetAddress" %>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<% 
	application.setAttribute("passIpList", EgovProperties.getProperty("Globals.passIpList"));
	String IP=request.getRemoteAddr();		
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>CMS3.1 통합관리 시스템</title>
<link rel="stylesheet" type="text/css" href="/css/common.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/common-ui.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/board.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/admin-layout.css" media="screen" />

<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/js/jquery.gsap.min.js"></script>

<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<script type="text/javaScript">

function checkLogin(userSe) {
    // 일반회원
    if (userSe == "GNR") {
        document.loginForm.rdoSlctUsr[0].checked = true;
        document.loginForm.rdoSlctUsr[1].checked = false;
        document.loginForm.rdoSlctUsr[2].checked = false;
        document.loginForm.userSe.value = "GNR";
    // 기업회원
    } else if (userSe == "ENT") {
        document.loginForm.rdoSlctUsr[0].checked = false;
        document.loginForm.rdoSlctUsr[1].checked = true;
        document.loginForm.rdoSlctUsr[2].checked = false;
        document.loginForm.userSe.value = "ENT";
    // 업무사용자
    } else if (userSe == "USR") {
        document.loginForm.rdoSlctUsr[0].checked = false;
        document.loginForm.rdoSlctUsr[1].checked = false;
        document.loginForm.rdoSlctUsr[2].checked = true;
        document.loginForm.userSe.value = "USR";
    }
}

function actionLogin() {

    if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
        return false;
    } else if (document.loginForm.password.value =="") {
        alert("비밀번호를 입력하세요");
        return false;
    } else {
        document.loginForm.action="<c:url value='/uat/uia/actionLogin.do'/>";
        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        return true;
    }
}

function actionCrtfctLogin() {
    document.defaultForm.action="<c:url value='/uat/uia/actionCrtfctLogin.do'/>";
    document.defaultForm.submit();
}

function goFindId() {
    document.defaultForm.action="<c:url value='/uat/uia/egovIdPasswordSearch.do'/>";
    document.defaultForm.submit();
}

function goRegiUsr() {

	var useMemberManage = '<c:out value='${useMemberManage}'/>';

	if(useMemberManage != 'true'){
		alert("사용자 관리 컴포넌트가 설치되어 있지 않습니다. \n관리자에게 문의하세요.");
		return false;
	}

    var userSe = document.loginForm.userSe.value;
    // 일반회원
    if (userSe == "GNR") {
        document.loginForm.action="<c:url value='/uss/umt/EgovStplatCnfirmMber.do'/>";
        document.loginForm.submit();
    // 기업회원
    } else if (userSe == "ENT") {
        document.loginForm.action="<c:url value='/uss/umt/EgovStplatCnfirmEntrprs.do'/>";
        document.loginForm.submit();
    // 업무사용자
    } else if (userSe == "USR") {
        alert("업무사용자는 별도의 회원가입이 필요하지 않습니다.");
    }
}

function goGpkiIssu() {
    document.defaultForm.action="<c:url value='/uat/uia/egovGpkiIssu.do'/>";
    document.defaultForm.submit();
}

function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "=";
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search);
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
    return "";
}

function saveid(form) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    else
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("saveid", form.id.value, expdate);
}

function getid(form) {
    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
}

function fnInit() {
}

$(document).ready(function(){
	$("#id").focus();
// 	fnInit();
});

</script>

<!--[if lt IE 8]>
<script src="/js/jquery.pseudo.js"></script>
<link rel="stylesheet" type="text/css" href="/css/ie7.css" media="screen" />
<![endif]-->
</head>

<body class="login">
<!-- wrap -->
<div id="wrap">
	<!-- header -->
	<div id="header">
		<h1 class="login-logo"><img src="/images/common/login_logo.png" alt="어린이 환경과 건강포털 홈페이지 통합관리 시스템" /></h1>
	</div>
	<!-- //header -->

	<!-- container -->
	<div id="container">
		<!-- Login Area -->
		<div class="login-area">
			<form name="loginForm" method="post" onsubmit="return actionLogin();">
				<input type="hidden" name="message" value="<c:out value='${message}'/>">
				<input name="userSe" type="hidden" value="USR"/>
            	<input name="siteType" type="hidden" value="ADMIN"/>
            	<input name="j_username" type="hidden"/>
				<fieldset>
					<legend>Login</legend>
					<div class="login-inner">
						<p class="row">
							<label for="login-id">ID</label>
							<input type="text" name="id" id="id" class="input input-login" value="" placeholder="아이디" />
						</p>
						<p class="row">
							<label for="login-pw">PASSWORD</label>
							<input type="password" name="password" id="password" class="input input-login" value="" placeholder="비밀번호" />
						</p>
						<p class="submit">
							<input type="submit" name="submit" value="로그인" class="btn-login" />
						</p>
					</div>
				</fieldset>
			</form>
		</div>
		<!-- //Login Area -->
	</div>
	<!-- //container -->

	<div id="footer">
		<span class="footer-address">(우)30103 세종특별자치시 도움6로 11 정부세종청사 6동 | 민원안내 : 044-201-6761</span>
		<span class="footer-copyright">Copyright Ministry of Environment All Rights Reseved.</span>
	</div>
</div>
<!-- //wrap -->

<div class="bg_img"><img src="/images/common/bg_login.jpg" alt="로그인" /></div>

</body>

</html>
