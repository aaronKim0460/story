<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
</c:if>
<script type="text/javascript">

	//alert("KorNoticeList.jsp");

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
	
	function fn_egov_downFile(atchFileId, fileSn){
		window.open("<c:url value='/cmm/fms/NoLoginFileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
	}
	
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
	
	<div class="tableBtn clearfix">
		<div class="btn_left big">
			총 <span class="point"><c:out
					value='${paginationInfo.totalRecordCount }' /></span>건, 현재페이지 <span
				class="point"><c:out value='${paginationInfo.currentPageNo }' /></span>/
			<c:out value='${paginationInfo.totalPageCount }' />
		</div>
		<form name="frm" id="frm"
			action="<c:url value='/user/cop/bbs${prefix}/selectBoardList.do'/>"
			method="post">
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

	<table class="bbs_default list">
		<colgroup>
			<col style="width: 6.5%" />
			<c:if test="${brdMstrVO.cl1Code!=null}">
				<col style="width: 12%" />
			</c:if>
			<c:if test="${brdMstrVO.cl2Code!=null}">
				<col style="width: 12%" />
			</c:if>
			<col />
			<c:if test="${brdMstrVO.etc0ClNm!=null}">
				<col style="width: 10%" />
			</c:if>
			<col style="width: 12%" />
			<col style="width: 6.5%" />
			<col style="width: 6.5%" />
		</colgroup>
		<thead>
			<tr>
				<!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
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
				<th scope="col">등록일</th>
				<th scope="col">파일</th>
				<th scope="col">조회</th>
			</tr>
		</thead>
		<tbody id="body_list" class="t_center list">
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<c:choose>
					<c:when test="${result.noticeAt == 1 }">
						<tr class="notice">
							<td><img src="/assets/kor/images/bbs/ico_notice.png"
								" alt="공지" /></td>
					</c:when>
					<c:otherwise>
						<tr>
							<td><c:out
									value="${paginationInfo.totalRecordCount - ((searchVO.pageIndex -1)* searchVO.pageSize + status.index)}" /></td>
					</c:otherwise>
				</c:choose>
				
				<c:if test="${brdMstrVO.cl1Code!=null}">
					<td class="board-default-td-name"><c:out value='${result.cl1DetailCodeNm}'/></td>
				</c:if>
				<c:if test="${brdMstrVO.cl2Code!=null}">
					<td class="board-default-td-name"><c:out value='${result.cl2DetailCodeNm}'/></td>
				</c:if>

				<td class="subject"><a
					href="#/user/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>"
					title="<c:out value="${result.nttSj}"/>"
					onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
						<c:choose>
							<c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
								<c:if test="${result.replyLc!=0}">
									<c:forEach begin="0" end="${result.replyLc}" step="1">
				    			&nbsp;
				    		</c:forEach>
									<img
										src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>"
										alt="reply arrow">
								</c:if>
								<c:choose>
									<c:when test="${result.useAt == 'N'}">
										<a href="#" class="btn-sm btn-warning">삭제</a>
										<span style="text-decoration: line-through; color: red"><c:out
												value='${result.nttSj}' /></span>
									</c:when>
									<c:otherwise>
										<c:out value='${result.nttSj}' />
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:if test="${result.replyLc!=0}">
									<c:forEach begin="0" end="${result.replyLc}" step="1">
				    			&nbsp;
				    		</c:forEach>
									<img
										src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>"
										alt="reply arrow">
								</c:if>
								<c:choose>
									<c:when test="${result.useAt == 'N'}">
										<a href="#" class="btn-sm btn-warning">삭제</a>
										<span style="text-decoration: line-through; color: red"><c:out
												value='${result.nttSj}' /></span>
									</c:when>
									<c:otherwise>
										<c:out value='${result.nttSj}' />
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
				</a></td>

				<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
					<td class="board-default-td-date"><c:out
							value="${result.ntceBgnde}" /></td>
					<td class="board-default-td-date"><c:out
							value="${result.ntceEndde}" /></td>
				</c:if>

				<c:if test="${brdMstrVO.etc0ClNm!=null}">
					<td class="board-default-td-name"><c:out
							value="${result.extStr0}" /></td>
				</c:if>

				<td class="board-default-td-date"><c:out
						value="${result.ntceDate}" /></td>

				<c:choose>
					<c:when
						test="${result.atchFileId == '' || result.atchFileId == null }">
						<td class="board-default-td-attach">&nbsp;</td>
					</c:when>
					<c:otherwise>
						<td class="board-default-td-attach ac"><a href="#"
							name="down_file_all"
							fileinfo="<c:out value='${result.atchFileId}'/>"> <img
								src="/assets/kor/images/bbs/ic_addfile.gif" alt="첨부파일" />
						</a></td>
					</c:otherwise>
				</c:choose>

				<td class="board-default-td-hit ac"><c:out
						value="${result.inqireCo}" /></td>
				</tr>
			</c:forEach>

			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<c:choose>
						<c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
							<td colspan="10" class="no_data" align="center">작성된 게시물이
								없습니다.</td>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${anonymous == 'true'}">
									<td colspan="4" class="no_data" align="center">작성된 게시물이
										없습니다.</td>
								</c:when>
								<c:otherwise>
									<td colspan="6" class="no_data" align="center">작성된 게시물이
										없습니다.</td>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:if>

		</tbody>
	</table>

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image"
			jsFunction="fn_egov_select_noticeList" />
	</div>

	<div class="t_center mt20">
		<c:if test="${brdMstrVO.userRegistPge!=null}">
			<a href="javascript:fn_egov_addNotice();" class="btn seablue">등록</a>
		</c:if>
	</div>

</div>
<!-- //contents -->
