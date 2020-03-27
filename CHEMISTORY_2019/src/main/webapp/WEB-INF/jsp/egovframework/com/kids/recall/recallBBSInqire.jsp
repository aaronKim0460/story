<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>

<script type="text/javascript">

//목록화면으로 이동
function fn_move_select_List() {
	location.href = '/com/kids/recall/selectRecallBBSList.do?domesticYn=' + $('[name=domesticYn]').val() + '&menuNo=9010700';
// 	$('#frm').attr("action","<c:url value='/com/kids/recall/selectRecallBBSList.do'/>");
// 	$('#frm').submit();
}

// 삭제하기
function fn_do_delete() {

	if (confirm('<spring:message code="common.delete.msg" />')) {
		$('#frm').attr("method","post");
		$('#frm').attr("action","<c:url value='/com/kids/recall/recallBBSDelete.do'/>");
		$('#frm').submit();
	}
}

// 수정화면으로 이동
function fn_move_detail() {
	$('#frm').attr("method","post");
	$('#frm').attr("action","<c:url value='/com/kids/recall/recallBBSDetail.do'/>");
	$('#frm').submit();
}

$(document).ready(function(){
	$("#productCnArea").html($('#productCn').val().replace(/\n/g, "<br>"))
	$("#recallCnArea").html($('#recallCn').val().replace(/\n/g, "<br>"))
});
</script>

<form name="frm" id="frm" method="post">
<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${recallBBSVO.pageIndex}'/>" />
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
<input type="hidden" name="searchCondition" id="searchCondition" value="<c:out value='${recallBBSVO.searchCondition}'/>" />
<input type="hidden" name="searchKeyword" id="searchKeyword" value="<c:out value='${recallBBSVO.searchKeyword}'/>" />
<input type="hidden" name="recallId" id="recallId" value="<c:out value='${result.recallId}'/>" />
<input type="hidden" name="domesticYn" value="${result.domesticYn}" />

<div id="contents">
	<h2 class="adminH2"><c:if test="${param.domesticYn eq 'Y' || result.domesticYn eq 'Y'}">국내어린이용품 환경유해인자 기준초과제품</c:if><c:if test="${param.domesticYn eq 'N' ||result.domesticYn eq 'N'}">국외위해어린이용품 리콜현황</c:if></h2>	
	<table class="bbs_default view" summary="유해물질 리콜 상세보기로, 제목, 내용 정보 제공" border="0">
		<caption>유해물질 리콜 내용</caption>
		<colgroup>
			<col width="20%" />
				<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제품명</th>
				<td class="subject">
					<c:out value="${result.productName}" />
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
				<th scope="row"><label for="">공표일</label></th>
				<td>${fn:substring(result.publishDt, 0, 4)}-${fn:substring(result.publishDt, 4, 6)}-${fn:substring(result.publishDt, 6, 8)}</td>
			</tr>
			<!-- <tr>
				<th scope="row">구분</th>
				<td>
					<c:choose>
						<c:when test="${result.domesticYn eq 'Y'}">국내</c:when>
						<c:otherwise>국외</c:otherwise>
					</c:choose>
				</td>
			</tr> -->
			<c:if test="${result.domesticYn eq 'Y'}">
			<tr id="spot">
				<th scope="row"><label for="">분류</label></th>
				<td><c:if test="${fn:length(result.productTabCd) > 0}">${result.productTabCd eq '1100701' ? '리콜명령' : '환경유해인자 기준초과'}</c:if></td>
			</tr>
			</c:if>
			<c:if test="${!empty result.keywordTag}">
				<tr>
					<th scope="row">키워드</th>
					<td>
						<c:out value="${result.keywordTag}" />
					</td>
				</tr>
			</c:if>
			<tr>
				<th scope="row">출처</th>
				<td>
					<c:out value="${result.productWhence}" />
				</td>
			</tr>
			<tr>
				<th scope="row">국가</th>
				<td>
					<c:out value="${result.countryName}" />
				</td>
			</tr>
			<tr>
				<th scope="row">유해물질</th>
				<td>

					<c:choose>
						<c:when test="${fn:length(result.materialName) > 0}">
							<c:forEach var="row" items="${result.materialList}" varStatus="i">
								<c:out value="${row.materialName}" /><br>
							</c:forEach>
						</c:when>
						<c:otherwise><c:out value="${result.position}" /></c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">제품설명</th>
				<td>
					<input type="hidden" id="productCn" value="<c:out value="${result.productCn}" />">
					<span id="productCnArea"></span>
				</td>
			</tr>
			<tr>
				<th scope="row">세부사항</th>
				<td>
					<input type="hidden" id="recallCn" value="<c:out value="${result.recallCn}" />">
					<span id="recallCnArea"></span>
				</td>
			</tr>
			<tr>
				<th scope="row">후속 조치 내용</th>
				<td>
					<c:out value="${result.afterRecallCn}" />
				</td>
			</tr>
			<tr>
				<th class="board-detail-file-th">썸네일</th>
					<c:choose>
						<c:when test="${!empty result.atchFileId}">
							<td style="text-align: center;">
								<img style="max-width: 1000px;max-height: 490px;" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>'/></span>
							</td>
						</c:when>
						<c:otherwise>
							<td>
							없음
							</td>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="t_center mt20">
		<a href="javascript:fn_move_select_List('<c:out value='${recallBBSVO.pageIndex }'/>')" class="btn gray">목록</a>
		<a href="javascript:fn_move_detail()" class="btn seablue">수정</a>
		<a href="javascript:fn_do_delete()" class="btn orange">삭제</a>
	</div>
	
</div><!-- //contents -->
</form>