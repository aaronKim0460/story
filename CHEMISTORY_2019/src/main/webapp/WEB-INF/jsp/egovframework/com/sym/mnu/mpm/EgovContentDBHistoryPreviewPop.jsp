<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function(){
	
	// 복원
	$("#btn_restoration").click(function(){
		
		var menuNo = $("#menuNo").val();
		var contentSn = $("#contentSn").val();
		
		if(menuNo == null || menuNo == "" || contentSn == null || contentSn == ""){
			alert("DB 컨텐츠 정보를 확인할 수 없습니다.");
			return;
		}
		
		if(!confirm("표시된 DB 콘텐츠로 복원하시겠습니까?"))return;
		
		fnGetAjaxData("/sym/mnu/mpm/contentBBSHistoryRestoration.do", "listForm", fnContentDBRestoration, false);
	});
	
	$("#btn_close").click(function(){
		self.close();
	});
});

// 복원 후처리
function fnContentDBRestoration(data){
	
	if(data == null || data.result == null || data.result != "Y"){
		alert("복원에 실패하였습니다.");
		return;
	}
	
	alert("복원 되었습니다.");
	
	opener.fnEndRestoration();
	
	self.close();
}

</script>

<body style="background:none;">

<form id="listForm" name="listForm" method="post">
	<input type="hidden" id="menuNo" name="menuNo" value="<c:out value='${historyDetail.menuNo}'/>" />
	<input type="hidden" id="contentSn" name="contentSn" value="<c:out value='${historyDetail.contentSn}'/>" />
</form>

<div class="board-detail-content" style="border:1px">
	<c:out value="${historyDetail.progrmContent}" escapeXml="false" />
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">
		<a id="btn_restoration" name="btn_restoration" href="#" class="btn btn-primary">복원</a>
		<a id="btn_close" name="btn_close" href="#" class="btn btn-default">닫기</a>
	</div>
</div>

</body>