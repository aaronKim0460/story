<%@page language="java" contentType="text/html; charset=euc-kr" %>
			
			<%
				//�޴��¿���
				String requestpage_left = request.getRequestURL().toString();
				
				String left_menu_1 = "";
				String left_menu_2 = "";
				String left_menu_3 = "";
				String left_menu_4 = "";
				
				if(requestpage_left.indexOf("memoris")>0) {
					left_menu_1 = "_on";
				} else if(requestpage_left.indexOf("poster")>0) {
					left_menu_2 = "_on";
				} else if(requestpage_left.indexOf("ucc")>0) {
					left_menu_3 = "_on";
				} else if(requestpage_left.indexOf("cardnews")>0) {
					left_menu_4 = "_on";
				}
				
			%>
			<!-- left ���� -->
          <div id="leftSec">
            <h2 class="tit"><img src="/csu/contest/images/common/leftTit03.gif" alt="������ ������" /></h2>
            <ul class="leftMenu">
              <li><a href="/csu/board/contest/memoris/list.do" title="������"><img src="/csu/contest/images/common/leftMenu0301<%=left_menu_1 %>.gif" alt="������" /></a></li>
              <li><a href="/csu/board/contest/poster/posterList.do" title="�׸�"><img src="/csu/contest/images/common/leftMenu0302<%=left_menu_2 %>.gif" alt="�׸�" /></a></li>
              <li><a href="/csu/board/contest/cardnews/cnList.do" title="ī�崺��"><img src="/csu/contest/images/common/leftMenu0501<%=left_menu_4 %>.gif" alt="ī�崺��" /></a></li>
              <li><a href="/csu/board/contest/ucc/movieList.do?idx=0" title="UCC"><img src="/csu/contest/images/common/leftMenu0303<%=left_menu_3 %>.gif" alt="UCC" /></a></li>
            </ul>
          </div>
	      <!-- //left ���� -->
			
		
   			