<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cop/bbs/"/>

<link rel="stylesheet" type="text/css" href="/css/css2/sub.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/common-ui.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.custom.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/board.css" media="screen" />

<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/jquery.ui.ympicker.js"></script>
<script type="text/javascript" src="/js/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="<c:url value='/js/common2.js' />"></script>
<script type="text/javascript" src="/js/design/common.js"></script>
<script type="text/javascript" src="/html/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/js/egovframework/com/cmm/fms/EgovMultiFile.js" ></script>
<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js" ></script>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
