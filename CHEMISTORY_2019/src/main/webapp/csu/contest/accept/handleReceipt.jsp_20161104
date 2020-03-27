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
		dateEnd = "2016-11-15";
		
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
	 alert("공모전 기간이 아닙니다.");
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
	CommonVOs code102 = (CommonVOs)request.getAttribute("CODE102");
%>

<%@ include file="/contest/include/head.jsp"%>
<script src="/csu/inc/common.js" type="text/javascript" charset="euc-kr"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" charset="UTF-8"></script>
<!-- <script type="text/javascript" src="/csu/Scripts/jquery-1.4.2.min.js"></script> -->
<script type="text/javascript" src="//zipapi.konetic.or.kr/api/search.js" charset="UTF-8"></script>
<!--[if IE 6]>< script type="text/javascript" src="http://zipapi.konetic.or.kr/api/search.js"></script><![endif]-->
<script language="JavaScript">
$().ready(function(){
	$('[name=enter_fld_cd]#part_fld_cd1').addClass('kid').attr('id', 'enter_fld_cd1');
	$('[name=enter_fld_cd]#part_fld_cd2').addClass('kid').attr('id', 'enter_fld_cd2');
	$('[name=enter_fld_cd]#part_fld_cd3').addClass('man').attr('id', 'enter_fld_cd3');//enter_fld_cd의 id 변경
	$('#part_fld_gnu1').prop('checked', true);//참가sub 기본값 : 개인
	
	//우편번호 api
	$("#search_button").postcodifyPopUp({
	      "api":"//zipapi.konetic.or.kr/lib/search.php",
	      "insertJibeonAddress" : "#user_addr",
	      "useCors":false
	});

	//참가main 
	$('[name=part_fld_cd]').change(function(){
		$('[name=enter_fld_cd]:checked').prop('checked', false);
		
		//체크한 id가 3번이면
		if($(this).attr('id') == 'part_fld_cd3'){
			$('.bbs_01 .adult').show();//일반부 옵션 show
			$('.bbs_01 #enter_fld_cd3').prop('checked', true);//카드뉴스 체크
			$('#part_fld_gnu1').prop('checked', true);//개인 체크
		}else{
			$('.bbs_01 .adult').hide();//일반부 옵션 hide
			$('.bbs_01 .team').hide();//단체 옵션 hide
			$('.bbs_01 #enter_fld_cd1').prop('checked', true);//그림 체크
			//체크한 id가 1, 2번인데 단체가 선택된 경우
			if($('[name=part_fld_gnu]:checked').attr('id') == 'part_fld_gnu2'){
				$('#part_fld_gnu2').prop('checked', false);//단체 체크 해제
				$('#part_fld_gnu1').prop('checked', true);//개인 체크
			}
		}
	});
	
	//참가sub
	$('.bbs_01 [name=part_fld_gnu]').change(function(){
		var length = $('.bbs_01 [name=part_fld_gnu]').length + 1;
		var thisVal = (length - $(this).val());
		
		//참가main 체크된 id가 3번이면
		if($('.bbs_01 [name=part_fld_cd]:checked').attr('id') == 'part_fld_cd3'){
			$('#part_fld_gnu'+thisVal).prop('checked', false);//클릭하지 않은 항목 체크 해제
			$(this).prop('checked', true);//클릭한 항목 체크
			//참가sub 체크된 id가 2번이면
			if($(this).attr('id') == 'part_fld_gnu2'){
				$('.bbs_01 .team').show();//단체 옵션 show
			}else{
				$('.bbs_01 .team').hide();//단체 옵션 hide
			}
		}else{
			//참가main 체크된 id가 1, 2번일 때 단체를 누르면
			if($(this).attr('id') == 'part_fld_gnu2'){
				alert("일반부가 아니면 단체 참가를 할 수 없습니다.");
				$('#part_fld_gnu1').prop('checked', true);//개인 체크
				$('#part_fld_gnu2').prop('checked', false);//단체 체크 해제
			}
		}
 	});
	
	//응모
	$('.bbs_01 [name=enter_fld_cd]').change(function(){
		if($('.bbs_01 [name=part_fld_cd]:checked').attr('id') == 'part_fld_cd3'){
			if($(this).attr('id') != 'enter_fld_cd3'){
				alert("일반부는 그림, 글짓기 부분에 응모할 수 없습니다.");
				$(this).prop('checked', false);
				$('#enter_fld_cd3').prop('checked', true);
				return false;
			}
		}else{
			if($(this).attr('id') == 'enter_fld_cd3'){
				alert("일반부가 아니면 카드뉴스 부분에 응모할 수 없습니다.");
				$('#enter_fld_cd3').prop('checked', false);
				$('#enter_fld_cd1').prop('checked', true);
				return false;
			}
		}
	});
});

