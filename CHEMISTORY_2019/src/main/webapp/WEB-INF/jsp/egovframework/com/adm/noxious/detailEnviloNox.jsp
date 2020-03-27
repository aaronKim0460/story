<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
<script type="text/javaScript">
$(document).ready(function(){
	
	
});
	

doList = function(){
	document.formNoxious.action = "<c:url value='/adm/contents/noxious/EnvilomentNoxiousList.do'/>";
	document.formNoxious.submit();
};

doDelete = function(idx){
	if(confirm("정말 삭제 하시겠습니까?")){
		$.ajax({
			type: "POST"
			,url: "<c:url value='/adm/contents/noxious/deleteAdmEnvilomentNoxious.do'/>"
			,data:$("#formNoxious").serialize()
			,success: function(result){
				if("success" == result){
	         		alert("삭제가 성공적으로 완료 되었습니다.");
	         		doList()
	         	}else if("success" == result){
	         		alert("삭제에 문제가 있습니다. 관리자에게 문의해 주세요");
	         	}
	      	}
		});
    }
};

doUpdate = function(){
	document.formNoxious.action = "<c:url value='/adm/contents/noxious/modifyEnvilomentNoxious.do'/>";
	document.formNoxious.submit();
};



</script>

<body>

<form id="formNoxious" name="formNoxious" method="post">
<input name="idx" id="idx" type="hidden" value="<c:out value="${detail.idx}"/>"/>
<input type="hidden" name="pageIndex" value="<c:if test="${empty srchVo.pageIndex }">1</c:if><c:if test="${!empty srchVo.pageIndex }"><c:out value='${srchVo.pageIndex}'/></c:if>">
<div id="contents">
	<h2 class="adminH2">환경 유해인자 DB</h2>
	<table class="bbs_default view" border="0">
   	<caption>공모전 등록</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
			<tr>
				<th scope="row">물질명</th>
				<td>
					한글 : <c:out value="${detail.kName}"/><br/>
					영문 : <c:out value="${detail.eName}"/><br/>
					cas 번호 : <c:out value="${detail.cas}"/><br/>
				</td>
			</tr>			
			<tr>
				<th scope="row">특성</th>
				<td>
					<c:out value="${detail.trait}"/>
				</td>
			</tr>
			<tr>
				<th scope="row">해당매체</th>
				<td>
					<c:out value="${detail.medium}"/>
				</td>
			</tr>
			<tr>
				<th scope="row">유해정도</th>
				<td>
					<c:choose>
						<c:when test="${detail.noxiousLevel eq 'H'}">상</c:when>
						<c:when test="${detail.noxiousLevel eq 'M'}">중</c:when>
						<c:when test="${detail.noxiousLevel eq 'L'}">하</c:when>
					</c:choose>
				</td>
			</tr> 
			<tr>
				<th scope="row">
					개요
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.outlineCh eq 'Y'}"><c:out value="${detail.outline}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.outline}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					기초정보 
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.basicCh eq 'Y'}"><c:out value="${detail.basic}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.basic}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					독성정보 
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.tInfoCh eq 'Y'}"><c:out value="${detail.tInfo}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.tInfo}"/></c:otherwise>
					</c:choose>					
				</td>
			</tr>
			<tr>
				<th scope="row">
					독성안전수준
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.tSafeCh eq 'Y'}"><c:out value="${detail.tSafe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.tSafe}"/></c:otherwise>
					</c:choose>	
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출원인 
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.overGCh eq 'Y'}"><c:out value="${detail.overG}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.overG}"/></c:otherwise>
					</c:choose>	
				</td>
			</tr>
			<tr>
				<th scope="row">
					취급시 유의사항
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.infoAttentionManCh eq 'Y'}"><c:out value="${detail.infoAttentionMan}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoAttentionMan}"/></c:otherwise>
					</c:choose>	
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출정보
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.overGReCh eq 'Y'}"><c:out value="${detail.overGRe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.overGRe}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출정보(매체)
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.overMCh eq 'Y'}"><c:out value="${detail.overM}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.overM}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출저감방안(제품)
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.overMReCh eq 'Y'}"><c:out value="${detail.overMRe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.overMRe}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					노출저감방안(매체)
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.outlineReCh eq 'Y'}"><c:out value="${detail.outlineRe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.outlineRe}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					규제정보(제품)
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.controlGCh eq 'Y'}"><c:out value="${detail.controlG}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.controlG}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					규제정보(매체)
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.controlGReCh eq 'Y'}"><c:out value="${detail.controlGRe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.controlGRe}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					참고문헌(제품)
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.planGCh eq 'Y'}"><c:out value="${detail.planG}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.planG}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					참고문헌(매체)
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.planGReCh eq 'Y'}"><c:out value="${detail.planGRe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.planGRe}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					참고문헌(전체)
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.planMCh eq 'Y'}"><c:out value="${detail.planM}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.planM}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					어떤 물질인가요?<br/>
					(어린이) 
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.infoMatterChildCh eq 'Y'}"><c:out value="${detail.infoMatterChild}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoMatterChild}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					어떤 증상이 있나요?<br/>
					(어린이)
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.infoExpoChildCh eq 'Y'}"><c:out value="${detail.infoExpoChild}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoExpoChild}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">
					주의할점은 무엇인가요?<br/>
					(어린이)
				</th>
				<td>
					<c:choose>
						<c:when test="${detail.infoAttentionChildCh eq 'Y'}"><c:out value="${detail.infoAttentionChild}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoAttentionChild}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="t_center mt20">		
		<a href="#none" onclick="doList();" class="btn gray">목록</a>
		<a href="#none" onclick="doUpdate();" class="btn seablue">수정</a>
		<a href="#none" onclick="doDelete();" class="btn orange">삭제</a>		
	</div>
	

</div>
</form>

</body>
</html>