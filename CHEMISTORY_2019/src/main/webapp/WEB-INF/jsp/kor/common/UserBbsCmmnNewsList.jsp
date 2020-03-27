<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>
<script type="text/javascript">
//alert("KorNewsList.jsp");
<!--
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_noticeList('1');
		}
	}

	function fn_egov_select_noticeList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
		document.frm.submit();
	}

	function fn_egov_inqire_notice(nttId, bbsId) {
		$('#nttId').val(nttId);
		$('#bbsId').val(bbsId);
		$('#frm').attr("action","<c:url value='/user/cop/bbs${prefix}/selectBoardArticle.do'/>");
		$('#frm').submit();
	}
//-->

	function fn_egov_select_searchList(searchBgnDe) {
		document.frm.searchBgnDe.value = searchBgnDe;
		document.frm.action = "<c:url value='/user/cop/bbs${prefix}/selectBoardList.do'/>";
		document.frm.submit();
	}

	$(document).ready(function(){
		
		// 상세보기
		$("#body_list tr").click(function(){
			
			if($(this).find("form").length < 1)return;
			
			$(this).find("form").submit();
		});
		
	});
	
	function imgError(image){
		$(image).attr('src','/assets/kor/images/bbs/img_thum01.gif');
	}	
	
</script>

<div id="contents">
	<c:if test="${brdMstrVO.cl1Code!=null}">
	<div class="contentTab">
	<ul class="Tab01">
		<li><a <c:if test="${searchVO.searchCl1DetailCode==null || searchVO.searchCl1DetailCode==''}">class="on"</c:if> href="/EgovMovePage.do?menuNo=<c:out value='${menuManageVO.menuNo}'/>">전체</a></li>
		<c:forEach var="cl1result" items="${codeList}" varStatus="status">
			<li><a <c:if test="${cl1result.code == searchVO.searchCl1DetailCode }">class="on"</c:if> href="/user/cop/bbs/selectBoardList.do?bbsId=<c:out value='${boardVO.bbsId}'/>&menuNo=<c:out value='${menuManageVO.menuNo}'/>&searchCl1DetailCode=<c:out value="${cl1result.code}"/>"><c:out value="${cl1result.codeNm}"/></a></li>
		</c:forEach>
	</ul>
	</div>
	</c:if>
	
	<c:if test="${searchVO.searchBgnDe!=null && searchVO.searchBgnDe!=''}">
	<div class="contentTab">
	<ul class="Tab01">
		<li><a <c:if test="${searchVO.searchBgnDe!=null && searchVO.searchBgnDe=='0'}">class="on"</c:if> href="#" onclick="fn_egov_select_searchList('0');">지난글</a></li>
		<li><a <c:if test="${searchVO.searchBgnDe!=null && searchVO.searchBgnDe=='1'}">class="on"</c:if> href="#" onclick="fn_egov_select_searchList('1');">진행중인글</a></li>
	</ul>
	</div>
	</c:if>
	
	<div class="tableBtn clearfix">
		<div class="btn_left big">
			총 <span class="point"><c:out
					value='${paginationInfo.totalRecordCount }' /></span>건, 현재페이지 <span
				class="point"><c:out value='${paginationInfo.currentPageNo }' /></span>/
			<c:out value='${paginationInfo.totalPageCount }' />
		</div>
		<form name="frm" id="frm"
			action="<c:url value='/user/cop/bbs${prefix}/selectBoardList.do'/>"
			method="get">
			<div class="btn_right">
				<div class="board_search">
					<input type="hidden" name="bbsId" id="bbsId"
						value="<c:out value='${boardVO.bbsId}'/>" /> <input type="hidden"
						name="nttId" id="nttId" value="0" /> <input type="hidden"
						name="bbsTyCode" id="bbsTyCode"
						value="<c:out value='${brdMstrVO.bbsTyCode}'/>" /> <input
						type="hidden" name="bbsAttrbCode" id="bbsAttrbCode"
						value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" /> <input
						type="hidden" name="authFlag" id="authFlag"
						value="<c:out value='${brdMstrVO.authFlag}'/>" /> <input
						type="hidden" name="pageIndex" id="pageIndex"
						value="<c:out value='${searchVO.pageIndex}'/>" /> <input
						type="hidden" name="menuNo" id="menuNo"
						value="<c:out value='${menuManageVO.menuNo}'/>" /> <input
						type="hidden" name="searchCl1DetailCode" id="searchCl1DetailCode"
						value="<c:out value='${searchVO.searchCl1DetailCode}'/>" />
						<input
						type="hidden" name="searchBgnDe" id="searchBgnDe"
						value="<c:out value='${searchVO.searchBgnDe}'/>" />
					<fieldset>
						<legend>게시물 검색</legend>
						<span> <select name="searchCnd" class="select_list">
								<option value="0"
									<c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>제목</option>
								<option value="1"
									<c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>내용</option>
								<c:if test="${anonymous != 'true'}">
									<option value="2"
										<c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if>>작성자</option>
								</c:if>
						</select>
						</span> <span> <label for="" class="skip">검색단어입력</label> <input
							name="searchWrd" type="text"
							value='<c:out value="${searchVO.searchWrd}"/>' class="text"
							title="검색어 입력" onKeyPress="press(event);" />
						</span> <input type="image"
							src="/assets/kor/images/bbs/board_search_btn.png" alt="검색"
							onClick="fn_egov_select_noticeList('1'); return false;" />
						<!-- <a id="button" class="btn gray">전체보기</a> -->
					</fieldset>
				</div>
			</div>
		</form>
	</div>
			
			<div class="movie event">
				<ul class="list">
					<c:forEach var="result" items="${resultList}" varStatus="status">
					<li class="clearfix"><span class="photo">
					<a href="#/user/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
							onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">	
					<img width="209px" height="116px" onerror="imgError(this);" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>&fileSn=<c:out value='${result.fileSn }'/>' alt="<c:out value='${result.nttSj}'/>" />
					</a>
					</span>
						<div class="substance">
							<a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
							onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
							<span class="subject"><c:out value='${result.nttSj}'/></span>
							</a>
							<p class="txt">
							<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
							    <c:out value="${result.ntceBgnde}"/> ~ 
							    <c:out value="${result.ntceEndde}"/>
					    	</c:if>
							</p>
							<p class="txt">
							<c:out value='${result.extStr1}'/>
							</p>
							<span class="txt"><c:out value='${result.ntceDate}'/></span>
						</div></li>
					</c:forEach>
				</ul>
			</div>
			<div class="pagination">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
			</div>
</div>
