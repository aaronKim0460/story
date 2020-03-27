<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>CMS3.1 통합관리 시스템</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/default.css" />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/common-n.css" />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/template.css" />" media="screen" />
<script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/main-head.js" />"></script>

<script type="text/javascript"> 

$(document).ready(function(){
	
	// 로그아웃
	$("#btnLogout").click(function(){
		
		$("#targetForm").attr("action", "<c:url value='/uat/uia/actionLogout.do'/>");
		$("#targetForm").attr("target", "_top");
		$("#targetForm").submit();
		
	});
	
	// 메뉴 선택
	$("ul[name=headMenuList] li").click(function(){
		
		var idx = $("ul[name=headMenuList] li").index($(this));
		
		$("ul[name=headMenuList] li").removeClass("on")
		$("ul[name=headMenuList] li").eq(idx).addClass("on");
		
	});
	
});
	

// 메뉴 이동
function fn_main_headPageMove(menuNo, url) {
	
	$("#vStartP").val(menuNo);
	$("#chkURL").val(url);
	$("#vStartP").val(menuNo);
	
	// lnb
	$("#targetForm").attr("action", "<c:url value='/sym/mnu/mpm/EgovMainMenuLeft.do'/>");
	$("#targetForm").attr("target", "main_left");
	$("#targetForm").submit();
	
	// content
	$("#targetForm").attr("action", "<c:url value='/sym/mnu/mpm/EgovMainMenuRight.do'/>");
	$("#targetForm").attr("target", "main_right");
	$("#targetForm").submit();
}

function fn_member_information_modify(){
	window.open('about:blank', 'memberModifyPop', 'width=800, height=600');
	$("#targetForm").find("#selectedId").val("<c:out value='${loginVO.uniqId }'/>");
	$("#targetForm").attr("action", "<c:url value='/uss/umt/EgovUserSelectUpdtView.do'/>");
	$("#targetForm").attr("target", "memberModifyPop");
	$("#targetForm").submit();
}
</script>
</head>

<body>
<form id="targetForm" name="targetForm">
<input id="vStartP" name="vStartP" type="hidden" />
<input id="chkURL" name="chkURL" type="hidden" />
<input id="siteType" name="siteType" type="hidden" value="ADMIN"/>
<input id="siteType" name="siteType" type="hidden" value="ADMIN"/>
<input id="selectedId" name="selectedId" type="hidden" value=""/>
<input id="openType" name="openType" type="hidden" value="Y"/>
</form>
<div id="sub">

<div id="header">
<div class="wrap clearfix">
    <div class="logo"><a href="#"><img src="<c:url value="/images/common/logo_1.png" />"  alt="어린이 환경과 건강포털 로고"/><img src="<c:url value="/images/common/logo_2.png" />"  alt="어린이 환경과 건강포털 홈페이지 통합관리 시스템"/></a></div>

    <div class="gnb" style="z-index: 999">
       <span onclick="fn_member_information_modify();" style="cursor:pointer"><c:out value='${loginVO.name }'/></span>
	   <a id="btnLogout" href="#" class="logout">로그아웃</a>
    </div>

		<div id="lnb">
			<ul id="top1menu" class="clearfix">
        <li class="n1 on"><a href="#n"><span>시스템관리</span></a>
            <div><div>
            <ul name="headMenuList" class="clearfix">
				<c:forEach var="result" items="${list_headmenu}" varStatus="status" >
					<c:if test="${result.sysMenuAt == 'Y'}">
						<c:choose>
							<c:when test="${result.menuType==0 }">
								<li <c:if test="${status.index == 0}">class="on"</c:if>><a href="javascript:fn_main_headPageMove('<c:out value="${result.menuNo}"/>','<c:out value="${result.chkURL}"/>')"><c:out value='${result.menuNm }'/></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="<c:out value='${result.chkURL}'/>" target="_blank"><c:out value='${result.sysMenuAt }'/><c:out value='${result.menuNm }'/></a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
            </ul>
            </div></div>
        </li>
        <li class="n2"><a href="#n"><span>콘텐츠관리</span></a>
            <div><div>
            <ul name="headMenuList" class="clearfix">
				<c:forEach var="result" items="${list_headmenu}" varStatus="status" >
					<c:if test="${result.sysMenuAt != 'Y'}">
						<c:choose>
							<c:when test="${result.menuType==0 }">
								<li><a href="javascript:fn_main_headPageMove('<c:out value="${result.menuNo}"/>','<c:out value="${result.chkURL}"/>')"><c:out value='${result.menuNm }'/></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="<c:out value='${result.chkURL}'/>" target="_blank"><c:out value='${result.menuNm }'/></a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
            </ul>
            </div>
            	<!-- <img src="/assets/kor/images/common/ic_locationhome.gif"  alt="홈" /> <span></span> -->
				<c:if test="${menuManageVO.menuOrdr == 3 }"><c:out value='${menuManageVO.topMenuNm }'/><span>&gt</span></c:if>
				<c:if test="${menuManageVO.menuOrdr == 2 }"><c:out value='${menuManageVO.upMenuNm }'/><span> &gt</span></c:if>
				<c:out value='${menuManageVO.menuNm }'/>
            </div>
        </li>
        </ul>
    </div>
    <!-- //lnb -->
    
</div>
<!-- //wrap -->
</div>
</body>
</html>