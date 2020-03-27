<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<script type="text/javaScript">
function setCookie() 
{ 
	var frm = document.pop;
    if (frm.setPopCookie.checked) 
    { 
    	setPopupCookie( "popupOpen" + frm.popupId.value, frm.popupId.value, 1); 
    } 
	self.close();
    //parent.mainPopClose('');
}; 

function setPopupCookie(name, value, expiredays) 
{ 
    var todayDate = new Date(); 
    todayDate.setDate(todayDate.getDate() + expiredays);  
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"; 
};
</script>

<style type="text/css">
body, p {margin:0px;}
</style>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" style="overflow-x:hidden;">
<div style="width:${pvo.popupWSize}; height:${pvo.popupHSize}; overflow:hidden;">
<c:out value="${ pvo.popupCn }" escapeXml="false" />
</div>		
<form name="pop" method="post" action="">
<input type="hidden" id="popupId" name="popupId" value="${ pvo.popupId }" />
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td style="background:#666; text-align:left; color:#fff; font-size:11px; height:34px;"> &nbsp;<input type="checkbox" name="setPopCookie" value="checkbox" onclick="setCookie();" id="close"/><label for="close">오늘 이 창을 다시 띄우지 않음</label></td>
			</tr>
		</table>
	</form>
</body>