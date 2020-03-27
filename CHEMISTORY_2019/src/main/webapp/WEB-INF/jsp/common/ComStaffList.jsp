<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
</c:if>
<script type="text/javascript">

	function press(event) {
		if (event.keyCode == 13) {
			fn_egov_select_userInfo('1');
		}
	}

	function fn_egov_select_noticeList(pageIndex) {

		var _target = document.frm.targetMethod.value;
		var actionUrl;

		if (_target == 'selectClubOprtrList') {
			actionUrl = "<c:url value='/cop/com/selectClubOprtrList.do'/>";
		} else if (_target == 'selectClubUserList') {
			actionUrl = "<c:url value='/cop/com/selectClubUserList.do'/>";
		} else if (_target == 'selectCmmntyMngrList') {
			actionUrl = "<c:url value='/cop/com/selectCmmntyMngrList.do'/>";
		} else if (_target == 'selectCmmntyUserList') {
			actionUrl = "<c:url value='/cop/com/selectCmmntyUserList.do'/>";
		} else {
			actionUrl = "<c:url value='/cop/com/selectNierUserList.do'/>?moveSite=<c:out value='${moveSite}'/>";
		}
		document.frm.pageIndex.value = pageIndex;
		document.frm.action = actionUrl;
		document.frm.submit();
	}
	
	function fn_egov_select_noticeListTot(pageIndex) {

		var _target = document.frm.targetMethod.value;
		var actionUrl;

		if (_target == 'selectClubOprtrList') {
			actionUrl = "<c:url value='/cop/com/selectClubOprtrList.do'/>";
		} else if (_target == 'selectClubUserList') {
			actionUrl = "<c:url value='/cop/com/selectClubUserList.do'/>";
		} else if (_target == 'selectCmmntyMngrList') {
			actionUrl = "<c:url value='/cop/com/selectCmmntyMngrList.do'/>";
		} else if (_target == 'selectCmmntyUserList') {
			actionUrl = "<c:url value='/cop/com/selectCmmntyUserList.do'/>";
		} else {
			actionUrl = "<c:url value='/cop/com/selectNierUserList.do'/>?moveSite=<c:out value='${moveSite}'/>";
		}
		document.frm.pageIndex.value = pageIndex;
		document.frm.searchCnd.value = "";
		document.frm.clubId.value = "";
		document.frm.action = actionUrl;
		document.frm.submit();
	}
	
	function initStaff(){
		location.href = '/cop/com/selectNierUserList.do?moveSite=<c:out value='${moveSite}'/>&menuNo=<c:out value='${menuManageVO.menuNo}'/>';
	}

	function fn_egov_select_userInitialInfo(selectInit) {
		
		var actionUrl = "<c:url value='/cop/com/selectNierUserList.do'/>?moveSite=<c:out value='${moveSite}'/>";
		document.frm.pageIndex.value = 1;
		document.frm.clubId.value = 5;
		document.frm.searchInitial.value = selectInit;
		document.frm.action = actionUrl;
		document.frm.submit();
	}

	function fn_egov_deleteUser(emplyrId) {
		var _target = document.frm.targetMethod.value;
		var url;

		if (confirm('<spring:message code="cop.withdraw.msg" />')) {

			if (_target == 'selectCmmntyUserList') {
				url = "<c:url value='/cop/com/deleteCmmntyUser.do'/>";
				document.frm.param_cmmntyId.value = document.frm.trgetId.value;
			} else if (_target == 'selectClubUserList') {
				url = "<c:url value='/cop/com/deleteClbUser.do'/>";
				document.frm.param_clbId.value = document.frm.trgetId.value;
			}
			document.frm.param_emplyrId.value = emplyrId;
			document.frm.action = url;
			document.frm.submit();
		}
	}

	function fn_egov_reRegistUser(emplyrId) {
		var _target = document.frm.targetMethod.value;
		var url;

		if (confirm('<spring:message code="cop.reregist.msg" />')) {
			if (_target == 'selectCmmntyUserList') {
				url = "<c:url value='/cop/com/reRegistCmmntyUser.do'/>";
				document.frm.param_cmmntyId.value = document.frm.trgetId.value;
			} else if (_target == 'selectClubUserList') {
				url = "<c:url value='/cop/com/reRegistClbUser.do'/>";
				document.frm.param_clbId.value = document.frm.trgetId.value;
			}

			document.frm.param_emplyrId.value = emplyrId;
			document.frm.action = url;
			document.frm.submit();
		}
	}

	function fn_egov_registManager(emplyrId) {
		var _target = document.frm.targetMethod.value;
		var url;

		if (confirm('<spring:message code="cop.registmanager.msg" />')) {
			if (_target == 'selectCmmntyUserList') {
				url = "<c:url value='/cop/com/registCmmntyManager.do'/>";
				document.frm.param_cmmntyId.value = document.frm.trgetId.value;
			} else if (_target == 'selectClubUserList') {
				url = "<c:url value='/cop/com/registClbOprtr.do'/>";
				document.frm.param_clbId.value = document.frm.trgetId.value;
			}
			document.frm.param_emplyrId.value = emplyrId;
			document.frm.action = url;
			document.frm.submit();
		}
	}
	
	$(document).ready(function(){
		
		var searchInitial = $("[name=searchInitial]").val();
		
		if(searchInitial == null || searchInitial == "")return;
		
		var splObj = $("#headerSpl a");
		
		// 초기화
		for(var i in splObj){
			
			if($("#headerSpl a").eq(i).text() == searchInitial){
				$("#headerSpl a").eq(i).html("<strong class='current'>" + $("#headerSpl a").eq(i).text() + "</strong>");
				return;
			}
		}		
	});
