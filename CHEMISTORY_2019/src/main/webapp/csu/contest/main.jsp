<%@page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "kr.go.chemistory.contest.action.ContestAction"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonUtil"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonVO"%>
<%@ page import="kr.go.chemistory.contest.framework.CommonVOs"%>
<%@ page import = "kr.go.chemistory.contest.framework.HtmlTagUtils"%>
<%
	
	ContestAction act = new ContestAction();
	CommonVOs data = null;
	try {
		act.getMainNotice(request);
	}catch(Exception e){
		e.printStackTrace();
		out.println(CommonUtil.sendErr("/"));
		return ;
	}
	data = (CommonVOs)request.getAttribute("DATA");
%>

<%@ include file="/csu/contest/include/head.jsp"%>

</head>
<body>
	<div id="wrap">
	
		<%@ include file="/csu/contest/include/main_header.jsp"%>
		
		<!-- middle -->
		<div id="middle">
        	<div class="main_con">
            	<p><img src="/csu/contest/images/common/main_con.jpg" alt="main_con" border="0" usemap="#Map" />
                    <map name="Map" id="Map">
                        <area shape="rect" coords="12,4,135,29" href="/csu/contest/intro/synop.jsp" alt="공모전 소개" title="공모전 소개" />
                        <area shape="rect" coords="13,36,292,289" href="/csu/contest/intro/synop.jsp" alt="무슨 공모전이 있을까요? 공모전에 관련된 정보를 볼 수 있는 공간 입니다.응모주제, 응모일, 공모부문 등의 정보를 확인하실 수 있습니다." title="무슨 공모전이 있을까요? 공모전에 관련된 정보를 볼 수 있는 공간 입니다.응모주제, 응모일, 공모부문 등의 정보를 확인하실 수 있습니다." />
                        <area shape="rect" coords="331,5,489,29" href="/csu/contest/accept/handleReceipt.jsp" alt="공모전 접수·확인" title="공모전 접수·확인" />
                        <area shape="rect" coords="334,32,630,193" href="/csu/contest/accept/handleReceipt.jsp" alt="공모전 접수하고 확인해보자! 온라인으로 공모전을 접수할 수 있으면 접수정보를 확인할 수 있는 공간 입니다." title="공모전 접수하고 확인해보자! 온라인으로 공모전을 접수할 수 있으면 접수정보를 확인할 수 있는 공간 입니다." />
                        <area shape="rect" coords="332,218,468,247" href="/csu/board/contest/memoris/list.do" alt="수상작 갤러리" title="수상작 갤러리" />
                        <area shape="rect" coords="331,254,637,410" href="/csu/board/contest/memoris/list.do" alt="수상작 보러 가자! 수상작품으로 수기, 포스터, UCC 동영상을 감상할 수 있는 공간입니다" title="수상작 보러 가자! 수상작품으로 수기, 포스터, UCC 동영상을 감상할 수 있는 공간입니다" />
                        <area shape="rect" coords="677,4,779,30" href="/csu/board/contest/notice/list.do" alt="커뮤니티" title="커뮤니티" />
                        <area shape="rect" coords="678,35,967,188" href="/csu/board/contest/notice/list.do" alt="무엇이 궁금한가요? 묻고 답하기 형식의 Q&A 자주 묻는 질문에 대한 답을 모아놓은 FAQ" title="무엇이 궁금한가요? 묻고 답하기 형식의 Q&A 자주 묻는 질문에 대한 답을 모아놓은 FAQ" />
                        <area shape="rect" coords="674,221,775,250" href="/csu/board/contest/notice/list.do" alt="공지사항" title="공지사항" />
                        <area shape="rect" coords="925,236,963,253" href="/csu/board/contest/notice/list.do" alt="공지사항 더보기" title="공지사항 더보기" />
                    </map>
                </p>
                <div class="notice">
                <%
                int rs_cnt = data.getRowNum();
                if(rs_cnt>0){
                if( rs_cnt>3 ) {
                	rs_cnt = 3;
                }
            		for( int i=0; i < rs_cnt; i++ ) { 
            			String idx = data.getString("idx",i);
            			String title = CommonUtil.getSubStr(data.getString("title",i),30,"...");
            			String reg_date = data.getString("reg_date",i);
                %>
                	<dl>
                   	<dd><a href="/csu/board/contest/notice/view.do?idx=<%=idx %>&amp;"><%=title %></a></dd>
                    <dt><%=reg_date %></dt>
                  </dl>
               <%
               		}
                }else{
            	 %> 
            	 <dl>
                   	<dd>공지글이 없습니다.</dd>
                    <dt>&nbsp;</dt>
                  </dl>
            	 <%} %>	
                </div>
            </div>	
	  </div>
		<!-- //middle -->
		
		<%@ include file="/csu/contest/include/footer.jsp"%>
		
	</div>
</body>
</html>
