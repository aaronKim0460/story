<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew2.jsp" %>
<script type="text/javascript" src="/js/jquery.form.min.js"></script>
<validator:javascript formName="formNoxious" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript">
$(document).ready(function(){
	
	var mediumVal = "<c:out value='${detail.medium}'/>";
	
	var mediumSplitCode = mediumVal.split(",");
	
	if(mediumSplitCode.length > 0){
		for (var idx in mediumSplitCode) {
			$("input:checkbox[name='boxmedium']:checkbox[value=" + mediumSplitCode[idx] + "]").attr("checked", true);
		}
	}
	
	var noxiousLevelVal = "<c:out value='${detail.noxiousLevel}'/>";
	
	if(noxiousLevelVal == "H"){
		$("input:radio[name='noxiousLevel']:radio[value='H']").attr('checked', true);
	}else if(noxiousLevelVal == "M"){
		$("input:radio[name='noxiousLevel']:radio[value='M']").attr('checked', true);
	}else if(noxiousLevelVal == "L"){
		$("input:radio[name='noxiousLevel']:radio[value='L']").attr('checked', true);
	}
	
	var outlineCh = "<c:out value='${detail.outlineCh}'/>";
	var basicCh = "<c:out value='${detail.basicCh}'/>";
	var tInfoCh = "<c:out value='${detail.tInfoCh}'/>";
	var tSafeCh = "<c:out value='${detail.tSafeCh}'/>";
	var overGCh = "<c:out value='${detail.overGCh}'/>";
	var infoAttentionManCh = "<c:out value='${detail.infoAttentionManCh}'/>";
	var overGReCh = "<c:out value='${detail.overGReCh}'/>";
	var overMCh = "<c:out value='${detail.overMCh}'/>";
	var overMReCh = "<c:out value='${detail.overMReCh}'/>";
	var outlineReCh = "<c:out value='${detail.outlineReCh}'/>";
	var controlGCh = "<c:out value='${detail.controlGCh}'/>"; 
	var controlGReCh = "<c:out value='${detail.controlGReCh}'/>";
	var planGCh = "<c:out value='${detail.planGCh}'/>";
	var planGReCh = "<c:out value='${detail.planGReCh}'/>";
	var planMCh = "<c:out value='${detail.planMCh}'/>";
	var infoMatterChildCh = "<c:out value='${detail.infoMatterChildCh}'/>";
	var infoExpoChildCh = "<c:out value='${detail.infoExpoChildCh}'/>";
	var infoAttentionChildCh = "<c:out value='${detail.infoAttentionChildCh}'/>";
	
	if(outlineCh == 'Y'){$("input:checkbox[name='outlineCh']").attr('checked', true);}
	if(basicCh == 'Y'){$("input:checkbox[name='basicCh']").attr('checked', true);}
	if(tInfoCh == 'Y'){$("input:checkbox[name='tInfoCh']").attr('checked', true);}
	if(tSafeCh == 'Y'){$("input:checkbox[name='tSafeCh']").attr('checked', true);}
	if(overGCh == 'Y'){$("input:checkbox[name='overGCh']").attr('checked', true);}
	if(infoAttentionManCh == 'Y'){$("input:checkbox[name='infoAttentionManCh']").attr('checked', true);}
	if(overGReCh == 'Y'){$("input:checkbox[name='overGReCh']").attr('checked', true);}
	if(overMCh == 'Y'){$("input:checkbox[name='overMCh']").attr('checked', true);}
	if(overMReCh == 'Y'){$("input:checkbox[name='overMReCh']").attr('checked', true);}
	if(outlineReCh == 'Y'){$("input:checkbox[name='outlineReCh']").attr('checked', true);}
	if(controlGCh == 'Y'){$("input:checkbox[name='controlGCh']").attr('checked', true);}
	if(controlGReCh == 'Y'){$("input:checkbox[name='controlGReCh']").attr('checked', true);}
	if(planGCh == 'Y'){$("input:checkbox[name='planGCh']").attr('checked', true);}
	if(planGReCh == 'Y'){$("input:checkbox[name='planGReCh']").attr('checked', true);}
	if(planMCh == 'Y'){$("input:checkbox[name='planMCh']").attr('checked', true);}
	if(infoMatterChildCh == 'Y'){$("input:checkbox[name='infoMatterChildCh']").attr('checked', true);}
	if(infoExpoChildCh == 'Y'){$("input:checkbox[name='infoExpoChildCh']").attr('checked', true);}
	if(infoAttentionChildCh == 'Y'){$("input:checkbox[name='infoAttentionChildCh']").attr('checked', true);}
	
	makeFileAttachment();
	makefileUpdate();
			
	
});

