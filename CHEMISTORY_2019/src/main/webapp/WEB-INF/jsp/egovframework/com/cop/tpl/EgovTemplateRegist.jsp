<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<validator:javascript formName="templateInf" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_regist_tmplatInfo(){
		if (!validateTemplateInf(document.templateInf)){
			return;
		}

		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.templateInf.action = "<c:url value='/cop/tpl/insertTemplateInf.do'/>";
			document.templateInf.submit();
		}
	}

	function fn_egov_select_tmplatInfo(){
		document.templateInf.action = "<c:url value='/cop/tpl/selectTemplateInfs.do'/>";
		document.templateInf.submit();
	}

	function fn_egov_selectTmplatType(obj){
		if (obj.value == 'TMPT01') {
			document.getElementById('sometext').innerHTML = "게시판 템플릿은 CSS만 가능합니다.";
		} else if (obj.value == '') {
			document.getElementById('sometext').innerHTML = "";
		} else {
			document.getElementById('sometext').innerHTML = "템플릿은 JSP만 가능합니다.";
		}
	}

	function fn_egov_previewTmplat() {
		var frm = document.templateInf;

		var url = frm.tmplatCours.value;

		var target = "";

		if (frm.tmplatSeCode.value == 'TMPT01') {
			target = "<c:url value='/cop/bbs/previewBoardList.do' />";
			width = "750";
		} else if (frm.tmplatSeCode.value == 'TMPT02') {
			target = "<c:url value='/cop/cmy/previewCmmntyMainPage.do' />";
			width = "980";
		} else if (frm.tmplatSeCode.value == 'TMPT03') {
			target = "<c:url value='/cop/cus/previewClubMainPage.do' />";
			width = "980";
		} else {
			alert('<spring:message code="cop.tmplatCours" /> 지정 후 선택해 주세요.');
		}

		if (target != "") {
			window.open(target + "?searchWrd="+url, "preview", "width=" + width + "px, height=500px;");
		}
	}
</script>

<body>
<form:form commandName="templateInf" name="templateInf" method="post" >
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />

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
				<th class="board-write-th">템플릿명<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<input name="tmplatNm" type="text" class="input-text full" value="" maxlength="60" id="tmplatNm" />
					<br/><form:errors path="tmplatNm" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">템플릿 구분<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="tmplatSeCode" onchange="fn_egov_selectTmplatType(this)" id="tmplatSeCode" class="board-search-select" style="width:130px">
						<option selected value=''>--선택하세요--</option>
						<c:forEach var="result" items="${resultList}" varStatus="status">
						<option value='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></option>
						</c:forEach>
					</select>
					<br/><form:errors path="tmplatSeCode" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">템플릿 경로<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<input name="tmplatCours" type="text" size="60" value="" class="input-text full" maxlength="60"  id="tmplatCours" />
					<br/><form:errors path="tmplatCours" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용 여부</th>
				<td class="board-write-td">
			 		사용&nbsp;&nbsp;<input type="radio" name="useAt" class="radio2" value="Y"  checked />&nbsp;&nbsp;
				 	사용중지&nbsp;&nbsp;<input type="radio" name="useAt" class="radio2" value="N" />
				 	<br/><form:errors path="useAt" />
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<input type="button" value="미리보기"  onclick="fn_egov_previewTmplat();" class="btn btn-link" />
	<input type="button" value="목록" onclick="javascript:fn_egov_select_tmplatInfo();return false;" class="btn btn-default" />
	<input type="submit" value="등록" onclick="fn_egov_regist_tmplatInfo(); return false;" class="btn btn-primary" />
</div>
</form:form>
</body>
</html>
