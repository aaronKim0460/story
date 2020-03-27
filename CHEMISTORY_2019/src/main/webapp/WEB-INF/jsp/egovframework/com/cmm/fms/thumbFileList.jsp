<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript">

	// 나중에 다운로드를 개발해야 할경우 참고용으로 남겨둠. 사용안함 - 2016.11.03 이한구
	function fn_thumbDownFile(atchFileId, fileSn){
		
		var downUrl = "<c:url value='/cmm/fms/FileDown.do' />";
		
		var downForm = "<form id='downForm' action='"+downUrl+"'>"+
		"<input type='hidden' name='atchFileId' value='"+atchFileId+"' />"+
		"<input type='hidden' name='fileSn' value='"+fileSn+"' />"+
		"</form>";
		
		$("body").append(downForm);
		
		$("#downForm").attr("target" , "fileDownFrame");
		$("#downForm").submit();
		
		$("#downForm").detach();
	}

	// 파일 삭제
	function fn_deleteThumbFile(thumbFileId, thumbFileSn) {
		if($('form').attr('id') == 'recall')	$('#deleteTable').val($('#delType').val());//리콜에서 썸네일 삭제 돌릴 때
		
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
	}
	
</script>

<input type="hidden" id="thumbFileId" name="thumbFileId" value="<c:out value='${atchFileId}'/>" />
<input type="hidden" id="thumbFileSn" name="thumbFileSn" />
<input type="hidden" id="deleteTable" name="deleteTable" />
<input type="hidden" name="thumbFileListCnt" id="thumbFileListCnt" value="<c:out value='${fileListCnt}'/>" />

	<table id="file_list">
		<c:forEach var="fileVO" items="${fileList}" varStatus="status">
		<tr>
			<td style="padding-left:20px;">
			<c:choose>
				<c:when test="${updateFlag=='Y'}">
					<c:out value="${fileVO.orignlFileNm}"/>&nbsp; 
					<a href="javascript:fn_deleteThumbFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>');" name="btn_delete" class="btn-sm btn-warning">삭제</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:fn_thumbDownFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')">
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
	