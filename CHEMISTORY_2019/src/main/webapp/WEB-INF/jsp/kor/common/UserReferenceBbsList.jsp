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

	// 검색하기
	function fn_egov_select_noticeList(pageNo) {
		$('#pageIndex').val(pageNo);
		$('#frm').attr("action","<c:url value='/user/cop/bbs/selectBoardList.do'/>");
		$('#frm').submit();
	}
	
	// 첨부파일 전체 다운로드
	$(document).ready(function(){
		
		var fileFlag = false;
		
		// 전체 파일 다운로드
		$("a[name=down_file_all]").click(function(){
			
			fileFlag = true;
			
			var atchFileId = $(this).attr("fileinfo"); 
			
			if(atchFileId == null || atchFileId == ""){
				alert("파일 정보를 확인할 수 없습니다.");
				return;
			}
			
			$("#downForm input[name=atchFileId]").val(atchFileId);
			
			$("#downForm").attr("action" , "<c:url value='/cmm/fms/fileDownAll.do' />");
			$("#downForm").attr("target" , "fileDown");
			$("#downForm").submit();
		});
		
	});
	
</script>

<form id="downForm" name="downForm" method="post">
	<input type="hidden" name="atchFileId" />
</form>

<div style="width: 0px; height: 0px; display: none;">
	<iframe name="fileDown" title="fileDown"></iframe>
</div>

<div id="contents">
	<div class="edu_materials">
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
				<ul class="clearfix">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<li class="clearfix">
							<div class="edu_book">
								<c:choose>
									<c:when test="${!empty result.thumbFileId}">
										<img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.thumbFileId}"/>'/>
									</c:when>
									<c:otherwise>
										<img src="/assets/kor/images/newMain/book.png" alt="환경보건 교육 교재">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="eduWrap">
								<em><c:out value="${result.cl1DetailCodeNm}"/></em>
								<h3><c:out value="${result.nttSj}"/></h3>
								<p><c:out value="${result.nttCn}" escapeXml="false" /></p>
							</div>
							<div class="grayBack">
								<c:choose>
									<c:when test="${result.atchFileId == '' || result.atchFileId == null }">
										<p>자료 준비중</p>
									</c:when>
									<c:otherwise>
										<c:if test="${result.cl3DetailCode eq 'A'}">
											<a href="#" name="down_file_all" fileinfo="<c:out value='${result.atchFileId}'/>"><p>학생용 다운로드</p></a>
										</c:if>
										<c:if test="${result.cl3DetailCode eq 'B'}">
											<a href="#" name="down_file_all" fileinfo="<c:out value='${result.atchFileId}'/>"><p>교사용 다운로드</p></a>
										</c:if>
									</c:otherwise>
								</c:choose>
							</div>
						</li>
					</c:forEach>
				</ul>
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
	</div>	
	<c:if test="${fn:length(resultList) gt 0}">
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
	</div>
	</c:if>
</div>
	