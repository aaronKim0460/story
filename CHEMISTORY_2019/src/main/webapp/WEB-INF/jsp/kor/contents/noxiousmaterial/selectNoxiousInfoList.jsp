<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">	
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
doDeatil = function(sn){
	$("#rdIdx").val(sn);
	document.frm.action = "<c:url value='/kor/contents/noxiousmaterial/detailNoxiousKorInfo.do'/>";
	document.frm.submit();
};

doSearch = function(){
	if($('[name=searchCondition4] option:selected').val() == ''){
		alert("검색상세를 선택해 주세요.");
		return false;
	} 
	
	$("#pageIndex").val(1);
	document.frm.action = "<c:url value='/kor/material/chemistry.do'/>";
    document.frm.submit();
};

function linkPage(pageNo){
    $("#pageIndex").val(pageNo);
    document.frm.action = "<c:url value='/kor/material/chemistry.do'/>";
    document.frm.submit();
};
</script>
<form id="detailForm" name="detailForm" method="post">
	<input  type="hidden" id="idx" name="idx" value=""/>
</form>

<div id="contents">
	<div class="tableBtn clearfix">
		<div class="btn_left big">
			총 <span class="point"><c:out
					value='${paginationInfo.totalRecordCount }' /></span>건, 현재페이지 <span
				class="point"><c:out value='${paginationInfo.currentPageNo }' /></span>/
			<c:out value='${paginationInfo.totalPageCount }' />
		</div>
		<form name="frm" id="frm" method="post">		
		<input type="hidden" name="rdIdx" id="rdIdx" value=""/>
			<div class="btn_right">
				<div class="board_search">					
						<input type="hidden" id="pageIndex" name="pageIndex" value="<c:if test="${empty ivo.pageIndex }">1</c:if><c:if test="${!empty ivo.pageIndex }"><c:out value='${ivo.pageIndex}'/></c:if>"> 
						<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
					<fieldset>
						<legend>게시물 검색</legend>
						<span>						
						<select name="searchCondition1" class="select_list">
							<option value="" <c:if test="${ivo.searchCondition1 == '' || ivo.searchCondition1 == null}">selected="selected"</c:if>>자료형태</option>
							<option value="보도자료" <c:if test="${ivo.searchCondition1 == '보도자료'}">selected="selected"</c:if>>보도자료</option>
							<option value="연구논문" <c:if test="${ivo.searchCondition1 == '연구논문'}">selected="selected"</c:if>>연구논문</option>
							<option value="보고서" <c:if test="${ivo.searchCondition1 == '보고서'}">selected="selected"</c:if>>보고서</option>
						</select>
						<select name="searchCnd" class="select_list">
							<option value="" <c:if test="${ivo.searchCnd == '' || ivo.searchCnd == null}">selected="selected"</c:if>>노출원</option>
							<option value="대기" <c:if test="${ivo.searchCnd == '대기'}">selected="selected"</c:if>>대기</option>
							<option value="실내공기" <c:if test="${ivo.searchCnd == '실내공기'}">selected="selected"</c:if>>실내공기</option>
							<option value="먹는물" <c:if test="${ivo.searchCnd == '먹는물'}">selected="selected"</c:if>>먹는물</option>
							<option value="토양" <c:if test="${ivo.searchCnd == '토양'}">selected="selected"</c:if>>토양</option>
							<option value="기타" <c:if test="${ivo.searchCnd == '기타'}">selected="selected"</c:if>>기타</option>
							<option value="제품" <c:if test="${ivo.searchCnd == '제품'}">selected="selected"</c:if>>제품</option>
						</select>
						<select name="searchCondition2" class="select_list">
							<option value="" <c:if test="${ivo.searchCondition2 == '' || ivo.searchCondition2 == null}">selected="selected"</c:if>>노출경로</option>
							<option value="구강" <c:if test="${ivo.searchCondition2 == '구강'}">selected="selected"</c:if>>구강</option>
							<option value="호흡" <c:if test="${ivo.searchCondition2 == '호흡'}">selected="selected"</c:if>>호흡</option>
							<option value="피부" <c:if test="${ivo.searchCondition2 == '피부'}">selected="selected"</c:if>>피부</option>
							<option value="기타" <c:if test="${ivo.searchCondition2 == '기타'}">selected="selected"</c:if>>기타</option>
						</select>
						<select name="searchCondition4" class="select_list">
							<option value="" <c:if test="${ivo.searchCondition4 == '' || ivo.searchCondition4 == null}">selected="selected"</c:if>>검색상세</option>
							<option value="물질명" <c:if test="${ivo.searchCondition4 == '물질명'}">selected="selected"</c:if>>물질명</option>
							<option value="출처" <c:if test="${ivo.searchCondition4 == '출처'}">selected="selected"</c:if>>출처</option>
						</select>
						 <label for="" class="skip">검색단어입력&nbsp;</label>
						<input name=searchKeyword type="text" value='<c:out value="${ivo.searchKeyword}"/>' class="text" title="검색어 입력" onKeyPress="press(event);" />						
						</span> <input type="image"
							src="/assets/kor/images/bbs/board_search_btn.png" alt="검색"
							onClick="doSearch(); return false;" />
						<!-- <a id="button" class="btn gray">전체보기</a> -->
					</fieldset>
				</div>
			</div>
		</form>
	</div>

	<table class="bbs_default list">
		<colgroup>
			<col style="width:10%" />
			<col style="width:20%" />
			<col style="width:*" />
			<col style="width:10%" />
			<col style="width:20%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">물질명</th>
				<th scope="col">출처</th>
				<th scope="col">자료형태</th>								
				<th scope="col">노출원</th>								
				<th scope="col">노출경로</th>
			</tr>
		</thead>
		<tbody id="body_list" class="t_center list">
			<c:forEach var="kvo" items="${list}" varStatus="status">
				<tr>
				<td class="ac"><c:out value="${paginationInfo.totalRecordCount + ivo.pageSize - (ivo.pageSize * ivo.pageIndex + status.count) + 1}"/></td>	
				<td class="ac"><a href="#none" onclick="doDeatil('<c:out value='${kvo.rdIdx}'/>');"><c:out value="${kvo.rdKname}"/></a></td>
				<td class="al">
					<c:choose>
						<c:when test="${kvo.rdSourceCh eq 'Y'}"><c:out value="${fn:substring(kvo.rdSource,0 ,40)}" escapeXml="false"/>...</c:when>
						<c:otherwise><c:out value="${fn:substring(kvo.rdSource,0,25)}"/>...</c:otherwise>
					</c:choose>
					<!--				
					<c:if test="${not empty kvo.rdDataSource}">																
						<c:out value='${fn:substring(kvo.rdDataSource, 0, fn:length(kvo.rdDataSource) -1)}'/>
					</c:if>	
					-->							
				</td>
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
</div>
<!-- //contents -->