//업로더 설정
function makeFileAttachment(){
	<c:if test="${empty detail.attachFileId}">
		var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), 1 );
		multi_selector.addThumbElement( document.getElementById( 'egovComFileUploader' ) );
	</c:if>
};

makefileUpdate = function(){
	
	<c:if test="${not empty detail.attachFileId}">
	
	var fileId = "<c:out value='${detail.attachFileId}'/>"	
	$.ajax({
		type: "POST"
		,url: "<c:url value="/adm/contents/selectFileInfsForUpdate.do"/>?atchFileId="+fileId		
		,success: function(result){                
            $("#fileUpdate").html(result);
            $("#fileUpdate").show();            
        }
	});
	
	</c:if>
};

function fn_deleteThumbFile(thumbFileId, thumbFileSn) {
	
	$("#thumbFileSn").val(thumbFileSn);
	
	if($("form").length < 1 || $("#thumbFileId").length < 1 || $("#thumbFileSn").length < 1){
		alert("파일 정보를 확인할 수 없습니다.");
		return;
	}
	
	var msg = "파일을 삭제하시겠습니까?";
	if(!confirm(msg))return;
	
	forms = document.getElementsByTagName("form");

	for (var i = 0; i < forms.length; i++) {
		if (typeof(forms[i].thumbFileId) != "undefined" &&
				typeof(forms[i].thumbFileSn) != "undefined" &&
				typeof(forms[i].thumbFileListCnt) != "undefined") {
			form = forms[i];
		}
	}
	
	form.action = "<c:url value='/cop/bbs/deleteThumbFileInfs.do'/>";
	form.submit();
};
	
doList = function(){
	document.formNoxious.action = "<c:url value='/adm/contents/noxious/EnvilomentNoxiousList.do'/>";
	document.formNoxious.submit();
};

