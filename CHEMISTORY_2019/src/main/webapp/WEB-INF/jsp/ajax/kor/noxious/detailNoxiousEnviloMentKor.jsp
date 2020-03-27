<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
doDetail = function(idx){
	$("#idx").val(idx);
	
	var newPop = document.detailAdForm;
	var url = "<c:url value='/kor/contents/noxiousmaterial/detailNoxiousMaterialKor.do'/>";
	 
	var status = "width=712, height=384, top=30,left=60"; 
	window.open("","detailAdForm",status);
	
	newPop.action =url; 
	newPop.method="post";
	newPop.target="detailAdForm";
	newPop.submit();	
	
};
</script>
<form id="detailAdForm" name="detailAdForm" method="post">
	<input  type="hidden" id="idx" name="idx" value=""/>
</form>

<div id="contents">
	<table class="bbs_default list">
		<colgroup>
			<col style="width:33%" />
	    	<col style="width:33%" />
	    	<col style="width:34%" />
		</colgroup>
		<tbody id="body_list" class="t_center list">			
			<tr>				
				<td class="board-write-td">
					어떤 물질인가요?<br/>
					<c:choose>
						<c:when test="${detail.infoMatterChildCh eq 'Y'}"><c:out value="${detail.infoMatterChild}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoMatterChild}"/></c:otherwise>
					</c:choose>					
				</td>
				<td class="board-write-td">
					어떤 증상이 있나요?<br/>
					<c:choose>
						<c:when test="${detail.infoExpoChildCh eq 'Y'}"><c:out value="${detail.infoExpoChild}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoExpoChild}"/></c:otherwise>
					</c:choose>					
				</td>
				<td class="board-write-td">
					주의할점은 무엇인가요?<br/>
					<c:choose>
						<c:when test="${detail.infoAttentionChildCh eq 'Y'}"><c:out value="${detail.infoAttentionChild}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoAttentionChild}"/></c:otherwise>
					</c:choose>					
				</td>
			</tr>						
		</tbody>
	</table>
	
	<div class="t_center mt20">		
		<a style="float: left;" href="javascript:doDetail('${detail.idx}');" class="btn seablue">어른들 정보 보기</a>
		
		<a style="float: right;"  class="btn seablue">웹툰</a>
		<a style="float: right;"  class="btn seablue">영상</a>
		<a style="float: right;"  class="btn seablue">스토리</a>				
	</div>
</div>
<!-- //contents -->
