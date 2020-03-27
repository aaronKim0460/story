<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
<validator:javascript formName="formNoxiousInfo" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript">
$(document).ready(function(){
	var dataSource = "<c:out value='${detail.rdDataSource}'/>";
	$("input:radio[name='rdDataSource']:radio[value='"+dataSource+"']").attr('checked', true);
	
	var dataForm = "<c:out value='${detail.rdDataForm}'/>";
	$("input:radio[name='rdDataForm']:radio[value='"+dataForm+"']").attr('checked', true);
	
	var overVal = "<c:out value='${detail.rdOver}'/>";
	var overSplitCode = overVal.split(",");
	if(overSplitCode.length > 0){
		for (var idx in overSplitCode) {
			$("input:checkbox[name='over']:checkbox[value='" + overSplitCode[idx] + ",']").attr("checked", true);
		}
	}
	
	var overPathVal = "<c:out value='${detail.rdOverPath}'/>";
	var overPathSplitCode = overPathVal.split(",");
	if(overPathSplitCode.length > 0){
		for (var idx in overPathSplitCode) {
			$("input:checkbox[name='overPath']:checkbox[value='" + overPathSplitCode[idx] + ",']").attr("checked", true);
		}
	}
	
	var ageVal = "<c:out value='${detail.rdAge}'/>";
	var ageSplitCode = ageVal.split(",");
	if(ageSplitCode.length > 0){
		for (var idx in ageSplitCode) {
			$("input:checkbox[name='age']:checkbox[value='" + ageSplitCode[idx] + ",']").attr("checked", true);
		}
	}
	
	var rdPlanCh = "<c:out value='${detail.rdPlanCh}'/>";
	var rdInCh = "<c:out value='${detail.rdInCh}'/>";
	var rdEtcCh = "<c:out value='${detail.rdEtcCh}'/>";
	var rdSourceCh = "<c:out value='${detail.rdSourceCh}'/>";
	
	if(rdPlanCh == 'Y'){$("input:checkbox[name='rdPlanCh']").attr('checked', true);}
	if(rdInCh == 'Y'){$("input:checkbox[name='rdInCh']").attr('checked', true);}
	if(rdEtcCh == 'Y'){$("input:checkbox[name='rdEtcCh']").attr('checked', true);}
	if(rdSourceCh == 'Y'){$("input:checkbox[name='rdSourceCh']").attr('checked', true);}

	
});
	
doList = function(){
	document.formNoxiousInfo.action = "<c:url value='/adm/contents/material/NoxiousInfoList.do'/>";
	document.formNoxiousInfo.submit();
};

doUpdate = function(){
	
	  var form = document.formNoxiousInfo;	  
	  
	  if(confirm("등록 하시겠습니까?")){
	        if(!validateFormNoxiousInfo(form)){           
	            return;
	        }else{
	        	
	        	var chked_over = "";
	        	var chked_overPath = "";
	        	var chked_age = "";
	        	
	        	if($("input:radio[name='rdDataSource']").is(":checked") == false ){
	        		alert("자료출처 항목을 체크해주세요.");
	    		    return;
	        	}

	        	if($("input:radio[name='rdDataForm']").is(":checked") == false ){
	        		alert("자료형태 항목을 체크해주세요.");
	    		    return;
	        	}
	        	
	        	if( $(":checkbox[name='over']:checked").length !=0 ){
	        		$(":checkbox[name='over']:checked").each(function(){
		        		 if(this.checked){
		        			 chked_over += ""+this.value;	 
		        		 }
		        	});
	        		
	        		if(chked_over!=""){
// 	        			chked_over = chked_over.substring(1);
		        		$("#rdOver").val(chked_over);
		        	}
	    		}
	        	
	        	if( $(":checkbox[name='overPath']:checked").length !=0 ){
	        		$(":checkbox[name='overPath']:checked").each(function(){
		        		 if(this.checked){
		        			 chked_overPath += ""+this.value;	 
		        		 }
		        	});
	        		
	        		if(chked_overPath!=""){
// 	        			chked_overPath = chked_overPath.substring(1);
		        		$("#rdOverPath").val(chked_overPath);
		        	}
	    		}
	        	
	        	if( $(":checkbox[name='age']:checked").length !=0 ){
	        		$(":checkbox[name='age']:checked").each(function(){
		        		 if(this.checked){
		        			 chked_age += ""+this.value;	 
		        		 }
		        	});
	        		
	        		if(chked_age!=""){
// 	        			chked_age = chked_age.substring(1);
		        		$("#rdAge").val(chked_age);
		        	}
	    		}
	        	
	        	 $.ajax({
        			type: "POST"
        			,url: "<c:url value='/adm/contents/material/updateNoxiousInfo.do'/>"
        			,data:$("#formNoxiousInfo").serialize()
        			,success: function(result){
        	          if(result == "success"){
        	        	  alert("수정이 성공적으로 완료 되었습니다");
        	        	  doList();
        	          }else if(result == "validateErr"){
        	        	  alert("파라미터에 문제가 있습니다.");
        	          }else{
        	        	  alert("수정에 문제가 있습니다. 관리자에게 문의해 주세요");
        	          }
        	      }
        		}); 
	        	
	           
	        }
	    }
};

