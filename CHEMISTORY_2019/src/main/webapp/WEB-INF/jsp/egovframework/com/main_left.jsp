<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	var onList;
	
	// 1depth
	$("#lnbMainUl").children().click(function(){
		
		var idx = $("#lnbMainUl").children().index($(this));
		
		// 클래스 제거
		$("#lnbMainUl").children().removeClass("on");
		
		// 하위 메뉴 닫기
		$("#lnbMainUl").children().find("ul").css("display", "none");
		
		// 클래스 on
		$("#lnbMainUl").children().eq(idx).addClass("on");
		
		$("#lnbMainUl").children().eq(idx).find("ul").css("display", "block");
		
		onList = $("#lnbMainUl .on");
		
	});

	$("#lnbMainUl li").children().click(function(){
		
		var idx = $("#lnbMainUl li").children().index($(this));
		
		// 클래스 제거
		$("#lnbMainUl").children().removeClass("on");
		
		// 하위 메뉴 닫기
		$("#lnbMainUl").children().find("ul").css("display", "none");
		
		// 클래스 on
		$("#lnbMainUl").children().eq(idx).addClass("on");
		
		$("#lnbMainUl").children().eq(idx).find("ul").css("display", "block");
		
	});	

	
	// 1depth
	/**
	$("#lnbMainUl").children().mouseover(function(){
		
		var idx = $("#lnbMainUl").children().index($(this));
		
		// 클래스 제거
		$("#lnbMainUl").children().removeClass("on");
		
		// 하위 메뉴 닫기
		$("#lnbMainUl").children().find("ul").css("display", "none");
		
		// 클래스 on
		$("#lnbMainUl").children().eq(idx).addClass("on");
		
		$("#lnbMainUl").children().eq(idx).find("ul").css("display", "block");
		
	});
	
	// 1depth
	$("#lnbMainUl").mouseleave(function(){
		
		// 클래스 제거
		$("#lnbMainUl").children().removeClass("on");
		
		// 하위 메뉴 닫기
		$("#lnbMainUl").children().find("ul").css("display", "none");
		
		for(var i in onList){
			
			$(onList).eq(i).addClass("on");
			
			$(onList).eq(i).find("ul").css("display", "block");
		}
		
	});
	**/
	
	// 2depth
	$("#lnbMainUl ul").children().click(function(){
		
		var idx = $("#lnbMainUl ul").children().index($(this));
		
		// 클래스 제거
		$("#lnbMainUl ul").children().removeClass("on");
		
		// 클래스 on
		$("#lnbMainUl ul").children().eq(idx).addClass("on");
		
	});
	
	$("#lnbMainUl a").click(function(e){
		
		if($(this).attr("href") == "" || $(this).attr("href") == "folder")e.preventDefault();
		
	});
	
	onList = $("#lnbMainUl .on");
});

</script>
</head>

<body>

<div id="container" class="clearfix">
<div class="wrap clearfix">

