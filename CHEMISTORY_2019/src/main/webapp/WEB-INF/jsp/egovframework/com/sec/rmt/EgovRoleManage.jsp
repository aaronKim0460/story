<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
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

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var returnValue = "";
    var returnBoolean = false;
    var checkCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else
                        returnValue = returnValue + ";" + checkField[i].value;
                }
            }
            if(checkCount > 0)
                returnBoolean = true;
            else {
                alert("선택된  롤이 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된 롤이 없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
    	alert("조회된 결과가 없습니다.");
    }

    document.listForm.roleCodes.value = returnValue;
    return returnBoolean;
}

function fncSelectRoleList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/rmt/EgovRoleList.do'/>";
    document.listForm.submit();
}

function fncSelectRole(roleCode) {
    document.listForm.roleCode.value = roleCode;
    document.listForm.action = "<c:url value='/sec/rmt/EgovRole.do'/>";
    document.listForm.submit();
}

function fncAddRoleInsert() {
    location.replace("<c:url value='/sec/rmt/EgovRoleInsertView.do'/>");
}

function fncRoleListDelete() {
	if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sec/rmt/EgovRoleListDelete.do'/>";
            document.listForm.submit();
        }
    }
}

function fncAddRoleView() {
    document.listForm.action = "<c:url value='/sec/rmt/EgovRoleUpdate.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/rmt/EgovRoleList.do'/>";
    document.listForm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectRoleList('1');
    }
}
-->
</script>

<body>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form:form name="listForm" action="${pageContext.request.contextPath}/sec/rmt/EgovRoleList.do" method="post">
<input type="hidden" name="roleCode"/>
<input type="hidden" name="roleCodes"/>
<input type="hidden" name="pageIndex" value="<c:out value='${roleManageVO.pageIndex}'/>"/>
<input type="hidden" name="searchCondition"/>
<div class="board-search">
	
	<fieldset>
	<legend>목록검색</legend>
	롤명
	<input name="searchKeyword" type="text" value="<c:out value='${roleManageVO.searchKeyword}'/>" onkeypress="press();" class="board-search-keyword" />
	<input type="submit" value="검색" onclick="javascript:fncSelectRoleList('1') return false;" id="board-search-submit" class="btn btn-sm btn-default" />
	
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:5%" />
			<col style="width:11%" />
			<col style="width:20%" />
			<col style="width:11%" />
			<col style="width:11%" />
			<col style="width:30%" />
			<col style="width:12%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택"></th>
				<th class="board-default-th-title">롤 ID</th>
				<th class="board-default-th-title">롤 명</th>
				<th class="board-default-th-no">롤 타입</th>
				<th class="board-default-th-no">롤 Sort</th>
				<th class="board-default-th-title">롤 설명</th>
				<th class="board-default-th-no">등록일자</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="role" items="${roleList}" varStatus="status">
			<tr>
				<td class="board-default-td-no"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${role.roleCode}"/>" /></td>
				<td class="board-default-td-title"><a href="#LINK" onclick="javascript:fncSelectRole('<c:out value="${role.roleCode}"/>')"><c:out value="${role.roleCode}"/></a></td>
				<td class="board-default-td-title"><c:out value="${role.roleNm}"/></td>
				<td class="board-default-td-no"><c:out value="${role.roleTyp}"/></td>
				<td class="board-default-td-no"><c:out value="${role.roleSort}"/></td>
				<td class="board-default-td-title"><c:out value="${role.roleDc}"/></td>
				<td class="board-default-td-no"><c:out value="${role.roleCreatDe}"/></td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(roleList) == 0}">
			<tr>
				<td class="lt_text3" colspan="8">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>
 

<c:if test="${!empty roleManageVO.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>
</div>
</c:if>

<div class="board-detail-foot">
	<div class="btns clear fr">
		<a href="#LINK" onclick="javascript:fncAddRoleInsert()" class="btn btn-primary">등록</a>
		<a href="#LINK" onclick="javascript:fncRoleListDelete()" class="btn btn-warning">삭제</a>
	</div>
</div>

</form:form>
</body>
</html>
