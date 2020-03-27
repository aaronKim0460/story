<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<%
  String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/prm/button/";
%>
<script language="javascript1.2" type="text/javaScript">
<!--

function fCheckAll() {
    var checkField = document.progrmManageForm.checkField;
    if(document.progrmManageForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}


function fDeleteProgrmManageList() {
    var checkField = document.progrmManageForm.checkField;
    var ProgrmFileNm = document.progrmManageForm.checkProgrmFileNm;
    var checkProgrmFileNms = "";
    var checkedCount = 0;
    if(checkField) {
    	if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkProgrmFileNms += ((checkedCount==0? "" : ",") + ProgrmFileNm[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
            	checkProgrmFileNms = ProgrmFileNm.value;
            }
        }
    }

    document.progrmManageForm.checkedProgrmFileNmForDel.value=checkProgrmFileNms;
    document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgrmManageListDelete.do'/>";
    document.progrmManageForm.submit();
}

function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.progrmManageForm.pageIndex.value = pageNo;
	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramFileListManageSelect.do'/>";
   	document.progrmManageForm.submit();
}

function selectProgramListManage() {
	document.progrmManageForm.pageIndex.value = 1;
	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramFileListManageSelect.do'/>";
	document.progrmManageForm.submit();
}

function insertProgramListManage() {
   	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramFileListRegist.do'/>";
   	document.progrmManageForm.submit();
}

function selectUpdtProgramListDetail(progrmFileNm) {
	document.progrmManageForm.tmp_progrmNm.value = progrmFileNm;
   	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramFileListDetailSelect.do'/>";
   	document.progrmManageForm.submit();
}

function fn_FocusStart(){
	var objFocus = document.getElementById('F1');
	objFocus.focus();
}

<c:if test="${!empty resultMsg}">alert("<c:out value='${resultMsg}'/>");</c:if>
-->
</script>

<body>
<h2 class="adminH2">다운로드파일관리</h2>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="progrmManageForm" action ="<c:url value='/sym/prm/EgovProgramListManageSelect.do' />" method="post" enctype="multipart/form-data">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="checkedProgrmFileNmForDel" type="hidden" />
<input type="hidden" name="cmd">
<input type="hidden" name="tmp_progrmNm">

<div class="board-search">
 
	<fieldset>
	<legend>목록검색</legend>
		관리 대상명&nbsp;<input name="searchKeyword" class="board-search-keyword" type="text" value="<c:out value='${searchVO.searchKeyword}'/>"  maxlength="60" id="F1" title="검색조건">
		<input type="submit" id="board-search-submit" class="btn btn-sm btn-default" value="검색" onclick="selectProgramListManage(); return false;">
	</fieldset>
</div>


<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:40%" />
			<col style="width:30%" />
			<col style="width:30%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-title">관리대상명</th>
				<th class="board-default-th-title">URL</th>
				<th class="board-default-th-title">관리대상설명</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="result" items="${list_progrmmanage}" varStatus="status">
			<tr onclick="selectUpdtProgramListDetail('<c:out value="${result.nttId}"/>'); return false;">
				<td class="board-default-td-title">
					<a href="<c:url value='/sym/prm/EgovProgramFileListDetailSelect.do'/>?tmp_progrmNm=<c:out value="${result.nttId}"/>"  >
					<c:if test="${fn:length(result.fileMgmName)> 30}">
					<c:out value="${fn:substring(result.fileMgmName,0, 30)}"/>...
					</c:if>
					<c:if test="${fn:length(result.fileMgmName)<= 30}">
					<c:out value="${result.fileMgmName}"/>
					</c:if>
					</a>
				</td>
				<td class="board-default-td-title">
					<c:if test="${fn:length(result.url)> 50}">
					<c:out value="${fn:substring(result.url,0, 50)}"/>...
					</c:if>
					<c:if test="${fn:length(result.URL)<= 50}">
					<c:out value="${result.url}"/>
					</c:if>
				</td>
				<td class="board-default-td-title"><c:out value="${result.fileMgmDc}"/></td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(list_progrmmanage) == 0}">
			<tr>
				<td class="lt_text3" colspan="3">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo = "${paginationInfo}"	type="image" jsFunction="linkPage"/>
	</div>
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">	
		<a href="<c:url value='/sym/prm/EgovProgramListRegist.do'/>" onclick="insertProgramListManage(); return false;" class="btn btn-primary">등록</a>
		<%-- <a href="#LINK" onclick="fDeleteProgrmManageList(); return false;" class="btn btn-warning">삭제</a> --%>
	</div>
</div>

</form>

</body>
</html>

