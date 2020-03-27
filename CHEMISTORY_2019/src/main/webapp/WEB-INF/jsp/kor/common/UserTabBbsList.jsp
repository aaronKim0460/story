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

	// tab화면으로 이동
	function fn_move_tabList(tab) {
		$('#formTab').find('input[name="searchCl1DetailCode"]').val(tab);
		$('#formTab').attr("action","<c:url value='/user/cop/bbs/selectBoardList.do'/>");
		$('#formTab').submit();
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

<form id="downForm" name="downForm" method="post">
	<input type="hidden" name="atchFileId" />
</form>

<div style="width: 0px; height: 0px; display: none;">
	<iframe name="fileDown" title="fileDown"></iframe>
</div>

<div id="contents">
	<form name="frm" id="frm" action ="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="post">
	<c:if test="${!empty brdMstrVO.cl1Code}">
		<div class="contentTab">
			<ul class="Tab01">
				<c:forEach var="row" items="${codeList}" varStatus="i">
					<c:set var="onClass" value="" />
					<c:if test="${row.code eq searchVO.searchCl1DetailCode}">
						<input type="hidden" name="searchCl1DetailCode" value="<c:out value="${row.code}" />">
						<c:set var="onClass" value="on" />
					</c:if>
					<li><a class="<c:out value="${onClass}" />" href="javascript:fn_move_tabList('<c:out value="${row.code}" />');"><c:out value="${row.codeNm}" /></a></li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	
	
	<div class="tableBtn clearfix margin_t_25">
		<div class="btn_left">
			총 <span class="point"><c:out value='${paginationInfo.totalRecordCount }'/></span>건, 현재페이지 <span class="point"><c:out value='${paginationInfo.currentPageNo }'/></span>/<c:out value='${paginationInfo.totalPageCount }'/>
		</div>
		<input type="hidden" name="bbsId" id="bbsId"  value="<c:out value='${boardVO.bbsId}'/>" />
		<input type="hidden" name="nttId" id="nttId"  value="0" />
		<input type="hidden" name="bbsTyCode" id="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
		<input type="hidden" name="bbsAttrbCode" id="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
		<input type="hidden" name="authFlag" id="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
		<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
		
		<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />	
							
		<div class="btn_right">
			<div class="board_search">
				<%-- <fieldset>
					<span>
						유해인자 물질명
						<input id="searchKname" name="searchKname" type="text" value='<c:out value="${searchVO.searchKname}"/>' class="text" title="검색어 입력" onkeypress="press(event);"/>
					</span>
					<span>
						유해인자 CAS번호
						<input id="searchCas" name="searchCas" type="text" value='<c:out value="${searchVO.searchCas}"/>' class="text" title="검색어 입력" onkeypress="press(event);"/>
					</span>					
				</fieldset> --%>
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
				</fieldset>
			</div>
		</div>
		</form>
	</div>
	
	<c:choose>
		<c:when test="${fn:length(resultList) gt 0}">
			<c:choose>
				<c:when test="${!empty brdMstrVO.cl1Code && brdMstrVO.cl1Code eq 'BCC4'}">
					<c:choose>
						<c:when test="${searchVO.searchCl1DetailCode eq 'BCC403'}">
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
									<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
										<col style="width: 10%" />
										<col style="width: 10%" />
									</c:if>
									<col style="width: 12%" />
									<col style="width: 6.5%" />
									<col style="width: 6.5%" />
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
														<c:if test="${userAuthority != null && result.publicNuriTy != null && result.publicNuriTy != '0'  && result.publicNuriTy != ''}">
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
										<td class="board-default-td-date"><c:out value="${result.ntceDate}" /></td>
										<c:choose>
											<c:when test="${result.atchFileId == '' || result.atchFileId == null }">
												<td class="board-default-td-attach">&nbsp;</td>
											</c:when>
											<c:otherwise>
												<td class="board-default-td-attach ac">
													<a href="#" name="down_file_all" fileinfo="<c:out value='${result.atchFileId}'/>">
														<img src="/assets/kor/images/bbs/ic_addfile.gif" alt="첨부파일" />
													</a>
												</td>
											</c:otherwise>
										</c:choose>
						
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
						</c:when>
						<c:otherwise>
							<div class="newsletter list">
								<ul>
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<li class="margin_left">
											<a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
													onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
											<!--썸네일로 변경 - 뒤에 파라미터 썸네일 Y 전송시 썸네일 다운 -->
											<h3 style="height: 35px; padding: 0px 15px; margin-bottom:5px; overflow:hidden;">
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
											<%--<div class="galleryBBox">
												<p class="date"><c:out value="${result.ntceDate}" /></p>
												<span class="subject">
													<span class="view"><img src="<c:url value='/assets/kor/images/bbs/ico_view.png'/>" alt="조회수" />111111111111<c:out value="${result.inqireCo}"/></span>
												</span>
											</div> --%>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<div class="newsletter list">
						<ul>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<li class="margin_left">
									<a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
											onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">
									<!--썸네일로 변경 - 뒤에 파라미터 썸네일 Y 전송시 썸네일 다운 -->
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
				</c:otherwise>
			</c:choose>
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
	
	<form name="formTab" id="formTab" action="" method="post">
		<input type="hidden" name="bbsId" id="bbsId"  value="<c:out value='${boardVO.bbsId}'/>" />
		<input type="hidden" name="searchCl1DetailCode" value="" />
		<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
	</form>
</div>