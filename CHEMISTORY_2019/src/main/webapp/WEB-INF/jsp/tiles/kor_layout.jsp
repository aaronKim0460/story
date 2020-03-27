<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<%@ page import="egovframework.com.cmm.service.*"%>
<%@ page import="egovframework.com.cmm.EgovWebUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" 	content="${menuManageVO.menuDc}" />
	<meta name="keywords" 		content="케미스토리<c:if test="${menuManageVO.menuNm ne null}">, ${menuManageVO.menuNm}</c:if>" />
	<title><c:if test="${menuManageVO.upMenuNm ne null && fn:trim(menuManageVO.upMenuNm) ne 'root'}">${menuManageVO.upMenuNm} - </c:if><c:if test="${menuManageVO.menuNm ne null}">${menuManageVO.menuNm} | </c:if>케미스토리</title>
	<tiles:insertAttribute name="script"/>
	<link rel="stylesheet" type="text/css" href="/assets/kor/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/assets/kor/css/board.css" />
	<script type="text/javascript" src="/js/common.js"></script>
</head>
<body id="section1">

<c:import url="/sym/mnu/mpm/EgovNoLoginMainMenuHead.do?vSiteType=KOR" charEncoding="UTF-8" /> 
<c:choose>
<c:when test="${menuManageVO.topMenuNo eq '0'}">
<div class="vImgBox vImgBox_<c:out value='${menuManageVO.upperMenuId}'/>">
	<div class="cBoxAni">
		<img src="/assets/kor/images/newMain/top_bg<c:out value='${menuManageVO.upperMenuId}'/>.png" alt="" />
		<img src="/assets/kor/images/newMain/t1_<c:out value='${menuManageVO.upperMenuId}'/>.png" alt="" class="c1Style" />
		<img src="/assets/kor/images/newMain/t2_<c:out value='${menuManageVO.upperMenuId}'/>.png" alt="" class="c2Style"  />
	</div>
</c:when>
<c:otherwise>
<div class="vImgBox vImgBox_<c:out value='${menuManageVO.topMenuNo}'/>">
	<div class="cBoxAni">
		<img src="/assets/kor/images/newMain/top_bg<c:out value='${menuManageVO.topMenuNo}'/>.png" alt="" />
		<img src="/assets/kor/images/newMain/t1_<c:out value='${menuManageVO.topMenuNo}'/>.png" alt="" class="c1Style" />
		<img src="/assets/kor/images/newMain/t2_<c:out value='${menuManageVO.topMenuNo}'/>.png" alt="" class="c2Style"  />
	</div>
</c:otherwise>
</c:choose>
	
</div>
<div class="contentLayout">
	<div class="leftBox">
		<c:import url="/sym/mnu/mpm/EgovNoLoginMenuLeft.do?movePage=${menuManageVO.progrmFileNm }&moveSite=KOR" charEncoding="UTF-8" /> 
	</div>
	<div class="contentBox">
		<div class="conTopBox">
			<h2 class="sub_title <c:out value='${menuManageVO.upperMenuId }'/>">
				<c:choose>
					<c:when test="${menuManageVO.menuOrdr == 3}"><c:out value='${menuManageVO.upMenuNm }'/></c:when>
					<c:when test="${menuManageVO.menuOrdr == 2}"><c:out value='${menuManageVO.menuNm }'/></c:when>
					<c:otherwise>메뉴명이상</c:otherwise>
				</c:choose>
				</h2>
			<div class="sub_txt"><c:out value='${menuManageVO.tabMenuText }'/></div>
			<div class="path">
				<img src="/assets/kor/images/common/ic_locationhome.gif"  alt="홈" /> <span></span>
				<c:if test="${menuManageVO.menuOrdr == 3 }"><c:out value='${menuManageVO.topMenuNm }'/><span>&gt</span></c:if>
				<c:if test="${menuManageVO.menuOrdr == 2 }"><c:out value='${menuManageVO.upMenuNm }'/><span> &gt</span></c:if>
				<c:out value='${menuManageVO.menuNm }'/>
			</div>
		</div>
		<!-- //sub_head -->
		<c:choose>
			<c:when test="${menuManageVO.dbUseYn == 'Y' && menuManageVO.contentViewTy == 'D' && not empty menuManageVO.progrmContent}">
				<div class="conCBox" id="contents">
			</c:when>
			<c:otherwise>
				<div class="conCBox">
			</c:otherwise>
		</c:choose>
		<c:if test="${menuManageVO.tabMenuUseAt eq 'Y' && menuManageVO.tabMenuCont!=null && menuManageVO.tabMenuCont!=''}">
		<!-- <div id="tabContMenu" style="display:none;"> -->
		<div id="tabContMenu">
			<div class="contentTab">
				<ul class="Tab01">
				<c:forEach items="${fn:split(menuManageVO.tabMenuCont,',')}" var="tabMenuCont">
					<c:set var="tabMenuContValue" value="${fn:split(tabMenuCont, '!@') }"/>
					<li><a href="/EgovMovePage.do?menuNo=<c:out value="${tabMenuContValue[0]}"/>" <c:if test="${menuManageVO.menuNo eq tabMenuContValue[0]}">class="on"</c:if>><c:out value="${tabMenuContValue[1]}"/></a></li>
				</c:forEach>
				</ul>
			</div>
		</div>
		</c:if>
		<c:choose>
			<c:when test="${menuManageVO.dbUseYn == 'Y' && menuManageVO.contentViewTy == 'D' && not empty menuManageVO.progrmContent }">
				<c:out value="${menuManageVO.progrmContent }"  escapeXml="false"/>
			</c:when>
			<c:otherwise>
				<tiles:insertAttribute name="content"/>
			</c:otherwise>
		</c:choose>
		</div>	
		<!-- 
		<div class="satisfaction">
			<h2  class="skip">담당자 정보</h2>
			<div class="admin_info" >
				<ul class="clearfix">
					<li><span>담당부서 :</span> <c:out value='${menuManager.menuAdmDpt }'/></li>
					<li><span>연락처 :</span> <c:out value='${menuManager.menuCttpc }'/></li>
					<li><span>최종 업데이트일 :</span> <c:out value='${menuManager.menuLastup }'/></li>
				</ul>        
			</div>
			
    	</div>
    	 -->
    	 
    	<div style="position:relative; height:30px; border-top:1px solid #ccc; padding-top:10px;">
	    	<div class="btnPrint"> 
				<a href="javascript:contentsPrint('<c:out value='${menuManageVO.menuNm }'/>')" class="btn02 btndarkgray"><img src="/assets/kor/images/bbs/ic_print.gif" alt="인쇄" style="vertical-align: middle" /> 인쇄</a>
			</div>
		</div>
  		<!-- //satisfaction -->
	</div>
</div>
<c:import url="/WEB-INF/jsp/kor/kor_bottom.jsp" charEncoding="UTF-8" /> 

</body>
</html>