</script>

<form name="frm" action="/cop/com/selectNierUserList.do" method="get">
<input type="hidden" name="targetMethod" value="<c:out value='${targetMethod}'/>" /> 
<input type="hidden" name="trgetId" value="<c:out value='${trgetId}'/>" /> 
<input type="hidden" name="param_emplyrId" /> 
<input type="hidden" name="param_cmmntyId" /> 
<input type="hidden" name="param_clbId" />
<input type="hidden" name="searchInitial" value="<c:out value='${searchInitial }'/>" />
<input type="hidden" name="clubId" value="<c:out value='${initialAt }'/>" /> 
<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

<input type="hidden" name="moveSite" id="moveSite" value="<c:out value='${moveSite}'/>" />
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
<c:choose>
<c:when test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
	<div class="board-search">
		<input type="hidden" name="method" value="staffMgmList" />
		<fieldset>
			<legend>검색</legend>
			<select name="searchCnd" class="board-search-select" title="검색조건">
				<option value="0"
					<c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>이름</option>
				<option value="3"
					<c:if test="${searchVO.searchCnd == '3'}">selected="selected"</c:if>>부서명</option>
				<option value="1"
					<c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>담당업무</option>
			</select> 
			<input name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' class="board-search-keyword" title="검색어 입력" />
			<input type="submit" id="board-search-submit" class="btn btn-sm btn-default" onClick="javascript:fn_egov_select_noticeList('1'); return false;" value="검색" />
			<input type="button" id="button" onClick="initStaff();" class="btn-viewall btn btn-sm btn-link" value="전체보기" />
		</fieldset>
	</div>
	
	<div id="headerSpl" class="pagenavi pagesearch">
		<a href="javascript:fn_egov_select_userInitialInfo('ㄱ');" class="page ${searchInitial=='ㄱ' ? 'on': '' }">ㄱ</a>
		<a href="javascript:fn_egov_select_userInitialInfo('ㄴ');" class="page ${searchInitial=='ㄴ' ? 'on': '' }">ㄴ</a>
		<a href="javascript:fn_egov_select_userInitialInfo('ㄷ');" class="page ${searchInitial=='ㄷ' ? 'on': '' }">ㄷ</a> 
		<a href="javascript:fn_egov_select_userInitialInfo('ㄹ');" class="page ${searchInitial=='ㄹ' ? 'on': '' }">ㄹ</a>
		<a href="javascript:fn_egov_select_userInitialInfo('ㅁ');" class="page ${searchInitial=='ㅁ' ? 'on': '' }">ㅁ</a> 
		<a href="javascript:fn_egov_select_userInitialInfo('ㅂ');" class="page ${searchInitial=='ㅂ' ? 'on': '' }">ㅂ</a>
		<a href="javascript:fn_egov_select_userInitialInfo('ㅅ');" class="page ${searchInitial=='ㅅ' ? 'on': '' }">ㅅ</a> 
		<a href="javascript:fn_egov_select_userInitialInfo('ㅇ');" class="page ${searchInitial=='ㅇ' ? 'on': '' }">ㅇ</a>
		<a href="javascript:fn_egov_select_userInitialInfo('ㅈ');" class="page ${searchInitial=='ㅈ' ? 'on': '' }">ㅈ</a> 
		<a href="javascript:fn_egov_select_userInitialInfo('ㅊ');" class="page ${searchInitial=='ㅊ' ? 'on': '' }">ㅊ</a>
		<a href="javascript:fn_egov_select_userInitialInfo('ㅋ');" class="page ${searchInitial=='ㅋ' ? 'on': '' }">ㅋ</a> 
		<a href="javascript:fn_egov_select_userInitialInfo('ㅌ');" class="page ${searchInitial=='ㅌ' ? 'on': '' }">ㅌ</a>
		<a href="javascript:fn_egov_select_userInitialInfo('ㅍ');" class="page ${searchInitial=='ㅍ' ? 'on': '' }">ㅍ</a> 
		<a href="javascript:fn_egov_select_userInitialInfo('ㅎ');" class="page ${searchInitial=='ㅎ' ? 'on': '' }">ㅎ</a>
	</div>

	<div class="board-list">
		<table class="board-default">
			<caption class="caption2">
				<span>부서 및 직원연락정보</span>
			</caption>
			<colgroup>
				<col width="137px" />
				<col width="47px" />
				<col width="442px" /> 
				<col width="126px" />
			</colgroup>
			<thead>
				<tr>
					<th class="board-default-th-no">부서명</th>
					<th class="board-default-th-name">이름</th>
					<th class="board-default-th-title">담당업무</th>
					<th class="board-default-th-hit">전화번호</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<c:choose>
							<c:when test="${result.departCd == '0000'  || result.sectCd != '0000' }">
								<td class="board-default-td-no"><c:out value='${result.sectNm}'/></td>
							</c:when>
							<c:otherwise>
								<td class="board-default-td-no"><c:out value='${result.departNm}'/></td>
							</c:otherwise>
						</c:choose>

						<td class="board-default-td-name"><c:out value='${result.staffNm}'/></td>
						<td class="board-default-td-title"><c:out value='${result.staffWork}'/></td>
						<td class="board-default-td-hit"><c:out value='${result.staffTel}'/></td>
					</tr>
				</c:forEach>
				
				<c:if test="${fn:length(resultList) == 0}">
					<tr>
						<td class="lt_text3" colspan="5">
							<spring:message code="common.nodata.msg" />
						</td>
					</tr>
				</c:if>
				
			</tbody>
		</table>
	</div>
	
	<div class="board-footer">
		<div class="pagenavi">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_userInfo" />
		</div>
	</div>

