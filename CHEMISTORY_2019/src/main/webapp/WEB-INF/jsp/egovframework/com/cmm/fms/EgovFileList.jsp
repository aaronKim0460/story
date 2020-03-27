<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript">

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
	}

	function fn_egov_deleteFile(atchFileId, fileSn) {
		
		var param = new Object();
		param.atchFileId = $("#atchFileId").val();
		$("#fileSn").val(fileSn);
		
		fnGetAjaxData("/cop/bbs/selectBBSFileIdCount.do", param, fnFileIdCount, false);
	}
	
	function fnFileIdCount(data){
		
		var msg = "파일을 삭제하시겠습니까?";
		
		if(data.result == "Y"){
			msg = "다른 게시물의 파일도 같이 삭제됩니다.\n 그래도 삭제하시겠습니까";
			//if(!confirm("다른 게시물의 파일도 같이 삭제됩니다.\n 그래도 삭제하시겠습니까"))return;
		}
		
		if($("form").length < 1 || $("#atchFileId").length < 1 || $("#fileSn").length < 1){
			alert("파일 정보를 확인할 수 없습니다.");
			return;
		}
		
		if(!confirm(msg))return;
		
		forms = document.getElementsByTagName("form");

		for (var i = 0; i < forms.length; i++) {
			if (typeof(forms[i].atchFileId) != "undefined" &&
					typeof(forms[i].fileSn) != "undefined" &&
					typeof(forms[i].fileListCnt) != "undefined") {
				form = forms[i];
			}
		}

		//form = document.forms[0];
		//form.atchFileId.value = atchFileId;
		//form.fileSn.value = fileSn;
		form.action = "<c:url value='/cop/bbs/deleteFileInfs.do'/>";
		form.submit();
	}

	function fn_egov_check_file(flag) {
		if (flag=="Y") {
			document.getElementById('file_upload_posbl').style.display = "block";
			document.getElementById('file_upload_imposbl').style.display = "none";
		} else {
			document.getElementById('file_upload_posbl').style.display = "none";
			document.getElementById('file_upload_imposbl').style.display = "block";
		}
	}
	
	$(document).ready(function(){
		
		$("a[name=btn_up], a[name=btn_down]").click(function(){
			
			var name = $(this).attr("name");
			var idx = $("[name="+name+"]").index(this);
			var objLen = $("[name="+name+"]").length;
			
			var trObj = $("#file_list tr").eq(idx);
			
			if(name == "btn_up"){
				if(idx < 1)return;
				
				trObj.prev().before(trObj);
				
			}else if(name == "btn_down"){
				
				if(idx >= (objLen - 1))return;
				
				trObj.next().after(trObj);
				
			}
		});
	});
	
</script>

<!-- <form id="com_file_form" name="com_file_form" action="" method="post" > -->
<input type="hidden" id="atchFileId" name="atchFileId" value="<c:out value='${atchFileId}'/>" />
<input type="hidden" id="fileSn" name="fileSn" />
<input type="hidden" name="fileListCnt" id="fileListCnt" value="<c:out value='${fileListCnt}'/>" />
<!-- </form> -->

	<table id="file_list">
		<c:forEach var="fileVO" items="${fileList}" varStatus="status">
		<tr>
			<c:if test="${fn:length(fileList) > 1}">
				<td>
					<a href="#" name="btn_up" style="padding-right: 5px;"><img src="<c:url value='/images/common/icon_up_arrow.gif'/>" /></a>
			    	<a href="#" name="btn_down"><img src="<c:url value='/images/common/icon_down_arrow.gif'/>" /></a>
			    </td>
		    </c:if>
		    
			<td style="padding-left:20px;">
				<input type="hidden" name="newFileSn" value="<c:out value='${fileVO.atchFileId}'/>|<c:out value='${fileVO.fileSn}'/>"/>
			<c:choose>
				<c:when test="${updateFlag=='Y'}">
					<c:out value="${fileVO.orignlFileNm}"/>&nbsp; 
					<a href="javascript:fn_egov_deleteFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>');" name="btn_delete" class="btn-sm btn-warning">삭제</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:fn_egov_downFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')">
					<c:out value="${fileVO.orignlFileNm}"/>&nbsp; 
					</a>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		</c:forEach>
		<c:if test="${fn:length(fileList) == 0}">
			파일 없음
	    </c:if>
	</table>

<div style="width: 0px; height: 0px; display: none;">
	<iframe name="fileDownFrame" title="file Down"></iframe>
</div>	