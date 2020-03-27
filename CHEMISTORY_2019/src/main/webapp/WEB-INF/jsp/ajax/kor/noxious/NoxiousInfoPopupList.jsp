<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">	
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>

<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
<script type="text/javascript">
doDeatil = function(sn){
	$("#rdIdx").val(sn);
	document.frm.action = "<c:url value='/kor/contents/noxiousmaterial/detailNoxiousKorInfoPopup.do'/>";
	document.frm.submit();
};

function linkPage(pageNo){
    $("#pageIndex").val(pageNo);
    document.frm.action = "<c:url value='/kor/material/chemistryPopup.do'/>";
    document.frm.submit();
};

</script>
<div class="popupInLayout">
	<dl>
		<dt class="cal_unvisible">
			연구자료 
			<div class="popupClose"><a href="javascript:self.close();" ><img src="/assets/kor/images/newMain/bu_close.png" alt="close" /></a></div>
		</dt>
		
			
		<dd class="">
			<form id="detailForm" name="detailForm" method="post">
				<input  type="hidden" id="idx" name="idx" value=""/>
			</form>
			<h3 class="textH1"><c:out value="${kvo.rdKname}"/> <span><c:out value="${kvo.eName}"/></span></h3>
			<div class=" clearfix tableBtn">
				<div class=" btn_left big">
					총 <span class="point"><c:out
							value='${paginationInfo.totalRecordCount }' /></span>건, 현재페이지 <span
						class="point"><c:out value='${paginationInfo.currentPageNo }' /></span>/
					<c:out value='${paginationInfo.totalPageCount }' />
				</div>
				<form name="frm" id="frm" method="post">		
				<input type="hidden" name="rdIdx" id="rdIdx" value=""/>
				<input type="hidden" name="searchIdx" id="searchIdx" value="<c:out value='${ivo.searchIdx}'/>"/>
				<input type="hidden" id="pageIndex" name="pageIndex" value="<c:if test="${empty ivo.pageIndex }">1</c:if><c:if test="${!empty ivo.pageIndex }"><c:out value='${ivo.pageIndex}'/></c:if>">			
				</form>
			</div>
		
			<table class="bbs_default list">
				<colgroup>
					<col style="width:10%" />
					<col style="width:10%" />
					<col style="width:*" />
					<col style="width:10%" />
					<col style="width:25%" />
					<col style="width:10%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">자료출처</th>
						<th scope="col">물질명</th>
						<th scope="col">자료형태</th>								
						<th scope="col">노출원</th>								
						<th scope="col">노출경로</th>
					</tr>
				</thead>
				<tbody id="body_list" class="t_center list">
					<c:forEach var="kvo" items="${list}" varStatus="status">
						<tr>
						<td class="ac">
							<c:out value="${(ivo.pageIndex-1) * ivo.pageSize + status.count}"/>
						</td>	
						<td class="ac">
							<c:if test="${not empty kvo.rdDataSource}">																
								<c:out value='${fn:substring(kvo.rdDataSource, 0, fn:length(kvo.rdDataSource) -1)}'/>																
							</c:if>	
						</td>
						<td><a href="#none" onclick="doDeatil('<c:out value='${kvo.rdIdx}'/>');"><c:out value="${kvo.rdKname}"/> (<c:out value="${kvo.rdSource}"/>)</a></td>
						<td class="ac">
							<c:if test="${not empty kvo.rdDataForm}">																
								<c:out value='${fn:substring(kvo.rdDataForm, 0, fn:length(kvo.rdDataForm) -1)}'/>																
							</c:if>	
						</td>
						<td class="ac">
							<c:if test="${not empty kvo.rdOver}">																
								<c:out value='${fn:substring(kvo.rdOver, 0, fn:length(kvo.rdOver) -1)}'/>																
							</c:if>	
						</td>
						<td class="ac">
							<c:if test="${not empty kvo.rdOverPath}">																
								<c:out value='${fn:substring(kvo.rdOverPath, 0, fn:length(kvo.rdOverPath) -1)}'/>																
							</c:if>			
						</td>
					</tr>
					</c:forEach>
		
					<c:if test="${fn:length(list) == 0}">
						<tr>
							<td colspan="10" class="no_data" align="center">작성된 게시물이 없습니다.</td>
						</tr>
					</c:if>
		
				</tbody>
			</table>
		
			<div class="pagination">
				<ui:pagination paginationInfo="${paginationInfo}" type="image"
					jsFunction="linkPage" />
			</div>
			</dd>
		</dl>
</div>