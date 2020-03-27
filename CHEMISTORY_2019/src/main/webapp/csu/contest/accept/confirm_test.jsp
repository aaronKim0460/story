<%@page language="java" contentType="text/html; charset=euc-kr" %>

<%@ page import = "kr.go.chemistory.contest.action.Contest_testAction"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonUtil"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonVO"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonVOs"%>
<%@ page import = "kr.go.chemistory.contest.framework.HtmlTagUtils"%>
<%
	String strUserNm = CommonUtil.nullCheck(request.getParameter("user_nm")) ;
	String strUserBirthday1 = CommonUtil.nullCheck(request.getParameter("user_birthday1")) ;
	String strUserBirthday2 = CommonUtil.nullCheck(request.getParameter("user_birthday2")) ;
	String strUserBirthday3 = CommonUtil.nullCheck(request.getParameter("user_birthday3")) ;
	String strUserCellNo1 = CommonUtil.nullCheck(request.getParameter("user_cell_no1")) ;
	String strUserCellNo2 = CommonUtil.nullCheck(request.getParameter("user_cell_no2")) ;
	String strUserCellNo3 = CommonUtil.nullCheck(request.getParameter("user_cell_no3")) ;


	String strCurrYear = CommonUtil.getTime("yyyy") ;
	int nSize = CommonUtil.convertINT(strCurrYear) ;
	
	Contest_testAction act = new Contest_testAction();
	try {
		act.getView_confirm(request) ;
	}catch(Exception e){
		e.printStackTrace();
		out.println(CommonUtil.sendErr("/"));
		return ;
	}
	CommonVOs data = (CommonVOs)request.getAttribute("DATA");
	
	int nCount = 0;
	if(data != null) nCount = data.getRowNum();
%>

<%@ include file="/contest/include/head.jsp"%>
<script src="/inc/common.js" type="text/javascript" charset="euc-kr"></script>
<script type="text/javascript">
	
	function goSearch(){
		var form = document.writeform;
		
		if(form.user_nm.value=="") {
			alert('성명을 입력하세요.');
			form.user_nm.focus();
			return ;
		}
		if(form.user_birthday1.value=="" || form.user_birthday2.value=="" || form.user_birthday3.value=="") {
			alert('생년월일을 입력해주세요.');
			
			form.user_birthday1.focus();
			return ;
		}
		if(form.user_cell_no1.value=="" || form.user_cell_no2.value=="" || form.user_cell_no3.value=="") {
			alert('휴대번호를 입력하세요.');
			form.user_cell_no2.value="";
			form.user_cell_no3.value="";
			form.user_cell_no1.focus();
			return ;
		}
	
		//form.target = "_self";
		//form.action = "/csu/contest/accept/confirm.jsp";
		form.submit();
		//form.target = "_self";
	}

</script>

