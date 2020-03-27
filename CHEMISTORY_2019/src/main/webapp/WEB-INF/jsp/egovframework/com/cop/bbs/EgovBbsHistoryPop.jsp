<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<title>콘텐츠 변경이력</title>
<script type="text/javaScript" language="javascript" defer="defer">

	<c:if test="${fn:length(historyList) == 0}">
		alert("조회된 이력이 없습니다.");
		self.close();
	</c:if>

	$(document).ready(function(){
		
		// 미리보기
		$("[name=preview]").click(function(){
			
			var bbsId = $("#bbsId").val();
			var nttId = $("#nttId").val();
			var nttSn = $(this).attr("nttSn");
			
			if(bbsId == null || bbsId == "" || nttId == null || nttId == "" || nttSn == null || nttSn == ""){
				alert("게시물 정보를 확인할 수 없습니다.");
				return;
			}
			
			var param = "bbsId="+bbsId;
			param += "&nttId="+nttId;
			param += "&nttSn="+nttSn;
			
			window.open("/cop/bbs/contentBBSHistoryPreview.do?"+param, "content_preview", "scrollbars=yes, width=1100, height=800");
			
		});
		
		// 복원
		$("[name=restoration]").click(function(){
			
			var bbsId = $("#bbsId").val();
			var nttId = $("#nttId").val();
			var nttSn = $(this).attr("nttSn");
			
			if(bbsId == null || bbsId == "" || nttId == null || nttId == "" || nttSn == null || nttSn == ""){
				alert("게시물 정보를 확인할 수 없습니다.");
				return;
			}
			
			var btnIdx = $("[name=restoration]").index($(this));
			
			var msgTime = $("[name=lastUpdtPnttm]").eq(btnIdx).text();
			
			if(!confirm(msgTime + " 에 백업된 콘텐츠로 복원하시겠습니까?"))return;
			
			$("#nttSn").val(nttSn);
			
			fnGetAjaxData("/cop/bbs/contentBBSHistoryRestoration.do", "listForm", fnCBRestoration, false);
		});
		
		// 닫기
		$("#btn_close").click(function(){
			self.close();
		});
		
	});
	
	// 복원 후처리
	function fnCBRestoration(data){
		
		if(data == null || data.result == null || data.result != "Y"){
			alert("복원에 실패하였습니다.");
			return;
		}
		
		alert("복원 되었습니다.");
		
		//opener.$("form").eq(0).submit();
		opener.location.reload();
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
	<input type="hidden" id="nttId" name="nttId" value="<c:out value='${boardInfo.nttId}'/>" />
	<input type="hidden" id="bbsId" name="bbsId" value="<c:out value='${boardInfo.bbsId}'/>" />
	<input type="hidden" id="nttSn" name="nttSn" />
</form>

<div class="board-list">
<table class="board-default">
	<colgroup>
		<col style="width:18%;" />
		<col style="width:*;" />
		<col style="width:8%;" />
		<col style="width:6%;" />
		<col style="width:12%;" />
		<col style="width:8%;" />
		<col style="width:8%;" />
	</colgroup>
	<thead>
	  	<tr>
	    	<th class="board-default-th-title">백업일시</th>
		    <th class="board-default-th-title">콘텐츠 설명</th>
		    <th class="board-default-th-title">변경유형</th>
		    <th class="board-default-th-title">수정자</th>
		    <th class="board-default-th-title">수정자IP</th>
		    <th class="board-default-th-hit">미리보기</th>
		    <th class="board-default-th-hit">복원</th>
		</tr>
	</thead>

	<tbody>
	
		<c:choose>
			<c:when test="${fn:length(historyList) == 0}">
				<tr class="bg">
					<td colspan="7" style="text-align:center;">조회된 이력이 없습니다.</td>
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
						<td class="board-default-td-title"><c:out value="${history.nttSj}"/></td>
						<td class="board-default-td"><c:out value="${actionTy}"/></td>
						<td class="board-default-td"><c:out value="${history.lastUpdusrNm}"/></td>
						<td class="board-default-td"><c:out value="${history.updusrIp}"/></td>
						<td class="board-default-td-hit"><a name="preview" nttSn="<c:out value='${history.nttSn}'/>" class="btn btn-sm btn-link" href="#none">미리보기</a></td>
						<td class="board-default-td-hit"><a name="restoration" nttSn="<c:out value='${history.nttSn}'/>" class="btn btn-sm btn-link" href="#none">복원</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
	</table>
</div> 

<div class="board-detail-foot">
	<div class="btns clear fr">
		<font color="red"><strong>*</strong></font>키워드는 복구되지 않습니다.
		<a id="btn_close" name="btn_close" href="#" class="btn btn-default">닫기</a>
	</div>
</div>

</body>
</html>