doUpdate = function(){
	
	  var form = $('#formNoxious');
	  var form2 = document.formNoxious;
	  
	  
	  
	  
	  
	  if(confirm("수정 하시겠습니까?")){
	        if(!validateFormNoxious(form2)){           
	            return;
	        }else{
	        	
	        	var chked_val = "";
	        	
	        	if( $(":checkbox[name='boxmedium']:checked").length ==0 ){
	    		    alert("해당매체 항목을 적어도 하나이상 체크해주세요.");
	    		    return;
	    		}
	        	
	        	if($("input:radio[name='noxiousLevel']").is(":checked") == false ){
	        		alert("유해정도 항목을 체크해주세요.");
	    		    return;
	        	}
	        	
	        	$(":checkbox[name='boxmedium']:checked").each(function(){
	        		 if(this.checked){
	        			 chked_val += ","+this.value;	 
	        		 }
	        	});
	        	
	        	if(chked_val!=""){
	        		chked_val = chked_val.substring(1);
	        		$("#medium").val(chked_val);
	        	}	        		 
	        	
	            
	            form.ajaxSubmit({
		             url: "<c:url value='/adm/contents/noxious/updateAdmEnvilomentNoxious.do'/>",
		             data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
		             type: 'POST',     
		             success: function(result){
			         	 //$('.file').val('');                     //file input에 들어가 있는 값을 비워줍니다.
			         	if("success" == result){
			         		alert("환경 유해인자 DB에 수정이 완료되었습니다");
			         		doList();
			         		//location.href = "/adm/kor/contest/getAdmKorContestList.do";
			         	}else if("validateErr" == result){
			         		alert("파라미터에 문제가 있습니다.");
			         	}else{
			         		alert("환경 유해인자 DB 수정중에 문제가 발생 하였습니다." + "\n" + "관리자에게 문의해 주세요.");
			         	}
		             }
		  		});
	        } 
	    }
	  
	  
	  /* form.ajaxSubmit({
	             url: "<c:url value='/adm/kor/contest/insertAdmKorContest.do'/>",
	             data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
	             type: 'POST',     
	             success: function(result){
		         	 //$('.file').val('');                     //file input에 들어가 있는 값을 비워줍니다.
		         	if("success" == result){
		         		alert("공모전 등록이 완료되었습니다");
		         		location.href = "/adm/kor/contest/getAdmKorContestList.do";
		         	}else if("success" == result){
		         		alert("공모전 등록에 문제가 있습니다. 관리자에게 문의해 주세요");
		         	}
	             }
	  }); */
	  
	/*   $.ajax({
		type: "POST"
		,url: "<c:url value='/adm/kor/contest/insertAdmKorContest.do'/>"
		,data:$("#formContest").serialize()
		,success: function(result){                
          
          alert(result);
      }
	}); */
	//.ajax() END
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

function fn_egov_downFile(atchFileId, fileSn){
	
	var downUrl = "<c:url value='/cmm/fms/FileDown.do' />";
	
	var downForm = "<form id='downForm' action='"+downUrl+"'>"+
	"<input type='hidden' name='atchFileId' value='"+atchFileId+"' />"+
	"<input type='hidden' name='fileSn' value='"+fileSn+"' />"+
	"</form>";
	
	$("body").append(downForm);
	
	$("#downForm").attr("target" , "fileDownFrame");
	$("#downForm").submit();
	
	$("#downForm").detach();
	
	//window.open("<c:url value='/cmm/fms/NoLoginFileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
	
	//window.open("<c:url value='/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
};

</script>

<body>

<form id="formNoxious" name="formNoxious" method="post" enctype="multipart/form-data">
<input name="idx" id="idx" type="hidden" value="<c:out value="${detail.idx}"/>"/>
<input name="medium" id="medium" type="hidden" value=""/>
<input type="hidden" name="pageIndex" value="<c:if test="${empty srchVo.pageIndex }">1</c:if><c:if test="${!empty srchVo.pageIndex }"><c:out value='${srchVo.pageIndex}'/></c:if>">
<input type="hidden" name="returnUrl" value="<c:url value='/adm/contents/noxious/modifyEnvilomentNoxious.do'/>"/>
<input type="hidden" name="deleteTable" value="noxious"/>

<div style="display: none;">
<ul id="attachInfo"></ul>
</div>

<div id="contents">
	<h2 class="adminH2">환경 유해인자 DB</h2>
	<table class="bbs_default write" border="1">
   	<caption>환경 유해인자 DB 수정</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
			<tr>
				<th scope="row">물질명<span class="required" style="color: red;">*</span></th>
				<td>
					한글 : <input type="text" id="kName" name="kName" style="width: 30%;" value="<c:out value="${detail.kName}"/>"/> <br/>
					영문 : <input type="text" id="eName" name="eName" style="width: 30%;" value="<c:out value="${detail.eName}"/>"/> <br/>
					cas 번호 : <input type="text" id="cas" name="cas" style="width: 30%;" value="<c:out value="${detail.cas}"/>"/> <br/>
				</td>
			</tr>
			<tr>
				<th scope="row">썸네일</th>
				
					<c:choose>
						<c:when test="${not empty detail.attachFileId}">
								<td id="fileUpdate">									
								</td>							
						</c:when>
						<c:otherwise>
						<td>
							<font color="red"><strong>*</strong></font>이미지파일만 선택하셔야 정상적으로 노출됩니다.
							<br>
							<input name="file_1" id="egovComFileUploader" type="file" title="첨부파일입력" accept="image/*" />
							<div id="egovComFileList"></div>
						</td>
						</c:otherwise>  
					</c:choose>
					
					
					<%-- <c:if test="${!empty detail.attachFileId}">
						<c:if test="${!empty fvo}">
							<c:forEach var="fvo" items="${fvo}" varStatus="i">
								<a id="img_view" class="btn-sm btn-primary" href="<c:url value='/cmm/fms/FileDown.do'/>?atchFileId=<c:out value='${fvo.atchFileId}'/>&fileSn=<c:out value='${fvo.fileSn}'/>"><c:out value='${fvo.orignlFileNm}'/></a>
								<a href="javascript:fn_egov_downFile('<c:out value="${fvo.atchFileId}"/>','<c:out value="${fvo.fileSn}"/>')">
								<c:out value="${fvo.orignlFileNm}"/>
								</a>
								<br/>
							</c:forEach>
						</c:if>	
					</c:if>
					<input type="file" name="file_1" id="egovComFileUploader" /> --%>
				
			</tr>
			<tr>
				<th scope="row">특성</th>
				<td>
					<input type="text" id="trait" name="trait" style="width: 30%;" value="<c:out value="${detail.medium}"/>"/>
				</td>
			</tr>
			<tr>
				<th scope="row">해당매체<span class="required" style="color: red;">*</span></th>
				<td>
					<input type="checkbox" id="air" name="boxmedium" value="대기"/>&nbsp;<label for="air">대기</label>&nbsp;&nbsp;
					<input type="checkbox" id="inAir" name="boxmedium" value="실내공기"/>&nbsp;<label for="inAir">실내공기</label>&nbsp;&nbsp;
					<input type="checkbox" id="water" name="boxmedium" value="먹는물"/>&nbsp;<label for="water">먹는물</label>&nbsp;&nbsp;
					<input type="checkbox" id="soil" name="boxmedium"  value="토양"/>&nbsp;<label for="soil">토양</label>&nbsp;&nbsp;
					<input type="checkbox" id="other" name="boxmedium" value="기타"/>&nbsp;<label for="other">기타</label>&nbsp;&nbsp;
					<input type="checkbox" id="product" name="boxmedium" value="제품"/>&nbsp;<label for="product">제품</label>&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th scope="row">유해정도<span class="required" style="color: red;">*</span></th>
				<td>
					<input type="radio" id="high" name="noxiousLevel" value="H"/>&nbsp;<label for="high">상</label>&nbsp;&nbsp;
					<input type="radio" id="middle" name="noxiousLevel" value="M"/>&nbsp;<label for="middle">중</label>&nbsp;&nbsp;
					<input type="radio" id="low" name="noxiousLevel" value="L"/>&nbsp;<label for="low">하</label>&nbsp;&nbsp;
				</td>
			</tr> 
			<tr>
				<th scope="row">
					개요 <br/>
					<input type="checkbox" id="outlinHtml" name="outlineCh" value="Y"/><label for="outlinHtml">html</label>
				</th>
				<td>
					<textarea id="outline" name="outline" rows="5" cols="100"><c:out value="${detail.outline}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					기초정보 <br/>
					<input type="checkbox" id="basicHtml" name="basicCh" value="Y"/><label for="basicHtml">html</label>
				</th>
				<td>
					<textarea id="basic" name="basic" rows="5" cols="100"><c:out value="${detail.basic}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					독성정보 <br/>
					<input type="checkbox" id="tInfoHtml" name="tInfoCh" value="Y"/><label for="tInfoHtml">html</label>
				</th>
				<td>
					<textarea id="tInfo" name="tInfo" rows="5" cols="100"><c:out value="${detail.tInfo}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					독성안전수준 <br/>
					<input type="checkbox" id="tSafeHtml" name="tSafeCh" value="Y"/><label for="tSafeHtml">html</label>
				</th>
				<td>
					<textarea id="tSafe" name="tSafe" rows="5" cols="100"><c:out value="${detail.tSafe}"/></textarea>
				</td>
			</tr>
			
			
			
			
			<tr>
				<th scope="row">
					노출원인 <br/>
					<input type="checkbox" id="overGHtml" name="overGCh" value="Y"/><label for="overGHtml">html</label>
				</th>
				<td>
					<textarea id="overG" name="overG" rows="5" cols="100"><c:out value="${detail.overG}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					취급시 유의사항 <br/>
					<input type="checkbox" id="infoAttentionManHtml" name="infoAttentionManCh" value="Y"/><label for="infoAttentionManHtml">html</label>
				</th>
				<td>
					<textarea id="infoAttentionMan" name="infoAttentionMan" rows="5" cols="100"><c:out value="${detail.infoAttentionMan}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출정보(제품) <br/>
					<input type="checkbox" id="overGReHtml" name="overGReCh" value="Y"/><label for="overGReHtml">html</label>
				</th>
				<td>
					<textarea id="overGRe" name="overGRe" rows="5" cols="100"><c:out value="${detail.overGRe}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출정보(매체) <br/>
					<input type="checkbox" id="overMHtml" name="overMCh" value="Y"/><label for="overMHtml">html</label>
				</th>
				<td>
					<textarea id="overM" name="overM" rows="5" cols="100"><c:out value="${detail.overM}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출저감방안(제품) <br/>
					<input type="checkbox" id="overMReHtml" name="overMReCh" value="Y"/><label for="overMReHtml">html</label>
				</th>
				<td>
					<textarea id="overMRe" name="overMRe" rows="5" cols="100"><c:out value="${detail.overMRe}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출저감방안(매체) <br/>
					<input type="checkbox" id="outlineReHtml" name="outlineReCh" value="Y"/><label for="outlineReHtml">html</label>
				</th>
				<td>
					<textarea id="outlineRe" name="outlineRe" rows="5" cols="100"><c:out value="${detail.outlineRe}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					규제정보(제품) <br/>
					<input type="checkbox" id="controlGHtml" name="controlGCh" value="Y"/><label for="controlGHtml">html</label>
				</th>
				<td>
					<textarea id="controlG" name="controlG" rows="5" cols="100"><c:out value="${detail.controlG}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					규제정보(매체) <br/>
					<input type="checkbox" id="controlGReHtml" name="controlGReCh" value="Y"/><label for="controlGReHtml">html</label>
				</th>
				<td>
					<textarea id="controlGRe" name="controlGRe" rows="5" cols="100"><c:out value="${detail.controlGRe}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					참고문헌(제품) <br/>
					<input type="checkbox" id="planGHtml" name="planGCh" value="Y"/><label for="planGHtml">html</label>
				</th>
				<td>
					<textarea id="planG" name="planG" rows="5" cols="100"><c:out value="${detail.planG}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					참고문헌(매체) <br/>
					<input type="checkbox" id="planGReHtml" name="planGReCh" value="Y"/><label for="planGReHtml">html</label>
				</th>
				<td>
					<textarea id="planGRe" name="planGRe" rows="5" cols="100"><c:out value="${detail.planGRe}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					참고문헌(전체) <br/>
					<input type="checkbox" id="planMHtml" name="planMCh" value="Y"/><label for="planMHtml">html</label>
				</th>
				<td>
					<textarea id="planM" name="planM" rows="5" cols="100"><c:out value="${detail.planM}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					어떤 물질인가요?<br/>
					(어린이) <br/>
					<input type="checkbox" id="infoMatterChildHtml" name="infoMatterChildCh" value="Y"/><label for="infoMatterChildHtml">html</label>
				</th>
				<td>
					<textarea id=infoMatterChild name="infoMatterChild" rows="5" cols="100"><c:out value="${detail.infoMatterChild}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					어떤 증상이 있나요?<br/>
					(어린이) <br/>
					<input type="checkbox" id="infoExpoChildHtml" name="infoExpoChildCh" value="Y"/><label for="infoExpoChildHtml">html</label>
				</th>
				<td>
					<textarea id="infoExpoChild" name="infoExpoChild" rows="5" cols="100"><c:out value="${detail.infoExpoChild}"/></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					주의할점은 무엇인가요?<br/>
					(어린이) <br/>
					<input type="checkbox" id="infoAttentionChildHtml" name="infoAttentionChildCh" value="Y"/><label for="infoAttentionChildHtml">html</label>
				</th>
				<td>
					<textarea id="infoAttentionChild" name="infoAttentionChild" rows="5" cols="100"><c:out value="${detail.infoAttentionChild}"/></textarea>
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