</head>
<body>
	<div id="wrap">
	
		<%@ include file="/contest/include/header.jsp"%>
		
		<!-- middle -->
	    <div id="middle">
	    
          <%@ include file="/contest/include/column02.jsp"%>
          
         <!-- cont 영역 -->
          <div class="conSec">
            <h3 class="stit"><img src="/csu/contest/images/common/stit0202.gif" alt="접수 확인" /></h3>
            <p class="lineMap"><a href="#" title="HOME">HOME</a> < <a href="#" title="공모전 접수·확인">공모전 접수·확인 </a> < 접수 확인</p>
            <!-- 컨텐츠 -->
            <div class="conBox">
              <!-- 검색 -->
              <div class="search">
              <form name="writeform" method="get">
              	<dl>
                	<dd>성명</dd>
                    <dt><input type="text" name="user_nm" id="user_nm" value="<%=strUserNm %>" class="input" style="width:220px" /></dt>
                </dl>
                <dl style="padding-top: 4px;">
                	<dd style="padding-top: 3px;">생년월일</dd>
                    <dt>
											<select name="user_birthday1" id="user_birthday1" style="width:80px;" title="select">
                          <option>연도선택</option>
												<%
													for(int i=1950; i<nSize; i++) {
												%>
														<option value="<%= i %>"><%= i%></option>
												<%
													}
												%>
                        </select>
                        <select name="user_birthday2" id="user_birthday2" style="width:65px;" title="select">
                          <option>월선택</option>
											<%
												nSize=13 ;
												for(int i=1; i<nSize; i++) {
											%>
													<option value="<%= CommonUtil.padLeftwithZero(i, 2) %>"><%= CommonUtil.padLeftwithZero(i, 2)%></option>
											<%
												}
											%>
                        </select>
                        <select name="user_birthday3" id="user_birthday3" style="width:65px;" title="select">
                          <option>일선택</option>
												<%
													nSize=32 ;
													for(int i=1; i<nSize; i++) {
												%>
														<option value="<%= CommonUtil.padLeftwithZero(i, 2) %>"><%= CommonUtil.padLeftwithZero(i, 2) %></option>
												<%
													}
												%>
                        </select>
										</dt>
                	<dd style="padding-top: 4px;">휴대번호</dd>
                    <dt>
                    	<select name="user_cell_no1" id="user_cell_no1" style="width:45px;" title="select">
                          <option value="010" <% if(("010").equals(strUserCellNo1)) out.println("selected"); %>>010</option>
												  <option value="011" <% if(("011").equals(strUserCellNo1)) out.println("selected"); %>>011</option>
												  <option value="016" <% if(("016").equals(strUserCellNo1)) out.println("selected"); %>>016</option>
												  <option value="017" <% if(("017").equals(strUserCellNo1)) out.println("selected"); %>>017</option>
												  <option value="018" <% if(("018").equals(strUserCellNo1)) out.println("selected"); %>>018</option>
                        </select>
                        -
                        <input type="text" name="user_cell_no2" id="user_cell_no2" value="<%=strUserCellNo2 %>" class="input" style="width:45px" maxlength="4"/>
                        -
                        <input type="text" name="user_cell_no3" id="user_cell_no3" value="<%=strUserCellNo3 %>" class="input" style="width:45px" maxlength="4"/>
                    </dt>
                </dl>
                <p class="btn_search"><a href="javascript:goSearch();"><img src="/csu/contest/images/btn/btn_ok.gif" alt="확인" border="0"  style="cursor:pointer;"/></a></p>
                </form>
              </div>
              
               <!--접수리스트 -->
              <div class="table_padding_Bottom">
                <p class="title"><img src="/csu/contest/images/title/title_04.gif" alt="접수 리스트" /></p>
                <table class="bbs_04" summary="접수 리스트입니다.">
                  <caption>접수 리스트</caption>
                  <colgroup>
                      <col style="width:90px" />
                      <col style="width:86px" />
                      <col style="width:77px" />
                      <col style="width:276px" />
                      <col style="width:102px" />
                      <col style="width:119px" />
                  </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">접수번호</th>
                            <th scope="col">참가부문</th>
                            <th scope="col">응모부문</th>
                            <th scope="col">제목</th>
                            <th scope="col">접수일</th>
                            <th scope="col">접수증</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    	<%
                    	if( nCount>0 ) {
                    		for( int i=0; i<nCount; i++ ) {
                    	
                    	%>
                        <tr>
                            <td class="center"><%=data.getString("receipt_no",i) %></td>
                            <td class="center"><%=data.getString("part_name",i) %></td>
                            <td class="center"><%=data.getString("enter_name",i) %></td>
                            <td class="tit"><%=data.getString("work_name",i) %></td>
                            <td class="center"><%=data.getString("reg_dtm",i) %></td>
                            <td class="center">
                            	<img src="/csu/contest/images/btn/btn_print.gif" alt="접수증 출력" style="cursor:pointer;" 
                							onclick="openWind('/csu/contest/accept/printReceipt.jsp?receipt_no=<%= data.getString("receipt_no",i)%>&user_nm=<%= data.getString("user_nm",i)%>',670,320,'no');"/>
                						</td>
                        </tr>
                        
                        <%	}
                    			}else{ %>
                        <tr style="height:100px;">
                            <td class="center" colspan="6">접수내역이 존재하지 않습니다.</td>
                        </tr>
                        <%} %>
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
