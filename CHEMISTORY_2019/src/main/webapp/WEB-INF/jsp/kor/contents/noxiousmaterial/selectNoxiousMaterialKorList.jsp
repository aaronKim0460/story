<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">	
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
doDetail = function(idx){
	document.detailForm.idx.value = idx;
	
	var newPop = document.detailForm;
	var url = "<c:url value='/kor/contents/noxiousmaterial/detailNoxiousMaterialKor.do'/>";
	 
	var status = "width=600, height=650, top=30, left=60, resizable=yes, scrollbars=yes"; 
	window.open("","detailForm",status);
	
	newPop.action =url; 
	newPop.method="post";
	newPop.target="detailForm";
	newPop.submit();	
};

doGoNoxInfo = function(idx){
	document.infoForm.searchIdx.value = idx;
	
	var newPop = document.infoForm;
	var url = "<c:url value='/kor/material/chemistryPopup.do'/>";
	 
	var status = "width=1024, height=768, top=30, left=160, scrollbars=yes"; 
	window.open("","infoForm",status);
	
	newPop.action =url; 
	newPop.method="post";
	newPop.target="infoForm";
	newPop.submit();	
};

function linkPage(pageNo){
    $("#pageIndex").val(pageNo);
    document.frm.action = "<c:url value='/kor/material/db.do'/>";
    document.frm.submit();
};

doGobbs = function(bbsid,code,menuno,idx,type){
	
	document.bbsForm.menuNo.value = menuno;
	//document.bbsForm.idx.value = idx;
	
	document.bbsForm.bbsId.value = bbsid;
	document.bbsForm.nttId.value = idx;
	document.bbsForm.searchCl1DetailCode.value = code;
	document.bbsForm.action = "<c:url value='/user/cop/bbs/selectBoardArticle.do'/>";
	document.bbsForm.submit();
	
};

function press(event) {
	if (event.keyCode==13) {
		fn_egov_select_noticeList('1');
	}
}

function fn_egov_select_noticeList(pageNo) {
	$('#pageIndex').val(pageNo);
	$('#frm').attr("action","<c:url value='/kor/material/db.do'/>");
	$('#frm').submit();
}


$().ready(function(){
});
</script>
<form id="detailForm" name="detailForm" method="post">
	<input  type="hidden" id="idx" name="idx" value=""/>
</form>
<form id="infoForm" name="infoForm" method="post">
	<input  type="hidden" id="searchIdx" name="searchIdx" value=""/>
</form>

<form id="bbsForm" name="bbsForm" method="post">
	<input  type="hidden" id="bbsId" name="bbsId"/>
	<input  type="hidden" id="searchCl1DetailCode" name="searchCl1DetailCode"/>
	<input  type="hidden" id="menuNo" name="menuNo"/>
	<input  type="hidden" id="idx" name="idx"/>
	<input  type="hidden" id="nttId" name="nttId"/>	
</form>

