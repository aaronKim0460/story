<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
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
</head>
<body>
<form id="downForm" name="downForm" method="post">
	<input type="hidden" name="atchFileId" />
</form>
<div style="width: 0px; height: 0px; display: none;">
	<iframe name="fileDown" title="fileDown"></iframe>
</div>
<div id="contents">
	<div class="tableBtn clearfix">
		<div class="btn_left big">
			총 <span class="point"><c:out value='${paginationInfo.totalRecordCount }' /></span>건
			, 현재페이지 <span class="point"><c:out value='${paginationInfo.currentPageNo }' /></span>
			/<c:out value='${paginationInfo.totalPageCount }' />
		</div>
		<form name="frm" id="frm" action="<c:url value='/cop/bbs${prefix}/selectNoLoginBoardList.do'/>" method="post">
			<div class="btn_right">
				<div class="board_search">
					<input type="hidden" name="bbsId" id="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
					<input type="hidden" name="nttId" id="nttId" value="0" />
					<input type="hidden" name="bbsTyCode" id="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
					<input type="hidden" name="bbsAttrbCode" id="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
					<input type="hidden" name="authFlag" id="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
					<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
					<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
					<fieldset>
						<legend>게시물 검색</legend>
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
							<select name="searchCnd" class="select_list">
									<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>제목</option>
									<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>내용</option>
									<c:if test="${param.menuNo eq 11003}">
										<option value="ETC0" <c:if test="${searchVO.searchCnd == 'ETC0'}">selected="selected"</c:if>>국가</option>
									</c:if>
							</select>
						</span>
						<span>
							<label for="" class="skip">검색단어입력</label>
							<input name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' class="text" title="검색어 입력" onKeyPress="press(event);" />
						</span>
						<input type="image" src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" onClick="fn_egov_select_noticeList('1'); return false;" />
					</fieldset>
				</div>
			</div>
		</form>
	</div>
	<table class="bbs_default list">
		<colgroup>
			<col style="width: 6.5%" /><!-- 번호 -->
			<c:if test="${brdMstrVO.cl1Code!=null}">
				<col style="width: 12%" /><!-- 2 -->
			</c:if>
			<c:if test="${brdMstrVO.cl2Code!=null}">
				<col style="width: 12%" /><!-- 3 -->
			</c:if>
			<col /><!-- 제목 -->
			<c:if test="${brdMstrVO.etc0ClNm!=null}">
				<col style="width: 10%" /><!-- 5 -->
			</c:if>
			<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
				<col style="width: 10%" /><!-- 시작일 -->
				<col style="width: 10%" /><!-- 종료일 -->
			</c:if>
			<c:if test="${!(boardVO.bbsId eq 'BBSMSTR_000000000591' || boardVO.bbsId eq 'BBSMSTR_000000000570' || boardVO.bbsId eq 'BBSMSTR_000000000641')}">
				<col style="width: 12%" /><!-- 출처 -->
			</c:if>
			<col style="width: 12%" /><!-- 등록일 -->
			<c:if test="${!(boardVO.bbsId eq 'BBSMSTR_000000000570' || boardVO.bbsId eq 'BBSMSTR_000000000590')}">
				<col style="width: 6.5%" /><!-- 파일 -->
			</c:if>
			<col style="width: 6.5%" /><!-- 조회수 -->
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<c:if test="${brdMstrVO.cl1Code!=null}">
					<th scope="col"><c:out value='${brdMstrVO.cl1CodeNm}'/></th>
				</c:if>
				<c:if test="${brdMstrVO.cl2Code!=null}">
					<th scope="col"><c:out value='${brdMstrVO.cl2CodeNm}'/></th>
				</c:if>
				<th scope="col">제목</th>
				<c:if test="${brdMstrVO.etc0ClNm!=null}">
					<th scope="col"><c:out value='${brdMstrVO.etc0ClNm}'/></th>
				</c:if>
				<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
					<th scope="col">시작일</th>
					<th scope="col">종료일</th>
				</c:if>
				<c:if test="${!(boardVO.bbsId eq 'BBSMSTR_000000000591' || boardVO.bbsId eq 'BBSMSTR_000000000570' || boardVO.bbsId eq 'BBSMSTR_000000000641')}">
					<th scope="col">출처</th>
				</c:if>
				<th scope="col">등록일</th>
				<c:if test="${!(boardVO.bbsId eq 'BBSMSTR_000000000591' || boardVO.bbsId eq 'BBSMSTR_000000000590')}">
					<th scope="col">파일</th>
				</c:if>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody id="body_list" class="t_center list">
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<c:choose>
					<c:when test="${result.noticeAt == 1 }">
						<tr class="notice">
							<td class="ac"><img src="/assets/kor/images/bbs/ico_notice.png" alt="공지" /></td>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="ac"><c:out value="${paginationInfo.totalRecordCount - ((searchVO.pageIndex -1)* searchVO.pageSize + status.index)}" /></td>
					</c:otherwise>
				</c:choose>
				<c:if test="${brdMstrVO.cl1Code!=null}">
					<td class="board-default-td-name ac"><c:out value='${result.cl1DetailCodeNm}'/></td>
				</c:if>
				<c:if test="${brdMstrVO.cl2Code!=null}">
					<td class="board-default-td-name ac"><c:out value='${result.cl2DetailCodeNm}'/></td>
				</c:if>
				<td class="subject">
					<a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>"
					title="<c:out value="${result.nttSj}"/>" onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
						<c:choose>
							<c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
								<c:if test="${result.replyLc!=0}">
									<c:forEach begin="0" end="${result.replyLc}" step="1">
						    			&nbsp;
						    		</c:forEach>
									<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
								</c:if>
								<c:choose>
									<c:when test="${result.useAt == 'N'}">
										<a href="#" class="btn-sm btn-warning">삭제</a>
										<span style="text-decoration: line-through; color: red"><c:out value='${result.nttSj}' /></span>
									</c:when>
									<c:otherwise>
										<c:out value='${result.nttSj}' />
									</c:otherwise>
								</c:choose>
								<c:if test="${userAuthority != null && result.publicNuriTy != null && result.publicNuriTy != '0' && result.publicNuriTy != ''}">
									<img src="<c:url value='/images/common/bbs_mark_open${result.publicNuriTy}.png'/>" alt="제${result.publicNuriTy}유형" class="bbs_markImg" />
									
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${result.replyLc!=0}">
									<c:forEach begin="0" end="${result.replyLc}" step="1">
				    				&nbsp;
				    				</c:forEach>
									<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
								</c:if>
								<c:choose>
									<c:when test="${result.useAt == 'N'}">
										<a href="#" class="btn-sm btn-warning">삭제</a>
										<span style="text-decoration: line-through; color: red"><c:out value='${result.nttSj}' /></span>
									</c:when>
									<c:otherwise>
										<c:out value='${result.nttSj}' />
									</c:otherwise>
								</c:choose>
								<c:if test="${result.publicNuriTy != null && result.publicNuriTy != '0'  && result.publicNuriTy != ''}">
									<img src="<c:url value='/images/common/bbs_mark_open${result.publicNuriTy}.png'/>" alt="제${result.publicNuriTy}유형" class="bbs_markImg" />
								</c:if>
							</c:otherwise>
						</c:choose>
					</a>
				</td>
				<c:if test="${brdMstrVO.etc0ClNm!=null}">
					<td class="board-default-td-name ac"><c:out value="${result.extStr0}" /></td>
				</c:if>
				<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
					<td class="board-default-td-date"><c:out value="${result.ntceBgnde}" /></td>
					<td class="board-default-td-date"><c:out value="${result.ntceEndde}" /></td>
				</c:if>
				<c:if test="${!(boardVO.bbsId eq 'BBSMSTR_000000000591' || boardVO.bbsId eq 'BBSMSTR_000000000570' || boardVO.bbsId eq 'BBSMSTR_000000000641')}">
					<td class="board-default-td-name ac"><c:if test="${result.extStr5!=null}"><c:out value="${result.extStr5}" /></c:if></td>
				</c:if>
				
				<td class="board-default-td-date"><c:out value="${result.ntceDate}" /></td>
				
				<c:if test="${!(boardVO.bbsId eq 'BBSMSTR_000000000591' || boardVO.bbsId eq 'BBSMSTR_000000000590')}">
					<c:choose>
						<c:when test="${result.atchFileId == '' || result.atchFileId == null }">
							<td class="board-default-td-attach ac">&nbsp;</td>
						</c:when>
						<c:otherwise>
							<td class="board-default-td-attach ac">
								<a href="#" name="down_file_all" fileinfo="<c:out value='${result.atchFileId}'/>">
									<img src="/assets/kor/images/bbs/ic_addfile.gif" alt="첨부파일" />
								</a>
							</td>
						</c:otherwise>
					</c:choose>
				</c:if>
				<%-- <c:choose>
					<c:when test="${(param.bbsId eq 'BBSMSTR_000000000570' && param.menuNo eq '11004') || (param.bbsId eq 'BBSMSTR_000000000590' && param.menuNo eq '1100202')}">
						<td class="board-default-td-name ac"><c:if test="${result.extStr5!=null}"><c:out value="${result.extStr5}" /></c:if></td>
						<td class="board-default-td-date"><c:out value="${result.ntceDate}" /></td>
					</c:when>
					<c:otherwise>
						<td class="board-default-td-date"><c:out value="${result.ntceDate}" /></td>
						<c:choose>
							<c:when test="${result.atchFileId == '' || result.atchFileId == null }">
								<td class="board-default-td-attach ac">&nbsp;</td>
							</c:when>
							<c:otherwise>
								<td class="board-default-td-attach ac">
									<a href="#" name="down_file_all" fileinfo="<c:out value='${result.atchFileId}'/>">
										<img src="/assets/kor/images/bbs/ic_addfile.gif" alt="첨부파일" />
									</a>
								</td>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose> --%>
				<td class="board-default-td-hit ac">
					<c:out value="${result.inqireCo}" />
				</td>
			</tr>
			</c:forEach>

			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="10" class="no_data" align="center">작성된 게시물이 없습니다.</td>
				</tr>
			</c:if>

		</tbody>
	</table>

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image"
			jsFunction="fn_egov_select_noticeList" />
	</div>
</div>
</body>
</html>