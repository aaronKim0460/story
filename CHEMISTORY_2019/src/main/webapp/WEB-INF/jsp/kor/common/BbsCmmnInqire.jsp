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
<form name="frm" id="frm" action ="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="get">
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

<div id="contents">		
	<c:choose>
	<c:when test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
	<table class="bbs_default view" summary="{게시물 제목} 상세보기로, 제목, 작성자, 내용, 첨부파일등 정보 제공" border="0">
		<colgroup>
			<col width="10%" />
			<col width="23%" />
			<col width="10%" />
			<col width="24%" />
			<col width="10%" />
			<col width="23%" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td class="subject" colspan="3"><c:out value="${result.nttSj}" /></td>
			</tr>
			<c:if test="${brdMstrVO.cl1Code!=null}">
			<tr>
				<th scope="row"><c:out value='${brdMstrVO.cl1CodeNm}'/></th>
				<td colspan="3"><c:out value="${result.cl1DetailCodeNm}" /></td>
			</tr>
			</c:if>
			<c:if test="${brdMstrVO.cl2Code!=null}">
			<tr>
				<th scope="row"><c:out value='${brdMstrVO.cl2CodeNm}'/></th>
				<td colspan="3"><c:out value="${result.cl2DetailCodeNm}" /></td>
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
				<th scope="row">등록일</th>
				<td><c:out value="${result.ntceDate}" /></td>
				<th scope="row">조회수</th>
				<td><c:out value="${result.inqireCo}" /></td>
			</tr>
									
			<tr>
				<th class="board-detail-file-th">첨부파일</th>			
				<td class="board-detail-file-td" colspan="3">
					<c:import url="/cmm/fms/selectNoLoginFileInfs.do" charEncoding="utf-8">
						<c:param name="param_atchFileId" value="${result.atchFileId}" />
					</c:import>		
				</td>
			</tr>
			<tr>
				<td class="substance" colspan="4">
					<c:out value="${result.nttCn}" escapeXml="false" />
				</td>
			</tr>
			<tr>
				<th scope="row"><span>이전 글</span></th>
				<td colspan="3">
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
				<th scope="row" ><span>다음 글</span></th>
				<td colspan="3">
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

   	<div class="t_center mt20">
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
	
	</c:when>
	<c:otherwise>
	
	<table class="bbs_default view" summary="상세보기로, 제목, 작성자, 내용, 첨부파일 등 정보제공" border="0">
	<caption></caption>
    <colgroup>
    	<col width="15%" />
        <col width="19%" />
        <col width="15%" />
        <col width="19%" />
        <col width="15%" />
        <col width="19%" />
    </colgroup>
    <thead>
    <tr>
    	<th colspan="6"><c:out value="${result.nttSj}" /></th>
    </tr>	
    </thead>
    <tbody>
	<c:choose>
	<c:when test="${brdMstrVO.bbsTyCode eq 'BBST11' }">
	<c:choose>
	<c:when test="${result.bbsId eq 'BBSMSTR_000000000231'}">
    <tr>
    	<th scope="row">담당부서</th>
        <td><c:out value="${result.extStr0}"/></td>
        <th scope="row">담당자</th>
        <td><c:out value="${result.extStr1}" /></td>
        <th scope="row">연락처</th>
        <td><c:out value="${result.extStr8}" />&nbsp;</td>
    </tr>	
	</c:when>
	<c:otherwise>
    <tr>
    	<th scope="row">담당자</th>
        <td><c:out value="${result.extStr1}"/></td>
        <th scope="row">등록일</th>
        <td><c:out value="${result.ntceDate}" /></td>
        <th scope="row">조회수</th>
        <td><c:out value="${result.inqireCo}" /></td>
    </tr>	
	</c:otherwise>
	</c:choose>
	</c:when>
	
	<c:otherwise>
		<c:choose>
			<c:when test="${result.bbsId eq 'BBSMSTR_000000000026' || result.bbsId eq 'BBSMSTR_000000000012' || result.bbsId eq 'BBSMSTR_000000000022' }">
				<tr>
					<th scope="row">담당부서</th>
        			<td><c:out value="${result.extStr0}"/></td>
					<th scope="row">담당자</th>
					<td>
						<c:choose>
					    	<c:when test="${anonymous == 'true'}">
					    		******
					    	</c:when>
					    	<c:when test="${result.ntcrNm == null || result.ntcrNm == ''}">
					    		<c:out value="${result.frstRegisterNm}" />
					    	</c:when>
					    	<c:otherwise>
					    		<c:out value="${result.ntcrNm}" />
					    	</c:otherwise>
					    </c:choose>
					</td>
			        <th scope="row">등록일</th>
			        <td><c:out value="${result.ntceDate}" /></td>
			    </tr>
			    <tr>
			    	<c:if test="${result.bbsId eq 'BBSMSTR_000000000026'}">
					    <th scope="row">분류</th>
				        <td><c:out value="${result.extStr2}" /></td>
			        </c:if>
			    	<th scope="row">조회수</th>
			        <td colspan="3"><c:out value="${result.inqireCo}" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th scope="row">담당자</th>
					<td>
						<c:choose>
					    	<c:when test="${anonymous == 'true'}">
					    		******
					    	</c:when>
					    	<c:when test="${result.ntcrNm == null || result.ntcrNm == ''}">
					    		<c:out value="${result.frstRegisterNm}" />
					    	</c:when>
					    	<c:otherwise>
					    		<c:out value="${result.ntcrNm}" />
					    	</c:otherwise>
					    </c:choose>
					</td>
			        <th scope="row">등록일</th>
			        <td><c:out value="${result.ntceDate}" /></td>
			        <th scope="row">조회수</th>
			        <td><c:out value="${result.inqireCo}" /></td>
			    </tr>
			    <tr>
					<th scope="row">담당부서</th>
        			<td colspan="3"><c:out value="${result.extStr0}"/></td>
        		</tr>	
			</c:otherwise>
		</c:choose>
	</c:otherwise>
	</c:choose>
    <tr>
    	<c:choose>
	    	<c:when test="${result.bbsId eq 'BBSMSTR_000000000231'}">
	    	<th scope="row">민원서식</th>
	    	</c:when>
	    	<c:otherwise>
			<th scope="row">첨부파일</th>
	    	</c:otherwise>
    	</c:choose>
        <td colspan="3">
			<c:import url="/cmm/fms/selectNoLoginFileInfs.do" charEncoding="utf-8">
				<c:param name="param_atchFileId" value="${result.atchFileId}" />
				<c:param name="userTp" value="userTp" />
			</c:import>
        </td>
    </tr>
    <tr>
    	<td colspan="6" class="substance"><c:out value="${result.nttCn}" escapeXml="false" /></td>
    </tr>
    <tr class="linetop">
    	<th scope="row">이전</th>
        <td colspan="3">
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
    <tr class="linebot">
    	<th scope="row">다음</th>
        <td colspan="3">
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
    <div class="btnBoth">
    	<%@ include file="/WEB-INF/jsp/kor/kor_sns.jsp" %>
        <div class="btnRight">
			<c:choose>
				<c:when test="${searchVO.preview ne 'Y'}">
		        	<a href="javascript:fn_egov_select_noticeList();" class="btn02 btndarkgray"><img src="/assets/kor/images/bbs/ic_list.gif" alt="목록" /> 목록보기</a>
		        	<!-- <a href="" class="btn02 btndarkgray"><img src="/assets/kor/images/bbs/ic_print.gif" alt="인쇄" /> 인쇄</a> -->
			    </c:when>
			    <c:otherwise>
			    	<a href="javascript:fn_egov_close_notice()" class="btn gray">닫기</a>
			    </c:otherwise>
		    </c:choose>
        </div>
    </div>			
    </c:otherwise>
	</c:choose>
	
	<!-- 2009.06.29 : 2단계 기능 추가  -->
	<c:if test="${useComment == 'true'}">
		<c:import url="/cop/cmt/selectCommentList.do" charEncoding="utf-8">
			<c:param name="type" value="body" />
		</c:import>
	</c:if>
</div><!-- //contents -->
</form>