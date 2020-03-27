<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cop/bbs/"/>

<script type="text/javascript">
	
	function fn_nier_downFile(atchFileId, fileSn){
		
		var downUrl = "<c:url value='/cmm/fms/NoLoginFileDown.do' />";
		
		var downForm = "<form id='downForm' action='"+downUrl+"'>"+
		"<input type='hidden' name='atchFileId' value='"+atchFileId+"' />"+
		"<input type='hidden' name='fileSn' value='"+fileSn+"' />"+
		"</form>";
		
		$("body").append(downForm);
		
		$("#downForm").attr("target" , "fileDownFrame");
		$("#downForm").submit();
		
		$("#downForm").detach();
		
		//window.open("<c:url value='/cmm/fms/NoLoginFileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
	}

	function fn_egov_deleteFile(atchFileId, fileSn) {
		
		var param = new Object();
		param.atchFileId = $("#atchFileId").val();
		
		fnGetAjaxData("/cop/bbs/selectBBSFileIdCount.do", param, fnFileIdCount, false);
	}
	
	function fnFileIdCount(data){
		
		var msg = "파일을 삭제하시겠습니까?";
		
		if(data.result == "Y"){
			msg = "다른 게시물의 파일도 같이 삭제됩니다.\n 그래도 삭제하시겠습니까";
			//if(!confirm("다른 게시물의 파일도 같이 삭제됩니다.\n 그래도 삭제하시겠습니까"))return;
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
		form.atchFileId.value = atchFileId;
		form.fileSn.value = fileSn;
		form.action = "<c:url value='/cmm/fms/deleteNierFileInfs.do'/>";
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
	
</script>

<!-- <form name="fileForm" action="" method="post" >  -->
<input type="hidden" name="atchFileId" value="<c:out value='${atchFileId}'/>" />
<input type="hidden" name="fileSn" />
<input type="hidden" name="fileListCnt" id="fileListCnt" value="<c:out value='${fileListCnt}'/>" />

<!-- </form>  -->

<!--<title>파일목록</title> -->
	<c:choose>
	<c:when test="${userTp eq 'userTp' }">
	<ul class="attach">
		<c:forEach var="fileVO" items="${fileList}" varStatus="status">
			<c:choose>
				<c:when test="${updateFlag=='Y'}">
					<li><c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]</li>
					<input type="button" value="삭제" onclick="fn_egov_deleteFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>');"/>
				</c:when>
				<c:otherwise>
					<li><img src="/assets/kor/images/bbs/ic_addfile.gif" alt="첨부파일" />&nbsp;<a href="javascript:fn_nier_downFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')"><c:out value="${fileVO.orignlFileNm}"/></a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
    </ul>
	</c:when>
	<c:otherwise>
		<div style="width:600px;" class="fileArea">
		<c:forEach var="fileVO" items="${fileList}" varStatus="status">
			<c:choose>
				<c:when test="${updateFlag=='Y'}">
					<c:out value="${fileVO.orignlFileNm}"/>&nbsp;[<c:out value="${fileVO.fileMg}"/>&nbsp;byte]
					<input type="button" value="삭제" onclick="fn_egov_deleteFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>');"/>
				</c:when>
				<c:otherwise>
					<a href="javascript:fn_nier_downFile('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>')"><i class="fa fa-floppy-o fa-lg"></i>&nbsp;<c:out value="${fileVO.orignlFileNm}"/></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${fn:length(fileList) == 0}">
			-
	    </c:if>
		</div>	
	</c:otherwise>
	</c:choose>
<div style="width: 0px; height: 0px; display: none;">
	<iframe name="fileDownFrame" title="file Down"></iframe>
</div>	