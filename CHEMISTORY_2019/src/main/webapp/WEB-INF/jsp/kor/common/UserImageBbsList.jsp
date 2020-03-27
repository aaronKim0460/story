<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp" %>
</c:if>
<script type="text/javascript">
	// enter로 검색하기
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_noticeList('1');
		}
	}

	// 등록화면으로 이동
	function fn_egov_addNotice() {
		$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>");
		$('#frm').submit();
	}

	// 검색하기
	function fn_egov_select_noticeList(pageNo) {
		$('#pageIndex').val(pageNo);
		$('#frm').attr("action","<c:url value='/user/cop/bbs/selectBoardList.do'/>");
		$('#frm').submit();
	}
	
	// 상세화면으로 이동
	function fn_egov_inqire_notice(nttId, bbsId) {
		$('#nttId').val(nttId);
		$('#bbsId').val(bbsId);
		$('#frm').attr("action","<c:url value='/user/cop/bbs/selectBoardArticle.do'/>");
		$('#frm').submit();
	}

</script>
<div id="contents">
	<div class="tableBtn clearfix margin_t_25">
		<div class="btn_left">
			총 <span class="point"><c:out value='${paginationInfo.totalRecordCount }'/></span>건, 현재페이지 <span class="point"><c:out value='${paginationInfo.currentPageNo }'/></span>/<c:out value='${paginationInfo.totalPageCount }'/>
		</div>
		<form name="frm" id="frm" action ="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="post">
		<input type="hidden" name="bbsId" id="bbsId"  value="<c:out value='${boardVO.bbsId}'/>" />
		<input type="hidden" name="nttId" id="nttId"  value="0" />
		<input type="hidden" name="bbsTyCode" id="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
		<input type="hidden" name="bbsAttrbCode" id="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
		<input type="hidden" name="authFlag" id="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
		<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
		
		<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />	
							
		<div class="btn_right">
			<div class="board_search">
				<fieldset>
					<legend>목록검색</legend>
					<!-- 선택옵션1 S -->
					<c:if test="${brdMstrVO.cl1Code != null and brdMstrVO.cl1Code != ''}">
						<span>
							<select id="searchCl1DetailCode" name="searchCl1DetailCode" class="select_list">
								<option value=''>선택</option>
								<c:forEach var="cl1result" items="${codeList}" varStatus="status">
								<option value="<c:out value='${cl1result.code }'/>" <c:if test="${cl1result.code == searchVO.searchCl1DetailCode }">selected</c:if>><c:out value="${cl1result.codeNm}"/> </option>
								</c:forEach>
							</select>
						</span>
					</c:if>
					<!-- 선택옵션1 N -->
					<!-- 선택옵션2 S -->
					<c:if test="${brdMstrVO.cl2Code != null && brdMstrVO.cl2Code != ''}">
						<span>
							<select id="searchCl2DetailCode" name="searchCl2DetailCode" class="select_list">
								<option value=''>선택</option>
								<c:forEach var="cl2result" items="${codeList2}" varStatus="status">
								<option value="<c:out value='${cl2result.code }'/>" <c:if test="${cl2result.code == searchVO.searchCl2DetailCode }">selected</c:if>><c:out value="${cl2result.codeNm}"/> </option>
								</c:forEach>
							</select>
						</span>
					</c:if>
					<!-- 선택옵션2 E -->
					<span>
						<select name="searchCnd" class="select_list" title="검색조건선택">
							   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
							   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
						</select>
					</span>
					<span>
						<label for="schTxt" class="skip">검색단어입력</label>
						<input id="schTxt" name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' class="text" title="검색어 입력" onkeypress="press(event);"/>
					</span>
						<input type="image" src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" onclick="fn_egov_select_noticeList('1'); return false;"/>
				</fieldset>
			</div>
		</div>
		</form>
	</div>
	
	<c:choose>
		<c:when test="${fn:length(resultList) gt 0}">
			<div class="ar" style="border-top:1px solid #ccc; padding-top:10px;">
				<button type="button" class="btn_s_orange" onclick="location.href='/user/com/newsletterApplication.do?menuNo=18009'">뉴스레터 신청하러 가기</button>
			</div>
			<div class="newsletter list">
				<ul>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<li class="margin_left">
							<c:choose>
								<c:when test="${fn:startsWith(result.extStr6, '/common/game')}">
									<a href="<c:url value="${result.extStr6}" />" onclick="window.open(this.href, '', 'width=560, height=420, scrollbars=no'); return false;" onkeypress="window.open(this.href, '', 'width=560, height=420, scrollbars=yes'); return false;">
								</c:when>
								<c:when test="${fn:startsWith(result.extStr6, '/game')}">
									<a href="<c:url value="${result.extStr6}" />" onclick="window.open(this.href, '', 'width=600, height=800, scrollbars=no'); return false;" onkeypress="window.open(this.href, '', 'width=600, height=800, scrollbars=yes'); return false;">
								</c:when>
								<c:otherwise>
									<a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
											onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
									<!--썸네일로 변경 - 뒤에 파라미터 썸네일 Y 전송시 썸네일 다운 -->
								</c:otherwise>
							</c:choose>
							<h3>
								<c:choose>
									<c:when test="${result.useAt == 'N'}">
										<span class="sub" style="text-decoration:line-through;color:red">[삭제]<c:out value="${result.nttSj}"/></span>
									</c:when>
									<c:otherwise>
										<span class="sub">
											<strong><c:out value="${result.nttSj}"/></strong>
											<%-- <c:out value="${result.nttCn}" escapeXml="false"/>--%>
										</span>
									</c:otherwise>
								</c:choose>
							</h3>
							<c:choose>
								<c:when test="${!empty result.thumbFileId}">
									<div class="photo"><img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.thumbFileId}"/>'/></div>
								</c:when>
								<c:otherwise>
									<div class="photo"><img src='<c:url value='/images/bbs/sample.jpg' />'/></div>
								</c:otherwise>
							</c:choose>
							<%--
							<div class="galleryBBox">
								<p class="date"><c:out value="${result.ntceDate}" /></p>
								<span class="subject">
									<span class="view"><img src="<c:url value='/assets/kor/images/bbs/ico_view.png'/>" alt="조회수" /><c:out value="${result.inqireCo}"/></span>
								</span>
							</div>
							--%>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</c:when>
		<c:otherwise>
			<table class="bbs_default list">
				<colgroup>
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<td>작성된 게시물이 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
	
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
	</div>
</div>