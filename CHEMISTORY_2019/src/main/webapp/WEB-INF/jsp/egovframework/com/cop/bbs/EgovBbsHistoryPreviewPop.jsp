<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<title>백업일시 : <c:out value='${historyDetail.frstRegisterPnttm }'/></title>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 파일 다운로드
		$("[name=file_down]").click(function(){
			
			$("#fileSn").val($(this).attr("filesn"));
			
			$("#downForm").attr("action" , "<c:url value='/cop/bbs/historyFileDown.do' />");
			$("#downForm").attr("target" , "fileDown");
			$("#downForm").submit();
		});
		
		// 복원
		$("#btn_restoration").click(function(){
			
			var bbsId = $("#bbsId").val();
			var nttId = $("#nttId").val();
			var nttSn = $("#nttSn").val();
			
			if(bbsId == null || bbsId == "" || nttId == null || nttId == "" || nttSn == null || nttSn == ""){
				alert("게시물 정보를 확인할 수 없습니다.");
				return;
			}
			
			if(!confirm("표시된 콘텐츠로 복원하시겠습니까?"))return;
			
			fnGetAjaxData("/cop/bbs/contentBBSHistoryRestoration.do", "downForm", fnCBRestoration, false);
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
		
		opener.fnEndRestoration();
		
		self.close();
	}
	
</script>

<body style="background:none;">

<form id="downForm" name="downForm" method="post">
	<input type="hidden" id="nttId" name="nttId" value="<c:out value='${boardInfo.nttId}'/>" />
	<input type="hidden" id="bbsId" name="bbsId" value="<c:out value='${boardInfo.bbsId}'/>" />
	<input type="hidden" id="nttSn" name="nttSn" value="<c:out value='${boardInfo.nttSn}'/>" />
	<input type="hidden" id="fileSn" name="fileSn" />
</form>

<div style="width: 0px; height: 0px; display: none;">
	<iframe name="fileDown" title="file Down"></iframe>
</div>

<div class="board-detail-head">
		
	<c:choose>
		<c:when test="${historyDetail.bbsAttrbCode == 'BBSA05' || historyDetail.bbsAttrbCode == 'BBSA02'}">
			<dl class="board-detail-head-title">
				<dt><span>제목</span></dt>
				<dd><span><c:out value="${historyDetail.nttSj}" /></span></dd>
			</dl>
			<dl class="board-detail-head-writer"> 
				<dt><span>담당자</span></dt>
				<dd><span>
				
				<c:choose>
			    	<c:when test="${historyDetail.ntcrNm == null || historyDetail.ntcrNm == ''}">
			    		<c:out value="${historyDetail.frstRegisterNm}" />
			    	</c:when>
			    	<c:otherwise>
			    		<c:out value="${historyDetail.ntcrNm}" />
			    	</c:otherwise>
		    	</c:choose>
		    	
				</span></dd>
			</dl>
			<dl class="board-detail-head-date">
				<dt><span>등록일</span></dt>
				<dd><span><c:out value="${historyDetail.frstRegisterPnttm}" /></span></dd>
			</dl>
			<dl class="board-detail-head-hit">
				<dt><span>조회수</span></dt>
			 	<dd><span><c:out value="${historyDetail.inqireCo}" /></span></dd>
			</dl>
		</c:when>
		<c:otherwise>
			<colgroup><col width="15%" /><col width="*" /><col width="15%" /><col width="30%" /></colgroup>
			<dl class="board-detail-head-title">
				<dt><span>제목</span></dt>
				<dd><span><c:out value="${historyDetail.nttSj}" /></span></dd>
			</dl>
			
			<dl class="board-detail-head-writer"> 
				<dt><span>담당자</span></dt>
				<dd><span>
					<c:choose>
				    	<c:when test="${historyDetail.ntcrNm == null || historyDetail.ntcrNm == ''}">
				    		<c:out value="${historyDetail.frstRegisterNm}" />
				    	</c:when>
				    	<c:otherwise>
				    		<c:out value="${historyDetail.ntcrNm}" />
				    	</c:otherwise>
				    </c:choose>
				</span></dd>
			</dl>
			<dl class="board-detail-head-date">
				<dt><span>등록일</span></dt>
				<dd><span><c:out value="${historyDetail.frstRegisterPnttm}" /></span></dd>
			</dl>
			<dl class="board-detail-head-hit">
				<dt><span>조회수</span></dt>
			 	<dd><span><c:out value="${historyDetail.inqireCo}" /></span></dd>
			</dl>
		</c:otherwise>
	</c:choose>
	<dl class="board-detail-head-file">
		<dt><span>첨부파일</span></dt>
		<dd>
			<span>
				<c:choose>
					<c:when test="${fn:length(fileList) == 0}">
						파일 없음
					</c:when>
					<c:otherwise>
						<c:forEach var="fileList" items="${fileList}" varStatus="status">
							<a href="#" name="file_down" filesn="<c:out value='${fileList.fileSn}'/>">
								<i class="fa fa-floppy-o fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${fileList.orignlFileNm}'/>&nbsp;
							</a>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</span>
		</dd>
	</dl>
</div>

<div class="board-detail-content">
	<c:out value="${historyDetail.nttCn}" escapeXml="false" />
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">
		<a id="btn_restoration" name="btn_restoration" href="#" class="btn btn-primary">복원</a>
		<a id="btn_close" name="btn_close" href="#" class="btn btn-default">닫기</a>
	</div>
</div>


</body>
</html>
