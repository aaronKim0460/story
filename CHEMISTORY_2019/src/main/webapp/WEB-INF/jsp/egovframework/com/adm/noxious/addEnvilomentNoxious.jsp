<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew2.jsp" %>
<script type="text/javascript" src="/js/jquery.form.min.js"></script>
<validator:javascript formName="formNoxious" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript">
$(document).ready(function(){
	makeFileAttachment();
	
});
	
doList = function(){
	document.formNoxious.action = "<c:url value='/adm/contents/noxious/EnvilomentNoxiousList.do'/>";
	document.formNoxious.submit();
};

doInsert = function(){
	
	  var form = $('#formNoxious');
	  var form2 = document.formNoxious;
	  
	  
	  
	  
	  
	  if(confirm("등록 하시겠습니까?")){
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
	        		 
	        	//alert(chked_val);
	        	
	        	
	            //alert("등록진행");
	            
	            form.ajaxSubmit({
		             url: "<c:url value='/adm/contents/noxious/insertAdmEnvilomentNoxious.do'/>",
		             data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
		             type: 'POST',     
		             success: function(result){
			         	 //$('.file').val('');                     //file input에 들어가 있는 값을 비워줍니다.
			         	if("success" == result){
			         		alert("환경 유해인자 DB에 등록이 완료되었습니다");
			         		doList();
			         		//location.href = "/adm/kor/contest/getAdmKorContestList.do";
			         	}else if("validateErr" == result){
			         		alert("파라미터에 문제가 있습니다.");
			         	}else{
			         		alert("환경 유해인자 DB에 등록에 문제가 발생 하였습니다." + "\n" + "관리자에게 문의해 주세요.");
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

function setElementsEvent(){
	
	$("#contestImg").bind("change", handleFileSelect);
		
};

function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object

    for (var i = 0, f; f = files[i]; i++) {

      // Only process image files.
      if(!f.type.match('image.*')){
        alert("이미지 포맷이 아닙니다");
        $("#contestImg").val("");        
        break;
      }
    }//for
};//fnc

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

//업로더 설정
function makeFileAttachment(){
	 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), 1 );
	 multi_selector.addThumbElement( document.getElementById( 'egovComFileUploader' ) );
};

</script>

<body>

<form id="formNoxious" name="formNoxious" method="post" enctype="multipart/form-data">
<input name="cmd" type="hidden" value="<c:out value='insert'/>"/>
<input name="medium" id="medium" type="hidden" value=""/>
<input type="hidden" name="pageIndex" value="<c:if test="${empty srchVo.pageIndex }">1</c:if><c:if test="${!empty srchVo.pageIndex }"><c:out value='${srchVo.pageIndex}'/></c:if>">
<div style="display: none;">
<ul id="attachInfo"></ul>
</div>

<div id="contents">
<div class="board-list">
	<h2 class="adminH2">환경 유해인자 DB</h2>
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
					한글 : <input type="text" id="kName" name="kName" style="width: 30%;" value=""/> <br/>
					영문 : <input type="text" id="eName" name="eName" style="width: 30%;" value=""/> <br/>
					cas 번호 : <input type="text" id="cas" name="cas" style="width: 30%;" value=""/> <br/>
				</td>
			</tr>
			<tr>
				<th scope="row">썸네일</th>
				<td>
					<input type="file" name="file_1" id="egovComFileUploader" accept="image/*"/>
					<div id="egovComFileList"></div>
				</td>
			</tr>
			<tr>
				<th scope="row">특성</th>
				<td>
					<input type="text" id="trait" name="trait" style="width: 30%;" value=""/>
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
					<textarea id="outline" name="outline" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					기초정보 <br/>
					<input type="checkbox" id="basicHtml" name="basicCh" value="Y"/><label for="basicHtml">html</label>
				</th>
				<td>
					<textarea id="basic" name="basic" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					독성정보 <br/>
					<input type="checkbox" id="tInfoHtml" name="tInfoCh" value="Y"/><label for="tInfoHtml">html</label>
				</th>
				<td>
					<textarea id="tInfo" name="tInfo" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					독성안전수준 <br/>
					<input type="checkbox" id="tSafeHtml" name="tSafeCh" value="Y"/><label for="tSafeHtml">html</label>
				</th>
				<td>
					<textarea id="tSafe" name="tSafe" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출원인 <br/>
					<input type="checkbox" id="overGHtml" name="overGCh" value="Y"/><label for="overGHtml">html</label>
				</th>
				<td>
					<textarea id="overG" name="overG" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					취급시 유의사항 <br/>
					<input type="checkbox" id="infoAttentionManHtml" name="infoAttentionManCh" value="Y"/><label for="infoAttentionManHtml">html</label>
				</th>
				<td>
					<textarea id="infoAttentionMan" name="infoAttentionMan" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출정보(제품) <br/>
					<input type="checkbox" id="overGReHtml" name="overGReCh" value="Y"/><label for="overGReHtml">html</label>
				</th>
				<td>
					<textarea id="overGRe" name="overGRe" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출정보(매체) <br/>
					<input type="checkbox" id="overMHtml" name="overMCh" value="Y"/><label for="overMHtml">html</label>
				</th>
				<td>
					<textarea id="overM" name="overM" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출저감방안(제품) <br/>
					<input type="checkbox" id="overMReHtml" name="overMReCh" value="Y"/><label for="overMReHtml">html</label>
				</th>
				<td>
					<textarea id="overMRe" name="overMRe" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출저감방안(매체) <br/>
					<input type="checkbox" id="outlineReHtml" name="outlineReCh" value="Y"/><label for="outlineReHtml">html</label>
				</th>
				<td>
					<textarea id="outlineRe" name="outlineRe" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					규제정보(제품) <br/>
					<input type="checkbox" id="controlGHtml" name="controlGCh" value="Y"/><label for="controlGHtml">html</label>
				</th>
				<td>
					<textarea id="controlG" name="controlG" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					규제정보(매체) <br/>
					<input type="checkbox" id="controlGReHtml" name="controlGReCh" value="Y"/><label for="controlGReHtml">html</label>
				</th>
				<td>
					<textarea id="controlGRe" name="controlGRe" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					참고문헌(제품) <br/>
					<input type="checkbox" id="planGHtml" name="planGCh" value="Y"/><label for="planGHtml">html</label>
				</th>
				<td>
					<textarea id="planG" name="planG" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					참고문헌(매체) <br/>
					<input type="checkbox" id="planGReHtml" name="planGReCh" value="Y"/><label for="planGReHtml">html</label>
				</th>
				<td>
					<textarea id="planGRe" name="planGRe" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					참고문헌(전체) <br/>
					<input type="checkbox" id="planMHtml" name="planMCh" value="Y"/><label for="planMHtml">html</label>
				</th>
				<td>
					<textarea id="planM" name="planM" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					어떤 물질인가요?<br/>
					(어린이) <br/>
					<input type="checkbox" id="infoMatterChildHtml" name="infoMatterChildCh" value="Y"/><label for="infoMatterChildHtml">html</label>
				</th>
				<td>
					<textarea id=infoMatterChild name="infoMatterChild" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					어떤 증상이 있나요?<br/>
					(어린이) <br/>
					<input type="checkbox" id="infoExpoChildHtml" name="infoExpoChildCh" value="Y"/><label for="infoExpoChildHtml">html</label>
				</th>
				<td>
					<textarea id="infoExpoChild" name="infoExpoChild" rows="5" cols="100"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">
					주의할점은 무엇인가요?<br/>
					(어린이) <br/>
					<input type="checkbox" id="infoAttentionChildHtml" name="infoAttentionChildCh" value="Y"/><label for="infoAttentionChildHtml">html</label>
				</th>
				<td>
					<textarea id="infoAttentionChild" name="infoAttentionChild" rows="5" cols="100"></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	
</div>

<div class="t_center mt20">
	<a href="javascript:doList();" class="btn gray">목록</a>
	<a href="javascript:doInsert();" class="btn seablue">등록</a>
</div>

</div>



</form>

</body>
</html>