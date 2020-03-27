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
                    checkField[i].value = checkId[i].value;
                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else
                	    returnValue = returnValue + ";" + checkField[i].value;
                    checkCount++;
                }
            }
            if(checkCount > 0)
                returnBoolean = true;
            else {
                alert("선택된 권한이 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된 권한이 없습니다.");
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

    document.listForm.authorCodes.value = returnValue;

    return returnBoolean;
}

function fncSelectAuthorList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthor(author) {
    document.listForm.authorCode.value = author;
    document.listForm.searchCondition.value = "1";
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthor.do'/>";
    document.listForm.submit();
}

function fncAddAuthorInsert() {
    location.replace("<c:url value='/sec/ram/EgovAuthorInsertView.do'/>");
}

function fncAuthorDeleteList() {

    if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sec/ram/EgovAuthorListDelete.do'/>";
            document.listForm.submit();
        }
    }
}

function fncAddAuthorView() {
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorUpdate.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorRole(author) {
    document.listForm.searchKeyword.value = author;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleList.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
    	fncSelectAuthorList('1');
    }
}
-->
</script>

<body>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form id="listForm" name="listForm" action ="<c:url value='/sec/ram/EgovAuthorList.do'/>" method="post" >
<input type="hidden" name="authorCode"/>
<input type="hidden" name="authorCodes"/>
<input type="hidden" name="pageIndex" value="<c:out value='${authorManageVO.pageIndex}'/>"/>
<input type="hidden" name="searchCondition"/>

<div class="board-search">
	<!--  검색  -->
	<fieldset>
	<legend>목록 검색</legend>
	권한명
	<input name="searchKeyword" type="text" value='<c:out value="${authorManageVO.searchKeyword}"/>' class="board-search-keyword" title="검색어 입력" onkeypress="press(event);">
	<input type="button" id="board-search-submit" class="btn btn-sm btn-default" onclick="fncSelectAuthorList('1'); return false;" value="검색" />
	<input type="button" id="button" class="btn-viewall btn btn-sm btn-link" value="전체보기" />
	</fieldset>
</div>
<div style="text-align:right;float:right">
	<font style="color:red">* 메뉴에 권한이 배정되어 있는 경우 삭제할 수 없습니다.</font>
</div>
<div class="board-list">
<table class="board-default">
	<colgroup>
		<col style="width:5%;" />
		<col />
		<col style="width:20%;" />
		<col style="width:20%;" />
		<col style="width:10%;" />
		<!-- <col style="width:80px;" /> -->
	</colgroup>
	<thead>
	  	<tr>
	    	<th class="board-default-th-no"><input type="checkbox" name="checkAll" onclick="javascript:fncCheckAll()" title="전체선택"></th>
		    <th class="board-default-th-title">권한아이디</th>
		    <th class="board-default-th-title">권한명</th>
		    <th class="board-default-th-title">설명</th>
		    <th class="board-default-th-date">등록일자</th>
		    <!-- <th class="board-default-th-hit">롤정보</th> -->
		</tr>
	</thead>

	<tbody>
		<c:forEach var="author" items="${authorList}" varStatus="status">
			<input type="hidden" name="checkId" value="<c:out value="${author.authorCode}"/>" />
			<fmt:parseDate var="ahthorCreateDe" pattern="MM/dd/yyyy" value="${fn:substring(author.authorCreatDe, 16, 26)}" />
			<tr <c:if test="${status.count % 2 == 1 }">class="bg"</c:if>>
				<td class="board-default-td"><input type="checkbox" name="delYn" title="선택" <c:if test="${author.deleteYn == 'N'}">disabled="disabled"</c:if>/></td>
				<td class="board-default-td-title"><a href="#LINK" onclick="javascript:fncSelectAuthor('<c:out value="${author.authorCode}"/>')"><c:out value="${author.authorCode}"/></a></td>
				<td class="board-default-td-date"><c:out value="${author.authorNm}"/></td>
				<td class="board-default-td-date"><c:out value="${author.authorDc}"/></td>
				<td class="board-default-td-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${ahthorCreateDe}"/></td>
				<%-- <td class="board-default-td-hit"><a href="javascript:fncSelectAuthorRole('<c:out value="${author.authorCode}"/>');" class="btn btn-sm btn-link">롤정보</a></td> --%>
			</tr>
		</c:forEach>

		<c:if test="${fn:length(authorList) == 0}">
			<tr class="bg">
				<td colspan="6">검색된 권한이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
	</table>
</div> 
</form>

<div class="board-footer">
	<div class="pagenavi">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fncSelectAuthorList" />
	</div>
</div>

<!-- 버튼 -->
<div class="board-detail-foot">
	<div class="btns clear fr">
		<a href="javascript:fncAddAuthorInsert();"  class="btn btn-primary">등록</a>
		<a href="javascript:fncAuthorDeleteList();"  class="btn btn-warning">삭제</a>
	</div>
</div>

</body>
</html>
