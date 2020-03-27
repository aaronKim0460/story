<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="groupManage" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

function fncSelectGroupList() {
    var varFrom = document.getElementById("groupManage");
    varFrom.action = "<c:url value='/sec/gmt/EgovGroupList.do'/>";
    varFrom.submit();
}

function fncGroupInsert() {
    var varFrom = document.getElementById("groupManage");
    varFrom.action = "<c:url value='/sec/gmt/EgovGroupInsert.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateGroupManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

</script>

<c:set var="registerFlag" value="${empty groupManageVO.groupId ? 'INSERT' : 'UPDATE'}"/>
<c:set var="registerFlagName" value="${empty groupManageVO.groupId ? '그룹 등록' : '그룹 수정'}"/>

<body>
<div class="content-body">
<div class="board-list">
<form:form commandName="groupManage" method="post" >
<input type="hidden" name="searchCondition" value="<c:out value='${groupManageVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${groupManageVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${groupManageVO.pageIndex}' default='1' />"/>
	<table class="board-write">
	<caption>글 등록</caption>
		<colgroup>
		    <col style="width:15%" />
		    <col />
		</colgroup>
	    <tbody>
		<tr>
		    <th class="board-write-th">그룹 명<i class="board-required"><span class="hide"></span></i></th>
		    <td class="board-write-td"><input id="groupNm" name="groupNm" type="text" value="<c:out value='${groupManage.groupNm}'/>" class="input-text" maxLength="50" size="50" title="그룹명"/></td>
		</tr>

		<tr>
		    <th class="board-write-th">설명</th>
		    <td class="board-write-td"><input id="groupDc" name="groupDc" type="text" value="<c:out value='${groupManage.groupDc}'/>" class="input-text" maxLength="50" size="50" title="설명"/></td>
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
      	<a href="javascript:fncSelectGroupList();" class="btn btn-default">목록</a>
      	<a href="javascript:fncGroupInsert();" class="btn btn-primary">등록</a>
	</div>
</form:form>
</div>
</div>

</body>
</html>

