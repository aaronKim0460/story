<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
</c:if>
<script type="text/javascript">
    //alert("ComImgList.jsp");

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_noticeList('1');
		}
	}

	function fn_egov_addNotice() {
		$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/addNierBoardArticle.do'/>");
		$('#frm').submit();
	}

	function fn_egov_select_noticeList(pageNo) {
		$('#pageIndex').val(pageNo);
		$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/selectNoLoginBoardList.do'/>");
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
		$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/selectNoLoginBoardArticle.do'/>");
		$('#frm').submit();
	}
	
	function imgError(image){
		$(image).attr('src','/assets/kor/images/bbs/img_thum01.gif');
	}		
</script>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="frm" id="frm" action ="<c:url value='/cop/bbs${prefix}/selectNoLoginBoardList.do'/>" method="get">
	<div class="board-search">
	<input type="hidden" name="bbsId" id="bbsId"  value="<c:out value='${boardVO.bbsId}'/>" />
	<input type="hidden" name="nttId" id="nttId"  value="0" />
	<input type="hidden" name="bbsTyCode" id="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
	<input type="hidden" name="bbsAttrbCode" id="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
	<input type="hidden" name="authFlag" id="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
	<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
	
	<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
	
	<!--  검색  -->
		<fieldset>
		<legend>목록검색</legend>
		<select name="searchCnd" class="board-search-select" title="검색조건선택">
		   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
		   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
		   <c:if test="${anonymous != 'true'}">
		   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
		   </c:if>
		</select>
		<input name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' class="board-search-keyword" title="검색어 입력" onKeyPress="press(event);" />
		<input type="submit" id="board-search-submit" class="btn btn-sm btn-default" onClick="fn_egov_select_noticeList('1'); return false;" value="검색" />
		<input type="button" id="button" class="btn-viewall btn btn-sm btn-link" value="전체보기" />
		</fieldset>
	
	<!--  검색  -->
	</div>
</form>

<div class="board-list">
	<div class="gallery-list">
	
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<dl class="board-gallery">
			<dt class="board-gallery-dt">
				<a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
							onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
					<span>
						<c:choose>
							<c:when test="${result.useAt == 'N'}">
								<a href="#" class="btn-sm btn-warning">삭제</a>
								<span style="text-decoration:line-through;color:red"><c:out value='${result.nttSj}'/></span>
							</c:when>
							<c:otherwise>
								<c:out value='${result.nttSj}'/>
							</c:otherwise>
						</c:choose>
						
					</span>
				</a>
			</dt>
			<dd class="board-gallery-img">
			<a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
							onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
				<img onerror="imgError(this);" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>'/>
			</a>
			</dd>
			<dd class="board-gallery-dd">
				<table style="width:100%;">
					<colgroup>
						<col style="width:30%" />
						<col style="width:30%" />
						<col style="width:*" />
					</colgroup>
					<tr>
						<td>
							<c:if test="${userAuthority != null && result.publicNuriTy != '0' && result.publicNuriTy != ''}">
								<img src="<c:url value='/images/common/bbs_mark_open${result.publicNuriTy}.png'/>" />
							</c:if>
						</td>
						<td>&nbsp;
						</td>
						<td style="text-align:right;">
							<c:out value="${result.ntceDate}"/>
						</td>
					</tr>
				</table>
			</dd>
		</dl>
		</c:forEach>	
	
	</div>
</div>


<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image2" jsFunction="fn_egov_select_noticeList" />
	</div>
</div>

<!-- 버튼 -->
<div class="board-detail-foot">
<div class="btns clear fr">
	<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA04' || fn:length(sessionUniqId)>0 }">
	<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
	<a href="javascript:fn_egov_addNotice();"  class="btn btn-primary">등록</a>
	</c:if>
	</c:if>
</div>
</div>
