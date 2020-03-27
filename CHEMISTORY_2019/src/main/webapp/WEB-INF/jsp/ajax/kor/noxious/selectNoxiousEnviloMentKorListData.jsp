<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
	<div class="board-pages">
		<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
		<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
	</div>

	<ul class="eventLi">
		<c:forEach var="result" items="${maplist}" varStatus="status">
		<li>
			<div class="left_wrap">
				<div class="p_wrap"><p><c:out value="${result.envName}"/></p>
				<p><strong><c:out value="${result.matName}"/></strong></p></div>
				<div class="img_wrap"><img src="/assets/kor/images/newMain/che_0.jpg" alt="어린이침실"/></div>
			</div>

			<div class="material">
				<ul>
					<c:forEach var="mappinglist" items="${result.mappingList}" varStatus="i">
						<li>
							<p onclick="doDetailPopUp('${mappinglist.idx}');"><c:out value="${mappinglist.kName}"/><span><c:out value="${mappinglist.cas}"/></span></p>
							<div class="icon_wrap">
								<c:if test="${fn:indexOf(mappinglist.searchCondition, 'BCC601') ne -1}">
									<a href="#none" onclick="doGobbs('BBSMSTR_000000000660','BCC601','12004','${mappinglist.idx}');"><img src="/assets/kor/images/newMain/toon.png" title="웹툰" alt="웹툰아이콘"></a>
								</c:if>
								<c:if test="${fn:indexOf(mappinglist.searchCondition, 'BCC603') ne -1}">
									<a href="#none" onclick="doGobbs('BBSMSTR_000000000660','BCC603','12004','${mappinglist.idx}');"><img src="/assets/kor/images/newMain/film.png" title="영상" alt="영상아이콘"></a>
								</c:if>
								<c:if test="${fn:indexOf(mappinglist.searchCondition, 'BCC602') ne -1}">
									<a href="#none" onclick="doGobbs('BBSMSTR_000000000660','BCC602','12004','${mappinglist.idx}');"><img src="/assets/kor/images/newMain/story.png" title="스토리" alt="스토리아이콘"></a>
								</c:if>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</li>
		</c:forEach>
		<c:if test="${fn:length(maplist) == 0}">
		<li>
			<p style="text-align:center;">작성된 게시물이 없습니다.</p>
		</li>
		</c:if>
	</ul>

	<c:if test="${fn:length(maplist) > 0}">
			<div class="pagination">
		        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
		    </div>
	</c:if>