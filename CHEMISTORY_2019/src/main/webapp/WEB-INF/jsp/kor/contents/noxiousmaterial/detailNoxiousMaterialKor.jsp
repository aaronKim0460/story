<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
</script>
<div id="contents">
	<table class="bbs_default list">
		<colgroup>
			<col style="width:20%" />
	    	<col style="width:80%" />			
		</colgroup>		
		<tbody id="body_list" class="t_center list">			
			<tr>
				<th class="board-write-th">물질명</th>
				<td class="board-write-td">
					한글 : <c:out value="${detail.kName}"/><br/>
					영문 : <c:out value="${detail.eName}"/><br/>
					cas 번호 : <c:out value="${detail.cas}"/><br/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">특성</th>
				<td class="board-write-td">
					<c:out value="${detail.trait}"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">해당매체</th>
				<td class="board-write-td">
					<c:set var="splitMedium" value="${fn:split(detail.medium,',')}"/>
						<c:if test="${!empty splitMedium}">
							<c:forEach var="sppath" items="${splitMedium}" varStatus="j">
								<c:choose>
									<c:when test="${sppath eq 'air'}">
										<c:out value="대기"/>
										<c:if test="${j.count ne fn:length(splitMedium)}"><c:out value=","/>&nbsp;&nbsp;</c:if>										
									</c:when>
									<c:when test="${sppath eq 'inAir'}">
										<c:out value="실내공기"/>																		
										<c:if test="${j.count ne fn:length(splitMedium)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
									</c:when>
									<c:when test="${sppath eq 'water'}">
										<c:out value="먹는물"/>
										<c:if test="${j.count ne fn:length(splitMedium)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
									</c:when>
									<c:when test="${sppath eq 'soil'}">
										<c:out value="토양"/>
										<c:if test="${j.count ne fn:length(splitMedium)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
									</c:when>								
									<c:when test="${sppath eq 'other'}">
										<c:out value="기타"/>
										<c:if test="${j.count ne fn:length(splitMedium)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
									</c:when>								
									<c:when test="${sppath eq 'product'}">
										<c:out value="제품"/>
										<c:if test="${j.count ne fn:length(splitMedium)}"><c:out value=","/>&nbsp;&nbsp;</c:if>
									</c:when>								
									<c:otherwise></c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>					
				</td>
			</tr>
			<!-- 
			<tr>
				<th class="board-write-th">유해정도</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.noxiousLevel eq 'H'}">상</c:when>
						<c:when test="${detail.noxiousLevel eq 'M'}">중</c:when>
						<c:when test="${detail.noxiousLevel eq 'L'}">하</c:when>
					</c:choose>
				</td>
			</tr>
			 -->
			<tr>
				<th class="board-write-th">
					개요
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.outlineCh eq 'Y'}"><c:out value="${detail.outline}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.outline}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					기초정보 
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.basicCh eq 'Y'}"><c:out value="${detail.basic}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.basic}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					독성정보 
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.tInfoCh eq 'Y'}"><c:out value="${detail.tInfo}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.tInfo}"/></c:otherwise>
					</c:choose>					
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					독성안전수준
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.tSafeCh eq 'Y'}"><c:out value="${detail.tSafe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.tSafe}"/></c:otherwise>
					</c:choose>	
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					노출정보
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.overGReCh eq 'Y'}"><c:out value="${detail.overGRe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.overGRe}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					노출정보(매체)
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.overMCh eq 'Y'}"><c:out value="${detail.overM}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.overM}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					노출저감방안(제품)
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.overMReCh eq 'Y'}"><c:out value="${detail.overMRe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.overMRe}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					노출저감방안(매체)
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.outlineReCh eq 'Y'}"><c:out value="${detail.outlineRe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.outlineRe}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					규제정보(제품)
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.controlGCh eq 'Y'}"><c:out value="${detail.controlG}" escapeXml="true"/></c:when>
						<c:otherwise><c:out value="${detail.controlG}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					규제정보(매체)
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.controlGReCh eq 'Y'}"><c:out value="${detail.controlGRe}" escapeXml="ture"/></c:when>
						<c:otherwise><c:out value="${detail.controlGRe}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					참고문헌(제품)
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.planGCh eq 'Y'}"><c:out value="${detail.planG}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.planG}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					참고문헌(매체)
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.planGReCh eq 'Y'}"><c:out value="${detail.planGRe}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.planGRe}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					참고문헌(전체)
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.planMCh eq 'Y'}"><c:out value="${detail.planM}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.planM}"/></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">
					취급시 유의사항
				</th>
				<td class="board-write-td">
					<c:choose>
						<c:when test="${detail.infoAttentionManCh eq 'Y'}"><c:out value="${detail.infoAttentionMan}" escapeXml="false"/></c:when>
						<c:otherwise><c:out value="${detail.infoAttentionMan}"/></c:otherwise>
					</c:choose>	
				</td>
			</tr>			
		</tbody>
	</table>
</div>
<!-- //contents -->
