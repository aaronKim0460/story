<%@page language="java" contentType="text/html; charset=euc-kr" %>
			
			<%
				//메뉴온오프
				String requestpage_left = request.getRequestURL().toString();
				
				String left_menu_1 = "";
				String left_menu_2 = "";
				String left_menu_3 = "";
				
				
				if(requestpage_left.indexOf("handleReceipt")>0) {
					left_menu_1 = "_on";
				} else if(requestpage_left.indexOf("viewReceipt")>0) {
					left_menu_2 = "_on";
				} else if(requestpage_left.indexOf("confirm")>0) {
					left_menu_3 = "_on";
				}
				
			%>
			
			<!-- left 영역 -->
      <div id="leftSec">
        <h2 class="tit"><img src="/csu/contest/images/common/leftTit02.gif" alt="공모전 접수·확인" /></h2>
        <ul class="leftMenu">
          <li><a href="/csu/contest/accept/handleReceipt.jsp" title="공모전 접수"><img src="/csu/contest/images/common/leftMenu0201<%=left_menu_1%><%=left_menu_2%>.gif" alt="공모전 접수" /></a></li>
          <li><a href="/csu/contest/accept/confirm.jsp" title="접수 확인"><img src="/csu/contest/images/common/leftMenu0202<%=left_menu_3%>.gif" alt="접수 확인" /></a></li>
        </ul>
      </div>
   		<!-- //left 영역 -->
   			