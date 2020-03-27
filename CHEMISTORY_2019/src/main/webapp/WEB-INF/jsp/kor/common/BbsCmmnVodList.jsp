<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>
<script type="text/javascript">
	//alert("KorVodList.jsp")
	<!--

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_noticeList('1');
		}
	}
	
	function fn_egov_addNotice() {
		$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>");
		$('#frm').submit();
	}
	
	function fn_egov_select_noticeList(pageNo) {
		$('#pageIndex').val(pageNo);
		$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>");
		$('#frm').submit();
	}
	
	function fn_egov_inqire_notice(nttId, bbsId) {
		$('#nttId').val(nttId);
		$('#bbsId').val(bbsId);
		$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>");
		$('#frm').submit();
	}
	//-->
	
	function imgError(image){
		$(image).attr('src','/assets/kor/images/bbs/img_thum01.gif');
	}		
</script>

<form name="frm" id="frm" action ="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="get">
<input type="hidden" name="bbsId" id="bbsId"  value="<c:out value='${boardVO.bbsId}'/>" />
<input type="hidden" name="nttId" id="nttId"  value="0" />
<input type="hidden" name="bbsTyCode" id="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
<input type="hidden" name="bbsAttrbCode" id="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
<input type="hidden" name="authFlag" id="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />

<input type="hidden" name="searchCl1DetailCode" id="searchCl1DetailCode" value="<c:out value='${searchVO.searchCl1DetailCode}'/>" />
</form>
<div id="contents">
	<c:choose>
	<c:when test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
	<!-- 본문내용 시작  -->
    <div class="movie">
	<ul class="list">
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<li class="clearfix">
			<span class="photo">
			<img width="190px" height="140px" onerror="imgError(this);" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>&fileSn=<c:out value='${result.fileSn }'/>'/>
			</span> 
			<div class="substance">
				<span class="subject"><c:out value='${result.nttSj}'/></span>
				<div>
					<a class="movie" href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
						onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
					동영상 보기</a>
				</div>
			</div>
	</li>	
	</c:forEach>
	</ul>
	</div>
	
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
	</div>	

	<div class="t_center mt20">
		<c:if test="${fn:length(sessionUniqId) > 0}">
		<a href="javascript:fn_egov_addNotice();" class="btn seablue">등록</a>
		</c:if>
	</div>
	</c:when>
	<c:otherwise>
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
								<input id="schTxt" name="searchWrd" type="text" placeholder="검색어 입력" value='<c:out value="${searchVO.searchWrd}"/>' style="width: 180px;" class="text ic_search" title="검색어 입력" onkeypress="press(event);"/>
							</fieldset>
					</div>
				</div>
			</div>
			<div class="movie">
				<ul class="list">
					<c:forEach var="result" items="${resultList}" varStatus="status">
					<li class="clearfix"><span class="photo">
					<img width="156px" height="116px"  onerror="imgError(this);" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>&fileSn=<c:out value='${result.fileSn }'/>'/>
					</span>
						<div class="substance">
							<span class="subject"><c:out value='${result.nttSj}'/></span>
							<p class="txt">
							<c:out value="${result.extStr5}" escapeXml="false" />
							</p>
							<div>
								<a class="movie" href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
										onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
									동영상 보기</a>
							</div>
						</div></li>
					</c:forEach>
				</ul>
			</div>
			<div class="pagination">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
			</div>

		</c:otherwise>
	</c:choose>	
</div>
