<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp"%>
<% pageContext.setAttribute("rn", "\n"); %>
<% pageContext.setAttribute("br", "<br/>"); %>
<script src="/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<div class="popupInLayout" id="contents">
	<dl>
		<dt class="cal_unvisible">
			물질 상세정보
			<div class="popupClose"><a href="javascript:self.close();" ><img src="/assets/kor/images/newMain/bu_close.png" alt="close" /></a></div>
		</dt>
		<dd>
			<h3 class="textH1"><c:out value="${detail.kName}"/> <span><c:out value="${detail.eName}"/></span></h3>
			
			<div class="contentTab2">
				<ul class="Tab01">
					<li class="tabLi"><a class="on" href="#" onclick="tabS(1,'.tabLi','.popupTabTBox',this);">어린이 정보</a></li>
					<li class="tabLi"><a href="#" onclick="tabS(2,'.tabLi','.popupTabTBox',this);">상세정보</a></li>
				</ul>
			</div>
			<div class="popupTabTBox" style="display:block">
				<h4><img src="/assets/kor/images/newMain/popTitle02.png" alt="어떤물질인가요?" /></h4>
				<p>
					<c:choose>
						<c:when test="${detail.infoMatterChildCh eq 'y'}"><c:out value="${detail.infoMatterChild}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoMatterChild}"/></c:otherwise>
					</c:choose>
				</p>
				<h4><img src="/assets/kor/images/newMain/popTitle03.png" alt="어떤증상이 있나요?" /></h4>
				<p>
					<c:choose>
						<c:when test="${detail.infoExpoChildCh eq 'y'}"><c:out value="${detail.infoExpoChild}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoExpoChild}"/></c:otherwise>
					</c:choose>
				</p>
				<h4><img src="/assets/kor/images/newMain/popTitle01.png" alt="주의할 점은 무엇인가요?" /></h4>
				<p>
					<c:choose>
						<c:when test="${detail.infoAttentionChildCh eq 'y'}"><c:out value="${detail.infoAttentionChild}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoAttentionChild}"/></c:otherwise>
					</c:choose>
				</p>
			</div>
			<div class="popupTabTBox">
				<table class="bbs_default" summary="화학물질 기본정보를 제공합니다. 물질명(한글), 물질명(영문), CAS번호, 매체 구분, 유해정도, 특성으로 구성되어 있습니다." border="0">
					<caption>화학물질 기본정보</caption>
					<colgroup>
						<col width="20%" />
						<col width="30%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					<tbody>
						<tr>
							<th>물질명(한글)</th>
							<td class="subject"><c:out value="${detail.kName}"/></td>
							<th>물질명(영문)</th>
							<td class="subject"><c:out value="${detail.eName}"/></td>
						</tr>
						<tr>
							<th>CAS번호</th>
							<td colspan="3"><c:out value="${detail.cas}"/></td>
						</tr>
						<tr>
							<th>매체 구분</th>
							<td class="subject">
								<c:set var="splitMedium" value="${fn:split(detail.medium,',')}"/>
								<c:if test="${!empty splitMedium}">
									<c:forEach var="sppath" items="${splitMedium}" varStatus="j">
										<c:choose>
											<c:when test="${fn:length(sppath) > 0}">
												<c:out value="${sppath}"/><c:if test="${j.count ne fn:length(splitMedium)}"><c:out value=","/>&nbsp;&nbsp;</c:if>										
											</c:when>
										</c:choose>
									</c:forEach>
								</c:if>	
							</td>
							<th>유해정도</th>
							<td class="subject">
								<c:choose>
									<c:when test="${detail.noxiousLevel eq 'H'}">상</c:when>
									<c:when test="${detail.noxiousLevel eq 'M'}">중</c:when>
									<c:when test="${detail.noxiousLevel eq 'L'}">하</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>특성</th>
							<td colspan="3"><c:out value="${detail.trait}"/></td>
						</tr>
					</tbody>
				</table>
				<table class="bbs_default" cellpadding="5" summary="화학물질 상세정보를 제공합니다. 개요, 기초정보, 독성정보, 노출정보, 노출저감방안, 규제정보로 구성되어 있습니다." border="0">
					<caption>화학물질 독성정보</caption>
					<colgroup>
						<col width="15%" />
						<col width="" />
					</colgroup>
					<tbody>
						<c:if test="${fn:length(fn:trim(detail.outline)) > 0}">
						<tr>
							<th>개요</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.outlineCh eq 'y' && fn:containsIgnoreCase(detail.outline, '</')}"><c:out value="${fn:replace(detail.outline, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.outline, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.basic)) > 0}">
						<tr>
							<th>기초 정보</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.basicCh eq 'y' && fn:containsIgnoreCase(detail.basic, '</')}"><c:out value="${fn:replace(detail.basic, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.basic, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.tInfo)) > 0}">
						<tr>
							<th>독성 정보</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.tInfoCh eq 'y' && fn:containsIgnoreCase(detail.tInfo, '</')}"><c:out value="${fn:replace(detail.tInfo, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.tInfo, rn, br)}</c:otherwise>
								</c:choose>			
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.tSafe)) > 0}">
						<tr>
							<th>독성<br/>안전수준</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.tSafeCh eq 'y' && fn:containsIgnoreCase(detail.tSafe, '</')}"><c:out value="${fn:replace(detail.tSafe, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.tSafe, rn, br)}</c:otherwise>
								</c:choose>	
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.overGRe)) > 0}">
						<tr>
							<th>노출 정보</th>
							<td class="textStyle">
								<c:choose>	
									<c:when test="${detail.overGReCh eq 'y' && fn:containsIgnoreCase(detail.overGRe, '</')}"><c:out value="${fn:replace(detail.overGRe, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.overGRe, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.overM)) > 0}">
						<tr>
							<th>노출정보<br/>(매체)</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.overMCh eq 'y' && fn:containsIgnoreCase(detail.overM, '</')}"><c:out value="${fn:replace(detail.overM, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.overM, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>	
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.overMRe)) > 0}">
						<tr>
							<th>노출저감<br/>방안<br/>(제품)</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.overMReCh eq 'y' && fn:containsIgnoreCase(detail.overMRe, '</')}"><c:out value="${fn:replace(detail.overMRe, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.overMRe, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.outlineRe)) > 0}">
						<tr>
							<th>노출저감<br/>방안<br/>(매체)</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.outlineReCh eq 'y' && fn:containsIgnoreCase(detail.outlineRe, '</')}"><c:out value="${fn:replace(detail.outlineRe, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.outlineRe, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.controlG)) > 0}">
						<tr>
							<th>규제정보<br/>(제품)</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.controlGCh eq 'y' && fn:containsIgnoreCase(detail.controlG, '</')}"><c:out value="${fn:replace(detail.controlG, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.controlG, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.controlGRe)) > 0}">
						<tr>
							<th>규제정보<br/>(매체)</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.controlGReCh eq 'y' && fn:containsIgnoreCase(detail.controlGRe, '</')}"><c:out value="${fn:replace(detail.controlGRe, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.controlGRe, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.planG)) > 0}">
						<tr>
							<th>참고문헌<br/>(제품)</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.planGCh eq 'y' && fn:containsIgnoreCase(detail.planG, '</')}"><c:out value="${fn:replace(detail.planG, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.planG, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.planGRe)) > 0}">
						<tr>
							<th>참고문헌<br/>(매체)</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.planGReCh eq 'y' && fn:containsIgnoreCase(detail.planGRe, '</')}"><c:out value="${fn:replace(detail.planGRe, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.planGRe, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.planM)) > 0}">
						<tr>
							<th>참고문헌<br/>(전체)</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.planMCh eq 'y' && fn:containsIgnoreCase(detail.planM, '</')}"><c:out value="${fn:replace(detail.planM, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.planM, rn, br)}</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:if>
						<c:if test="${fn:length(fn:trim(detail.infoAttentionMan)) > 0}">
						<tr>
							<th>취급시 <br/>유의사항</th>
							<td class="textStyle">
								<c:choose>
									<c:when test="${detail.infoAttentionManCh eq 'y' && fn:containsIgnoreCase(detail.infoAttentionMan, '</')}"><c:out value="${fn:replace(detail.infoAttentionMan, rn, '')}" escapeXml="false"/></c:when>
									<c:otherwise>${fn:replace(detail.infoAttentionMan, rn, br)}</c:otherwise>
								</c:choose>	
							</td>
						</tr>				
						</c:if>	
					</tbody>
				</table>
			</div>
		</dd>
	</dl>
	<div class="buttonBox ac">
		<a href="javascript:window.print();" class="btn gray">인쇄</a>
		<!-- <a href="javascript:contentsPrint('물질 상세정보')" class="btn gray"> 인쇄</a> -->
		<a href="javascript:self.close();" class="btn gray">닫기</a>
	</div>
</div>
<script type="text/javascript">
	var pageW;
	$(window).resize(function(){
		pageW = $(window).height();
		$(".popupTabTBox").css("height",pageW-250);
	});
</script>
<!-- //contents -->
