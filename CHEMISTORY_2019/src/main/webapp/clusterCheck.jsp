<%
session.setAttribute("a","a");
%>

<%@ page import="java.net.*" %>
<%@ page import="org.apache.commons.lang.StringUtils" %><pre>
<%
	System.out.println(StringUtils.isNumeric("aaa"));
	System.out.println(StringUtils.isNumeric("111"));
	System.out.println(StringUtils.isNumeric("111."));
	System.out.println(StringUtils.isNumeric("111.1"));
	System.out.println(StringUtils.isNumeric(".1"));
%>
<html>
<head>
<title> WAS Session Clustering Test Page</title>
</head>

<body>
<H1> WAS Session Clustering Test Page </H1>
 
<%
InetAddress inet= InetAddress.getLocalHost();
%>

<table>
	<tr>
		<td>requested URL:</td>
		<td><%=request.getRequestURL()%></td>
	</tr>

	<tr>
		<td>requested URI:</td>
		<td><%=request.getRequestURI()%></td>
	</tr>
	
	<tr>
		<td>WAS Host IP:</td>
		<td><%=inet.getHostAddress()%></td>
	</tr>
	
	<tr>
		<td>Client IP:</td>
		<td><%=request.getRemoteAddr()%></td>
	</tr>	
	
	<tr>
		<td>WAS Session ID:</td>
		<td><%=session.getId()%></td>
	</tr>	
</table>


</body>
</html>
