<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
$(document).on('click', '.btn-viewall.btn.btn-sm.btn-link', function(){
	$('.board-search-keyword').val('');
	document.listForm.pageIndex.value = 1;
	document.listForm.submit();
});

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
                alert("선택된  그룹이 없습니다.");
                returnBoolean = false;
            }
        } else {
        	 if(document.listForm.delYn.checked == false) {
                alert("선택된 그룹이 없습니다.");
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

    document.listForm.groupIds.value = returnValue;

    return returnBoolean;
}

function fncSelectGroupList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/gmt/EgovGroupList.do'/>";
    document.listForm.submit();
}

function fncSelectGroup(groupId) {
	document.listForm.searchCondition.value = "1";
    document.listForm.groupId.value = groupId;
    document.listForm.action = "<c:url value='/sec/gmt/EgovGroup.do'/>";
    document.listForm.submit();
}

function fncAddGroupInsert() {
    location.replace("<c:url value='/sec/gmt/EgovGroupInsertView.do'/>");
}

function fncGroupListDelete() {
	if(fncManageChecked()) {
	    if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sec/gmt/EgovGroupListDelete.do'/>";
            document.listForm.submit();
	    }
	}
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/gmt/EgovGroupList.do'/>";
    document.listForm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectGroupList('1');
    }
}
//-->
</script>

<body>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form id="listForm" name="listForm" action ="<c:url value='/sec/gmt/EgovGroupList.do'/>" method="post" >
<div class="board-search">
<input type="hidden" name="groupId"/>
<input type="hidden" name="groupIds"/>
<input type="hidden" name="pageIndex" value="<c:out value='${groupManageVO.pageIndex}'/>"/>
<input type="hidden" name="searchCondition"/>

	<!--  검색  -->
	<fieldset>
	<legend>목록 검색</legend>
	그룹명
	<input name="searchKeyword" type="text" value='<c:out value="${groupManageVO.searchKeyword}"/>' class="board-search-keyword" title="검색어 입력" onkeypress="press(event);">
	<input type="button" id="board-search-submit" class="btn btn-sm btn-default" onclick="fncSelectGroupList('1'); return false;" value="검색" />
	<input type="button" id="button" class="btn-viewall btn btn-sm btn-link" value="전체보기" />
	</fieldset>
</div>

<div class="board-list">
<table class="board-default">
	<colgroup>
		<col style="width:30px;" />
		<col />
		<col style="width:20%" />
		<col style="width:20%" />
		<col style="width:100px;" />
	</colgroup>
	<thead>
	  	<tr>
	    	<th class="board-default-th-no"><input type="checkbox" name="checkAll" onclick="javascript:fncCheckAll()" title="전체선택"></th>
		    <th class="board-default-th-title">그룹ID</th>
		    <th class="board-default-th-title">그룹 명</th>
		    <th class="board-default-th-">설명</th>
		    <th class="board-default-th-title">등록일자</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="group" items="${groupList}" varStatus="status">
			<input type="hidden" name="checkId" value="<c:out value="${group.groupId}"/>" />
			<fmt:parseDate var="groupCreatDe" pattern="MM/dd/yyyy" value="${fn:substring(group.groupCreatDe, 16, 26)}" />
			<tr>
				<td class="board-default-td"><input type="checkbox" name="delYn" title="선택"></td>
				<td class="board-default-td-title"><a href="#LINK" onclick="javascript:fncSelectGroup('<c:out value="${group.groupId}"/>')"><c:out value="${group.groupId}"/></a></td>
				<td class="board-default-td-title"><c:out value="${group.groupNm}"/></td>
				<td class="board-default-td-title"><c:out value="${group.groupDc}"/></td>
				<td class="board-default-td-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${groupCreatDe}"/></td>
			</tr>
		</c:forEach>

		<c:if test="${fn:length(groupList) == 0}">
			<tr class="bg">
				<td colspan="5">검색된 그룹이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
	</table>
</div> 
</form>

<div class="board-footer">
	<div class="pagenavi">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fncSelectGroupList" />
	</div>
</div>

<!-- 버튼 -->
<div class="board-detail-foot">
	<div class="btns clear fr">
		<a href="javascript:fncAddGroupInsert();"  class="btn btn-primary">등록</a>
		<a href="javascript:fncGroupListDelete();"  class="btn btn-warning">삭제</a>
	</div>
</div>
</body>
</html>
