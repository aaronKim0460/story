<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
<script type="text/javaScript">
$(document).ready(function(){
	
	
});
	
doList = function(){
	document.formNoxiousInfo.action = "<c:url value='/adm/contents/material/NoxiousInfoList.do'/>";
	document.formNoxiousInfo.submit();
};

doUpdate = function(){
	document.formNoxiousInfo.action = "<c:url value='/adm/contents/material/modifyNoxiousInfo.do'/>";
	document.formNoxiousInfo.submit();
};

doDelete = function(){
	if(confirm("정말 삭제 하시겠습니까?")){
		$.ajax({
			type: "POST"
			,url: "<c:url value='/adm/contents/material/deleteNoxiousInfo.do'/>"
			,data:$("#formNoxiousInfo").serialize()
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
</script>

<body>
<form id="formNoxiousInfo" name="formNoxiousInfo" method="post">
<input type="hidden" id="rdIdx" name="rdIdx" value="${detail.rdIdx}"/>
<input type="hidden" name="pageIndex" value="<c:if test="${empty ivo.pageIndex }">1</c:if><c:if test="${!empty ivo.pageIndex }"><c:out value='${ivo.pageIndex}'/></c:if>">

<div id="contents">
	<h2 class="adminH2">유해물질자료</h2>
	<table class="bbs_default view" border="0">
   	<caption>유해인자 DB 등록</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
			<tr>
				<th scope="row">물질명<span class="required" style="color: red;">*</span></th>
				<td>
					<c:out value="${detail.rdKname}"/>
				</td>
			</tr>
			<tr>
				<th scope="row">자료출처<span class="required" style="color: red;">*</span></th>
				<td>
					<c:out value="${detail.rdDataSource}"/>
<%-- 				
					<c:choose>
						<c:when test="${detail.rdDataSource eq 'C'}"><c:out value="국내"/></c:when>
						<c:when test="${detail.rdDataSource eq 'F'}"><c:out value="국외"/></c:when>
						<c:otherwise></c:otherwise>
					</c:choose>	
 --%>									
				</td>
			</tr>
			<tr>
				<th scope="row">자료형태<span class="required" style="color: red;">*</span></th>
				<td>
					<c:out value="${detail.rdDataForm}"/>
<%-- 				
					<c:choose>
						<c:when test="${detail.rdDataForm eq 'T'}"><c:out value="연구논문"/></c:when>
						<c:when test="${detail.rdDataForm eq 'R'}"><c:out value="보고서"/></c:when>
						<c:when test="${detail.rdDataForm eq 'P'}"><c:out value="보도자료"/></c:when>
						<c:when test="${detail.rdDataForm eq 'E'}"><c:out value="기타"/></c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
--%>
				</td>
			</tr>
			<tr>
				<th scope="row">노출원</th>
				<td>
					<c:out value="${detail.rdOver}"/>
<%-- 				
					<c:set var="splitOver" value="${fn:split(detail.rdOver,',')}"/>
					<c:if test="${!empty splitOver}">
						<c:forEach var="spover" items="${splitOver}" varStatus="i">
							<c:choose>
								<c:when test="${spover eq 'A'}">
									<c:out value="대기"/>
									<c:if test="${i.count ne fn:length(splitOver)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${spover eq 'I'}">
									<c:out value="실내공기"/>																		
									<c:if test="${i.count ne fn:length(splitOver)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${spover eq 'W'}">
									<c:out value="먹는물"/>
									<c:if test="${i.count ne fn:length(splitOver)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${spover eq 'S'}">
									<c:out value="토양"/>
									<c:if test="${i.count ne fn:length(splitOver)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${spover eq 'E'}">
									<c:out value="기타"/>
									<c:if test="${i.count ne fn:length(splitOver)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>								
								<c:otherwise></c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
--%>
					
				</td>
			</tr>
			<tr>
				<th scope="row">노출경로</th>
				<td>
					<c:out value="${detail.rdOverPath}"/>
<%-- 				
					<c:set var="splitPath" value="${fn:split(detail.rdOverPath,',')}"/>
					<c:if test="${!empty splitPath}">
						<c:forEach var="sppath" items="${splitPath}" varStatus="j">
							<c:choose>
								<c:when test="${sppath eq 'B'}">
									<c:out value="호흡"/>
									<c:if test="${j.count ne fn:length(splitPath)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${sppath eq 'M'}">
									<c:out value="구강"/>																		
									<c:if test="${j.count ne fn:length(splitPath)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${sppath eq 'S'}">
									<c:out value="피부"/>
									<c:if test="${j.count ne fn:length(splitPath)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${sppath eq 'E'}">
									<c:out value="기타"/>
									<c:if test="${j.count ne fn:length(splitPath)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>								
								<c:otherwise></c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>	
 --%>				
				</td>
			</tr> 
			<tr>
				<th scope="row">대상연령</th>
				<td>
					<c:out value="${detail.rdAge}"/>
<%-- 					
					<c:set var="splitAge" value="${fn:split(detail.rdAge,',')}"/>
					<c:if test="${!empty splitAge}">
						<c:forEach var="spage" items="${splitAge}" varStatus="k">
							<c:choose>
								<c:when test="${spage eq 'F'}">
									<c:out value="태아"/>
									<c:if test="${k.count ne fn:length(splitAge)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${spage eq 'I'}">
									<c:out value="신생아"/>																		
									<c:if test="${k.count ne fn:length(splitAge)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${spage eq 'B'}">
									<c:out value="영아"/>
									<c:if test="${k.count ne fn:length(splitAge)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${spage eq 'C'}">
									<c:out value="유아"/>
									<c:if test="${k.count ne fn:length(splitAge)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>
								<c:when test="${spage eq 'K'}">
									<c:out value="어린이"/>
									<c:if test="${k.count ne fn:length(splitAge)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>								
								<c:when test="${spage eq 'Y'}">
									<c:out value="청소년"/>
									<c:if test="${k.count ne fn:length(splitAge)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
								</c:when>								
								<c:otherwise></c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
 --%>					
				</td>
			</tr> 
			<tr>
				<th scope="row">주요독성</th>
				<td><c:out value="${detail.rdPoison}"/></td>
			</tr>
			<tr>
				<th scope="row">건강영향</th>
				<td>
<pre><c:choose><c:when test="${detail.rdPlanCh eq 'Y'}"><c:out value="${detail.rdPlan}" escapeXml="false"/></c:when><c:otherwise><c:out value="${detail.rdPlan}"/></c:otherwise></c:choose></pre>					
				</td>
			</tr>
			<tr>
				<th scope="row">노출및 저감방안</th>
				<td>
<pre><c:choose><c:when test="${detail.rdInCh eq 'Y'}"><c:out value="${detail.rdInCh}" escapeXml="false"/></c:when><c:otherwise><c:out value="${detail.rdInCh}"/></c:otherwise></c:choose></pre>					
				</td>
			</tr>			
			<tr>
				<th scope="row">기타</th>
				<td>
<pre><c:choose><c:when test="${detail.rdEtcCh eq 'Y'}"><c:out value="${detail.rdEtcCh}" escapeXml="false"/></c:when><c:otherwise><c:out value="${detail.rdEtcCh}"/></c:otherwise></c:choose></pre>					
				</td>
			</tr>
			<tr>
				<th scope="row">출처</th>
				<td>
					<c:choose>
						<c:when test="${detail.rdSourceCh eq 'Y'}"><c:out value="${detail.rdSource}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.rdSource}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">해당년도 </th>
				<td><c:out value="${detail.rdYear}"/></td>
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