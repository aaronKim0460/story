<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<%
	String openType = egovframework.rte.fdl.string.EgovStringUtil.null2string((String)request.getAttribute("openType"), "");
	if("Y".equals(openType)){
		out.println("<script type='text/javaScript' language='javascript' defer='defer'>alert('수정되었습니다.');window.close();</script>");
		return;
	}
%>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnCheckAll() {
    var checkField = document.listForm.checkField;
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
function fnDeleteUser() {
    var checkField = document.listForm.checkField;
    var id = document.listForm.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
    	//alert(checkedIds);
        if(confirm("<spring:message code="common.delete.msg" />")){
        	document.listForm.checkedIdForDel.value=checkedIds;
            document.listForm.action = "<c:url value='/uss/umt/EgovUserDelete.do'/>";
            document.listForm.submit();
        }
    }
}

function fnAddUserView() {
    document.listForm.action = "<c:url value='/uss/umt/EgovUserInsertView.do'/>";
    document.listForm.submit();
}
function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.listForm.submit();
}
function fnSearch(){
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.listForm.submit();
}
function fnViewCheck(){
    if(insert_msg.style.visibility == 'hidden'){
    	insert_msg.style.visibility = 'visible';
    }else{
    	insert_msg.style.visibility = 'hidden';
    }
}
//-->
	function fnSelectUser(id) {
    document.listForm.selectedId.value = id;
    array = id.split(":");
    if(array[0] == "") {
    } else {
        userTy = array[0];
        userId = array[1];
    }
   	document.listForm.selectedId.value = userId;
    document.listForm.action = "<c:url value='/uss/umt/EgovUserSelectUpdtView.do'/>";
    document.listForm.submit();

}
</script>

<body>
<h2 class="adminH2">업무사용자관리</h2>
<div class="board-pages">
	<span class="board-pages-total">사용자수 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>명</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form name="listForm" action="<c:url value='/uss/umt/EgovUserManage.do'/>" method="post">
<input name="selectedId" type="hidden" />
<input name="checkedIdForDel" type="hidden" />
<input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>

<div class="board-search">
	<fieldset>
	<legend>목록검색</legend>	
		<select name="sbscrbSttus" id="sbscrbSttus" class="board-search-select">
		    <option value="0" <c:if test="${empty userSearchVO.sbscrbSttus || userSearchVO.sbscrbSttus == '0'}">selected="selected"</c:if> >상태(전체)</option>
			<option value="A" <c:if test="${userSearchVO.sbscrbSttus == 'A'}">selected="selected"</c:if> >가입신청</option>
			<option value="D" <c:if test="${userSearchVO.sbscrbSttus == 'D'}">selected="selected"</c:if> >삭제</option>
			<option value="P" <c:if test="${userSearchVO.sbscrbSttus == 'P'}">selected="selected"</c:if> >승인</option>
		</select>
		<select name="searchCondition" id="searchCondition" class="board-search-select">
		    <option value="0" <c:if test="${userSearchVO.searchCondition == '0'}">selected="selected"</c:if> >아이디</option>
			<option value="1" <c:if test="${empty userSearchVO.searchCondition || userSearchVO.searchCondition == '1'}">selected="selected"</c:if> >이름</option>
		</select>
		<input name="searchKeyword" type="text" class="board-search-keyword" value="<c:out value="${userSearchVO.searchKeyword}"/>"  />
		<input type="submit" id="board-search-submit" class="btn btn-sm btn-default" value="검색" onclick="fnSearch(); return false;" />
	</fieldset>
</div>
	
<div class="board-list">	
	<table class="board-default">
		<colgroup>
			<!-- <col style="width:3%" /> -->
			<col style="width:14%" />
			<col style="width:14%" />
			<col style="width:20%" />
			<col style="width:16%" />
			<col style="width:17%" />
			<col style="width:16%" />
		</colgroup>
		<thead>
        	<tr>
        		<!-- 
                <th class="board-default-th-no">
                    <input name="checkAll" type="checkbox" title="Check All" onclick="javascript:fnCheckAll();"/>
                </th>
                 -->
                <th class="board-default-th-title">아이디</th>
                <th class="board-default-th-title">사용자이름</th>
                <th class="board-default-th-title">사용자이메일</th>
                <th class="board-default-th-title">전화번호</th>
                <th class="board-default-th-no">등록일</th>
                <th class="board-default-th-no">가입상태</th>
            </tr>
		</thead>
		<tbody>

			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr onclick="javascript:fnSelectUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;" align="center">
				
				<%-- <td class="board-default-td-no">
					<input name="checkField" title="Check <c:out value="${status.count}"/>" type="checkbox"/>
					<input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>"/>
				</td> --%>
				<td class="board-default-td-title">
					<c:out value="${result.userId}"/>
				</td>
				<td class="board-default-td-title"><c:out value="${result.userNm}"/></td>
				<td class="board-default-td-title"><c:out value="${result.emailAdres}"/></td>
				<td class="board-default-td-title"><c:out value="${result.moblphonNo}"/></td>
				<td class="board-default-td-no"><c:out value="${result.sbscrbDe}"/></td>
				<td class="board-default-td-no">
			    	<c:forEach var="emplyrSttusCode_result" items="${emplyrSttusCode_result}" varStatus="status">
					<c:if test="${result.sttus == emplyrSttusCode_result.code}"><c:out value="${emplyrSttusCode_result.codeNm}"/></c:if>
					</c:forEach>
			    </td>
			</tr>
			</c:forEach>
              
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td class="lt_text3" colspan="8">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
	</div>
</div>

<div class="board-detail-foot">
	<div class="btns clear fr">	
        <a href="<c:url value='/uss/umt/EgovUserInsertView.do'/>" onclick="fnAddUserView(); return false;" class="btn btn-primary">등록</a>
	</div>
</div>

</form>

</body>
</html>
