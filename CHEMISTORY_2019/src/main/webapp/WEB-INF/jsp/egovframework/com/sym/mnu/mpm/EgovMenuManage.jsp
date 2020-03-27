<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
  String imagePath_icon   = "/images/egovframework/com/sym/mnu/mpm/icon";
  String imagePath_button = "/images/egovframework/com/sym/mnu/mpm/button";
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script language="javascript1.2" type="text/javaScript">
$(document).on('click', '.btn-viewall.btn.btn-sm.btn-link', function(){
	$('.board-search-keyword').val('');
	document.menuManageForm.pageIndex.value = 1;
	document.menuManageForm.submit();
});

<!--
/* 모두선택 처리 함수 */
function fCheckAll() {
    var checkField = document.menuManageForm.checkField;
    if(document.menuManageForm.checkAll.checked) {
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
/* 멀티삭제 처리 함수  */
function fDeleteMenuList() {
    var checkField = document.menuManageForm.checkField;
    var menuNo = document.menuManageForm.checkMenuNo;
    var checkMenuNos = "";
    var checkedCount = 0;
    alert(checkField.length);
    if(checkField) {

    	if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkMenuNos += ((checkedCount==0? "" : ",") + menuNo[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkMenuNos = menuNo.value;
                checkedCount++;
            }
        }
    }
    if(checkedCount ==0){
		alert("선택된 메뉴가 없습니다.");
		return false;
    }

    document.menuManageForm.checkedMenuNoForDel.value=checkMenuNos;
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageListDelete.do'/>";
    document.menuManageForm.submit();
}

/* 페이징 처리 함수  */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.menuManageForm.pageIndex.value = pageNo;
	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
   	document.menuManageForm.submit();
}

/* 조회 처리 함수  */
function selectMenuManageList() {
	document.menuManageForm.pageIndex.value = 1;
	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
	document.menuManageForm.submit();
}

/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertMenuManage() {
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>";
   	document.menuManageForm.submit();
}

/* ********************************************************
 * 일괄처리 화면호출 함수
 ******************************************************** */
/* function bndeInsertMenuManage() {
	   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>";
	   	document.menuManageForm.submit();
	}
 */
function bndeInsertMenuManage() {
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuBndeRegist.do'/>";
   	document.menuManageForm.submit();
}
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtMenuManageDetail(menuNo) {
	document.menuManageForm.req_menuNo.value = menuNo;
   	document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageListDetailSelect.do'/>";
   	document.menuManageForm.submit();
}
/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuManageSelect(){
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
    document.menuManageForm.submit();
}
<c:if test="${!empty resultMsg}">alert("<c:out value='${resultMsg}'/>");</c:if>
-->
</script>

<body>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="menuManageForm" action="<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do' />" method="post">
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="checkedMenuNoForDel" type="hidden" />
<input name="req_menuNo" type="hidden"  />

<div class="board-search">
	<fieldset>
	<legend>목록검색</legend>
		<select name="searchSiteType" class="board-search-select" style="width:120px">
			<option value="">사이트구분</option>
			<c:forEach var="siteResult" items="${siteType}" varStatus="status">
				<option value="<c:out value='${siteResult.code }'/>" <c:if test="${searchVO.searchSiteType == siteResult.code}">selected="selected"</c:if>><c:out value="${siteResult.codeNm}"/> </option>
			</c:forEach>
		</select>
		        	
		<select name="searchCnd" class="board-search-select" style="width:120px">
			<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >메뉴명</option>
			<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >메뉴ID</option>
			<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >프로그램명</option>
		</select>
		<input name="searchKeyword" type="text" value="<c:out value='${searchVO.searchKeyword}'/>" size="25" title="검색" class="board-search-keyword" />
		<input type="submit" value="검색" onclick="selectMenuManageList(); return false;" id="board-search-submit" class="btn btn-sm btn-default" />
		<input type="button" id="button" class="btn-viewall btn btn-sm btn-link" value="전체보기" />
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:30px;" />
			<col style="width:10%" />
			<col />
			<col style="width:20%" />
			<col style="width:20%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
			   <th><input type="checkbox" name="checkAll" onclick="javascript:fCheckAll()" title="전체선택"></th>
			   <th class="board-default-th-title">메뉴 ID</th>
			   <th class="board-default-th-title">메뉴한글명</th>
			   <th class="board-default-th-no">프로그램파일명</th>
			   <th class="board-default-th-no">메뉴설명</th>
			   <th class="board-default-th-no">상위메뉴ID</th>
			 </tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${list_menumanage}" varStatus="status">
			<input type="hidden" name="checkMenuNo" value="<c:out value='${result.menuNo}'/>"/>
			<tr>
				<td class="board-default-td-no"><input type="checkbox" name="checkField" title="선택"></td>
				<td class="board-default-td-title"><c:out value="${result.menuNo}"/></td>
				<td class="board-default-td-title"><a href="<c:url value='/sym/mnu/mpm/EgovMenuManageListDetailSelect.do?req_menuNo='/><c:out value='${result.menuNo}'/>"><c:out value="${result.menuNm}"/></a></td>
				<td class="board-default-td-title"><c:out value="${result.progrmFileNm}"/><input type="hidden" name="mberTyCode" value="<c:out value='${result.mberTyCode}'/>"/></td>
				<td class="board-default-td-title"><c:out value="${result.menuDc}"/></td>
				<td class="board-default-td-title"><c:out value="${result.upperMenuId}"/></td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(list_menumanage) eq 0}">
				<tr class="bg">
					<td colspan="6">검색된 메뉴가 없습니다.</td>
				</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<c:if test="${!empty searchVO.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>
</div>
</c:if>

<div class="board-detail-foot">
	<div class="btns clear fr">
		<a href="#LINK" onclick="bndeInsertMenuManage();" class="btn btn-primary">일괄등록</a>
		<a href="#LINK" onclick="insertMenuManage();" class="btn btn-primary">등록</a>
		<a href="#LINK" onclick="fDeleteMenuList();" class="btn btn-warning">삭제</a>
	</div>
</div>
</form>

</body>
</html>

