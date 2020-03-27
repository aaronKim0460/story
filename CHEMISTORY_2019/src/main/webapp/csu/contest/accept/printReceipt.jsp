<%@page language="java" contentType="text/html; charset=euc-kr" %>

<%@ page import = "kr.go.chemistory.contest.action.ContestAction"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonUtil"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonVO"%>
<%@ page import = "kr.go.chemistory.contest.framework.HtmlTagUtils"%>
<%

	String strReceipt_no = CommonUtil.nullCheck(request.getParameter("receipt_no")) ;
	String strUserNm = CommonUtil.nullCheck(request.getParameter("user_nm")) ;

	ContestAction act = new ContestAction();
	try {
		act.getView(request) ;
	}catch(Exception e){
		e.printStackTrace();
		out.println(CommonUtil.sendErr("/"));
		return ;
	}
	CommonVO data = (CommonVO)request.getAttribute("DATA");
	
	String pn = data.getString("part_name");
	String spn = CommonUtil.nullCheck(data.getString("sub_part_name"), "");
	String spn2 = "";
	
	if(pn.equals("초등부"))								pn = "어린이부";
	else if(pn.equals("중등부"))							pn = "청소년부";
	else if(pn.equals("고등부") || pn.equals("일반부"))		pn = "일반부";
	
	if(pn.equals("일반부"))								spn2 = "(" + spn + ")";
%>

<%@ include file="/contest/include/head.jsp"%>
<script src="/inc/common.js" type="text/javascript" charset="euc-kr"></script>

</head>
<body onLoad="window.print();">
	<div id="pop">
    	<div id="pop_top">
        	<h3>접수증 출력</h3>
            <div id="close">
            	<p><a href="javascript:self.close();" title="닫기"><img src="/csu/contest/images/btn/btn_close.gif" alt="닫기" /></a></p>
            </div>
        </div>
        <!-- con -->
        <div class="con w_650">
		  <div class="pop_print">
            	<p class="title_C"><img src="/csu/contest/images/title/pop_tit_01.gif" alt="공모전 접수증" /></p>
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
              <table class="bbs_03" summary="신청저 정보 등록입니다.">
                <caption>
                  팝업관리 쓰기
                </caption>
                <colgroup>
                <col style="width:70px" />
                <col style="width:92px" />
                <col style="width:221px" />
                <col style="width:102px" />
                <col style="width:125px" />
                </colgroup>
                <tbody>
                  <tr>
                    <th class="text_G" colspan="2">접수번호</th>
                    <td colspan="3"><%=data.getString("receipt_no") %></td>
                  </tr>
                  <tr>
                    <th rowspan="4">참가자<br />
                    인적사항</th>
                    <td class="G">성명</td>
                    <td><%=data.getString("user_nm") %></td>
                    <td class="G">접수일시</td>
                    <td><%=data.getString("reg_dtm") %></td>
                  </tr>
                  <tr>
                    <td class="G"> 주소</td>
                    <td><%=data.getString("user_addr") %> <%=data.getString("user_dtl_addr") %></td>
                    <td class="G">참가부문</td>
                    <td><%=pn%><%=spn2%></td>
                  </tr>
                  <tr>
                    <td class="G">소속</td>
                    <td><%=data.getString("user_blng") %></td>
                    <td class="G">응모부문</td>
                    <td><%=data.getString("enter_name") %></td>
                  </tr>
                  <tr>
                    <td class="last G">작품명</td>
                    <td class="last" colspan="3"><%=data.getString("work_name") %></td>
                  </tr>
                </tbody>
              </table>
            
          </div>
        </div>
    </div>
</body>
</html>
