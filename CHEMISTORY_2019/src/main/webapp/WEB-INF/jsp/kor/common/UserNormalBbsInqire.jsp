<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp" %>
</c:if>
<link rel="stylesheet" type="text/css" href="/assets/kor/css/common.css" />
<link rel="stylesheet" type="text/css" href="/assets/kor/css/board.css" />
<script type="text/javascript">

$(document).ready(function(){
	onloading();
});
function onloading() {
	if ("<c:out value='${msg}'/>" != "") {
		alert("<c:out value='${msg}'/>");
	}
	<c:if test="${searchVO.preview eq 'Y'}">$(".fileArea").css({"width" : "100%" });</c:if>
}

function fn_egov_select_noticeList() {
	$('#frm').attr("action","<c:url value='/user/cop/bbs/selectBoardList.do'/>");
	$('#frm').submit();
}

function fn_egov_close_notice() {
	self.close();
}

function fn_egov_delete_notice() {
	if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
		alert('등록시 사용한 패스워드를 입력해 주세요.');
		$('#password').focus();
		return;
	}

	if (confirm('<spring:message code="common.delete.msg" />')) {
		$('#frm').attr("method","post");
		$('#frm').attr("action","<c:url value='/user/cop/bbs${prefix}/deleteBoardArticle.do'/>");
		$('#frm').submit();
	}
}

function fn_egov_moveUpdt_notice() {
	if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
		alert('등록시 사용한 패스워드를 입력해 주세요.');
		$('#password').focus();
		return;
	}
	$('#frm').attr("method","post");
	$('#frm').attr("action","<c:url value='/user/cop/bbs/forUpdateBoardArticle.do'/>");
	$('#frm').submit();
}

function fn_egov_addReply() {
	$('#frm').attr("method","post");
	$('#frm').attr("action","<c:url value='/user/cop/bbs${prefix}/addReplyBoardArticle.do' />");
	$('#frm').submit();
}

function goPreNext(nttId) {
// 	alert(nttId);
	$("#nttId").val(nttId);
	$('#frm').attr("method","post");
	$('#frm').attr("action","<c:url value='/user/cop/bbs${prefix}/selectBoardArticle.do'/>");
	$('#frm').submit();	
}

</script>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<c:if test="${useComment == 'true'}">
<c:import url="/user/cop/cmt/selectCommentList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useSatisfaction == 'true'}">
<c:import url="/user/cop/stf/selectSatisfactionList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useScrap == 'true'}">
<script type="text/javascript">
	function fn_egov_addScrap() {
		$("form[name=frm]").attr("action","<c:url value='/user/cop/scp/addScrap.do'/>").submit();
	}
</script>
</c:if>
<form name="frm" id="frm" action ="<c:url value='/user/cop/bbs${prefix}/selectBoardList.do'/>" method="post">
<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
<input type="hidden" name="bbsId" id="bbsId" value="<c:out value='${result.bbsId}'/>" />
<input type="hidden" name="nttId" id="nttId" value="<c:out value='${result.nttId}'/>" />
<input type="hidden" name="parnts" id="parnts" value="<c:out value='${result.parnts}'/>" />
<input type="hidden" name="sortOrdr" id="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" />
<input type="hidden" name="replyLc" id="replyLc" value="<c:out value='${result.replyLc}'/>" />
<input type="hidden" name="nttSj" id="nttSj" value="<c:out value='${result.nttSj}'/>" />

<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />

<input type="hidden" name="searchCnd" id="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>" />
<input type="hidden" name="searchWrd" id="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" />
<input type="hidden" name="searchCl1DetailCode" id="searchCl1DetailCode" value="<c:out value='${searchVO.searchCl1DetailCode}'/>" />
<input type="hidden" name="searchCl2DetailCode" id="searchCl2DetailCode" value="<c:out value='${searchVO.searchCl2DetailCode}'/>" />

