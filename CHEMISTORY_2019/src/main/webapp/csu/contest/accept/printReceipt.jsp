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
	
	if(pn.equals("�ʵ��"))								pn = "��̺�";
	else if(pn.equals("�ߵ��"))							pn = "û�ҳ��";
	else if(pn.equals("����") || pn.equals("�Ϲݺ�"))		pn = "�Ϲݺ�";
	
	if(pn.equals("�Ϲݺ�"))								spn2 = "(" + spn + ")";
%>

<%@ include file="/contest/include/head.jsp"%>
<script src="/inc/common.js" type="text/javascript" charset="euc-kr"></script>

</head>
<body onLoad="window.print();">
	<div id="pop">
    	<div id="pop_top">
        	<h3>������ ���</h3>
            <div id="close">
            	<p><a href="javascript:self.close();" title="�ݱ�"><img src="/csu/contest/images/btn/btn_close.gif" alt="�ݱ�" /></a></p>
            </div>
        </div>
        <!-- con -->
        <div class="con w_650">
		  <div class="pop_print">
            	<p class="title_C"><img src="/csu/contest/images/title/pop_tit_01.gif" alt="������ ������" /></p>
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
              <table class="bbs_03" summary="��û�� ���� ����Դϴ�.">
                <caption>
                  �˾����� ����
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
                    <th class="text_G" colspan="2">������ȣ</th>
                    <td colspan="3"><%=data.getString("receipt_no") %></td>
                  </tr>
                  <tr>
                    <th rowspan="4">������<br />
                    ��������</th>
                    <td class="G">����</td>
                    <td><%=data.getString("user_nm") %></td>
                    <td class="G">�����Ͻ�</td>
                    <td><%=data.getString("reg_dtm") %></td>
                  </tr>
                  <tr>
                    <td class="G"> �ּ�</td>
                    <td><%=data.getString("user_addr") %> <%=data.getString("user_dtl_addr") %></td>
                    <td class="G">�����ι�</td>
                    <td><%=pn%><%=spn2%></td>
                  </tr>
                  <tr>
                    <td class="G">�Ҽ�</td>
                    <td><%=data.getString("user_blng") %></td>
                    <td class="G">����ι�</td>
                    <td><%=data.getString("enter_name") %></td>
                  </tr>
                  <tr>
                    <td class="last G">��ǰ��</td>
                    <td class="last" colspan="3"><%=data.getString("work_name") %></td>
                  </tr>
                </tbody>
              </table>
            
          </div>
        </div>
    </div>
</body>
</html>
