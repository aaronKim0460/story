<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
<script type="text/javaScript">
$(document).ready(function(){
});
	

doList = function(){
	document.formInfo.action = "<c:url value='/kor/material/chemistryPopup.do'/>";
	document.formInfo.submit();
};
</script>

<div class="popupInLayout">
	<dl>
		<dt class="cal_unvisible">
			연구자료 
			<div class="popupClose"><a href="javascript:self.close();" ><img src="/assets/kor/images/newMain/bu_close.png" alt="close" /></a></div>
		</dt>
		
			
		<dd class="">	
			
			
			<form id="formInfo" name="formInfo" method="post">
			<input type="hidden" name="searchIdx" id="searchIdx" value="<c:out value='${ivo.searchIdx}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:if test="${empty ivo.pageIndex }">1</c:if><c:if test="${!empty ivo.pageIndex }"><c:out value='${ivo.pageIndex}'/></c:if>">
					
			<div id="contents">
				<div style="height:630px; overflow:auto;">
					<table class="bbs_default view">
				   	<caption>어린이 활동공간 현황/시설 상세</caption>
					<colgroup>
					    <col style="width:20%" />
					    <col style="width:80%" />
					</colgroup>
						<tbody>
							<tr>
								<th scope="row">물질명</th>
								<td>
									<c:out value="${detail.rdKname}"/>
								</td>
							</tr>
							<!-- 
							<tr>
								<th scope="row">자료출처</th>
								<td>
									<c:choose>
										<c:when test="${detail.rdDataSource eq 'C'}"><c:out value="국내"/></c:when>
										<c:when test="${detail.rdDataSource eq 'F'}"><c:out value="국외"/></c:when>
										<c:otherwise></c:otherwise>
									</c:choose>					
								</td>
							</tr>
							<tr>
								<th scope="row">자료형태</th>
								<td>
									<c:choose>
										<c:when test="${detail.rdDataForm eq 'T'}"><c:out value="연구논문"/></c:when>
										<c:when test="${detail.rdDataForm eq 'R'}"><c:out value="보고서"/></c:when>
										<c:when test="${detail.rdDataForm eq 'P'}"><c:out value="보도자료"/></c:when>
										<c:when test="${detail.rdDataForm eq 'E'}"><c:out value="기타"/></c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">노출원</th>
								<td>
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
								</td>
							</tr>
							<tr>
								<th scope="row">노출경로</th>
								<td>
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
								</td>
							</tr> 
							<tr>
								<th scope="row">대상연령</th>
								<td>
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
								</td>
							</tr> 
							 -->
							<tr>
								<th scope="row">주요독성</th>
								<td><c:out value="${detail.rdPoison}"/></td>
							</tr>
							<tr>
								<th scope="row">건강영향</th>
								<td>
									<c:choose>
										<c:when test="${detail.rdPlanCh eq 'Y'}"><c:out value="${detail.rdPlan}" escapeXml="false"/></c:when>
										<c:otherwise><c:out value="${detail.rdPlan}"/></c:otherwise>
									</c:choose>					
								</td>
							</tr>
							<tr>
								<th scope="row">노출 및 저감방안</th>
								<td>
									<c:choose>
										<c:when test="${detail.rdInCh eq 'Y'}"><c:out value="${detail.rdIn}" escapeXml="false"/></c:when>
										<c:otherwise><c:out value="${detail.rdIn}"/></c:otherwise>
									</c:choose>
								</td>
							</tr>			
							<tr>
								<th scope="row">기타</th>
								<td>
									<c:choose>
										<c:when test="${detail.rdEtcCh eq 'Y'}"><c:out value="${detail.rdEtc}" escapeXml="false"/></c:when>
										<c:otherwise><c:out value="${detail.rdEtc}"/></c:otherwise>
									</c:choose>
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
				</div>
				<div class="t_center mt20 ac">
					<a href="javascript:doList();" class="btn gray">목록</a>
				</div>
			</div>
			
			
			
			</form>
		</dd>
	</dl>
</div>

