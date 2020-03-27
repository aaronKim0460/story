<%@page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import = "java.sql.*,java.net.*,java.util.Date, java.text.*"  %>
<%@ page import = "kr.go.chemistory.contest.action.ContestAction"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonUtil"%>
<%@ page import = "kr.go.chemistory.contest.framework.CommonVOs"%>
<%@ page import = "kr.go.chemistory.contest.framework.HtmlTagUtils"%>
<%
		int flag = 0;
		String dateTmp = "";
		String dateEnd = "";
		
		/** ��������� ���� **/
		dateEnd = "2013-04-12";
		
		Date today = new Date();
		Date endday = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		dateTmp = formatter.format(new java.util.Date());            
		today = formatter.parse(dateTmp);
		
		endday = formatter.parse(dateEnd);
		
		long millisDiff = (today.getTime() - endday.getTime())/(1000 * 60 * 60 * 24);
		
		if(millisDiff > 0){
		  flag = 1;
		}else if(millisDiff < 0){
		  flag = 2;
		}else if(millisDiff == 0){
			flag = 0;
		}
		/** flag�� 1 �̸� �������� ǥ�� (0:���� 2:��������)**/
		//out.print("flag :"+flag);
	
	if(flag == 1){	
	%>
	<script type="text/javascript">
<!--
	 alert("������ ������ 3�� 11�� ���� 10�ú��� �����մϴ�.");
	 history.back(-1);
//-->
</script>
	<%	  
	}

	String strCurrYear = CommonUtil.getTime("yyyy") ;
	int nSize = CommonUtil.convertINT(strCurrYear) ;
	ContestAction act = new ContestAction();
	try {
		act.getHandle(request) ;
	}catch(Exception e){
		e.printStackTrace();
		out.println(CommonUtil.sendErr("/"));
		return ;
	}
	CommonVOs code100 = (CommonVOs)request.getAttribute("CODE100");
	CommonVOs code101 = (CommonVOs)request.getAttribute("CODE101");
%>

<%@ include file="/contest/include/head.jsp"%>
<script src="/csu/inc/common.js" type="text/javascript" charset="euc-kr"></script>


