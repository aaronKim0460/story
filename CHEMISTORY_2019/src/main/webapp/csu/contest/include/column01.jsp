<%@page language="java" contentType="text/html; charset=euc-kr" %>
			
			<%
				//�޴��¿���
				String requestpage_left = request.getRequestURL().toString();
				
				String left_menu_1 = "";
				String left_menu_2 = "";
				
				
				if(requestpage_left.indexOf("synop")>0) {
					left_menu_1 = "_on";
				} else if(requestpage_left.indexOf("outline")>0) {
					left_menu_2 = "_on";
				}
			%>
			
			<!-- left ���� -->
         <div id="leftSec">
           <h2 class="tit"><img src="/csu/contest/images/common/leftTit01.gif" alt="������ �Ұ�" /></h2>
           <ul class="leftMenu">
             <li><a href="/csu/contest/intro/synop.jsp" title="������ ����"><img src="/csu/contest/images/common/leftMenu0101<%=left_menu_1 %>.gif" alt="������ ����" /></a></li>
             <li><a href="/csu/contest/intro/outline.jsp" title="������ �����䰭"><img src="/csu/contest/images/common/leftMenu0102<%=left_menu_2 %>.gif" alt="������ �����䰭" /></a></li>
           </ul>
         </div>
      <!-- //left ���� -->
  			