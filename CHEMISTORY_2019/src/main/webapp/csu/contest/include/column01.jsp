<%@page language="java" contentType="text/html; charset=euc-kr" %>
			
			<%
				//메뉴온오프
				String requestpage_left = request.getRequestURL().toString();
				
				String left_menu_1 = "";
				String left_menu_2 = "";
				
				
				if(requestpage_left.indexOf("synop")>0) {
					left_menu_1 = "_on";
				} else if(requestpage_left.indexOf("outline")>0) {
					left_menu_2 = "_on";
				}
			%>
			
			<!-- left 영역 -->
         <div id="leftSec">
           <h2 class="tit"><img src="/csu/contest/images/common/leftTit01.gif" alt="공모전 소개" /></h2>
           <ul class="leftMenu">
             <li><a href="/csu/contest/intro/synop.jsp" title="공모전 개요"><img src="/csu/contest/images/common/leftMenu0101<%=left_menu_1 %>.gif" alt="공모전 개요" /></a></li>
             <li><a href="/csu/contest/intro/outline.jsp" title="공모전 모집요강"><img src="/csu/contest/images/common/leftMenu0102<%=left_menu_2 %>.gif" alt="공모전 모집요강" /></a></li>
           </ul>
         </div>
      <!-- //left 영역 -->
  			