doOpenEnv = function(){
	var newPop = document.popForm;
	var url = "<c:url value='/adm/contents/material/addMaterialForInfo.do'/>";
	//var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=240, height=200, top=0,left=20"; 
	var status = "width=712, height=384, top=30,left=60"; 
	window.open("","popForm",status);
	
	newPop.action =url; 
	newPop.method="post";
	newPop.target="popForm";
	newPop.submit();
};

mappParm = function(idx,kname,ename){
	$("#rdMidx").val(idx);
	$("#rdKname").val(kname);
	$("#rdEname").val(ename);
};

function showKeyCode(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || (keyID == 8) || (keyID == 9) || (keyID == 46) || (( keyID >=37 && keyID <= 40 )))
	{
		return;
	}
	else
	{
		return false;
	}
};

</script>

<body>
<form id="popForm" name="popForm" method="post">
</form>

<form id="formNoxiousInfo" name="formNoxiousInfo" method="post">
<input name="rdOverPath" id="rdOverPath" type="hidden" value=""/>
<input name="rdOver" id="rdOver" type="hidden" value=""/>
<input name="rdMidx" id="rdMidx" type="hidden" value="${detail.rdMidx}"/>
<input name="rdEname" id="rdEname" type="hidden" value="${detail.rdEname}"/>
<input name="rdAge" id="rdAge" type="hidden" value=""/>
<input type="hidden" id="rdIdx" name="rdIdx" value="${detail.rdIdx}"/>
<input type="hidden" name="pageIndex" value="<c:if test="${empty ivo.pageIndex }">1</c:if><c:if test="${!empty ivo.pageIndex }"><c:out value='${ivo.pageIndex}'/></c:if>">
<div style="display: none;">
<ul id="attachInfo"></ul>
</div>

