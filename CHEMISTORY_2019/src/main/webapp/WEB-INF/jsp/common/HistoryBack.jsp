<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.*"%>
<%@ page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	PageUtil pu = new PageUtil(request);
	
	String _forward_page 	= EgovWebUtil.clearXSSMinimum(request.getParameter( "_forward_page" ));		// 이동할 페이지.
	String mode 			= EgovWebUtil.clearXSSMinimum(request.getParameter( "mode" ));				// 현재화면 처리구분. 디폴트는 _forward_page로 이동.
	String openermode 		= EgovWebUtil.clearXSSMinimum(request.getParameter( "openermode" ));			// 팝업에서 사용하는 경우 부모창에 대한 제어처리구분.
	String resultMsg 		= (String)request.getAttribute( "resultMsg" );	// 메세지.
%>
<c:set var="actionUrl"><%=_forward_page%></c:set>
<form name="frm" action="<c:url value='${actionUrl}'/>" method="post">
	<%=pu.getRequestToHiddenTag()%>
</form>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
	window.onload = function()
	{
		history.back();
	};
//-->
</script>