</c:when>
<c:otherwise>
<div id="contents">	

    <div class="board_search_new">
            <fieldset>
            <legend>게시물 검색</legend>
            <span>
			<select name="searchCnd" class="select_list" title="검색조건">
				<option value="0"
					<c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>이름</option>
				<option value="3"
					<c:if test="${searchVO.searchCnd == '3'}">selected="selected"</c:if>>부서명</option>
				<option value="1"
					<c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>담당업무</option>
			</select> 
         	</span>
            <span>
            <label for="searchWrd" class="skip">검색단어입력</label>
            <input type="text" name="searchWrd" id="searchWrd" class="text" value='<c:out value="${searchVO.searchWrd}"/>' title="검색단어입력" />
            </span>
            <span>
            <a href="#none" onClick="javascript:fn_egov_select_noticeList('1'); return false;" title="검색">검색</a>
            <a href="#none" onClick="initStaff();" title="검색" class="btnsearch">전체보기</a>
            </span>
            </fieldset>
            <div class="wordSearch clearfix">
            	<ul>
                	<li><a href="javascript:fn_egov_select_userInitialInfo('ㄱ');" class="${searchInitial=='ㄱ' ? 'on': '' }">ㄱ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㄴ');" class="${searchInitial=='ㄴ' ? 'on': '' }">ㄴ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㄷ');" class="${searchInitial=='ㄷ' ? 'on': '' }">ㄷ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㄹ');" class="${searchInitial=='ㄹ' ? 'on': '' }">ㄹ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㅁ');" class="${searchInitial=='ㅁ' ? 'on': '' }">ㅁ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㅂ');" class="${searchInitial=='ㅂ' ? 'on': '' }">ㅂ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㅅ');" class="${searchInitial=='ㅅ' ? 'on': '' }">ㅅ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㅇ');" class="${searchInitial=='ㅇ' ? 'on': '' }">ㅇ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㅈ');" class="${searchInitial=='ㅈ' ? 'on': '' }">ㅈ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㅊ');" class="${searchInitial=='ㅊ' ? 'on': '' }">ㅊ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㅋ');" class="${searchInitial=='ㅋ' ? 'on': '' }">ㅋ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㅌ');" class="${searchInitial=='ㅌ' ? 'on': '' }">ㅌ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㅍ');" class="${searchInitial=='ㅍ' ? 'on': '' }">ㅍ</a></li>
                    <li><a href="javascript:fn_egov_select_userInitialInfo('ㅎ');" class="${searchInitial=='ㅎ' ? 'on': '' }">ㅎ</a></li>
                </ul>
            </div><!--wordSearch-->
    </div><!-- //board_search_row -->
	<h2>부서 및 직원연락정보</h2>    
    <table class="bbs_default list" summary="표 설명">
					<caption>연구결과 목록</caption>
					<colgroup>
						<col width="137px" />
						<col width="47px" />
						<col width="442px" /> 
						<col width="126px" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">부서명</th>
							<th scope="col">이름</th>
							<th scope="col">담당업무</th>
							<th scope="col">전화번호</th>
						</tr>
                    </thead>
					<tbody class="t_center list">
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<c:choose>
									<c:when test="${result.departCd == '0000'  || result.sectCd != '0000' }">
										<td><c:out value='${result.sectNm}'/></td>
									</c:when>
									<c:otherwise>
										<td><c:out value='${result.departNm}'/></td>
									</c:otherwise>
								</c:choose>
		
								<td><c:out value='${result.staffNm}'/></td>
								<td><c:out value='${result.staffWork}'/></td>
								<td><c:out value='${result.staffTel}'/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
                
			<div class="pagination">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
			</div>
                
</div>
<!-- //content-body -->

</c:otherwise>
</c:choose>
</form>
