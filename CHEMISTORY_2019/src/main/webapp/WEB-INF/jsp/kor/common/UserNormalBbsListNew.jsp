<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
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

	// 검색화면으로 이동 
	function fn_egov_inqire_goUrl(menuNo, searchWrd) {
		$('#menuNo').val(menuNo);
		$('#schTxt').val(searchWrd);
		//$('#searchKeyword').val(searchWrd);
		$('input[name="searchKeyword"]').val(searchWrd);
		$('#frm').attr("action","<c:url value='/kor/guide/search.do'/>");
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
		<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />

		<div class="btn_right">
			<div class="board_search">
				<fieldset>
					<legend>목록검색</legend>
					<span>
						<select name="searchCl1DetailCode" id="searchCl1DetailCode" class="select_list" title="검색조건선택">
							<option value=""  <c:if test="${searchVO.searchCl1DetailCode == ''}">selected="selected"</c:if>>선택</option>
							<option value="BCC501"  <c:if test="${searchVO.searchCl1DetailCode == 'BCC501'}">selected="selected"</c:if>>화학물질 관리 </option>
							<option value="BCC502"  <c:if test="${searchVO.searchCl1DetailCode == 'BCC502'}">selected="selected"</c:if>>화학 상식 </option>
							<option value="BCC503"  <c:if test="${searchVO.searchCl1DetailCode == 'BCC503'}">selected="selected"</c:if>>건강과 생활 </option>
							<option value="BCC504"  <c:if test="${searchVO.searchCl1DetailCode == 'BCC504'}">selected="selected"</c:if>>환경오염 </option>
						</select>
					</span>
					
					<span>
						<select name="searchCnd" class="select_list" title="검색조건선택">
							   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
							   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
							   <c:if test="${anonymous != 'true'}">
							   <!--<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>-->
							   </c:if>
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
			<div class="newsletter">
				<ul class="clearfix">
					<c:forEach var="result" items="${resultList}" varStatus="status">
					<li>
						<a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
								onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
						<!-- 썸네일로 변경 - 뒤에 파라미터 썸네일 Y 전송시 썸네일 다운 -->
						
						<%-- <a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
						   onclick="javascript:fn_egov_inqire_goUrl('18001','<c:out value='${result.nttSj}'/>'); return false;"> --%>
								
						<c:choose>
							<c:when test="${!empty result.thumbFileId}">
								<div class="photo"><img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${result.thumbFileId}'/>" alt="" /></div>
							</c:when>
							<c:otherwise>
								<div class="photo"><img src="<c:url value='/images/bbs/noimgs.png' />"/></div>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${result.useAt == 'N'}">
							<span class="sub" style="text-decoration:line-through;color:red">[삭제]<c:out value="${result.nttSj}"/></span>
							</c:when>
							<c:otherwise>
							<h3 style="height:75px; padding:0px 15px 0px 15px">
								<strong><c:out value="${result.nttSj}"/></strong>
							</h3>
							<%-- <div class="newText"><c:out value="${result.nttCn}" escapeXml="false"/></div> --%>
							</c:otherwise>
						</c:choose>
						<span class="caBox">
							<c:if test="${result.cl1DetailCode eq 'BCC501'}">화학물질 관리</c:if>
							<c:if test="${result.cl1DetailCode eq 'BCC502'}">화학 상식</c:if>
							<c:if test="${result.cl1DetailCode eq 'BCC503'}">건강과 생활</c:if>
							<c:if test="${result.cl1DetailCode eq 'BCC504'}">환경오염</c:if>
						</span>
						<%-- <p class="date"><c:out value="${result.ntceDate}" /></p>--%>
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

	<div class="t_center mt20">
		<c:if test="${brdMstrVO.authFlag == 'Y' && sessionUniqId != null}">
		<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
			<a href="javascript:fn_egov_addNotice();" class="btn seablue">등록</a>
		</c:if>
		</c:if>
	</div>
</div>