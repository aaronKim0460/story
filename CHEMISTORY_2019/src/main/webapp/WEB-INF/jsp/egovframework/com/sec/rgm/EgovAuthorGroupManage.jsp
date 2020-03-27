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

	var resultCheck = false;

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var selectAuthor = document.listForm.authorManageCombo;
    var booleanRegYn = document.listForm.regYn;
    var listMberTyCode = document.listForm.mberTyCode;

    var returnId = "";
    var returnAuthor = "";
    var returnRegYn = "";
    var returnmberTyCode = "";

    var checkedCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkedCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnId == "") {
                        returnId = checkField[i].value;
                        returnAuthor = selectAuthor[i].value;
                        returnRegYn = booleanRegYn[i].value;
                        returnmberTyCode = listMberTyCode[i].value;
                    }
                    else {
                    	returnId = returnId + ";" + checkField[i].value;
                    	returnAuthor = returnAuthor + ";" + selectAuthor[i].value;
                    	returnRegYn = returnRegYn + ";" + booleanRegYn[i].value;
                    	returnmberTyCode = returnmberTyCode + ";" + listMberTyCode[i].value;

                    }
                }
            }

            if(checkedCount > 0)
            	resultCheck = true;
            else {
                alert("선택된  항목이 없습니다.");
                resultCheck = false;
            }

        } else {
        	 if(document.listForm.delYn.checked == false) {
                alert("선택 항목이 없습니다.");
                resultCheck = false;
            }
            else {
                returnId = checkId.value;
                returnAuthor = selectAuthor.value;
                returnRegYn = booleanRegYn.value;
                returnmberTyCode = listMberTyCode.value;

                resultCheck = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.userIds.value = returnId;
    document.listForm.authorCodes.value = returnAuthor;
    document.listForm.regYns.value = returnRegYn;
    document.listForm.mberTyCodes.value = returnmberTyCode;
    return resultCheck;
}

function fncSelectAuthorGroupList(pageNo){
    //document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>";
    document.listForm.submit();
}

function fncAddAuthorGroupInsert() {

	if(!fncManageChecked()) return;

    if(confirm("등록하시겠습니까?")) {

        document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupInsert.do'/>";
        document.listForm.submit();
    }
}

function fncAuthorGroupDeleteList() {

	if(!fncManageChecked()) return;

    if(confirm("삭제하시겠습니까?")) {
        document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupDelete.do'/>";
        document.listForm.submit();
    }
}

function linkPage(pageNo){
    //document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorGroupPop() {

    if(document.listForm.searchCondition.value == '3') {
    	window.open("<c:url value='/sec/gmt/EgovGroupSearchList.do'/>","notice","height=500, width=485, top=50, left=20, scrollbars=no, resizable=no");
    } else {
        alert("그룹을 선택하세요.");
        return;
    }

    /*
    var url = "<c:url value='/sec/gmt/EgovGroupSearchView.do'/>";
    var varParam = new Object();
    var openParam = "dialogWidth:500px;dialogHeight:485px;scroll:no;status:no;center:yes;resizable:yes;";
    var retVal;

    if(document.listForm.searchCondition.value == '3') {
        retVal = window.showModalDialog(url, varParam, openParam);
        if(retVal) {
            document.listForm.searchKeyword.value = retVal;
        }
    } else {
        alert("검색조건에서 그룹을 선택하세요.");
        return;
    }
    */

}

function onSearchCondition() {
	document.listForm.searchKeyword.value = "";
	if(document.listForm.searchCondition.value == '3') {
        document.listForm.searchKeyword.readOnly = true;
	} else {
		document.listForm.searchKeyword.readOnly = false;
	}
}

function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorGroupList('1');
    }
}
//-->
</script>

<body>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form:form name="listForm" action="${pageContext.request.contextPath}/sec/rgm/EgovAuthorGroupList.do" method="post">
<input type="hidden" name="userId"/>
<input type="hidden" name="userIds"/>
<input type="hidden" name="authorCodes"/>
<input type="hidden" name="regYns"/>
<input type="hidden" name="mberTyCodes"/>
<input type="hidden" name="pageIndex" value="<c:out value='${authorGroupVO.pageIndex}'/>"/>

<div class="board-search">
	<fieldset>
	<legend>목록검색</legend>
		<select name="searchCondition" onchange="onSearchCondition()" class="board-search-select">
		    <option value="1" <c:if test="${authorGroupVO.searchCondition == '1'}">selected</c:if> >사용자 ID</option>
		    <option value="2" <c:if test="${authorGroupVO.searchCondition == '2'}">selected</c:if> >사용자 명</option>
		    <option value="3" <c:if test="${authorGroupVO.searchCondition == '3'}">selected</c:if> >그룹</option>
		</select>
		<input name="searchKeyword" type="text" value="<c:out value='${authorGroupVO.searchKeyword}'/>" size="25" title="검색" onkeypress="press();" class="board-search-keyword" />
		<input type="submit" value="검색" onclick="fncSelectAuthorGroupList('1') return false;" id="board-search-submit" class="btn btn-sm btn-default" />
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:5%" />
			<col style="width:10%" />
			<col style="width:10%" />
			<col style="width:30%" />
			<col style="width:35%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
			   <th><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택체크박스"></th>
			   <th class="board-default-th-title">사용자 ID</th>
			   <th class="board-default-th-title">사용자 명</th>
			   <th class="board-default-th-no">사용자 유형</th>
			   <th class="board-default-th-no">권한</th>
			   <th class="board-default-th-no">등록 여부</th>
			 </tr>
		</thead>
		<tbody>
			<c:forEach var="authorGroup" items="${authorGroupList}" varStatus="status">
			<tr>
				<td class="board-default-td-no"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${authorGroup.uniqId}"/>"/></td>
				<td class="board-default-td-title"><c:out value="${authorGroup.userId}"/></td>
				<td class="board-default-td-title"><c:out value="${authorGroup.userNm}"/></td>
				<td class="board-default-td-no"><c:out value="${authorGroup.mberTyNm}"/><input type="hidden" name="mberTyCode" value="<c:out value='${authorGroup.mberTyCode}'/>"/></td>
				<td class="board-default-td-no">
				<select name="authorManageCombo" class="board-search-select" style="width:200px;">
					<c:forEach var="authorManage" items="${authorManageList}" varStatus="status">
			        <option value="<c:out value="${authorManage.authorCode}"/>" <c:if test="${authorManage.authorCode == authorGroup.authorCode}">selected</c:if> ><c:out value="${authorManage.authorNm}"/></option>
				    </c:forEach>
				 </select></td>
				<td class="board-default-td-no"><c:out value="${authorGroup.regYn}"/><input type="hidden" name="regYn" value="<c:out value="${authorGroup.regYn}"/>"></td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(authorGroupList) == 0}">
				<tr>
					<td class="lt_text3" colspan=5>
						<spring:message code="common.nodata.msg" />
					</td>
				</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<c:if test="${!empty authorGroupVO.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>
</div>
</c:if>

<div class="board-detail-foot">
	<div class="btns clear fr">
<!-- 		<a href="#LINK" onclick="javascript:fncSelectAuthorGroupPop();" class="btn btn-link">그룹조회 팝업</a> -->
		<a href="#LINK" onclick="javascript:fncAddAuthorGroupInsert(); return false;" class="btn btn-primary">등록</a>
		<a href="#LINK" onclick="javascript:fncAuthorGroupDeleteList();" class="btn btn-warning">삭제</a>
	</div>
</div>

</form:form>
</body>
</html>
