<%@ page contentType="text/html; charset=euc-kr" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<script type="text/javascript" src="/csu/inc/common.js"></script>
<link rel="stylesheet" type="text/css" href="/csu/inc/common.css" />
<link rel="stylesheet" type="text/css" href="../env_kid.css" /><!-- ��� �޴� Only -->
<script type="text/javascript" src="../env_js.js"></script><!-- ��� �޴� Only -->
</head>
<body>
<script type="text/JavaScript">
<!--
function fnGo(num) {
	if (num == 1) {	// ������
		location.href="./outdoor_f02.jsp";
	}
	else if(num==3) {	// ���丮��
		location.href="./outdoor_st01.jsp";
	}
	else if(num==4) {	// ����
		location.href="./outdoor_quiz.jsp";
	}
	else if(num==5) {	// ������
		location.href="./outdoor_f01.jsp";
	}
	else if(num==6) {	// Ȱ���ڷ�
	    window.open("../pdf/outdoor_pdf.pdf");
	}
}
//-->
</script>
<style type="text/css">
<!--
#click_01 {	position:absolute;left:608px;top:402px;width:207px;height:205px;z-index:1;}	/*���*/
-->
</style>
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
						<td><img src="/csu/img/cnt/edu_kis_title03.gif" alt="" title="" /></td>
						<td><div class="lctn_txt"><a href="/csu/">Ȩ����</a> / <a href="/csu/edu/kid/gate.jsp">�ɹ̿���</a> / ��� / �߿�</div></td>
					</tr>
				</table>
				<!--location end-->
				<div class="cnt">
				<script src='./outdoor_main.js'></script>
				<!--right quick menu-->
				<jsp:include page="./outdoor_right_menu.jsp" flush="true"/>
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