<div id="side" class="clearfix">
    <div class="side_title">
    	<c:forEach var="result" items="${list_menulist}" varStatus="status">
			<c:if test="${result.menuLevel eq 0 }">
				<c:out value='${result.menuNm }'/>
			</c:if>
		</c:forEach>
    </div>
    <div class="side_menu">
        <ul id="lnbMainUl">
        	<c:set var="onFalg" value="N" />
        	<c:forEach var="result" items="${list_menulist }" varStatus="status">
        		<c:if test="${result.menuNo eq resultVO.tempInt}"><c:set var="onFalg" value="Y" /></c:if>
				<c:if test="${result.menuLevel eq 1}">
					<li <c:if test="${onFalg eq 'Y'}">class="on"</c:if>>
						<c:set var="onFalg" value="Y" />
						
						<c:choose>
							<c:when test="${fn:indexOf(result.chkUrl,'?')>0 }">
								<a href="<c:url value="${result.chkUrl}" />&menuNo=<c:out value='${result.menuNo}'/>" target="${result.menuType eq '1' ? "_blank" : "main_right"}"><c:out value='${result.menuNm }'/></a>
							</c:when>
							<c:when test="${result.chkUrl=='folder' }">
								<a href="<c:url value="${result.chkUrl}" />" target="${result.menuType eq '1' ? "_blank" : "main_right"}"><c:out value='${result.menuNm }'/></a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value="${result.chkUrl}" />?menuNo=<c:out value='${result.menuNo}'/>" target="${result.menuType eq '1' ? "_blank" : "main_right"}"><c:out value='${result.menuNm }'/></a>
							</c:otherwise>
						</c:choose>
						
						<c:set var="isSubMenu" value="0"/>
						<c:forEach var="result1" items="${list_menulist }" varStatus="status">
							<c:if test="${result1.upperMenuId == result.menuNo }">
								<c:set var="isSubMenu" value="${isSubMenu + 1 }"/>
							</c:if>
						</c:forEach>
						<c:if test="${isSubMenu gt 0}">
							<ul class="clearfix" <c:if test="${onFalg eq 'N'}"> style="display:none;"</c:if>>
								<c:set var="subOnFalg" value="Y" />
								<c:forEach var="result1" items="${list_menulist }" varStatus="status">
									<c:if test="${result1.upperMenuId == result.menuNo }">
										<li <c:if test="${onFalg eq 'Y' and subOnFalg eq 'Y' }">class="on"</c:if>>
											<c:choose>
												<c:when test="${fn:indexOf(result1.chkUrl,'?')>0 }">
													<a href="<c:url value="${result1.chkUrl}" />&menuNo=<c:out value='${result1.menuNo}'/>"  target="${result1.menuType eq '1' ? "_blank" : "main_right"}"><c:out value='${result1.menuNm }'/></a>
												</c:when>
												<c:when test="${result1.chkUrl=='folder' }">
													<a href="<c:url value="${result1.chkUrl}" />"  target="${result1.menuType eq '1' ? "_blank" : "main_right"}"><c:out value='${result1.menuNm }'/></a>
												</c:when>
												<c:otherwise>
													<a href="<c:url value="${result1.chkUrl}" />?menuNo=<c:out value='${result1.menuNo}'/>"  target="${result1.menuType eq '1' ? "_blank" : "main_right"}"><c:out value='${result1.menuNm }'/></a>
												</c:otherwise>
											</c:choose>
											
											
											
											<c:set var="isSubMenu2" value="0"/>
											<c:forEach var="result2" items="${list_menulist }" varStatus="status">
												<c:if test="${result2.upperMenuId == result1.menuNo }">
													<c:set var="isSubMenu2" value="${isSubMenu2 + 1 }"/>
												</c:if>
											</c:forEach>
											<c:if test="${isSubMenu2 gt 0}">
												<ul class="clearfix" <c:if test="${subOnFalg eq 'N'}"> style="display:none;"</c:if>>
													<c:set var="subOnFalg2" value="Y" />
													<c:forEach var="result2" items="${list_menulist }" varStatus="status">
														<c:if test="${result2.upperMenuId == result1.menuNo }">
															<li <c:if test="${subOnFalg eq 'Y' and subOnFalg2 eq 'Y' }">class="on"</c:if>>
																<c:choose>
																	<c:when test="${fn:indexOf(result2.chkUrl,'?')>0 }">
																		<a href="<c:url value="${result2.chkUrl}" />&menuNo=<c:out value='${result2.menuNo}'/>"  target="${result2.menuType eq '1' ? "_blank" : "main_right"}"><c:out value='${result2.menuNm }'/></a>
																	</c:when>
																	<c:when test="${result2.chkUrl=='folder' }">
																		<a href="<c:url value="${result2.chkUrl}" />"  target="${result2.menuType eq '1' ? "_blank" : "main_right"}"><c:out value='${result2.menuNm }'/></a>
																	</c:when>
																	<c:otherwise>
																		<a href="<c:url value="${result2.chkUrl}" />?menuNo=<c:out value='${result2.menuNo}'/>"  target="${result2.menuType eq '1' ? "_blank" : "main_right"}"><c:out value='${result2.menuNm }'/></a>
																	</c:otherwise>
																</c:choose>
															</li>
															<c:set var="subOnFalg2" value="N" />
														</c:if>
													</c:forEach>
												</ul>
											</c:if>
											
										</li>
										<c:set var="subOnFalg" value="N" />
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</li>
					
					<c:set var="onFalg" value="N" />
				</c:if>
			</c:forEach>
        </ul>    
    </div>
    <!-- //side_menu -->
</div>
<!-- //side -->

</body>
</html>