<div id="contents" class="con2">		
	<table class="bbs_default view" summary="{게시물 제목} 상세보기로, 제목, 내용 정보 제공" border="0">
		<caption>게시물 내용</caption>
		<colgroup>
			<col width="150px" />
			<col width="" />
			<col width="150px" />
			<col width="" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td class="subject" colspan="3"><c:out value="${result.nttSj}" /></td>
			</tr>
			
			result=${result}
			
			<tr>
				<th>조회수</th>
				<td><c:out value="${result.inqireCo}" /></td>
				<th>등록일</th>
				<td><c:out value="${result.ntceDate}" /></td>
			</tr>
			<c:if test="${fn:length(result.extStr5) > 0}"><!-- 출처 노출 여부 -->
			<tr>
				<th scope="row">출처</th>
				<td colspan="3"><c:out value="${result.extStr5}" /></td>
			</tr>
			</c:if>
			<!--  
			<tr>
				<th scope="row">링크</th>
				<c:choose>
					<c:when test="${fn:startsWith(result.extStr6, '/common/game')}">
						<td>
							<a href="<c:url value="${result.extStr6}" />" onclick="window.open(this.href, '', 'width=560, height=420, scrollbars=no'); return false;" onkeypress="window.open(this.href, '', 'width=560, height=420, scrollbars=yes'); return false;"><c:out value="${result.extStr6}" /></a>
						</td>
					</c:when>
					<c:when test="${fn:startsWith(result.extStr6, '/common/edu') and fn:indexOf(result.extStr6, 'flash') >= 0}">
						<td>
							<a href="<c:url value="${result.extStr6}" />" onclick="window.open(this.href, '', 'width=567, height=460, scrollbars=no'); return false;" onkeypress="window.open(this.href, '', 'width=567, height=460, scrollbars=yes'); return false;"><c:out value="${result.extStr6}" /></a>
						</td>
					</c:when>
					<c:when test="${fn:startsWith(result.extStr6, '/common/edu') and fn:indexOf(result.extStr6, 'flash') < 0}">
						<td>
							<a href="<c:url value="${result.extStr6}" />" onclick="window.open(this.href, '', 'width=567, height=708, scrollbars=no'); return false;" onkeypress="window.open(this.href, '', 'width=567, height=708, scrollbars=yes'); return false;"><c:out value="${result.extStr6}" /></a>
						</td>
					</c:when>
					<c:when test="${fn:startsWith(result.extStr6, '/common/webtoon')}">
						<td>
							<a href="<c:url value="${result.extStr6}" />" onclick="window.open(this.href, '', 'width=510, height=768, scrollbars=no'); return false;" onkeypress="window.open(this.href, '', 'width=510, height=768, scrollbars=yes'); return false;"><c:out value="${result.extStr6}" /></a>
						</td>
					</c:when>
					<c:otherwise>
						<td colspan="3"><c:out value="${result.extStr6}" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
			-->
			<c:if test="${(brdMstrVO.cl1Code!=null) or (brdMstrVO.cl2Code!=null)}">
				<tr>
					<c:if test="${brdMstrVO.cl1Code!=null}">
						<th scope="row"><c:out value='${brdMstrVO.cl1CodeNm}'/></th>
						<td><c:out value="${result.cl1DetailCodeNm}" /></td>
						<c:if test="${empty brdMstrVO.cl2Code}">
							<td></td>
							<td></td>
						</c:if>
					</c:if>
					<c:if test="${brdMstrVO.cl2Code!=null}">
						<th scope="row"><c:out value='${brdMstrVO.cl2CodeNm}'/></th>
						<td><c:out value="${result.cl2DetailCodeNm}" /></td>
						<c:if test="${empty brdMstrVO.cl1Code}">
							<td></td>
							<td></td>
						</c:if>
					</c:if>
				</tr>
			</c:if>
			<c:if test="${brdMstrVO.etc0ClNm != null && brdMstrVO.etc0ClNm != ''}">
				<tr>
					<th scope="row"><c:out value='${brdMstrVO.etc0ClNm}'/></th>
					<td colspan="3"><c:out value="${result.extStr0}" /></td>
				</tr>
			</c:if>
			<c:if test="${brdMstrVO.etc1ClNm != null && brdMstrVO.etc1ClNm != ''}">
				<tr>
					<th scope="row"><c:out value='${brdMstrVO.etc1ClNm}'/></th>
					<td colspan="3"><c:out value="${result.extStr1}" /></td>
				</tr>
			</c:if>
			<c:if test="${brdMstrVO.etc2ClNm != null && brdMstrVO.etc2ClNm != ''}">
				<tr>
					<th scope="row"><c:out value='${brdMstrVO.etc2ClNm}'/></th>
					<td colspan="3"><c:out value="${result.extStr2}" /></td>
				</tr>
			</c:if>
			<c:if test="${brdMstrVO.etc3ClNm != null && brdMstrVO.etc3ClNm != ''}">
				<tr>
					<th scope="row"><c:out value='${brdMstrVO.etc3ClNm}'/></th>
					<td colspan="3"><c:out value="${result.extStr3}" /></td>
				</tr>
			</c:if>
			
			<c:choose>
				<c:when test="${!empty brdMstrVO.cl1Code and brdMstrVO.cl1Code eq 'BCC6'}">
					<c:choose>
						<c:when test="${result.cl1DetailCode eq 'BCC601'}">
							<c:forEach var="row" items="${result.fileList}" varStatus="i">
								<tr><td colspan="4">
								<img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>&fileSn=<c:out value="${row.fileSn}"/>' style='max-width:800px;' /></span>
								</td></tr>
							</c:forEach>
						</c:when>
						<c:when test="${result.cl1DetailCode eq 'BCC602'}">
							<tr><td colspan="4">
								<script type="text/javascript">
									var wN, iN;
									var sStart = 0;
									$(function(){
										wN = $(".storyBookBox").width();
										iN = $(".storyBookBox").find(".storyBImg").length;
										$(".storyBookBox ul").css("width",wN*iN);
										$(".storyBookBox li").css("width",wN);
									});
									function storyS(n){
										wN = $(".storyBookBox").width();
										iN = $(".storyBookBox").find(".storyBImg").length;
										if(n == "prev"){
											if(sStart == 0){
												alert("첫 페이지입니다.");
											}else{
												sStart--;
											}
										}else{
											if(sStart == iN-1){
												alert("마지막 페이지입니다.");
											}else{
												sStart++;
											}
										}
										$(".storyBookBox ul").stop().animate({"margin-left":-(wN*sStart)},300);
									}
								</script>
								<div class="storyBookBox">
									<div class="storyBookBuL">
										<a href="javascript:storyS('prev')"><img src="/assets/kor/images/newMain/bu_prev_m.png" alt="장면 뒤로가기"/><a/>
									</div>
									<div class="storyBookBuR">
										<a href="javascript:storyS('next')"><img src="/assets/kor/images/newMain/bu_next_m.png" alt="장면 앞으로가기"/></a>
									</div>
									<ul>
								<c:forEach var="row" items="${result.fileList}" varStatus="i">
								<li><img class="storyBImg" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>&fileSn=<c:out value="${row.fileSn}"/>' /></span></li>
								</c:forEach>
									</ul>
								</div>
							</td></tr>
						</c:when>
						<c:when test="${result.cl1DetailCode eq 'BCC603'}">
							<tr><td colspan="4">
							<c:forEach var="row" items="${result.fileList}" varStatus="i">
								<c:set var="fileSrc" value="${fn:split(row.fileStreCours, '/')}" />
								<c:set var="srcString"><%=request.getContextPath().split("/user/cop/bbs/")[0]%><c:out value="/${fileSrc[6]}/${fileSrc[7]}/${fileSrc[8]}/${row.streFileNm}" /></c:set>
								<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="520" height="334">
									<param name="movie" value="<c:out value="${srcString}" />" />
									<param name="wmode" value="transparent" />
									<!--[if !IE]> <-->
									<object type="application/x-shockwave-flash" data="<c:out value="${srcString}" />" width="634" height="480">
									<param name="wmode" value="transparent" />
										<p><c:out value="${result.cl1DetailCodeNm}" /></p>
									</object>
									<!--> <![endif]-->
								</object>
							</c:forEach>
							</td></tr>
						</c:when>
					</c:choose>
				</c:when>
				<c:otherwise>
				<!--<c:if test="${!(result.bbsId eq 'BBSMSTR_000000000591' || result.bbsId eq 'BBSMSTR_000000000590')}">-->
					<c:choose>
						<c:when test="${fn:length(result.atchFileId) ne 0}">
							<tr>
								<th class="board-detail-file-th">첨부파일</th>			
								<td class="board-detail-file-td" colspan="3">
								<c:import url="/cmm/fms/selectNoLoginFileInfs.do" charEncoding="utf-8">
									<c:param name="param_atchFileId" value="${result.atchFileId}" />
								</c:import>	
								</td>
							</tr>	
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				<!--</c:if>-->
				</c:otherwise>
			</c:choose>
				
			<tr>
				<td class="substance" colspan="4">
					<c:out value="${result.nttCn}" escapeXml="false" />
				</td>
			</tr>
			<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
 				<th scope="row"><label for=""><spring:message code="cop.noticeTerm" /></label></th>
 				<td>
 					<c:out value='${fn:replace(fn:substring(result.ntceBgnde,0,10),"-","")}'/> ~ <c:out value='${fn:replace(fn:substring(result.ntceEndde,0,10),"-","")}'/>
 				</td>
 			</c:if>
 			<c:if test="${result.extStr5 ne null || fn:length(result.extStr5) > 0}">
 			<tr>
 				<th scope="row">원문보러가기</th>
				<td><a href="${result.extStr6}">${result.extStr5}</a></td>
 			</tr>
 			</c:if>
 			<c:if test="${result.publicNuriTy ne null || result.publicNuriTy > 0}">
 			<tr>
				<th scope="row">공공누리</th>
				<td colspan="4">
					<c:choose>
						<c:when test="${result.publicNuriTy eq null || result.publicNuriTy eq 0}">사용안함</c:when>
						<c:when test="${result.publicNuriTy eq 1}"><strong>제1유형</strong> : 출처표시</c:when>
						<c:when test="${result.publicNuriTy eq 2}"><strong>제2유형</strong>: 출처표시+상업적 이용금지</c:when>
						<c:when test="${result.publicNuriTy eq 3}"><strong>제3유형</strong>: 출처표시+변경금지</c:when>
						<c:when test="${result.publicNuriTy eq 4}"><strong>제4유형</strong>: 출처표시+상업적 이용금지+변경금지</c:when>
					</c:choose>
				</td>
			</tr>
			</c:if>
			<c:if test="${result.keywordTag ne null || fn:length(result.keywordTag) > 0}">
			<tr>
				<th scope="row">키워드</th>
				<td id="keywordTag">${result.keywordTag}</td>
			</tr>
			</c:if>
		</tbody>
	</table>
	<br/>
	<table class="bbs_default view" summary="{게시물 제목} 상세보기로 저작권 정보 제공" border="0">
		<caption>저작권정보</caption>
		<colgroup>
			<col width="150px" />
			<col width="" />
		</colgroup>
		<tbody>
 			<tr>
				<th>이전글</th>
				<td>
					<c:choose>
						<c:when test="${result.preNttId != null}">
							<a href="javascript:goPreNext('<c:out value="${result.preNttId}"/>')"><c:out value="${result.preNttSj}" /></a>
						</c:when>
						<c:otherwise>
							이전 글이 존재하지 않습니다.
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>다음글</th>
				<td>
					<c:choose>
						<c:when test="${result.nextNttId != null}">
							<a href="javascript:goPreNext('<c:out value="${result.nextNttId}"/>')"><c:out value="${result.nextNttSj}" /></a>
						</c:when>
						<c:otherwise>
							다음 글이 존재하지 않습니다.
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="buttonBox ac">
		<a href="javascript:fn_egov_select_noticeList('<c:out value='${boardVO.pageIndex }'/>')" class="btn gray">목록</a>
	</div>
	<!-- 2009.06.29 : 2단계 기능 추가  -->
	<c:if test="${useComment == 'true'}">
		<c:import url="/user/cop/cmt/selectCommentList.do" charEncoding="utf-8">
			<c:param name="type" value="body" />
		</c:import>
	</c:if>
	
</div><!-- //contents -->
</form>