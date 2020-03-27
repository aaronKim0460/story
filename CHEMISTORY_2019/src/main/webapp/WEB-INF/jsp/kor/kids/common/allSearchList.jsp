<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<link rel="stylesheet" type="text/css" href="/assets/kor/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/assets/kor/css/board.css" />
<script type="text/javascript">
	$(document).ready(function() {	
	
	});
	// 상세화면으로 이동
	function fn_move_inqire(recallId) {
		$('#recallId').val(recallId);
		$('#frm').attr("action","/user/com/kids/recall/recallBBSInqire.do");
		$('#frm').submit();
	}
	
	// 검색화면으로 이동 
	function goTotalSearch() {
		if($('#ttlSearchWrd').val() == ''){
			alert('검색어를 입력해주세요.');
			$('#ttlSearchWrd').focus();
			return false;
		}else{
			$('#frm input[name="searchKeyword"]').val($('#ttlSearchWrd').val());
			return true;
		}
	}
</script>

<div id="contents">
	<!-- Contents Start -->
	<div class="contents">

		<!-- //sub_head -->
		<div class="conCBox">
			<div id="contents" class="con2">
				<div class="allSearch">
					<div class="formWrap">
						<form name="frm" id="frm" action="/kor/guide/search.do" onsubmit="return goTotalSearch();" method="post">
							<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" /> 
							<input type="text" id="ttlSearchWrd" name="searchWrd" placeholder="검색어를 입력하세요." />
							<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />
							<button type="submit">통합검색</button>
						</form>
						<p class="search_result">
							<c:choose>
								<c:when test="${fn:length(searchVO.searchWrd) > 0}">
								<c:set var="totalListCount" value="0" />
								<c:if test="${!empty totalSearchList}">
									<c:forEach var="row" items="${totalSearchList}" varStatus="i">
										<c:choose>
											<c:when test="${row.bbsId eq 'BBSMSTR_000000000012'}">
												<c:set var="totalListCount" value="${fn:length(row.totalResultList)}" />
											</c:when>
											<c:otherwise>
												<c:set var="totalListCount" value="${totalListCount + row.totalCount}" />
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
									<strong>"</strong><em><c:out value='${searchVO.searchWrd}'/></em>에 대한 검색결과는 총 <em><c:out value="${totalListCount}" /> 건</em> 입니다.<strong>"</strong>
								</c:when>
								<c:otherwise>
											검색어를 입력해 주세요.						
								</c:otherwise>
							</c:choose>
						</p>
					</div>
				</div>
				<c:choose>
					<c:when test="${!empty totalSearchList and fn:length(totalSearchList) > 0}">
						<c:forEach var="row" items="${totalSearchList}" varStatus="i">
						<!-- 홈페이지 이용안내와 공지사항의 내용이 겹쳐 한쪽을 제거함 -->
						<c:if test="${!(row.bbsId eq 'BBSMSTR_000000000012' && row.menuNm eq '홈페이지 이용안내')}">
							<div class="textH1">
								<c:out value="${row.menuNm}" /> (검색결과 <c:out value="${fn:length(row.totalResultList)}" />건)
							</div>
							<c:choose>
								<c:when test="${row.bbsId eq '11007' or row.bbsId eq '11008'}">
									<div class="foreignRecall">
										<ul>
											<c:forEach var="subRow" items="${row.totalResultList}" varStatus="j">
											<li class="clearfix">
												<div class="recallImg">
													<p>
														<c:choose>
															<c:when test="${!empty subRow.atchFileId}">
																<c:if test="${fn:substring(subRow.frstRegistPnttm, 0, 4) >= '2016'}">
																	<img style="max-width: 1000px;max-height: 490px;" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${subRow.atchFileId}"/>'/>
																</c:if>
																<c:if test="${fn:substring(subRow.frstRegistPnttm, 0, 4) < '2016'}">
																	<img src="/assets/kor/images/newMain/noimgs.png" alt="리콜상품정보"/>
																</c:if>
															</c:when>
															<c:otherwise>
																<img src="/assets/kor/images/newMain/noimgs.png" alt="리콜상품정보"/>
															</c:otherwise>
														</c:choose>
													</p>
												</div>
												<div class="recallText">
													<div class="clearfix recallHeader">
														<c:if test="${fn:length(subRow.productType) > 0}"><p class="btn_s_blue"><c:out value="${subRow.productType}" /></p></c:if>
														<p class="btn_s_orange"><span style="color:#fffbc6;"><c:out value="${subRow.afterRecallCn}" /></span></p><br/>
													<h3><a href="/user/com/kids/recall/recallBBSInqire.do?recallId=${subRow.bbsId}&menuNo=${row.menuId}"><nobr><c:out value="${subRow.nttSj}" /></nobr></a></h3>
													<p class="date">${subRow.frstRegistPnttm}</p></div>
													<div class="recall_contents">				
														<h4><a href="/user/com/kids/recall/recallBBSInqire.do?recallId=${subRow.bbsId}&menuNo=${row.menuId}">
															<c:choose>
																<c:when test="${fn:length(subRow.materialName) > 0}"><c:out value="${subRow.materialName}" /></c:when>
																<c:otherwise><c:out value="${subRow.position}" /></c:otherwise>
															</c:choose>
														</a></h4>
														<p class="goods_explain"><nobr><a href="/user/com/kids/recall/recallBBSInqire.do?recallId=${subRow.bbsId}&menuNo=${row.menuId}"><c:out value="${subRow.recallCn}" /></a></nobr></p>
													</div>
												</div>
											</li>
											</c:forEach>
										</ul>
									</div>
								</c:when>
								<c:otherwise>
									<table class="bbs_default list">
										<colgroup>
											<col style="width: 6.5%" />
											<col style="" />
											<col style="width: 10%" />
											<col style="width: 6.5%" />
											<col style="width: 6.5%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">제목</th>
												<th scope="col">등록일</th>
												<th scope="col">파일</th>
												<th scope="col">조회</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="subRow" items="${row.totalResultList}" varStatus="j">
												<tr>
													<td class="ac"><c:out value="${j.count}" /></td>
													<td>
														<a href="/user/cop/bbs/selectBoardArticle.do?nttId=<c:out value="${subRow.nttId}" />&bbsId=<c:out value="${subRow.bbsId}" />&menuNo=<c:out value="${row.menuId}" />"><c:out value="${subRow.nttSj}" /></a>
													</td>
													<td class="ac"><c:out value="${subRow.frstRegistPnttm}" /></td>
													<td class="ac">
														<c:choose>
															<c:when test="${empty subRow.atchFileId}">
															-
															</c:when>
															<c:otherwise>
															O
															</c:otherwise>
														</c:choose>
													</td>
													<td class="ac"><c:out value="${subRow.rdcnt}" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:otherwise>
							</c:choose>
						</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<table class="bbs_default list">
							<colgroup>
								<col style="width: 6.5%" />
								<col style="" />
								<col style="width: 10%" />
								<col style="width: 6.5%" />
								<col style="width: 6.5%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
									<th scope="col">파일</th>
									<th scope="col">조회</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="ac" colspan="5">검색된 결과가 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- Contents End -->
	</div>
</div>
<!-- //contents -->
