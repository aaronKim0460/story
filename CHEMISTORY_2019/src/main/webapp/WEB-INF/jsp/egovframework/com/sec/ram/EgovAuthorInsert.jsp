<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="authorManage" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">
<!--
function fncSelectAuthorList() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
	varFrom.submit();
}

function fncAuthorInsert() {

    var varFrom = document.getElementById("authorManage");
    varFrom.action = "<c:url value='/sec/ram/EgovAuthorInsert.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAuthorManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncAuthorUpdate() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/sec/ram/EgovAuthorUpdate.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAuthorManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncAuthorDelete() {
	var varFrom = document.getElementById("authorManage");
	varFrom.action = "<c:url value='/sec/ram/EgovAuthorDelete.do'/>";
	if(confirm("삭제 하시겠습니까?")){
	    varFrom.submit();
	}
}
//-->
</script>

<c:set var="registerFlag" value="${empty authorManageVO.authorCode ? 'INSERT' : 'UPDATE'}"/>
<c:set var="registerFlagName" value="${empty authorManageVO.authorCode ? '권한 등록' : '권한 수정'}"/>

<body>
<div class="content-body">
<div class="board-list">
<form:form commandName="authorManage" method="post" >
<input type="hidden" name="searchCondition" value="<c:out value='${authorManageVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${authorManageVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${authorManageVO.pageIndex}' default='1' />"/>
	<table class="board-write">
	<caption>글 등록</caption>
		<colgroup>
		    <col style="width:15%" />
		    <col />
		</colgroup>
	    <tbody>
		<tr>
		    <th class="board-write-th">권한 코드<i class="board-required"><span class="hide"></span></i></th>
		    <td class="board-write-td"><input id="authorCode" name="authorCode" type="text" value="<c:out value='${authorManage.authorNm}'/>" class="input-text" maxLength="50" size="50" title="권한코드"/></td>
		</tr>
		<tr>
		    <th class="board-write-th">권한 명<i class="board-required"><span class="hide"></span></i></th>
		    <td class="board-write-td"><input id="authorNm" name="authorNm" type="text" value="<c:out value='${authorManage.authorNm}'/>" class="input-text" maxLength="50" size="50" title="권한명"/></td>
		</tr>
		<tr>
		    <th class="board-write-th">설명</th>
		    <td class="board-write-td"><input id="authorDc" name="authorDc" type="text" value="<c:out value='${authorManage.authorDc}'/>" class="input-text" maxLength="50" size="50" title="설명"/></td>
		</tr>
		</tbody>
	</table>
  	 <div class="text-center">
      <c:if test="${bdMstr.authFlag == 'Y'}">
      <!-- 
	      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	      <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap>
	      <a href="javascript:fn_egov_regist_notice();"><spring:message code="button.create" /></a>
	      </td>
	      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	   -->
	  	  <td width="10"></td>
      </c:if>
      	<a href="javascript:fncSelectAuthorList();" class="btn btn-default">목록</a>
      	<a href="javascript:fncAuthorInsert();" class="btn btn-primary">등록</a>
	</div>
</form:form>
</div>
</div>
</body>
</html>

