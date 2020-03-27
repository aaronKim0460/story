<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
   	
<script type="text/javascript">

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_userInfo('1');
		}
	}

	function fn_egov_select_userInfo(pageIndex) {
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
			actionUrl = "<c:url value='/cop/com/selectCmsUserList.do'/>?moveSite=<c:out value='${moveSite}'/>";
		}
		document.frm.pageIndex.value = pageIndex;
		document.frm.action = actionUrl;
		document.frm.submit();
	}

	function fn_egov_deleteUser(emplyrId) {

		if (confirm('삭제하시겠습니까?')) {

			document.frm.staffCd.value = emplyrId;
			document.frm.action = "<c:url value='/cop/com/selectCmsUserDelete.do'/>";
			document.frm.submit();
		}
	}

	function fn_egov_reRegistUser(emplyrId){
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
	

	function fn_egov_CmsUserInqire(staffCd) {
		document.frm.staffCd.value = staffCd;
		document.frm.action = "<c:url value='/cop/com/selectCmsUserDetailSelect.do'/>";
		document.frm.submit();
	}
</script>

<body>

<div class="board-pages">
	<span class="board-pages-total">직원수 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>명</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="frm" action ="" method="post">
<input type="hidden" name="targetMethod" value="<c:out value='${targetMethod}'/>" />
<input type="hidden" name="trgetId" value="<c:out value='${trgetId}'/>" />
<input type="hidden" name="param_emplyrId" />
<input type="hidden" name="param_cmmntyId" />
<input type="hidden" name="param_clbId" />
<input type="hidden" name="staffCd"/>
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div class="board-search">
	<fieldset>
	<legend>목록검색</legend>	
		<select name="searchCnd" class="board-search-select">
			<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >사용자명</option>
			<option value="5" <c:if test="${searchVO.searchCnd == '5'}">selected="selected"</c:if> >부서명</option>
			<option value="6" <c:if test="${searchVO.searchCnd == '6'}">selected="selected"</c:if> >과명</option>
		</select>
		<input name="searchWrd" type="text" class="board-search-keyword" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색단어입력" />
		<input type="submit" id="board-search-submit" class="btn btn-sm btn-default" value="검색" onclick="javascript:fn_egov_select_userInfo('1');return false;" />
	</fieldset>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:5%" />
			<col style="width:10%" />
			<col style="width:15%" />
			<col style="width:15%" />
			<col  />
			<col style="width:15%" />
			<col style="width:15%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no">번호</th>
				<th class="board-default-th-title">사용자명</th>
				<th class="board-default-th-title">부서명</th>
				<th class="board-default-th-title">과명</th>
				<th class="board-default-th-title">담당업무</th>
				<th class="board-default-th-title">전화번호</th>
				<th class="board-default-th-no">비고</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td class="board-default-td-no"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
				<td class="board-default-td-title">
					<a href="javascript:fn_egov_CmsUserInqire('<c:out value="${result.staffCd}"/>')"><c:out value="${result.staffNm}" /></a>
				</td>
				<td class="board-default-td-title"><c:out value="${result.departNm}" /></td>
				<td class="board-default-td-title"><c:out value="${result.sectNm}" /></td>
				<td class="board-default-td-title">
					<c:choose>
					<c:when test="${fn:length(result.staffWork) > 20 }">
						<c:out value="${fn:substring(result.staffWork,0,18) }"/>...
					</c:when>
					<c:otherwise>
						<c:out value="${result.staffWork }"/>
					</c:otherwise>
				</c:choose>
				</td>
				<td class="board-default-td-title"><c:out value="${result.staffTel}" /></td>
				<td class="board-default-td-no">
					<input type="button" value="수정" onClick="javascript:fn_egov_CmsUserInqire('<c:out value="${result.staffCd}"/>')" class="btn btn-sm btn-primary"/>
					<input type="button" value="삭제" onClick="javascript:fn_egov_deleteUser('<c:out value="${result.staffCd}"/>')" class="btn btn-sm btn-warning"/>
				</td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td class="lt_text3" nowrap colspan="7" >
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

<div class="board-detail-foot">
	<div class="btns clear fr">	
         <a href="<c:url value='/cop/com/selectCmsUserRegist.do'/>" class="btn btn-primary">등록</a>
	</div>
</div>

</form>
</body>
</html>
