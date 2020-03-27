<%@ page contentType="text/html; charset=euc-kr" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<script type="text/javascript" src="/csu/inc/common.js"></script>
<link rel="stylesheet" type="text/css" href="/csu/inc/common.css" />
<link rel="stylesheet" type="text/css" href="../env_kid.css" /><!-- 어린이 메뉴 Only -->
<script type="text/javascript" src="../env_js.js"></script><!-- 어린이 메뉴 Only -->
</head>
<body>
<script>
function reSize()
{
	try{
		if(navigator.appName.indexOf("Microsoft Internet Explorer") != 0)
		{
			var objBody	=	parent.document.all["ifrm"].contentWindow.document.body;		
			var objFrame	=	parent.document.all["ifrm"];

		    objFrame.style.height = objBody.scrollHeight;
		    objFrame.style.width = '100%';
			
		}
		else
		{
			var objBody	    =	ifrm.document.body;
			var objFrame	=	document.all["ifrm"];


			objFrame.style.height = objBody.scrollHeight + (objBody.offsetHeight - objBody.clientHeight)
			objFrame.style.width = '100%'
		}
	}
	//An error is raised if the IFrame domain != its container's domain
	catch(e)
	{
	    //err_handle(e);
	}
}
</script>
<div id="btm_base_bg">
<table cellspacing="0" cellpadding="0" border="0" id="ly_frame">
	<tr valign="top">
		<td id="ly_lm" class="lm_edu_base_bg_kid">
			<!--left area start-->
			<jsp:include page="/inc/inc_edu_menu.jsp" flush="true"/>
			<!--left area end-->
		</td>
		<td id="ly_cnt">
			<div id="ly_tm">
				<!--Top area start-->
				<jsp:include page="/inc/common_top.jsp" flush="true"/>
				<!--Top area end-->
			</div>
			<div id="ly_dtl">
				<!--//////////////////////-cnt area start-//////////////////////-->

				<!--location start-->
				<table cellspacing="0" cellpadding="0" class="cnt_title">
					<tr>
						<td><img src="/csu/img/cnt/edu_kis_title04.gif" alt="" title="" /></td>
						<td><div class="lctn_txt"><a href="/csu/">홈으로</a> / <a href="/csu/edu/kid/gate.jsp">케미에듀</a> / 어린이 / <a href='./'>운송수단</a> / 퀴즈</div></td>
					</tr>
				</table>
				<!--location end-->
				<div class="cnt">

  <table width=630 border=0 cellpadding=0 cellspacing=0>
    <tr><td><img src='./img/qz_title.gif'></td></tr>
    <tr><td height=8></td></tr>
	<tr>
	  <td>
	    <table width=630 border=0 cellpadding=0 cellspacing=0>
			<col width=25></col>
			<col width=579></col>
			<col width=26></col>
		  <tr>
		    <td><img src='./img/qz_bx_01.gif'></td>
		    <td background='./img/qz_bx_02.gif'></td>
		    <td><img src='./img/qz_bx_03.gif'></td>
		  </tr>
		  <tr>
		    <td background='./img/qz_bx_04.gif'></td>
		    <td bgcolor='#FFFFFF'>
				<iframe id=ifrm src="/qz_1017/csu/build.do?category_key=3" width="571" height="100%" FRAMEBORDER=0 MARGINHEIGHT=0 MARGINWIDTH=0 SCROLLING=no  HSPACE="0" VSPACE="0" ></iframe>
			</td>
		    <td background='./img/qz_bx_05.gif'></td>
		  </tr>
		  <tr>
		    <td><img src='./img/qz_bx_06.gif'></td>
		    <td background='./img/qz_bx_07.gif'></td>
		    <td><img src='./img/qz_bx_08.gif'></td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>

				<!--right quick menu-->
				<jsp:include page="./transport_right_menu.jsp" flush="true"/>
				<!--right quick menu-->


				</div>
				<!--//////////////////////-cnt area end-//////////////////////-->
			</div>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="2" id="ly_btm">
			<!--bottom area start-->
			<jsp:include page="/inc/common_copyright.jsp" flush="true"/>
			<!--bottom area end-->
		</td>
	</tr>
</table>

</body>
</html>