<script language="JavaScript">
function goSubmit() {
	var f = document.forms["form1"] ;
	var strMail = /\w+([-+.]\w+)*\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	
	if(!chkByteCheck(f.user_nm, 1, 40, "������")) return false ;
	if(!chkByteCheck(f.user_blng, 0, 40, "�Ҽ���")) return false ;
	if(!chkByteCheck(f.user_birthday1, 1, 4, "������Ͽ� ������")) return false ;
	if(!chkByteCheck(f.user_birthday2, 1, 2, "������Ͽ� ����")) return false ;
	if(!chkByteCheck(f.user_birthday3, 1, 2, "������Ͽ� ����")) return false ;
	if(!chkNumber(f.user_tel_no1, "��ȭ��ȣ��")) return false ;
	if(!chkNumber(f.user_tel_no2, "��ȭ��ȣ��")) return false ;
	if(!chkNumber(f.user_tel_no3, "��ȭ��ȣ��")) return false ;
	if(!chkByteCheck(f.user_tel_no1, 1, 3, "��ȭ��ȣ��")) return false ;
	if(!chkByteCheck(f.user_tel_no2, 1, 4, "��ȭ��ȣ��")) return false ;
	if(!chkByteCheck(f.user_tel_no3, 1, 4, "��ȭ��ȣ��")) return false ;
	if(!chkNumber(f.user_cell_no1, "�޴���ȭ��")) return false ;
	if(!chkNumber(f.user_cell_no2, "�޴���ȭ��")) return false ;
	if(!chkNumber(f.user_cell_no3, "�޴���ȭ��")) return false ;
	if(!chkByteCheck(f.user_cell_no1, 1, 3, "�޴���ȭ��")) return false ;
	if(!chkByteCheck(f.user_cell_no2, 1, 4, "�޴���ȭ��")) return false ;
	if(!chkByteCheck(f.user_cell_no3, 1, 4, "�޴���ȭ��")) return false ;
	//�����ȣ �̸��� üũ�ؾ���, ��ǰ�� �� �־�ߵ� 
	if(!chkByteCheck(f.user_email1, 1, 50, "�̸��� �ּҴ�")) return false ;
	if(!chkByteCheck(f.user_email2, 1, 30, "�̸��� �ּҴ�")) return false ;
    
  if(document.getElementById("user_email2").value != ""){
       if(!document.getElementById("user_email2").value.match(strMail )) 
     { 
               alert("��Ȯ�� �����ּҸ� �Է��ϼ���.");
               document.getElementById("user_email1").value="";
               document.getElementById("user_email2").value="";
               document.getElementById("user_email1").focus();
               return false; 
     } 
  }
	if(!chkByteCheck(f.user_zip_cd1, 1, 8, "�����ȣ��")) return false ;
	if(!chkByteCheck(f.user_dtl_addr, 1, 100,"�ּҴ�")) return false ;
	if(!chkByteCheck(f.user_addr, 1, 50, "������ �ּҴ�")) return false ;
	if(!chkByteCheck(f.work_name, 1, 100, "��ǰ����")) return false ;
	if(!chkByteCheck(f.work_desc, 1, 1000, "��ǰ������")) return false ;
	setAllSelect(f.atchFile, true);
	f.action = "/csu/contest/accept/actReceipt.jsp" ;
	f.submit();
}
function chkTextByteCheck(obj, len, id) {

	var le = length(obj.value);
	if(le > len) {
		alert("�ִ� "+len+"Bytes���� �����մϴ�. �ʰ��� ������ �ڵ����� �����˴ϴ�.");
		obj.focus();
		obj.value=length(obj.value, len);
		le = len ;
	}
	document.getElementById(id).innerHTML = "(<span>"+le+"</span>/1000byte)"  ;
	
}
function goFileUpload(path, num) {
	var f = document.forms["form1"] ;
	var nSize = f.atchFile.length ;
	if(num <= (nSize-1) ) {
		alert("���� ÷�� ������ "+num+"������ �Դϴ�.");
		return false ;
	}
	goFilePopup(path, 'setInsertFile') ;
}
function goFilePopup(file, callback) {
	openwin = window.open("/csu/contest/accept/frmFile.jsp?fp="+file+"&callback="+callback, "pop_file", "width=449, height=269, top=300, left=300" );
}
function setInsertFile(orgname, fileName, fileSize , filePath) {
	var f = document.forms["form1"] ;
	fileSet(f.atchFile, orgname, fileName, fileSize , filePath) ;
}
function fileSet(obj, orgName, fileName, fileSize , filePath) {
	var index = obj.length ;
	var option = document.createElement("OPTION");
	option.value = orgName +"|"+fileName+"|"+fileSize+"|"+filePath ;
	option.innerHTML = orgName+" ("+fileSize+"KB)" ;
	obj.appendChild(option);
}
function goFileDel() {
	var f = document.forms["form1"] ;
	var nSize = f.atchFile.length ;
	var bChk = false ;
	if(nSize && nSize > 1) {
		for(var i=nSize-1; i>0; i--) {
			if(f.atchFile.options[i].selected) {
				f.atchFile.options[i] = null ;				
				bChk = true ;
			}
		}
	}
	if(!bChk) {
		alert("���õ� ������ �����ϴ�.");
	}
}
function goFormReset(){
	
	var f = document.forms["form1"] ;
	f.reset();
}
</script>
</head>
<body>
<form name="form1" method="get">
<input type="hidden" name="gisu" id="gisu" value="4">
	<div id="wrap">
	
		<%@ include file="/contest/include/header.jsp"%>
		
		<!-- middle -->
	    <div id="middle">
          
          <%@ include file="/contest/include/column02.jsp"%>
          
          <!-- cont ���� -->
          <div class="conSec">
            <h3 class="stit"><img src="/csu/contest/images/common/stit0201.gif" alt="������ ����" /></h3>
            <p class="lineMap"><a href="#" title="HOME">HOME</a> < <a href="#" title="������ ������Ȯ��">������ ������Ȯ�� </a> < ������ ����</p>
            <!-- ������ -->
            <div class="conBox">
              <div class="table_padding_Bottom">
                <!--��û������ -->
                <p class="title"><img src="/csu/contest/images/title/title_01.gif" alt="��û�� ����" /></p>
                <p class="text_01">* Ǫ���� �׸��� �ʼ� �Է�  ���� �Դϴ�.</p>
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
                <table class="bbs_01" summary="��û�� ���� ����Դϴ�.">
                  <caption>
                                    �˾����� ����
                  </caption>
                  <colgroup>
                  <col style="width:124px" />
                  <col style="width:252px" />
                  <col style="width:124px" />
                  <col style="width:252px" />
                  </colgroup>
                  <tbody>
                    <tr>
                      <th>����</th>
                      <td><input name="user_nm" id="user_nm" type="text" class="input" style="width:228px" /></td>
                      <th class="text_G">�Ҽ�</th>
                      <td><input name="user_blng" id="user_blng" type="text" class="input" style="width:228px" /></td>
                    </tr>
                    <tr>
                      <th>�������</th>
                      <td colspan="3">
												<select name="user_birthday1" id="user_birthday1" style="width:80px;" title="select">
                          <option>��������</option>
												<%
													for(int i=1940; i<nSize; i++) {
												%>
														<option value="<%= i %>"><%= i%></option>
												<%
													}
												%>
                        </select>
                        <select name="user_birthday2" id="user_birthday2" style="width:65px;" title="select">
                          <option>������</option>
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
                          <option>�ϼ���</option>
												<%
													nSize=32 ;
													for(int i=1; i<nSize; i++) {
												%>
														<option value="<%= CommonUtil.padLeftwithZero(i, 2) %>"><%= CommonUtil.padLeftwithZero(i, 2) %></option>
												<%
													}
												%>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <th>��ȭ��ȣ</th>
                      <td><input type="text" name="user_tel_no1" id="user_tel_no1" class="input" style="width:45px" maxlength="3"/>
                        -
                        <input type="text" name="user_tel_no2" id="user_tel_no2" class="input" style="width:45px" maxlength="4"/>
                        -
                        <input type="text" name="user_tel_no3" id="user_tel_no3" class="input" style="width:45px" maxlength="4"/></td>
                      <th>�޴���ȭ</th>
                      <td>
                      	<select name="user_cell_no1" id="user_cell_no1" style="width:45px;" title="select">
                          <option value="010" selected>010</option>
												  <option value="011">011</option>
												  <option value="016">016</option>
												  <option value="017">017</option>
												  <option value="018">018</option>
                        </select>
                        -
                        <input type="text" name="user_cell_no2" id="user_cell_no2" class="input" style="width:45px" maxlength="4"/>
                        -
                        <input type="text" name="user_cell_no3" id="user_cell_no3" class="input" style="width:45px" maxlength="4"/>
                      </td>
                    </tr>
                    <tr>
                      <th>�̸���</th>
                      <td colspan="3">
                      	<input type="text" name="user_email1" id="user_email1" class="input" style="width:100px" />
                        @
                        <input type="text" name="user_email2" id="user_email2" class="input" style="width:100px" /></td>
                    </tr>
                    <tr>
                      <th>�����ȣ</th>
                      <td colspan="3">
                      	<input type="text" name="user_zip_cd1" id="user_zip_cd1" class="input" style="width:30px" 
                      	onclick="openWind('/csu/member/addressSearchPro.do?zip1=user_zip_cd1&zip2=user_zip_cd2&addr1=user_addr',380,300,'no');" readonly="readonly"/> - 
                      	<input type="text" name="user_zip_cd2" id="user_zip_cd2" class="input" style="width:30px" 
                      	onclick="openWind('/csu/member/addressSearchPro.do?zip1=user_zip_cd1&zip2=user_zip_cd2&addr1=user_addr',380,300,'no');" readonly="readonly"/>
                        <img src="/csu/contest/images/btn/btn_zipcode.gif" alt="�����ȣ" 
                        onclick="openWind('/csu/member/addressSearchPro.do?zip1=user_zip_cd1&zip2=user_zip_cd2&addr1=user_addr',380,300,'no');" style="cursor:pointer;">
                       </td>
                    </tr>
                    <tr>
                      <th class="last">�ּ�</th>
                      <td colspan="3" class="last">
                      	<input name="user_addr" id="user_addr" type="text" class="input" style="width:250px" />
                        &nbsp;&nbsp;
                        <input name="user_dtl_addr" id="user_dtl_addr" type="text" class="input" style="width:270px" />
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!--��ǰ���� -->
              <div class="table_padding_Bottom">
                <!--��ǰ���� -->
                <p class="title"><img src="/csu/contest/images/title/title_02.gif" alt="��ǰ����" /></p>
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
                <table class="bbs_01" summary="��ǰ���� ����Դϴ�.">
                  <caption>��ǰ���� ����</caption>
                  <colgroup>
                      <col style="width:124px" />
                      <col style="width:628px" />
                      
                  </colgroup>
                  <tbody>
                    <tr>
                      <th>�����ι�</th>
										  <td >
											<%= HtmlTagUtils.getFrontRadioBox(code100, "part_fld_cd", "1", "") %>
										  </td>
                    </tr>
                    <tr>
                      <th>����κ�</th>
										  <td >
											<%= HtmlTagUtils.getFrontRadioBox(code101, "enter_fld_cd", "1", "") %>
										  </td>
                    </tr>
                    <tr>
                      <th>��ǰ��</th>
                      <td ><input type="text" name="work_name" id="work_name" class="input" style="width:605px" /></td>
                    </tr>
                    <tr>
                      <th class="last">��ǰ����</th>
                      <td class="last textarea"><p class="text_02" id="view_byte">(<span>000</span>/1000byte)</p>
                          <textarea name="work_desc" id="work_desc" class="textarea" style="height:80px; width:600px;" onKeyUp="javascript:chkTextByteCheck(this, 1000, 'view_byte');" onChange="javascript:chkTextByteCheck(this, 1000, 'view_byte');"></textarea>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!--÷������ -->
              <div class="table_padding_Bottom">
                <!--÷������ -->
                <p class="title"><img src="/csu/contest/images/title/title_03.gif" alt="÷������" /></p>
                <p class="text_01">* Ǫ���� �׸��� �ʼ� �Է�  ���� �Դϴ�.(��û��1��, ������ǰ1�� ÷��)</p>
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
                <table class="bbs_01" summary="��ǰ���� ����Դϴ�.">
                  <caption>÷������ ����</caption>
                  <colgroup>
                      <col style="width:124px" />
                      <col style="width:628px" />
                  </colgroup>
                  <tbody>
                    <tr>
                      <th class="last">÷������</th>
                      <td class="last textarea">
												<p><img src="/csu/contest/images/btn/btn_file_upload.gif" onclick="goFileUpload('', '5');" style="cursor:pointer;" alt="���Ͼ��ε�" />
												<img src="/csu/contest/images/btn/btn_filedel.gif" onclick="goFileDel()" style="cursor:pointer;" alt="���ϻ���" /></p>
												<select name="atchFile" id="atchFile" size="4" multiple="multiple" style="width:380px;height:80px;">
													<option value="">--------------------- ÷������ ---------------------</option>
												</select>
											</td>
                    </tr>
                  </tbody>
                  <tfoot>
                  	<tr>
                    	<td class="btn" colspan="2"><a href="#none" title="�����ϱ�" onclick="goSubmit();"><img src="/csu/contest/images/btn/btn_register.gif" alt="�����ϱ�" /></a><a href="#none" title="���" onclick="goFormReset();"><img src="/csu/contest/images/btn/btn_cancle.gif" alt="���" /></a></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <!-- //������ -->
          </div>
	      <!-- //cont ���� -->
        </div>
      <!-- //middle -->
		  
		  <%@ include file="/contest/include/footer.jsp"%>
		  
	</div>
</form>
</body>
</html>
