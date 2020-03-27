<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>


<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	var startIndex = "<c:out value="${envlist[0].envId}"/>";
	doStartPage(startIndex);
});

doStartPage = function(envid){	
	
	$.ajax({
		type: "POST"
		,url: "<c:url value="/adm/contents/material/NoxiousMaterialListData.do"/>?envId="+envid		
		,success: function(result){                
            $("#conData").html(result);
            $("#conData").show();            
        }
	});
};

doAddPopup = function(envid, matid){	
	$("#envId").val(envid);
	$("#matId").val(matid);
	
	var newPop = document.popForm;
	var url = "<c:url value='/adm/contents/material/addEnvMaterial.do'/>";
	//var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=240, height=200, top=0,left=20"; 
	var status = "width=712, height=384, top=30,left=60"; 
	window.open("","popForm",status);
	
	newPop.action =url; 
	newPop.method="post";
	newPop.target="popForm";
	newPop.submit();
};

refresh = function(envid){
	doStartPage(envid);
};

doMapiingdelete = function(envId, matId, idx){
	
	$("#mapEnvId").val(envId);
	$("#mapMatId").val(matId);
	$("#mapIdx").val(idx);
	
	$.ajax({
		type: "POST"
		,url: "<c:url value="/adm/contents/material/deleteMatMapping.do"/>"
		,data:$("#deleteForm").serialize()
		,success: function(result){
			if("success" == result){
            	alert("삭제되었습니다.");
            	doStartPage(envId);
            }else{
            	alert("삭제에 실패하였습니다. \n 관리자에게 문의해주세요");
            }
        }
	});
};
</script>

<style type="text/css">
.notPointer{
	cursor:default !important;
}
</style>

<body>
<h2 class="adminH2">생활 속 유해물질</h2>
<form id="popForm" name="popForm" method="post">
<input type="hidden" id="envId" name="envId" value=""/>
<input type="hidden" id="matId" name="matId" value=""/>
</form>
<form id="deleteForm" name="deleteForm" method="post">
<input type="hidden" id="mapEnvId" name="envId" value=""/>
<input type="hidden" id="mapMatId" name="matId" value=""/>
<input type="hidden" id="mapIdx" name="idx" value=""/>
</form>

<div class="board-search" style="float: left; text-align: left;">
<form id="listForm" name="listForm" method="post">
	<fieldset>
	<legend>목록검색</legend>
		배너명&nbsp;		
			<select onchange="doStartPage(this.value);">
				<c:forEach var="envlist" items="${envlist}" varStatus="i">
					<option value="<c:out value="${envlist.envId}"/>"><c:out value="${envlist.envName}"/></option>
				</c:forEach>
			</select>
	</fieldset>
</form>
</div>
<br/><br/>
<div id="conData">
</div>
</body>
</html>

