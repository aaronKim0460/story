<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<validator:javascript formName="boardUseInf" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
	function fn_egov_select_bbsUseInfs(){
		document.boardUseInf.action = "<c:url value='/cop/com/selectBBSUseInfs.do'/>";
		document.boardUseInf.submit();
	}

	function fn_egov_regist_bbsUseInf(){
		if (!validateBoardUseInf(document.boardUseInf)){
			return;
		}

		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.boardUseInf.param_trgetType.value = document.boardUseInf.trgetType.value;
			document.boardUseInf.action = "<c:url value='/cop/com/insertBBSUseInf.do'/>";
			document.boardUseInf.submit();
		}
	}

	function fn_egov_inqire_bbsInf(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do' />?requestUrl=/cop/bbs/SelectBBSMasterInfsPop.do&width=850&height=520";
		var openParam = "width=860, height=520px,resizable=0, scroll=1";
		window.open(url, "p_cmmntyInqire", openParam);
	}

	function fn_egov_selectTargetType(obj) {

		var retVal;
		var _strType = obj.value;

		if (_strType == 'CMMNTY') {
			retVal = fn_egov_inqire_cmmnty();
		} else if (_strType == 'CLUB') {
			retVal = fn_egov_inqire_club();
		} else if (_strType == '') {
			retVal = "|";
		} else {
			retVal = "SYSTEM_DEFAULT_BOARD"+"|"+"시스템 활용";
		}

		if (retVal != null) {
			var tmp = retVal.split("|");
			document.boardUseInf.trgetId.value = tmp[0];
			document.boardUseInf.trgetNm.value = tmp[1];
		}
	}

	function fn_egov_inqire_cmmnty(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do' />?requestUrl=/cop/cmy/selectCmmntyInfsByPop.do&width=850&height=360";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_cmmntyInqire", openParam);
		return retVal;
	}

	function fn_egov_inqire_club(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do' />?requestUrl=/cop/clb/selectClubInfsByPop.do&width=850&height=360";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_cmmntyInqire", openParam);
		return retVal;
	}
</script>

<body>

<form:form commandName="boardUseInf" name="boardUseInf" method="post">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"/></div>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
<input type="hidden" name="param_trgetType" value="" />

<div class="content-body">
<div class="board-list">

	<table class="board-write">
		<caption>글 등록</caption>
		<colgroup>
		    <col style="width:20%" />
		    <col style="width:80%" />
		</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">게시판명<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<input name="bbsId" type="hidden" />
					<input name="bbsNm" type="text" value=""  maxlength="40" class="input-text full" readonly />
					<a href="#LINK" onclick="fn_egov_inqire_bbsInf();" class="btn btn-link">게시판명 선택 팝업</a>
					<br/><form:errors path="bbsId" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">커뮤니트/동호회명<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="trgetType" class="board-search-select" title="<spring:message code="cop.trgetNm" />" onChange="javascript:fn_egov_selectTargetType(this)"  style="width:120px">
						<option selected value=''>--선택하세요--</option>
						<c:if test="${useCommunity == 'true'}">
						<option value="CMMNTY" >커뮤니티</option>
						</c:if>
						<c:if test="${useClub == 'true'}">
						<option value="CLUB" >동호회</option>
						</c:if>
						<option value="SYSTEM" >시스템</option>
					</select>
				<input type="hidden" name="trgetId" value="" />
				<input type="text" name="trgetNm" value="" class="input-text" readOnly />
				<br/><form:errors path="trgetId" />
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<a href="<c:url value='/cop/com/selectBBSUseInfs.do'/>?searchCondition=1" onclick="fn_egov_select_bbsUseInfs(); return false;" class="btn btn-default">목록</a>
	<input type="submit" value="등록" onclick="fn_egov_regist_bbsUseInf(); return false;" class="btn btn-primary" />
</div>

</form:form>
</body>
</html>
