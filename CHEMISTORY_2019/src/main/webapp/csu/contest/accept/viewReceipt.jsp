<%@page language="java" contentType="text/html; charset=euc-kr" %>

<%@ page import = "kr.go.chemistory.contest.action.ContestAction"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonUtil"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonVO"%>
<%@ page import = "kr.go.chemistory.contest.framework.HtmlTagUtils"%>
<%
	String strCurrYear = CommonUtil.getTime("yyyy") ;
	int nSize = CommonUtil.convertINT(strCurrYear) ;
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
<script src="/csu/inc/common.js" type="text/javascript" charset="euc-kr"></script>

</head>
<body>
	<div id="wrap">
	
		<%@ include file="/contest/include/header.jsp"%>
		
		<!-- middle -->
	    <div id="middle">
	    
          <%@ include file="/contest/include/column02.jsp"%>
          
          <!-- cont 영역 -->
          <div class="conSec">
            <h3 class="stit"><img src="/csu/contest/images/common/stit0201.gif" alt="공모전 접수" /></h3>
            <p class="lineMap"><a href="#" title="HOME">HOME</a> < <a href="#" title="공모전 접수·확인">공모전 접수·확인 </a> < 공모전 접수</p>
            <!-- 컨텐츠 -->
            <div class="conBox">
              <div class="table_padding_Bottom">
                <!--신청자정보 -->
                <p class="title_02"><span><%= data.getString("user_nm")%>님</span> 케미스토리 환경보건창작 공모전에 참여해 주셔서 감사합니다. </p>
                <p class="text_info"><%= data.getString("user_nm")%>님 공모전 참여 정보 입니다. </p>
                <p class="text_02">* 접수증 출력을 원하시면 접수증 출력버튼을 클릭하세요.
                <img src="/csu/contest/images/btn/btn_print.gif" alt="접수증 출력" style="cursor:pointer;" 
                onclick="openWind('/csu/contest/accept/printReceipt.jsp?receipt_no=<%= data.getString("receipt_no")%>&user_nm=<%= data.getString("user_nm")%>',670,320,'no');"/>
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
                <table class="bbs_02" summary="신청저 정보 등록입니다.">
                  <caption>
                                    팝업관리 쓰기
                  </caption>
                  <colgroup>
                  <col style="width:124px" />
                  <col style="width:628px" />
                  </colgroup>
                  <tbody>
                    <tr>
                      <th class="text_G">접수번호</th>
                      <td class="col_333"><%= data.getString("receipt_no")%></td>
                    </tr>
                    <tr>
                      <th class="text_G">참가부문</th>
                      <td class="col_333"><%= data.getString("part_name")%></td>
                    </tr>
                    <tr>
                      <th class="text_G">응모부문</th>
                      <td class="col_333"><%= data.getString("enter_name")%></td>
                    </tr>
                    <tr>
                      <th class="text_G">작품 명</th>
                      <td class="col_333"><%= data.getString("work_name")%></td>
                    </tr>
                    <tr>
                      <th class="last text_G">작품 설명</th>
                      <td class="last col_333 pa_top"><%= data.getHtmlString("work_desc")%></td>
                    </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- //컨텐츠 -->
          </div>
	      <!-- //cont 영역 -->
        </div>
      <!-- //middle -->
      
	 		<%@ include file="/contest/include/footer.jsp"%>
	 
	</div>
</body>
</html>
