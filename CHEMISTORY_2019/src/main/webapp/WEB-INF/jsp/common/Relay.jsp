<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.*"%>
<%@ page import="egovframework.com.cmm.EgovWebUtil"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovStringUtil"%>
<%@ page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	PageUtil pu = new PageUtil(request);
	
	String _forward_page 	= EgovWebUtil.clearXSSMinimum(request.getParameter( "_forward_page" ));		// 이동할 페이지.
	String mode 			= EgovWebUtil.clearXSSMinimum(request.getParameter( "mode" ));				// 현재화면 처리구분. 디폴트는 _forward_page로 이동.
	String openermode 		= EgovWebUtil.clearXSSMinimum(request.getParameter( "openermode" ));			// 팝업에서 사용하는 경우 부모창에 대한 제어처리구분.
	String resultMsg 		= EgovWebUtil.clearXSSMinimum((String)request.getAttribute( "resultMsg" ));	// 메세지.

    String methodtype 			= EgovWebUtil.clearXSSMinimum(request.getParameter( "methodtype" ));				// method type get,post

	if( !EgovStringUtil.isEmpty( _forward_page ) ){
        _forward_page = URLDecoder.decode(request.getParameter("_forward_page"), "UTF-8");
    }
    if( EgovStringUtil.isEmpty( methodtype ) ){
        methodtype = "post";
    }
 
%>

<c:set var="actionUrl"><%=_forward_page%></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>어린이 환경과 건강포털</title>
</head>
<body>
	<form name="frm" action="<c:url value='${actionUrl}'/>" method="<%=methodtype%>">
		<%=pu.getRequestToHiddenTag()%>
	</form>
	<script type="text/javaScript" language="javascript" defer="defer">
	<!--
		<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
	
		window.onload = function()
		{
			<%
			// 팝업인 경우 실행할 스크립트
			if ("reload".equals( openermode ) )
				out.println("opener.location.reload();");
	
			// 작업완료후 실행할 스크립트
			if ( "close".equals( mode ) )
				out.println("self.close();");
			else
				out.println("document.frm.submit();");
			%>
		};
	//-->
	</script>
</body>
</html>