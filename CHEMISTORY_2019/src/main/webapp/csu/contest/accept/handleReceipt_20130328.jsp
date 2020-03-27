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
		
		/** 퀴즈별종료일 설정 **/
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
		/** flag가 1 이면 마감으로 표시 (0:오늘 2:일정남음)**/
		//out.print("flag :"+flag);
	
	if(flag == 1){	
	%>
	<script type="text/javascript">
<!--
	 alert("공모전 접수는 3월 11일 오전 10시부터 가능합니다.");
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
	
	if(!chkByteCheck(f.user_nm, 1, 40, "성명은")) return false ;
	if(!chkByteCheck(f.user_blng, 0, 40, "소속은")) return false ;
	if(!chkByteCheck(f.user_birthday1, 1, 4, "생년월일에 연도는")) return false ;
	if(!chkByteCheck(f.user_birthday2, 1, 2, "생년월일에 월은")) return false ;
	if(!chkByteCheck(f.user_birthday3, 1, 2, "생년월일에 일은")) return false ;
	if(!chkNumber(f.user_tel_no1, "전화번호는")) return false ;
	if(!chkNumber(f.user_tel_no2, "전화번호는")) return false ;
	if(!chkNumber(f.user_tel_no3, "전화번호는")) return false ;
	if(!chkByteCheck(f.user_tel_no1, 1, 3, "전화번호는")) return false ;
	if(!chkByteCheck(f.user_tel_no2, 1, 4, "전화번호는")) return false ;
	if(!chkByteCheck(f.user_tel_no3, 1, 4, "전화번호는")) return false ;
	if(!chkNumber(f.user_cell_no1, "휴대전화는")) return false ;
	if(!chkNumber(f.user_cell_no2, "휴대전화는")) return false ;
	if(!chkNumber(f.user_cell_no3, "휴대전화는")) return false ;
	if(!chkByteCheck(f.user_cell_no1, 1, 3, "휴대전화는")) return false ;
	if(!chkByteCheck(f.user_cell_no2, 1, 4, "휴대전화는")) return false ;
	if(!chkByteCheck(f.user_cell_no3, 1, 4, "휴대전화는")) return false ;
	//우편번호 이메일 체크해야함, 작품명 다 넣어야됨 
	if(!chkByteCheck(f.user_email1, 1, 50, "이메일 주소는")) return false ;
	if(!chkByteCheck(f.user_email2, 1, 30, "이메일 주소는")) return false ;
    
  if(document.getElementById("user_email2").value != ""){
       if(!document.getElementById("user_email2").value.match(strMail )) 
     { 
               alert("정확한 메일주소를 입력하세요.");
               document.getElementById("user_email1").value="";
               document.getElementById("user_email2").value="";
               document.getElementById("user_email1").focus();
               return false; 
     } 
  }
	if(!chkByteCheck(f.user_zip_cd1, 1, 8, "우편번호는")) return false ;
	if(!chkByteCheck(f.user_dtl_addr, 1, 100,"주소는")) return false ;
	if(!chkByteCheck(f.user_addr, 1, 50, "나머지 주소는")) return false ;
	if(!chkByteCheck(f.work_name, 1, 100, "작품명은")) return false ;
	if(!chkByteCheck(f.work_desc, 1, 1000, "작품설명은")) return false ;
	setAllSelect(f.atchFile, true);
	f.action = "/csu/contest/accept/actReceipt.jsp" ;
	f.submit();
}
function chkTextByteCheck(obj, len, id) {

	var le = length(obj.value);
	if(le > len) {
		alert("최대 "+len+"Bytes까지 가능합니다. 초과된 내용은 자동으로 삭제됩니다.");
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
		alert("파일 첨부 개수는 "+num+"개까지 입니다.");
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
		alert("선택된 파일이 없습니다.");
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
          
          <!-- cont 영역 -->
          <div class="conSec">
            <h3 class="stit"><img src="/csu/contest/images/common/stit0201.gif" alt="공모전 접수" /></h3>
            <p class="lineMap"><a href="#" title="HOME">HOME</a> < <a href="#" title="공모전 접수·확인">공모전 접수·확인 </a> < 공모전 접수</p>
            <!-- 컨텐츠 -->
            <div class="conBox">
              <div class="table_padding_Bottom">
                <!--신청자정보 -->
                <p class="title"><img src="/csu/contest/images/title/title_01.gif" alt="신청자 정보" /></p>
                <p class="text_01">* 푸른색 항목은 필수 입력  사항 입니다.</p>
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
                <table class="bbs_01" summary="신청저 정보 등록입니다.">
                  <caption>
                                    팝업관리 쓰기
                  </caption>
                  <colgroup>
                  <col style="width:124px" />
                  <col style="width:252px" />
                  <col style="width:124px" />
                  <col style="width:252px" />
                  </colgroup>
                  <tbody>
                    <tr>
                      <th>성명</th>
                      <td><input name="user_nm" id="user_nm" type="text" class="input" style="width:228px" /></td>
                      <th class="text_G">소속</th>
                      <td><input name="user_blng" id="user_blng" type="text" class="input" style="width:228px" /></td>
                    </tr>
                    <tr>
                      <th>생년월일</th>
                      <td colspan="3">
												<select name="user_birthday1" id="user_birthday1" style="width:80px;" title="select">
                          <option>연도선택</option>
												<%
													for(int i=1940; i<nSize; i++) {
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
                      </td>
                    </tr>
                    <tr>
                      <th>전화번호</th>
                      <td><input type="text" name="user_tel_no1" id="user_tel_no1" class="input" style="width:45px" maxlength="3"/>
                        -
                        <input type="text" name="user_tel_no2" id="user_tel_no2" class="input" style="width:45px" maxlength="4"/>
                        -
                        <input type="text" name="user_tel_no3" id="user_tel_no3" class="input" style="width:45px" maxlength="4"/></td>
                      <th>휴대전화</th>
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
                      <th>이메일</th>
                      <td colspan="3">
                      	<input type="text" name="user_email1" id="user_email1" class="input" style="width:100px" />
                        @
                        <input type="text" name="user_email2" id="user_email2" class="input" style="width:100px" /></td>
                    </tr>
                    <tr>
                      <th>우편번호</th>
                      <td colspan="3">
                      	<input type="text" name="user_zip_cd1" id="user_zip_cd1" class="input" style="width:30px" 
                      	onclick="openWind('/csu/member/addressSearchPro.do?zip1=user_zip_cd1&zip2=user_zip_cd2&addr1=user_addr',380,300,'no');" readonly="readonly"/> - 
                      	<input type="text" name="user_zip_cd2" id="user_zip_cd2" class="input" style="width:30px" 
                      	onclick="openWind('/csu/member/addressSearchPro.do?zip1=user_zip_cd1&zip2=user_zip_cd2&addr1=user_addr',380,300,'no');" readonly="readonly"/>
                        <img src="/csu/contest/images/btn/btn_zipcode.gif" alt="우편번호" 
                        onclick="openWind('/csu/member/addressSearchPro.do?zip1=user_zip_cd1&zip2=user_zip_cd2&addr1=user_addr',380,300,'no');" style="cursor:pointer;">
                       </td>
                    </tr>
                    <tr>
                      <th class="last">주소</th>
                      <td colspan="3" class="last">
                      	<input name="user_addr" id="user_addr" type="text" class="input" style="width:250px" />
                        &nbsp;&nbsp;
                        <input name="user_dtl_addr" id="user_dtl_addr" type="text" class="input" style="width:270px" />
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!--작품정보 -->
              <div class="table_padding_Bottom">
                <!--작품정보 -->
                <p class="title"><img src="/csu/contest/images/title/title_02.gif" alt="작품정보" /></p>
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
                <table class="bbs_01" summary="작품정보 등록입니다.">
                  <caption>작품정보 쓰기</caption>
                  <colgroup>
                      <col style="width:124px" />
                      <col style="width:628px" />
                      
                  </colgroup>
                  <tbody>
                    <tr>
                      <th>접수부문</th>
										  <td >
											<%= HtmlTagUtils.getFrontRadioBox(code100, "part_fld_cd", "1", "") %>
										  </td>
                    </tr>
                    <tr>
                      <th>응모부분</th>
										  <td >
											<%= HtmlTagUtils.getFrontRadioBox(code101, "enter_fld_cd", "1", "") %>
										  </td>
                    </tr>
                    <tr>
                      <th>작품명</th>
                      <td ><input type="text" name="work_name" id="work_name" class="input" style="width:605px" /></td>
                    </tr>
                    <tr>
                      <th class="last">작품설명</th>
                      <td class="last textarea"><p class="text_02" id="view_byte">(<span>000</span>/1000byte)</p>
                          <textarea name="work_desc" id="work_desc" class="textarea" style="height:80px; width:600px;" onKeyUp="javascript:chkTextByteCheck(this, 1000, 'view_byte');" onChange="javascript:chkTextByteCheck(this, 1000, 'view_byte');"></textarea>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!--첨부파일 -->
              <div class="table_padding_Bottom">
                <!--첨부파일 -->
                <p class="title"><img src="/csu/contest/images/title/title_03.gif" alt="첨부파일" /></p>
                <p class="text_01">* 푸른색 항목은 필수 입력  사항 입니다.(신청서1부, 공모작품1부 첨부)</p>
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
                <table class="bbs_01" summary="작품정보 등록입니다.">
                  <caption>첨부파일 쓰기</caption>
                  <colgroup>
                      <col style="width:124px" />
                      <col style="width:628px" />
                  </colgroup>
                  <tbody>
                    <tr>
                      <th class="last">첨부파일</th>
                      <td class="last textarea">
												<p><img src="/csu/contest/images/btn/btn_file_upload.gif" onclick="goFileUpload('', '5');" style="cursor:pointer;" alt="파일업로드" />
												<img src="/csu/contest/images/btn/btn_filedel.gif" onclick="goFileDel()" style="cursor:pointer;" alt="파일삭제" /></p>
												<select name="atchFile" id="atchFile" size="4" multiple="multiple" style="width:380px;height:80px;">
													<option value="">--------------------- 첨부파일 ---------------------</option>
												</select>
											</td>
                    </tr>
                  </tbody>
                  <tfoot>
                  	<tr>
                    	<td class="btn" colspan="2"><a href="#none" title="접수하기" onclick="goSubmit();"><img src="/csu/contest/images/btn/btn_register.gif" alt="접수하기" /></a><a href="#none" title="취소" onclick="goFormReset();"><img src="/csu/contest/images/btn/btn_cancle.gif" alt="취소" /></a></td>
                    </tr>
                  </tfoot>
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
</form>
</body>
</html>