<div id="contents">
	<div class="tableBtn clearfix">
		<div class="btn_left big">
			총 <span class="point"><c:out
					value='${paginationInfo.totalRecordCount }' /></span>건, 현재페이지 <span
				class="point"><c:out value='${paginationInfo.currentPageNo }' /></span>/
			<c:out value='${paginationInfo.totalPageCount }' />
		</div>

		<form name="frm" id="frm" method="post">
		<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />			
			<div class="btn_right">
				<div class="board_search">					
						<input
						type="hidden" name="pageIndex" id="pageIndex"
						value="<c:out value='${nvo.pageIndex}'/>" /> <%-- <input
						type="hidden" name="menuNo" id="menuNo"
						value="<c:out value='${menuManageVO.menuNo}'/>" /> --%>
					<fieldset>
						<legend>게시물 검색</legend>	
						<span> 
						<select name="searchCondition4" class="select_list">
							<option value="kname" <c:if test="${nvo.searchCondition4 == '' || nvo.searchCondition4 == 'kname'}">selected="selected"</c:if>>국문순</option>
							<option value="ename" <c:if test="${nvo.searchCondition4 == 'ename'}">selected="selected"</c:if>>영문순</option>
						</select>
						<select name="searchCnd" class="select_list">
								<option value="0"
									<c:if test="${nvo.searchCnd == '0'}">selected="selected"</c:if>>제목</option>
								<option value="1"
									<c:if test="${nvo.searchCnd == '1'}">selected="selected"</c:if>>CAS번호</option>
						</select>
						<select name="searchCnd2nd" class="select_list">
							<option value="" <c:if test="${nvo.searchCnd2nd == '' || nvo.searchCnd2nd == null}">selected="selected"</c:if>>구분</option>
							<option value="대기" <c:if test="${nvo.searchCnd2nd == '대기'}">selected="selected"</c:if>>대기</option>
							<option value="실내공기" <c:if test="${nvo.searchCnd2nd == '실내공기'}">selected="selected"</c:if>>실내공기</option>
							<option value="먹는물" <c:if test="${nvo.searchCnd2nd == '먹는물'}">selected="selected"</c:if>>먹는물</option>
							<option value="토양" <c:if test="${nvo.searchCnd2nd == '토양'}">selected="selected"</c:if>>토양</option>
							<option value="기타" <c:if test="${nvo.searchCnd2nd == '기타'}">selected="selected"</c:if>>기타</option>
							<option value="제품" <c:if test="${nvo.searchCnd2nd == '제품'}">selected="selected"</c:if>>제품</option>
						</select>
						</span> <span> <label for="" class="skip">검색단어입력</label> <input
							name=searchKeyword type="text"
							value='<c:out value="${nvo.searchKeyword}"/>' class="text"
							title="검색어 입력" onKeyPress="press(event);" />
						</span> <input type="image"
							src="/assets/kor/images/bbs/board_search_btn.png" alt="검색"
							onClick="fn_egov_select_noticeList('1'); return false;" />
						<!-- <a id="button" class="btn gray">전체보기</a> -->
					</fieldset>
				</div>
			</div>
			<div style="padding:8px 3px 8px; clear:both; margin-top:8px; border-bottom:1px dotted #ccc; text-align:right; font-size:12px;"> 게시물 숫자 : 
				<select name="recordCountPerPage" class="select_list" onChange="fn_egov_select_noticeList('1'); return false;"> >
					<option value="6" <c:if test="${paginationInfo.recordCountPerPage == '6'}">selected="selected"</c:if>>6개</option>
					<option value="10" <c:if test="${paginationInfo.recordCountPerPage == '10'}">selected="selected"</c:if>>10개</option>
					<option value="20" <c:if test="${paginationInfo.recordCountPerPage == '20'}">selected="selected"</c:if>>20개</option>
				</select>
			</div>
		</form>
	</div>
	
	<div class="chemiBox">
		<ul>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach var="result" items="${list}" varStatus="status">
					<li>
						<div class="chemiTopBox">
							<c:set var="splitMedium" value="${fn:split(result.medium,',')}"/>
								<c:if test="${!empty splitMedium}">
									<span class="btn_s_blue">
										<c:forEach var="sppath" items="${splitMedium}" varStatus="j"><c:if test="${sppath eq '대기' || sppath eq '실내공기' || sppath eq '먹는물' || sppath eq '토양' || sppath eq '기타' || sppath eq '제품'}">
											<c:out value="${sppath}"/><c:if test="${j.count ne fn:length(splitMedium)}"><c:out value=":"/></c:if>
										</c:if></c:forEach>
									</span>
								</c:if>
							<span class="casBox">CAS : <c:out value="${result.cas}" escapeXml="false"/></span>
							<h3><c:out value="${result.kName}" escapeXml="false"/> <span><c:out value="${result.eName}" escapeXml="false"/></span></h3>
							<div class="chemiText">
								<c:choose>
									<c:when test="${result.outlineCh eq 'Y'}"><c:out value="${result.outline}" escapeXml="false"/></c:when>
									<c:otherwise><c:out value="${result.outline}" escapeXml="false"/></c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="chemiBottomBox">
							<div class="chemiL">
								<button type="button" class="bu_white" onclick="doDetail('<c:out value="${result.idx}"/>');">상세보기</button>
								<c:if test="${result.reportCnt > 0}"><button type="button" class="bu_white" onclick="doGoNoxInfo('<c:out value="${result.idx}"/>');">연구자료 보기</button></c:if>
							</div>
							<div class="chemiR">
								<c:if test="${fn:length(result.searchCondition1) > 0}">
									<button type="button" onclick="doGobbs('BBSMSTR_000000000660','BCC601','12004','${result.searchCondition1}');"><img src="/assets/kor/images/newMain/bu_web.png" alt="웹툰" /></button>
								</c:if>	
								<c:if test="${fn:length(result.searchCondition3) > 0}">
									<button type="button" onclick="doGobbs('BBSMSTR_000000000660','BCC603','12004','${result.searchCondition3}');"><img src="/assets/kor/images/newMain/bu_movie.png" alt="영상" /></button>
								</c:if>	
								<c:if test="${fn:length(result.searchCondition2) > 0}">
									<button type="button" onclick="doGobbs('BBSMSTR_000000000660','BCC602','12004','${result.searchCondition2}');"><img src="/assets/kor/images/newMain/bu_story.png" alt="스토리북" /></button>
								</c:if>	
							</div>
							
						</div>
					</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<li style="width:100%;"><p style="margin:30px;">작성된 게시물이 없습니다.</p></li>	
				</c:otherwise>
			</c:choose>
		</ul>
	</div>

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image"
			jsFunction="linkPage" />
	</div>
</div>
<!-- //contents -->
