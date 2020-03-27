<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp" %>
</c:if>
<script type="text/javascript">
	//alert("KorImgList.jsp");

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_noticeList('1');
		}
	}

	function fn_egov_addNotice() {
		$('#frm').attr("action","<c:url value='/user/cop/bbs${prefix}/addBoardArticle.do'/>");
		$('#frm').submit();
	}

	function fn_egov_select_noticeList(pageNo) {
		$('#pageIndex').val(pageNo);
		$('#frm').attr("action","<c:url value='/user/cop/bbs${prefix}/selectBoardList.do'/>");
		$('#frm').submit();
	}
	
	$(document).on('click', '.btn-viewall.btn.btn-sm.btn-link', function(){
		$('.board-search-keyword').val('');
		$('#pageIndex').val(1);
		$('#frm').submit();
	});

	function fn_egov_inqire_notice(nttId, bbsId) {
		$('#nttId').val(nttId);
		$('#bbsId').val(bbsId);
		$('#frm').attr("action","<c:url value='/user/cop/bbs${prefix}/selectBoardArticle.do'/>");
		$('#frm').submit();
	}

</script>
<div id="contents">
	<c:choose>
	<c:when test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
	<div class="tableBtn clearfix margin_t_25">
		<div class="btn_left">
			총 <span class="point"><c:out value='${paginationInfo.totalRecordCount }'/></span>건, 현재페이지 <span class="point"><c:out value='${paginationInfo.currentPageNo }'/></span>/<c:out value='${paginationInfo.totalPageCount }'/>
		</div>
		<form name="frm" id="frm" action ="<c:url value='/user/cop/bbs${prefix}/selectBoardList.do'/>" method="get">
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
						<span>
							<select name="searchCnd" class="select_list" title="검색조건선택">
								   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
								   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
								   <c:if test="${anonymous != 'true'}">
								   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
								   </c:if>
							</select>
						</span>
						<span>
							<label for="schTxt" class="skip">검색단어입력</label>
							<input id="schTxt" name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' class="text" title="검색어 입력" onkeypress="press(event);"/>
						</span>
							<input type="image" src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" onclick="fn_egov_select_noticeList('1'); return false;"/>
							<!-- 
							2015.08.13 현 퍼블리싱에 맞게 주석처리
							<input type="button" id="button" class="btn gray" value="전체보기" /> -->
					</fieldset>
			</div>
		</div>
		</form>
	</div>
	
	<div class="newsletter list">
		<ul class="clearfix">
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<li>
					<a href="#/user/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
							onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
					<span class="photo"><img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>'/></span>
					<span class="subject">
						<c:choose>
							<c:when test="${result.useAt == 'N'}">
								<span class="sub" style="text-decoration:line-through;color:red">[삭제]<c:out value="${result.nttSj}"/></span>
							</c:when>
							<c:otherwise>
								<span class="sub"><c:out value="${result.nttSj}"/></span>
							</c:otherwise>
						</c:choose>
						<span class="view"><img src="<c:url value='/assets/kor/images/bbs/ico_view.png'/>" alt="조회수" /><c:out value="${result.inqireCo}"/></span>
					</span>
					</a>
			</li>
			</c:forEach>
		</ul>
	</div>
	
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
	</div>

	<div class="text_right margin_t_20">
		<c:if test="${brdMstrVO.authFlag == 'Y' && sessionUniqId != null}">
		<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
			<a href="javascript:fn_egov_addNotice();" class="btn seablue">등록</a>
		</c:if>
		</c:if>
	</div>
	</c:when>
	<c:otherwise>
		<form name="frm" id="frm" action ="<c:url value='/user/cop/bbs${prefix}/selectBoardList.do'/>" method="get">
		<input type="hidden" name="bbsId" id="bbsId"  value="<c:out value='${boardVO.bbsId}'/>" />
		<input type="hidden" name="nttId" id="nttId"  value="0" />
		<input type="hidden" name="bbsTyCode" id="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
		<input type="hidden" name="bbsAttrbCode" id="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
		<input type="hidden" name="authFlag" id="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
		<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
		
		<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />	
		<div class="tableBtn clearfix">
			<div class="btn_left">
				총 <span class="point"><c:out value='${paginationInfo.totalRecordCount }'/></span>건, 현재페이지 <span class="point"><c:out value='${paginationInfo.currentPageNo }'/></span>/<c:out value='${paginationInfo.totalPageCount }'/>
			</div>
			<div class="btn_right">
				<div class="board_search">
						<fieldset>
							<legend>게시물 검색</legend>
							<span> 
							<select name="searchCnd" class="select_list" title="검색조건선택">
								   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
								   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
								   <c:if test="${anonymous != 'true'}">
								   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
								   </c:if>
							</select>
							</span> 
							<input type="text" id="schTxt" name="searchWrd" placeholder="검색어 입력" class="text ic_search" value='<c:out value="${searchVO.searchWrd}"/>' onkeypress="press(event);" style="width: 180px;" />
						</fieldset>
				</div>
			</div>
		</div>
		</form>
		<div class="newsletter list">
			<ul class="clearfix">
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<li><a href="#/user/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
							onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;"> 
					<span class="photo"><img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>'/></span> 
					<span class="subject"> 
						<c:choose>
							<c:when test="${result.useAt == 'N'}">
								<span class="sub" style="text-decoration:line-through;color:red">[삭제]<c:out value="${result.nttSj}"/></span>
							</c:when>
							<c:otherwise>
								<span class="sub"><c:out value="${result.nttSj}"/></span>
							</c:otherwise>
						</c:choose>
					</span>
				</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
		</div>
	</c:otherwise>	
	</c:choose>
</div>