function goSubmit() {
	var f = document.forms["form1"] ;
	var strMail = /\w+([-+.]\w+)*\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	var part_cd_id = $('[name=part_fld_cd]:checked').attr('id');
	var part_fld_gnu = $('[name=part_fld_gnu]:checked').attr('id');
	
	if(!$('#chk_yn1').prop('checked')){
		alert("개인정보 수집 및 이용에 동의해 주세요.");
		$('#chk_yn1').focus();
		return false;
	}else{
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
		
		if(part_cd_id == 'part_fld_cd3'){
			if(part_fld_gnu == 'part_fld_gnu2'){
				if(!chkByteCheck(f.user_cnt, 1, 20, "참가인원은")) return false ;
				if(!chkByteCheck(f.team_nm, 1, 100, "팀명을")) return false ;
				if(!chkByteCheck(f.user2_nm, 1, 40, "공동참가자1의 이름을")) return false ;
				if(!chkByteCheck(f.user2_birthday, 1, 8, "공동참가자1의 생년월일을")) return false ;
				if(!chkByteCheck(f.user3_nm, 1, 40, "공동참가자2의 이름을")) return false ;
				if(!chkByteCheck(f.user3_birthday, 1, 8, "공동참가자2의 생년월일을")) return false ;
			}
			if(!chkByteCheck(f.work_right, 1, 100, "컨텐츠 출처는")) return false ;
		}	
		f.action = "/csu/contest/accept/actReceipt.jsp" ;
		f.submit();
	}
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
<input type="hidden" name="gisu" id="gisu" value="6">
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
            
            <!--첨부파일 -->
              <div class="table_padding_Bottom">
                <!--첨부파일 -->
                
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
                <table class="bbs_07" summary="개인정보 수집및 이용동의서입니다.">
                  <caption>개인정보 수집및 이용동의서</caption>
                  <colgroup>
                      <col style="width:752px" />
                  </colgroup>
                  <tbody>
                    <tr>
                      <th class="last">개인정보 수집 및 이용 동의서</th>
                    </tr>
                    <tr>
                      <td>환경부는 공모전 참가자의 개인정보를 중요시하며,「개인정보보호법」을 준수하고 있습니다. 개인정보 취급방침을 통하여 참가자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치를 취해지고 있는지 알려드립니다.</td>
                    </tr>
                    <tr>
                      <td class="R_boa_N"><table><tr><td>
                      ο개인정보 수집ㆍ이용 목적:케미스토리 환경보건창작 공모전 응모자 관리<br/>
                      ο수집 개인정보 항목:성명,생년월일,주소,연락처,이메일,소속(학교ㆍ직장명,학과부서명)<br/>
                      ※수상자의 경우:신분증 사본, 본인명의 통장사본, 수령확인에 대한 서명 등(수상자에 한하여 별도 통보)<br/>
                      ο개인정보의 보유 및 이용기간:공모전 신청 접수와 당선작 시상을 위해서만 사용하며, 공모전 종료 이후에는 해당정보를 <br/>
                      &nbsp;&nbsp;지체없이 파기<br/>
                      ο개인정보 수집 동의를 거부할 권리: 개인정보 수집 및 활용에 대한 동의서의 제출을 거부할 권리가 있으나, 미동의 시 공모전 <br/>
                      &nbsp;&nbsp;응모가 거부될 수 있습니다. 개인정보는  공모전 이외의 다른 목적으로 사용하지 않습니다.<br/>
                      ※제공된 개인정보의 이용을 거부하고자 할 때에는 개인정보 관리책임자를 통해 열람, 정정, 삭제를 요구할 수 있음<br/></td></tr></table></td>
                    </tr>
                    <tr>
                   		<td class="boder_r">
                    		<p>본인은 환경부의 '개인정보 수집 및 이용'에 관한 설명을 모두 이해하였으며, 이에 동의 합니다.</p>
                            <p>(해당란에 ∨표시) &nbsp;&nbsp;<input type="radio" name="chk_yn" id="chk_yn1" value="1"  checked class="ra" title="동의함" /><label for="label">동의함 </label>
											&nbsp;&nbsp;<input type="radio" name="chk_yn" id="chk_yn2" value="2"  class="ra" title="동의하지 않음" /><label for="label">동의하지 않음 </label>
							</p>
                    	</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
              <div class="table_padding_Bottom">
                <!--신청자정보 -->
                <p class="title"><img src="/csu/contest/images/title/title_01.gif" alt="신청자 정보" /></p>
                <p class="text_01">* 푸른색 항목은 필수 입력  사항 입니다.
                	<!--button type="button" style="margin-bottom:10px; 
                    background-color:#eee; padding:0px 5px; border:1px solid #ccc; color:#333; border-radius:6px;">개인정보수집 및 이용 동이서 다운로드</button-->
                </p>
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
                      <th>소속</th>
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
                      	<input type="text" name="user_zip_cd1" id="user_zip_cd1" class="input postcodify_postcode6_1" style="width:30px" readonly/> - 
                      	<input type="text" name="user_zip_cd2" id="user_zip_cd2" class="input postcodify_postcode6_2" style="width:30px" readonly/>
                        <img src="/csu/contest/images/btn/btn_zipcode.gif" alt="우편번호" style="cursor:pointer;" id="search_button">
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
              
              <div class="table_padding_Bottom">
                <!--신청자정보 -->
                <p class="title"><img src="/csu/contest/images/title/title_02.gif" alt="신청자 정보" /></p>
                
                <p class="table_top"><img src="/csu/contest/images/common/table_top.gif" alt="table_top" /></p>
                <table class="bbs_01" summary="작품 정보 등록입니다.">
                  <caption>
                                    작품정보 쓰기
                  </caption>
                  <colgroup>
                  <col style="width:124px" />
                  <col style="width:252px" />
                  <col style="width:124px" />
                  <col style="width:252px" />
                  </colgroup>
                  <tbody>
                  <tr>
                    	<th>참가구분</th>
                        <td colspan="3">
	                        &nbsp;&nbsp;<input type="radio" name="part_fld_cd" id="part_fld_cd1" value="1"  checked class="ra" title="어린이부" /><label for="label">어린이부 </label>
							&nbsp;&nbsp;<input type="radio" name="part_fld_cd" id="part_fld_cd2" value="2"  class="ra" title="청소년부" /><label for="label">청소년부 </label>
							&nbsp;&nbsp;<input type="radio" name="part_fld_cd" id="part_fld_cd3" value="3"  class="ra" title="일반부" /><label for="label">일반부 </label>
							&nbsp;&nbsp; ( <input type="checkbox" name="part_fld_gnu" id="part_fld_gnu1" value="1"  class="ra" title="개인" /><label for="label"> 개인 </label>
							&nbsp;&nbsp;<input type="checkbox" name="part_fld_gnu" id="part_fld_gnu2" value="2"  class="ra" title="단체" /><label for="label"> 단체 )</label>
						</td>
                    </tr>
                    <tr class="team" style="display: none;">
                      <th>총 참가인원</th>
                      <td><input name="user_cnt" id="user_cnt" type="text" class="input" style="width:228px" maxlength="2"/></td>
                      <th>팀명</th>
                      <td><input name="team_nm" id="team_nm" type="text" class="input" style="width:228px" maxlength="50"/></td>
                    </tr>
                    <tr class="team" style="display: none;">
                      <th>공동참가자1 이름</th>
                      <td><input name="user2_nm" id="user2_nm" type="text" class="input" style="width:228px" maxlength="20" /></td>
                      <th>생년월일</th>
                      <td><input name="user2_birthday" id="user2_birthday" type="text" class="input" style="width:228px" maxlength="10"/></td>
                    </tr>
                    <tr class="team" style="display: none;">
                      <th>공동참가자2 이름</th>
                      <td><input name="user3_nm" id="user_nm3" type="text" class="input" style="width:228px" maxlength="20" /></td>
                      <th>생년월일</th>
                      <td><input name="user3_birthday" id="user3_birthday" type="text" class="input" style="width:228px"  maxlength="10"/></td>
                    </tr>
                    <tr>
                      <th>응모부분</th>
										  <td colspan="3">
											<%= HtmlTagUtils.getFrontRadioBox(code102, "enter_fld_cd", "1", "") %>
										  </td>
                    </tr>
                    <tr>
                      <th>작품명</th>
                      <td colspan="3"><input type="text" name="work_name" id="work_name" class="input" style="width:605px" /></td>
                    </tr>
                    <tr>
                      <th class="last">작품설명</th>
                      <td class="last textarea" colspan="3">
                      	<p style="text-align:right;" id="view_byte">(<span style="color:#0099cc; font-weight:bold;">000</span>/1000byte)</p>
                          <textarea name="work_desc" id="work_desc" class="textarea" style="height:80px; width:600px; clear:both;" onKeyUp="javascript:chkTextByteCheck(this, 1000, 'view_byte');" onChange="javascript:chkTextByteCheck(this, 1000, 'view_byte');"></textarea>
                      </td>
                    </tr>
                    <tr class="adult" style="display: none;">
                      <th class="last">컨텐츠출처</th>
                      <td class="last textarea" colspan="3">
                          <textarea name="work_right" id="work_right" class="textarea" style="height:80px; width:600px;"></textarea>
						  <div>
						  <p class="text_01"><strong>※ 일반부(카드뉴스) 응모시 필수 기재</strong><br/>
							케미스토리 내 활용 콘텐츠 메뉴 기재<br/>
							(예) 어린이교실-과정안내-5차시</p>
							</div>
                      </td>
                    </tr>
                    
                  </tbody>
                </table>
              </div>
              
              
              
              <!--첨부파일 -->
              <div class="table_padding_Bottom">
                <!--첨부파일 -->
                <p class="title"><img src="/csu/contest/images/title/title_03.gif" alt="첨부파일" /></p>
                <p class="text_01">* 푸른색 항목은 필수 입력 사항입니다.<br/>(공모작품 1부,개인정보 수집 및 이용동의서 1부 첨부)</p>
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
                      
              <div class="table_padding_Bottom">
              <p><a href="/csu/data/contest.zip"><img src="/csu/contest/images/btn/btn_consent.gif" alt="개인정보수집및이용동의서다운로드" /></a>
												<p><img src="/csu/contest/images/btn/btn_file_upload.gif" onClick="goFileUpload('', '5');" style="cursor:pointer;" alt="파일업로드" />
												<img src="/csu/contest/images/btn/btn_filedel.gif" onClick="goFileDel()" style="cursor:pointer;" alt="파일삭제" /></p>
<!--                                                 <p class="text_03">파일 첨부조건 명시</p> -->
                                                
												<select name="atchFile" id="atchFile" size="4" multiple="multiple" style="width:380px;height:80px;">
													<option value="">--------------------- 첨부파일 ---------------------</option>
												</select>
											</td>
                    </tr>
                  </tbody>
                  <tfoot>
                  	<tr>
                    	<td class="btn" colspan="2"><a href="#none" title="접수하기" onClick="goSubmit();"><img src="/csu/contest/images/btn/btn_register.gif" alt="접수하기" /></a><a href="#none" title="취소" onClick="goFormReset();"><img src="/csu/contest/images/btn/btn_cancle.gif" alt="취소" /></a></td>
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
