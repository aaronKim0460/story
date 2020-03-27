<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>

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
	$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>");
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
		$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/deleteBoardArticle.do'/>");
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
	$('#frm').attr("action","<c:url value='/cop/bbs/forUpdateBoardArticle.do'/>");
	$('#frm').submit();
}

function fn_egov_addReply() {
	$('#frm').attr("method","post");
	$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/addReplyBoardArticle.do' />");
	$('#frm').submit();
}

function goPreNext(nttId) {
	$("#nttId").val(nttId);
	$('#frm').attr("method","get");
	$('#frm').attr("action","<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>");
	$('#frm').submit();	
}

</script>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<c:if test="${useComment == 'true'}">
<c:import url="/cop/cmt/selectCommentList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useSatisfaction == 'true'}">
<c:import url="/cop/stf/selectSatisfactionList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useScrap == 'true'}">
<script type="text/javascript">
	function fn_egov_addScrap() {
		$("form[name=frm]").attr("action","<c:url value='/cop/scp/addScrap.do'/>").submit();
	}
</script>
</c:if>
<form name="frm" id="frm" action ="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="post">
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
<div id="contents" class="con2">
	<h2 class="adminH2"><c:out value='${menuManageVO.menuNm }'/></h2>		
	<table class="bbs_default view" summary="{게시물 제목} 상세보기로, 제목, 내용 정보 제공" border="0">
		<caption>게시물 내용</caption>
		<colgroup>
			<col width="20%" />
			<col width="" />
			<col width="20%" />
			<col width="" />
		</colgroup>	
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td class="subject" colspan="3"><c:out value="${result.nttSj}" /></td>
			</tr>
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
					<c:choose>
						<c:when test="${result.bbsId eq 'BBSMSTR_000000000670' && result.cl3DetailCode != null}">
							<th scope="row"><c:out value='${brdMstrVO.cl2CodeNm}'/></th>
							<td><c:if test="${result.cl3DetailCode eq 'A'}">학생용</c:if><c:if test="${result.cl3DetailCode eq 'B'}">교사용</c:if></td>
							<c:if test="${empty brdMstrVO.cl1Code}">
								<td></td>
								<td></td>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${brdMstrVO.cl2Code!=null}">
								<th scope="row"><c:out value='${brdMstrVO.cl2CodeNm}'/></th>
								<td><c:out value="${result.cl2DetailCodeNm}" /></td>
								<c:if test="${empty brdMstrVO.cl1Code}">
									<td></td>
									<td></td>
								</c:if>
							</c:if>	
						</c:otherwise>
					</c:choose>
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
			<tr>
				<td class="substance" colspan="4">
					<c:out value="${result.nttCn}" escapeXml="false" />
				</td>
			</tr>
		</tbody>
	</table>
	
	<br>
	
	<table class="bbs_default view" summary="{게시물 제목} 상세보기로 부가 정보 제공" border="0">
		<caption>부가정보</caption>
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tbody>
			<c:if test="${!empty result.thumbFileId}">
				<tr>
					<th class="board-detail-file-th">썸네일</th>
					<td colspan="3" style="text-align: center;">
						<img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.thumbFileId}"/>'/></span>
					</td>
				</tr>
			</c:if>
			<c:if test="${param.bbsId ne 'BBSMSTR_000000000570' || param.bbsId ne 'BBSMSTR_000000000590'}">
			<tr>
				<th class="board-detail-file-th">첨부파일</th>			
				<td class="board-detail-file-td" colspan="3">
					<c:choose>
						<c:when test="${!empty brdMstrVO.cl1Code and brdMstrVO.cl1Code eq 'BCC6'}">
							<c:choose>
								<c:when test="${result.cl1DetailCode eq 'BCC601'}">
									<c:forEach var="row" items="${result.fileList}" varStatus="i">
										<img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>&fileSn=<c:out value="${row.fileSn}"/>'/></span>
									</c:forEach>
								</c:when>
								<c:when test="${result.cl1DetailCode eq 'BCC602'}">
									<c:forEach var="row" items="${result.fileList}" varStatus="i">
										<img src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>&fileSn=<c:out value="${row.fileSn}"/>'/></span>
									</c:forEach>
								</c:when>
								<c:when test="${result.cl1DetailCode eq 'BCC603'}">
									<c:forEach var="row" items="${result.fileList}" varStatus="i">
										<c:set var="fileSrc" value="${fn:split(row.fileStreCours, '/')}" />
										<c:set var="srcString"><c:out value="/upload/${fileSrc[5]}/${fileSrc[6]}/${row.streFileNm}" /></c:set>
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
								</c:when>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:import url="/cmm/fms/selectNoLoginFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.atchFileId}" />
							</c:import>		
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:if>
			<tr>
				<th scope="row">출처</th>
				<td><c:out value="${result.extStr5}" /></td>
			</tr>
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
						<td><c:out value="${result.extStr6}" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<c:if test="${!empty result.meterialName}">
				<tr>
					<th scope="row">유해인자</th>
					<td>
						<c:out value="${result.meterialName}" />
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	
	<br>
	
	<table class="bbs_default view" summary="{게시물 제목} 상세보기로 저작권 정보 제공" border="0">
		<caption>저작권정보</caption>
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">담당부서</th>
				<td><c:out value="${result.extStr7}" /></td>
			</tr>
			<tr>
				<th scope="row">게시일자</th>
				<td><c:out value="${result.ntceDateH}" /></td>
			</tr>
 			<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
 				<th scope="row"><label for=""><spring:message code="cop.noticeTerm" /></label></th>
 				<td>
 					<c:out value='${fn:replace(fn:substring(result.ntceBgnde,0,10),"-","")}'/> ~ <c:out value='${fn:replace(fn:substring(result.ntceEndde,0,10),"-","")}'/>
 				</td>
 			</c:if>
 			<tr>
				<th scope="row">공공누리</th>
				<td>
					<c:choose>
						<c:when test="${result.publicNuriTy eq 0}">사용안함</c:when>
						<c:when test="${result.publicNuriTy eq 1}"><strong>제1유형</strong> : 출처표시</c:when>
						<c:when test="${result.publicNuriTy eq 2}"><strong>제2유형</strong>: 출처표시+상업적 이용금지</c:when>
						<c:when test="${result.publicNuriTy eq 3}"><strong>제3유형</strong>: 출처표시+변경금지</c:when>
						<c:when test="${result.publicNuriTy eq 4}"><strong>제4유형</strong>: 출처표시+상업적 이용금지+변경금지</c:when>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
	
	<br>
	
	<table class="bbs_default view" summary="{게시물 제목} 상세보기로 검색엔진용 데이터 정보 제공" border="0">
		<caption>검색엔진용 데이터</caption>
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">Meta Descript</th>
				<td><c:out value="${result.extStr8}" /></td>
			</tr>
			<tr>
				<th scope="row">Meta Keyword</th>
				<td><c:out value="${result.extStr9}" /></td>
			</tr>
		</tbody>
	</table>
	
	<!-- 2009.06.29 : 2단계 기능 추가  -->
	<c:if test="${useComment == 'true'}">
		<c:import url="/cop/cmt/selectCommentList.do" charEncoding="utf-8">
			<c:param name="type" value="body" />
		</c:import>
	</c:if>
	
	<div class="conR">
		<div class="t_center">
			<c:choose>
				<c:when test="${searchVO.preview ne 'Y'}">
					<a href="javascript:fn_egov_select_noticeList('<c:out value='${boardVO.pageIndex }'/>')" class="btn gray">목록</a>
					<c:if test="${sessionUniqId != null && fn:length(sessionUniqId) > 0}">
					<a href="javascript:fn_egov_moveUpdt_notice()" class="btn seablue">수정</a>
					<a href="javascript:fn_egov_delete_notice()" class="btn orange">삭제</a>
					
					<c:if test="${result.replyPosblAt == 'Y' && result.parnts == '0'}">
				      <a href="javascript:fn_egov_addReply()" class="btn orange">답글작성</a>
		          	</c:if>
				    </c:if>
			    </c:when>
			    <c:otherwise>
			    	<a href="javascript:fn_egov_close_notice()" class="btn gray">닫기</a>
			    </c:otherwise>
		    </c:choose>
	    </div>
	    <dl class="conRList">
	    	<dt>기본정보</dt>
	    	<dd>
	    		<dl>
					<dt>작성자</dt>
					<dd><c:out value='${result.ntcrNm}'/></dd>
					<dt>등록일</dt>
					<dd><c:out value="${result.ntceDate}" /></dd>
					<dt>사용여부</dt>
					<dd>
						<c:choose>
							<c:when test="${result.confmSttus eq 'C'}">승인</c:when>
							<c:when test="${result.confmSttus eq 'R'}">승인 대기</c:when>
						</c:choose>
					</dd>
					<dt>공지여부</dt>
					<dd>
						<c:choose>
							<c:when test="${result.noticeAt eq '0'}">일반 게시물</c:when>
							<c:when test="${result.noticeAt eq '1'}">공지 게시물</c:when>
						</c:choose>
					</dd>
				</dl>
	    	</dd>
	    	<dt>키워드</dt>
	    	<dd><c:out value="${result.keywordTag}" /></dd>
	    	<dt>조회수</dt>
	    	<dd><c:out value="${result.inqireCo}" /></dd>
	    	<dt>이전글</dt>
	    	<dd>
	    		<c:choose>
					<c:when test="${result.preNttId != null}">
						<a href="javascript:goPreNext('<c:out value="${result.preNttId}"/>')"><c:out value="${result.preNttSj}" /></a>
					</c:when>
					<c:otherwise>
						이전 글이 존재하지 않습니다.
					</c:otherwise>
				</c:choose>
	    	</dd>
	    	<dt>다음글</dt>
	    	<dd>
	    		<c:choose>
					<c:when test="${result.nextNttId != null}">
						<a href="javascript:goPreNext('<c:out value="${result.nextNttId}"/>')"><c:out value="${result.nextNttSj}" /></a>
					</c:when>
					<c:otherwise>
						다음 글이 존재하지 않습니다.
					</c:otherwise>
				</c:choose>
	    	</dd>
    	</dl>
	</div>
</div><!-- //contents -->
</form>