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

	function fn_egov_addNotice() {
		document.frm.action = "<c:url value='/cop/bbs${prefix}/addNierBoardArticle.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_noticeList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs${prefix}/selectNoLoginBoardList.do'/>";
		document.frm.submit();
	}

	function fn_egov_inqire_notice(nttId, bbsId) {
		$('#nttId').val(nttId);
		$('#bbsId').val(bbsId);
		$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/selectNoLoginBoardArticle.do'/>");
		$('#frm').submit();
	}
//-->

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
	<c:choose>
	<c:when test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
	<div class="tableBtn clearfix">
		<div class="btn_left big">
			총 <span class="point"><c:out value='${paginationInfo.totalRecordCount }'/></span>건, 현재페이지 <span class="point"><c:out value='${paginationInfo.currentPageNo }'/></span>/<c:out value='${paginationInfo.totalPageCount }'/>
		</div>

		<div class="btn_right">
			<div class="board_search">
			<form name="frm" id="frm" action ="<c:url value='/cop/bbs${prefix}/selectNoLoginBoardList.do'/>" method="get">
				<input type="hidden" name="bbsId" id="bbsId"  value="<c:out value='${boardVO.bbsId}'/>" />
				<input type="hidden" name="nttId" id="nttId"  value="0" />
				<input type="hidden" name="bbsTyCode" id="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
				<input type="hidden" name="bbsAttrbCode" id="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
				<input type="hidden" name="authFlag" id="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
				<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
				
				<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
				<fieldset>
					<legend>분류</legend>
					<span>
					<select name="searchCnd" id="div100" class="select_list" style="width:120px">
						<option id="div100f" value="-1" selected="selected">전체</option>
						<option value="01" >과학원30년사</option>
						<option value="02" >애뉴얼레포트</option>
						<option value="03" >뉴스 및 보도</option>
					</select>
					</span>
					<span>
					<input type="image" src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" onclick="fn_egov_select_noticeList('1'); return false;"/>
					</span>
				</fieldset>
			</form>
			</div>
		</div>
	</div>
 
	<table class="bbs_default list">
		<colgroup>
			<col style="width:7%" />
			<col />
			<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
			<col style="width:11%" />
			<col style="width:11%" />
			</c:if>
			<c:if test="${userAuthority != null }">
				<col style="width:10%" />
			</c:if>
			<col style="width:14%" />
			<col style="width:14%" />
		</colgroup>
		<thead>
			<tr>
			  <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
				<th class="board-default-th-no">번호</th>
				<th class="board-default-th-title">제목</th>
				<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
				<th>게시시작일</th>
				<th>게시종료일</th>
				</c:if>
				<c:if test="${userAuthority != null }">
					<th class="board-default-th-name">승인상태</th>
				</c:if>
				<th class="board-default-th-hit">분류</th>
				<th class="board-default-th-date">등록일</th>
			</tr>
		</thead>

		<tbody id="body_list" class="t_center list">
	 	<c:forEach var="result" items="${resultList}" varStatus="status">
			<c:choose>
			    <c:when test="${result.noticeAt == 1 }">
					<tr class="notice">
	    				<td><img src="/assets/kor/images/bbs/ico_notice.png" alt="공지" /></td>
			    </c:when>
			    <c:otherwise>
					<tr>
						<td><c:out value="${paginationInfo.totalRecordCount - ((searchVO.pageIndex -1)* searchVO.pageSize + status.index)}"/></td>
			    </c:otherwise>
			</c:choose>
			    
		    <td class="subject">
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
								<span style="text-decoration:line-through;color:red"><c:out value='${result.nttSj}'/></span>
							</c:when>
							<c:otherwise>
								<c:out value='${result.nttSj}'/>
							</c:otherwise>
						</c:choose>
						
						<c:if test="${userAuthority != null && result.publicNuriTy != '0' && result.publicNuriTy != ''}">
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
				    		<a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
							onclick="javascript:fn_egov_inqire_notice('<c:out value='${result.nttId}'/>','<c:out value='${result.bbsId}'/>'); return false;">	
								<c:choose>
									<c:when test="${result.useAt == 'N'}">
										<a href="#" class="btn-sm btn-warning">삭제</a>
										<span style="text-decoration:line-through;color:red"><c:out value='${result.nttSj}'/></span>
									</c:when>
									<c:otherwise>
										<c:out value='${result.nttSj}'/>
									</c:otherwise>
								</c:choose>
								
								<c:if test="${userAuthority != null && result.publicNuriTy != '0' && result.publicNuriTy != ''}">
									<img src="<c:url value='/images/common/bbs_mark_open${result.publicNuriTy}.png'/>" alt="제${result.publicNuriTy}유형" class="bbs_markImg" />
								</c:if>
							</a>
		    		</c:otherwise>
		    	</c:choose>
				</td>
		   		<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
			    <td><c:out value="${result.ntceBgnde}"/></td>
			    <td><c:out value="${result.ntceEndde}"/></td>
		   		</c:if>
		   		
		   		<c:if test="${userAuthority != null }">
					<td class="board-default-td-name">
						<c:choose>
							<c:when test="${result.confmSttus == 'C'}">
								승인
							</c:when>
							<c:when test="${result.confmSttus == 'R'}">
								<span style="color:red">승인대기</span>
							</c:when>
							<c:otherwise>
								<span style="color:red">확인불가</span>
							</c:otherwise>
						</c:choose>
					</td>
				</c:if>
				
			   	<td class="board-default-td-hit">
			   	<c:choose>
			   		<c:when test="${result.extStr9 == '01' }">
			   			과학원30년사
			   		</c:when>
			   		<c:when test="${result.extStr9 == '03' }">
			   			뉴스 및 보도
			   		</c:when>
			   		<c:otherwise>
			   			애뉴얼레포트
			   		</c:otherwise>
			   	</c:choose>
			   	</td>
		    	<td class="board-default-td-date"><c:out value="${result.ntceDate}"/></td>
		  	</tr>
		 	</c:forEach>
		 	<c:if test="${fn:length(resultList) == 0}">
			<tr>
			   	<c:choose>
			   		<c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
			   			<td class="subject" colspan="7" ><spring:message code="common.nodata.msg" /></td>
			   		</c:when>
			   		<c:otherwise>
			   			<c:choose>
			   				<c:when test="${anonymous == 'true'}">
				    			<td class="subject" colspan="4" ><spring:message code="common.nodata.msg" /></td>
				    		</c:when>
				    		<c:otherwise>
				    			<td class="subject" colspan="5" ><spring:message code="common.nodata.msg" /></td>
				    		</c:otherwise>
				    	</c:choose>
			   		</c:otherwise>
			   	</c:choose>
			</tr>
		 	</c:if>
		</tbody>
	</table>

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
	</div>
	
	<div class="board-detail-foot">
	  	 <div class="btns clear fr">
			<c:if test="${brdMstrVO.authFlag == 'Y' && sessionUniqId != null}">
			<a href="javascript:fn_egov_addNotice(); " class="btn btn-primary">등록</a>
			</c:if>
		</div>
	</div>	
	</c:when>
	<c:otherwise>
	
			<form name="frm" id="frm" action ="<c:url value='/cop/bbs${prefix}/selectNoLoginBoardList.do'/>" method="get">
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
			</div>
			</form>
			<div class="movie event">
				<ul class="list">
					<c:forEach var="result" items="${resultList}" varStatus="status">
					<li class="clearfix"><span class="photo">
					<a href="#/cop/bbs/selectBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=<c:out value='${menuManageVO.menuNo}'/>" title="<c:out value="${result.nttSj}"/>" 
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
							<c:out value="${result.extStr5}" escapeXml="false" />
							</p>
							<span class="txt"><c:out value='${result.ntceDate}'/></span>
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
