<%@page language="java" contentType="text/html; charset=euc-kr" %>
		<%
				//�޴��¿���
				String requestpage_main = request.getRequestURL().toString();
				
				String main_menu_1 = "";
				String main_menu_2 = "";
				String main_menu_3 = "";
				String main_menu_4 = "";
				String main_menu_5 = "";
				String main_menu_6 = "";
				String main_menu_7 = "";
				String main_menu_8 = "";
				String main_menu_9 = "";
				String main_menu_10 = "";
				String main_menu_11 = "";
				
				if(requestpage_main.indexOf("synop")>0) {
					main_menu_1 = "_on";
				}	else if(requestpage_main.indexOf("outline")>0) {
					main_menu_2 = "_on";
				} else if(requestpage_main.indexOf("handleReceipt")>0) {
					main_menu_3 = "_on";
				} else if(requestpage_main.indexOf("confirm")>0) {
					main_menu_4 = "_on";
				} else if(requestpage_main.indexOf("memoris")>0) {
					main_menu_5 = "_on";
				} else if(requestpage_main.indexOf("poster")>0) {
					main_menu_6 = "_on";
				} else if(requestpage_main.indexOf("ucc")>0) {
					main_menu_7 = "_on";
				} else if(requestpage_main.indexOf("notice")>0) {
					main_menu_8 = "_on";
				} else if(requestpage_main.indexOf("qna")>0) {
					main_menu_9 = "_on";
				} else if(requestpage_main.indexOf("faq")>0) {
					main_menu_10 = "_on";
				} else if(requestpage_main.indexOf("cardnews")>0) {
					main_menu_11 = "_on";
				}
		%>
			
		<!-- header -->
		<div id="header">
			<div class="headerBox bg02">
				<h1 class="logo"><a href="/csu/contest/main.jsp" title="�ɹ̽��丮 ��� ȯ��� �ǰ�����"><img src="/csu/contest/images/common/logo_h02.png" alt="�ɹ̽��丮 ��� ȯ��� �ǰ�����" /></a></h1>
				<ul class="topMenu02">
					<li><a href="/csu/contest/intro/synop.jsp" title="�������Ұ�"><img src="/csu/contest/images/common/topMenu_01<%=main_menu_1%><%=main_menu_2%>.png" alt="�������Ұ�"  /></a></li>
					<li><a href="/csu/contest/accept/handleReceipt.jsp" title="�������Ұ�"><img src="/csu/contest/images/common/topMenu_02<%=main_menu_3%><%=main_menu_4%>.png" alt="����������Ȯ��" /></a></li>
					<li><a href="/csu/board/contest/memoris/list.do" title="�����۰�����"><img src="/csu/contest/images/common/topMenu_03<%=main_menu_5%><%=main_menu_6%><%=main_menu_7%><%=main_menu_11%>.png" alt="�����۰�����" /></a></li>
					<li class="last"><a href="/csu/board/contest/notice/list.do" title="Ŀ�´�Ƽ"><img src="/csu/contest/images/common/topMenu_04<%=main_menu_8%><%=main_menu_9%><%=main_menu_10%>.png" alt="Ŀ�´�Ƽ" /></a></li>
				</ul>
			</div>
		</div>
		<!-- //header -->