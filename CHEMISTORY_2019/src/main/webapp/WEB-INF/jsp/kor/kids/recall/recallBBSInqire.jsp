<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp" %>
</c:if>

<script type="text/javascript">

//목록화면으로 이동
function fn_move_select_List() {
	$('#frm').attr("action","<c:url value='/user/com/kids/recall/selectRecallBBSList.do'/>");
	$('#frm').submit();
}

$(document).ready(function(){
	$("#productCnArea").html($('#productCn').val().replace(/\n/g, "<br>"));
	$("#recallCnArea").html($('#recallCn').val().replace(/\n/g, "<br>"));
});
</script>

<form name="frm" id="frm" method="post">
<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${recallBBSVO.pageIndex}'/>" />
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
<input type="hidden" name="searchCondition" id="searchCondition" value="<c:out value='${recallBBSVO.searchCondition}'/>" />
<input type="hidden" name="searchKeyword" id="searchKeyword" value="<c:out value='${recallBBSVO.searchKeyword}'/>" />
<input type="hidden" name="domesticYn" id="domesticYn" value="<c:out value='${recallBBSVO.domesticYn}'/>" />
<input type="hidden" name="recallId" id="recallId" value="<c:out value='${result.recallId}'/>" />

<div id="contents">		
	<table class="bbs_default view" summary="유해물질 리콜 상세보기로, 제목, 내용 정보 제공" border="0">
		<caption>유해물질 리콜 내용</caption>
		<colgroup>
			<col width="20%" />
			<col width="*" />
			<col width="30%" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제품명</th>
				<td class="subject">
					<c:out value="${result.productName}" />
				</td>
				<td style="text-align: center;" rowspan="5">
				<c:choose>
					<c:when test="${!empty result.atchFileId}">
						<img style="max-width:255px;max-height: 300px;" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>' onerror="imgError(this);" /></span>
					</c:when>
					<c:otherwise>
						<img src="/assets/kor/images/newMain/noimgs.png" alt="리콜상품정보"/>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">제품군</th>
				<td>
					<c:forEach var="productTypeList" items="${productTypeList}" varStatus="status">
					<c:if test="${productTypeList.code == result.productType }"><c:out value="${productTypeList.codeNm}"/></c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th scope="row">공표일</th>
				<td>${fn:substring(result.publishDt, 0, 4)}-${fn:substring(result.publishDt, 4, 6)}-${fn:substring(result.publishDt, 6, 8)}</td>
			</tr>
			<tr>
				<th scope="row">구분</th>
				<td>
					<c:choose>
						<c:when test="${result.domesticYn eq 'Y'}">
							국내
						</c:when>
						<c:otherwise>
							국외
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<c:if test="${fn:length(result.productWhence) > 0}">
			<tr>
				<th scope="row">출처</th>
				<td>
					<c:out value="${result.productWhence}" /><!-- 출처 노출 여부 -->
				</td>
			</tr>
			</c:if>
			<tr>
				<th scope="row">국가</th>
				<td colspan="2">
					<c:out value="${result.countryName}" />
				</td>
			</tr>
			<tr>
				<th scope="row">유해물질</th>
				<td colspan="2">
					<c:choose>
						<c:when test="${fn:length(result.materialList) > 0}">
							<c:forEach var="row" items="${result.materialList}" varStatus="i"><c:if test="${i.count > 1}">,</c:if><c:out value="${row.materialName}" /></c:forEach>
						</c:when>
						<c:otherwise><c:out value="${result.position}" /></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">제품설명</th>
				<td colspan="2">
					<input type="hidden" id="productCn" value="<c:out value="${result.productCn}" />">
					<span id="productCnArea"></span>
				</td>
			</tr>
			<tr>
				<th scope="row">세부사항</th>
				<td colspan="2">
					<input type="hidden" id="recallCn" value="<c:out value="${result.recallCn}" />">
					<span id="recallCnArea"></span>
				</td>
			</tr>
			<tr>
				<th scope="row">후속 조치 내용</th>
				<td colspan="2">
					<c:out value="${result.afterRecallCn}" />
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="buttonBox ac">
		<a href="javascript:fn_move_select_List('<c:out value='${boardVO.pageIndex }'/>')" class="btn gray">목록</a>
	</div>
	
</div><!-- //contents -->
</form>