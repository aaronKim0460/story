<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>

<script type="text/javascript">

function fn_egov_select_noticeList() {
	$('#frm').attr("action","<c:url value='/user/cop/bbs/selectBoardList.do'/>");
	$('#frm').submit();
}

</script>
<form name="frm" id="frm" action ="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="post">
<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
<input type="hidden" name="bbsId" id="bbsId" value="<c:out value='${result.bbsId}'/>" />
<input type="hidden" name="nttId" id="nttId" value="<c:out value='${result.nttId}'/>" />
<input type="hidden" name="parnts" id="parnts" value="<c:out value='${result.parnts}'/>" />
<input type="hidden" name="sortOrdr" id="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" />
<input type="hidden" name="replyLc" id="replyLc" value="<c:out value='${result.replyLc}'/>" />
<input type="hidden" name="nttSj" id="nttSj" value="<c:out value='${result.nttSj}'/>" />

<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />

<input type="hidden" name="searchCnd" id="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>" />
<input type="hidden" name="searchWrd" id="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" />

<input type="hidden" name="searchCl1DetailCode" id="searchCl1DetailCode" value="<c:out value='${searchVO.searchCl1DetailCode}'/>" />

<div id="contents">		
	
	<div class="hotIssueSub">
		<div class="issueSubImg">
			<c:choose>
				<c:when test="${!empty result.thumbFileId}">
					<img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${result.thumbFileId}'/>" alt="핫이슈" />
				</c:when>
				<c:otherwise>
					<img src="<c:url value='/images/bbs/noimgs.png' />" alt="핫이슈"/>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="issueSubContents">
			<h3><c:out value="${result.nttSj}" /></h3>
			<p><c:out value="${result.nttCn}" escapeXml="false" /></p>
			<p class="date"><c:out value="${result.frstRegisterPnttm}" /></p>
		</div>
	</div>
	<c:choose>
		<c:when test="${!empty totalSearchList and fn:length(totalSearchList) > 0}">
			<c:forEach var="row" items="${totalSearchList}" varStatus="i">
			<!-- 홈페이지 이용안내와 공지사항의 내용이 겹쳐 한쪽을 제거함 -->
			<c:if test="${!(row.bbsId eq 'BBSMSTR_000000000012' && row.menuNm eq '홈페이지 이용안내')}">
				<div class="textH1">
					<c:choose>
						<c:when test="${row.menuNm eq '11007'}">국내위해어린이용품리콜현황</c:when>
						<c:when test="${row.menuNm eq '11008'}">국외위해어린이용품리콜현황</c:when>
						<c:otherwise><c:out value="${row.menuNm}" /></c:otherwise>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${row.menuNm eq '11007' or row.menuNm eq '11008'}">
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
	
	<div class="buttonBox ac">
		<a href="javascript:fn_egov_select_noticeList()" class="btn gray">목록</a>
	</div>
	
</div><!-- //contents -->
</form>