<div id="contents">
	<h2 class="adminH2">유해물질자료</h2>
	<table class="bbs_default write" border="1">
   	<caption>유해인자 DB 등록</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
			<tr>
				<th scope="row">물질명<span class="required" style="color: red;">*</span></th>
				<td>
					<a href="javascript:doOpenEnv();" class="btn btn-link" alt="물질 찾기">찾기</a>
					<input type="text" name="rdKname" id="rdKname" value="${detail.rdKname}" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th scope="row">자료출처<span class="required" style="color: red;">*</span></th>
				<td>
					<input type="radio" id="country" name="rdDataSource" value="국내,"/>&nbsp;<label for="country">국내</label>&nbsp;&nbsp;
					<input type="radio" id="foreign" name="rdDataSource" value="국외,"/>&nbsp;<label for="foreign">국외</label>&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th scope="row">자료형태<span class="required" style="color: red;">*</span></th>
				<td>
					<input type="radio" id="thesis" name="rdDataForm" value="연구논문,"/>&nbsp;<label for="thesis">연구논문</label>&nbsp;&nbsp;
					<input type="radio" id="report" name="rdDataForm" value="보고서,"/>&nbsp;<label for="report">보고서</label>&nbsp;&nbsp;
					<input type="radio" id="press" name="rdDataForm" value="보도자료,"/>&nbsp;<label for="press">보도자료</label>&nbsp;&nbsp;
					<input type="radio" id="etcform" name="rdDataForm" value="기타,"/>&nbsp;<label for="etcform">기타</label>&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th scope="row">노출원</th>
				<td>
					<input type="checkbox" id="air" name="over" value="대기,"/>&nbsp;<label for="air">대기</label>&nbsp;&nbsp;
					<input type="checkbox" id="inAir" name="over" value="실내공기,"/>&nbsp;<label for="inAir">실내공기</label>&nbsp;&nbsp;
					<input type="checkbox" id="water" name="over" value="먹는물,"/>&nbsp;<label for="water">먹는물</label>&nbsp;&nbsp;
					<input type="checkbox" id="soil" name="over"  value="토양,"/>&nbsp;<label for="soil">토양</label>&nbsp;&nbsp;
					<input type="checkbox" id="etcover" name="over" value="기타,"/>&nbsp;<label for="etcover">기타</label>&nbsp;&nbsp;					
				</td>
			</tr>
			<tr>
				<th scope="row">노출경로</th>
				<td>
					<input type="checkbox" id="breathe" name="overPath" value="호흡,"/>&nbsp;<label for="breathe">호흡</label>&nbsp;&nbsp;
					<input type="checkbox" id="mouth" name="overPath" value="구강,"/>&nbsp;<label for="mouth">구강</label>&nbsp;&nbsp;
					<input type="checkbox" id="skin" name="overPath" value="피부,"/>&nbsp;<label for="skin">피부</label>&nbsp;&nbsp;
					<input type="checkbox" id="etcoverpath" name="overPath"  value="기타,"/>&nbsp;<label for="etcoverpath">기타</label>&nbsp;&nbsp;
				</td>
			</tr> 
			<tr>
				<th scope="row">대상연령</th>
				<td>
					<input type="checkbox" id="fetus" name="age" value="태아,"/>&nbsp;<label for="fetus">태아</label>&nbsp;&nbsp;
					<input type="checkbox" id="infant" name="age" value="신생아,"/>&nbsp;<label for="infant">신생아</label>&nbsp;&nbsp;
					<input type="checkbox" id="baby" name="age" value="영아,"/>&nbsp;<label for="baby">영아</label>&nbsp;&nbsp;
					<input type="checkbox" id="child" name="age"  value="유아,"/>&nbsp;<label for="child">유아</label>&nbsp;&nbsp;
					<input type="checkbox" id="kid" name="age"  value="어린이,"/>&nbsp;<label for="kid">어린이</label>&nbsp;&nbsp;
					<input type="checkbox" id="youth" name="age"  value="청소년,"/>&nbsp;<label for="youth">청소년</label>&nbsp;&nbsp;
				</td>
			</tr> 
			<tr>
				<th scope="row">
					주요독성 
				</th>
				<td>
					<textarea id="rdPoison" name="rdPoison" rows="5" cols="100"><c:out value="${detail.rdPoison}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					건강영향 <br/>
					<input type="checkbox" id="rdPlanHtml" name="rdPlanCh" value="Y"/><label for="rdPlanHtml">html</label>
				</th>
				<td>
					<textarea id="rdPlan" name="rdPlan" rows="5" cols="100"><c:out value="${detail.rdPlan}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출및 저감방안 <br/>
					<input type="checkbox" id="rdInHtml" name="rdInCh" value="Y"/><label for="rdInHtml">html</label>
				</th>
				<td>
					<textarea id="rdIn" name="rdIn" rows="5" cols="100"><c:out value="${detail.rdIn}"/></textarea>
				</td>
			</tr>			
			<tr>
				<th scope="row">
					기타 <br/>
					<input type="checkbox" id="rdEtcHtml" name="rdEtcCh" value="Y"/><label for="rdEtcHtml">html</label>
				</th>
				<td>
					<textarea id="rdSource" name="rdEtc" rows="5" cols="100"><c:out value="${detail.rdEtc}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					출처 <br/>
					<input type="checkbox" id="rdSourceHtml" name="rdSourceCh" value="Y"/><label for="rdSourceHtml">html</label>
				</th>
				<td>
					<textarea id="rdSource" name="rdSource" rows="5" cols="100"><c:out value="${detail.rdSource}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">해당년도 </th>
				<td>
					<select name="rdYear">
					<c:forEach var="year" items="${yearlist}" varStatus="i">
						<option value="${year}" <c:if test="${detail.rdYear == year}">selected="selected"</c:if> ><c:out value="${year}"/></option>
					</c:forEach>
					</select>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="t_center mt20">		
		<a href="#none" onclick="doList();" class="btn gray">목록</a>
		<a href="#none" onclick="doUpdate();" class="btn seablue">수정</a>		
	</div>	
</div>
</form>

</body>
</html>