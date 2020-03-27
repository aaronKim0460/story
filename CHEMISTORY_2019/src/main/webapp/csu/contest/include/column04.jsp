<%@page language="java" contentType="text/html; charset=euc-kr" %>
			
			<%
				//메뉴온오프
				String requestpage_left = request.getRequestURL().toString();
				
				String left_menu_1 = "";
				String left_menu_2 = "";
				String left_menu_3 = "";
				
				
				if(requestpage_left.indexOf("notice")>0) {
					left_menu_1 = "_on";
				} else if(requestpage_left.indexOf("qna")>0) {
					left_menu_2 = "_on";
				} else if(requestpage_left.indexOf("faq")>0) {
					left_menu_3 = "_on";
				}
			%>
			
			<!-- left 영역 -->
          <div id="leftSec">
            <h2 class="tit"><img src="/csu/contest/images/common/leftTit04.gif" alt="커뮤니티" /></h2>
            <ul class="leftMenu">
              <li><a href="/csu/board/contest/notice/list.do" title="공지사항"><img src="/csu/contest/images/common/leftMenu0401<%=left_menu_1 %>.gif" alt="공지사항" /></a></li>
              <li><a href="/csu/board/contest/qna/list.do" title="Q&A"><img src="/csu/contest/images/common/leftMenu0402<%=left_menu_2 %>.gif" alt="Q&A" /></a></li>
              <li><a href="/csu/board/contest/faq/list.do" title="FAQ"><img src="/csu/contest/images/common/leftMenu0403<%=left_menu_3 %>.gif" alt="FAQ" /></a></li>
            </ul>
          </div>
	      <!-- //left 영역 -->
			
  			