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
<script type="text/JavaScript">
<!--
function fnGo(num) {
	if (num == 1) {	// 게임
		location.href="./school_quiz.jsp";
	}
	else if(num==2) {
		location.href="./school_st01.jsp";
	}
	else if(num==3) {
		location.href="./school_f02.jsp";
	}
	else if(num==4) {
		location.href="./school_f01.jsp";
	}
	else if(num==5) {
		window.open("../pdf/school_pdf.pdf");
	}
}
//-->
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
						<td><img src="/csu/img/cnt/edu_kis_title02.gif" alt="" title="" /></td>
						<td><div class="lctn_txt"><a href="/csu/">홈으로</a> / <a href="/csu/edu/kid/gate.jsp">케미에듀</a> / 어린이 / 학교</div></td>
					</tr>
				</table>
				<!--location end-->
				<div class="cnt">

				<script src='./school_main.js'></script>
				<!--right quick menu-->
				<jsp:include page="./school_right_menu.jsp" flush="true"/>
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