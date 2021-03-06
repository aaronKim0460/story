<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import = "kr.go.chemistory.contest.action.ContestAction"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonUtil"%>
<%@ page import = "kr.go.chemistory.contest.framework.MessageBox"%>
<%@ page import = "java.util.Enumeration"%>
<%
	ContestAction act = new ContestAction();
	String strUrl = "/csu/contest/accept/hanleReceipt.jsp" ;
	String strMsg = "" ;
	String strResult = "" ;
	try {
		act.setSave(request) ;
		strMsg = (String)request.getAttribute("MSG");
		strUrl = CommonUtil.nullCheck((String)request.getAttribute("RETURL"));
		strResult = CommonUtil.nullCheck((String)request.getAttribute("DATA"));
	}catch(Exception e){
		e.printStackTrace();
		out.println(CommonUtil.sendErr("/"));
		return ;
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" >
</head>
<body>
<form method="post" name="form1" >
<%
Enumeration e = request.getParameterNames();
while(e.hasMoreElements()) {
	String strParamName = (String)e.nextElement() ;
	String strParamValue = request.getParameter(strParamName) ;
	strParamValue = CommonUtil.getReplace(strParamValue, "\"", "'") ;
%>
<input type="hidden" name="<%=strParamName%>" value="<%=strParamValue%>" > 
<%
}
%>
<input type="hidden" name="receipt_no" id="receipt_no" value="<%= strResult %>" />
</form>
<script language="JavaScript">
<%
	out.println(MessageBox.getMsg(strMsg));
%>
document.form1.action = "<%=strUrl%>" ;
document.form1.submit();
</script>
</body>
</html>