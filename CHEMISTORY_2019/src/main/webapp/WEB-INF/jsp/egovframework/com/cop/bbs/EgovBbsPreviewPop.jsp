<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<title>게시물 미리보기</title>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 파일 다운로드
		$("[name=file_down]").click(function(){
			
			$("#fileSn").val($(this).attr("filesn"));
			
			$("#downForm").attr("action" , "<c:url value='/cop/bbs/fileDown.do' />");
			$("#downForm").attr("target" , "fileDown");
			$("#downForm").submit();
		});
		
		// 게시물 승인
		$("#confirm_bbs").click(function(){
			
			if(!confirm("게시물을 승인하시겠습니까?"))return;
			
			var params = {};
			params["code"] = $("#bbsId").val() + "|" + $("#nttId").val();
			
			fnGetAjaxData("<c:url value='/cop/bbs/bbsConfirm.do'/>", params, fnConfirmCB, false);
			
		});
		
		// 닫기
		$("#btn_close").click(function(){
			self.close();
		});
		
	});
	
	// 승인 후처리
	function fnConfirmCB(data){
		
		if(data.result == "A"){
			
			alert("승인 권한이 없습니다.");
			return;
		}
		
		if(data.result != "Y"){
			
			alert("게시물 승인에 실패하였습니다.");
			return;
		}
		
		alert("승인되었습니다.");
		
		opener.frm.submit();
		
		self.close();
	}
	
</script>

<body style="background:none;">

<form id="downForm" name="listForm" method="post">
	<input type="hidden" id="nttId" name="nttId" value="<c:out value='${boardInfo.nttId}'/>" />
	<input type="hidden" id="bbsId" name="bbsId" value="<c:out value='${boardInfo.bbsId}'/>" />
	<input type="hidden" id="fileSn" name="fileSn" />
</form>

<div style="width: 0px; height: 0px; display: none;">
	<iframe name="fileDown" title="file down"></iframe>
</div>

<div class="board-detail-head">
		
	<c:choose>
		<c:when test="${bbsDetail.bbsAttrbCode == 'BBSA05' || bbsDetail.bbsAttrbCode == 'BBSA02'}">
			<dl class="board-detail-head-title">
				<dt><span>제목</span></dt>
				<dd><span><c:out value="${bbsDetail.nttSj}" /></span></dd>
			</dl>
			<dl class="board-detail-head-writer"> 
				<dt><span>담당자</span></dt>
				<dd><span>
				
				<c:choose>
			    	<c:when test="${bbsDetail.ntcrNm == null || bbsDetail.ntcrNm == ''}">
			    		<c:out value="${bbsDetail.frstRegisterNm}" />
			    	</c:when>
			    	<c:otherwise>
			    		<c:out value="${bbsDetail.ntcrNm}" />
			    	</c:otherwise>
		    	</c:choose>
		    	
				</span></dd>
			</dl>
			<dl class="board-detail-head-date">
				<dt><span>등록일</span></dt>
				<dd><span><c:out value="${bbsDetail.ntceDate}" /></span></dd>
			</dl>
			<dl class="board-detail-head-hit">
				<dt><span>조회수</span></dt>
			 	<dd><span><c:out value="${bbsDetail.inqireCo}" /></span></dd>
			</dl>
		</c:when>
		<c:otherwise>
			<colgroup><col width="15%" /><col width="*" /><col width="15%" /><col width="30%" /></colgroup>
			<dl class="board-detail-head-title">
				<dt><span>제목</span></dt>
				<dd><span><c:out value="${bbsDetail.nttSj}" /></span></dd>
			</dl>
			
			<dl class="board-detail-head-writer"> 
				<dt><span>담당자</span></dt>
				<dd><span>
					<c:choose>
				    	<c:when test="${bbsDetail.ntcrNm == null || bbsDetail.ntcrNm == ''}">
				    		<c:out value="${bbsDetail.frstRegisterNm}" />
				    	</c:when>
				    	<c:otherwise>
				    		<c:out value="${bbsDetail.ntcrNm}" />
				    	</c:otherwise>
				    </c:choose>
				</span></dd>
			</dl>
			<dl class="board-detail-head-date">
				<dt><span>등록일</span></dt>
				<dd><span><c:out value="${bbsDetail.ntceDate}" /></span></dd>
			</dl>
			<dl class="board-detail-head-hit">
				<dt><span>조회수</span></dt>
			 	<dd><span><c:out value="${bbsDetail.inqireCo}" /></span></dd>
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
	<c:out value="${bbsDetail.nttCn}" escapeXml="false" />
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">
		<c:if test="${bbsDetail.confmSttusCode == 'R' && userAuthority == 'ROLE_ADMIN'}">
			<a href="#" id="confirm_bbs" name="confirm_bbs" class="btn btn-primary">승인</a>
		</c:if>
		<a id="btn_close" name="btn_close" href="#" class="btn btn-default">닫기</a>
	</div>
</div>


</body>
</html>
