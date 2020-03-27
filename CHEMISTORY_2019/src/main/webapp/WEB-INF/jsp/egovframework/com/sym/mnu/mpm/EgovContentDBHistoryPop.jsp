<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	
	$("[name=preview]").click(function(){
		
		var menuNo = $("#menuNo").val();
		var contentSn = $(this).attr("contentSn");
		
		if(menuNo == null || menuNo == "" || contentSn == null || contentSn == ""){
			alert("DB 컨텐츠 정보를 확인할 수 없습니다.");
			return;
		}
		
		var param = "menuNo="+menuNo;
		param += "&contentSn="+contentSn;
		
		window.open("/sym/mnu/mpm/contentDBHistoryPreview.do?"+param, "content_preview", "scrollbars=yes, width=800, height=800");
		
	});
	
	// 복원
	$("[name=restoration]").click(function(){
		
		var menuNo = $("#menuNo").val();
		var contentSn = $(this).attr("contentSn");
		
		if(menuNo == null || menuNo == "" || contentSn == null || contentSn == ""){
			alert("DB 컨텐츠 정보를 확인할 수 없습니다.");
			return;
		}
		
		var btnIdx = $("[name=restoration]").index($(this));
		
		var msgTime = $("[name=lastUpdtPnttm]").eq(btnIdx).text();
		
		if(!confirm(msgTime + " 에 백업된 콘텐츠로 복원하시겠습니까?"))return;
		
		$("#contentSn").val(contentSn);
		
		fnGetAjaxData("/sym/mnu/mpm/contentBBSHistoryRestoration.do", "listForm", fnContentDBRestoration, false);
	});
	
	$("#btn_close").click(function(){
		self.close();
	});
});

//복원 후처리
function fnContentDBRestoration(data){
	
	if(data == null || data.result == null || data.result != "Y"){
		alert("복원에 실패하였습니다.");
		return;
	}
	
	alert("복원 되었습니다.");
	
	opener.$("form").eq(0).submit();
	self.close();
}

// 미리보기창에서 복원 완료
function fnEndRestoration(){
	opener.$("form").eq(0).submit();
	self.close();
}
</script>

<body>

<form id="listForm" name="listForm" method="post">
	<input type="hidden" id="menuNo" name="menuNo" value="<c:out value='${menuInfo.menuNo}'/>" />
	<input type="hidden" id="contentSn" name="contentSn" />
</form>

<div class="board-list">
<table class="board-default">
	<colgroup>
		<col style="width:26%;" />
		<col />
		<col style="width:18%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
	</colgroup>
	<thead>
	  	<tr>
	    	<th class="board-default-th-title">백업일시</th>
		    <th class="board-default-th-title">변경유형</th>
		    <th class="board-default-th-title">수정자</th>
		    <th class="board-default-th-hit">미리보기</th>
		    <th class="board-default-th-hit">복원</th>
		</tr>
	</thead>

	<tbody>
	
		<c:choose>
			<c:when test="${fn:length(historyList) == 0}">
				<tr class="bg">
				<td colspan="6">검색된 결과가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="history" items="${historyList}" varStatus="status">
				
					<c:set var="actionTy" value="" />
					<c:choose>
						<c:when test="${history.actionTy == 'C'}">
							<c:set var="actionTy" value="생성" />
						</c:when>
						<c:when test="${history.actionTy == 'U'}">
							<c:set var="actionTy" value="수정" />
						</c:when>
						<c:when test="${history.actionTy == 'D'}">
							<c:set var="actionTy" value="삭제" />
						</c:when>
						<c:when test="${history.actionTy == 'R'}">
							<c:set var="actionTy" value="복원" />
						</c:when>
					</c:choose>
				
					<tr>
						<td class="board-default-td" name="lastUpdtPnttm"><c:out value='${history.lastUpdtPnttm}'/></td>
						<td class="board-default-td"><c:out value="${actionTy}"/></td>
						<td class="board-default-td"><c:out value="${history.lastUpdusrId}"/></td>
						<td class="board-default-td-hit"><a name="preview" contentSn="<c:out value='${history.contentSn}'/>" class="btn btn-sm btn-link" href="#">미리보기</a></td>
						<td class="board-default-td-hit"><a name="restoration" contentSn="<c:out value='${history.contentSn}'/>" class="btn btn-sm btn-link" href="#">복원</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
</div> 

<div class="board-detail-foot">
	<div class="btns clear fr">
		<a id="btn_close" name="btn_close" href="#" class="btn btn-default">닫기</a>
	</div>
</div>

</body>
</html>