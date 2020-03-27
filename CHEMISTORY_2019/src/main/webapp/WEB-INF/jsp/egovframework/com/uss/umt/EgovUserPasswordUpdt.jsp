<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.LoginVO, egovframework.com.cmm.util.EgovUserDetailsHelper" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<%
String openType = egovframework.rte.fdl.string.EgovStringUtil.null2string((String)request.getAttribute("openType"), "");
String resultMsg = egovframework.rte.fdl.string.EgovStringUtil.null2string((String)request.getAttribute("resultMsg"), "");
if("Y".equals(openType) && !"".equals(resultMsg)){
	out.println("<script type='text/javaScript' language='javascript' defer='defer'>alert('수정되었습니다.');window.close();</script>");
	return;
}


	boolean isAdministrator = false;
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
	// 통합관리자 권한을 가진 사용자면 기존패스워드 체크 없음
	if("ROLE_ADMIN".equals(user.getAuthority())) isAdministrator = true;
%>

<validator:javascript formName="passwordChgVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.passwordChgVO.action = "<c:url value='/uss/umt/EgovUserManageNier.do'/>";
    document.passwordChgVO.submit();
}
function fnUpdate(){
    if(validatePasswordChgVO(document.passwordChgVO)){
        if(document.passwordChgVO.newPassword.value != document.passwordChgVO.newPassword2.value){
            alert("<spring:message code="fail.user.passwordUpdate2" />");
            return;
        }
        <%if(!isAdministrator){ %>
	        if(document.passwordChgVO.oldPassword.value == ""){
	        	alert("이전 비밀번호는 필수 입력값입니다.");
	        	return false;
	        }
        <%}%>
        
        document.passwordChgVO.submit();
    }
}
<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
//-->
</script>

<body>

<form name="passwordChgVO" method="post"  action="<c:url value="${'/uss/umt/EgovUserPasswordUpdt.do'}"/>" >
<!-- onsubmit="javascript:return FormValidation(document.passwordChgVO);" >  -->
<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
<input name="checkedIdForDel" type="hidden" />
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
<input type="hidden" name="openType" value="<c:out value='${openType}'/>"/>
<input type="hidden" name="emplyrId" value="<c:out value='${userManageVO.emplyrId}'/>" />
<input type="hidden" name="uniqId" value="<c:out value='${userManageVO.uniqId}'/>"/>
<input type="hidden" name="userTy" value="<c:out value='${userManageVO.userTy}'/>"/>
 
<div class="content-body">
<div class="board-list">    
	   
	<table class="board-write">
   	<caption>비밀번호 변경</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
            <tr>
                <th class="board-write-th">사용자아이디</th>
                <td class="board-write-td">
                   <c:out value='${userManageVO.emplyrId}'/>
                </td>
            </tr>
            
            <%if(!isAdministrator){ %>
            <tr> 
                <th class="board-write-th">기존 비밀번호</th>
                <td class="board-write-td">
                	<input name="oldPassword" id="oldPassword" class="input-text" type="password" size="20" value=""  maxlength="100" />
                </td>
            </tr>
            <%} %>
            
            <tr> 
                <th class="board-write-th">비밀번호</th>
                <td class="board-write-td">
                	<input name="newPassword" id="newPassword" class="input-text" type="password" size="20" value=""  maxlength="100" />
                </td>
            </tr>
            
            <tr>
                <th class="board-write-th">비밀번호확인</th>
                <td class="board-write-td">
                	<input name="newPassword2" id="newPassword2" class="input-text" type="password" size="20" value=""  maxlength="100" />
                </td>
            </tr>
            
		</tbody>            
	</table>
</div>
</div>

<div class="text-center">
	<c:if test="${openType eq 'Y'}"><a href="#none" onclick="window.close();" class="btn btn-default">닫기</a></c:if>
	<c:if test="${openType ne 'Y'}"><a href="#none"  onclick="fnListPage(); return false;" class="btn btn-default">목록</a></c:if>
	<input type="submit" value="비밀번호 변경" onclick="fnUpdate(); return false;"  class="btn btn-primary" />
	<!-- <a href="#LINK" onclick="javascript:document.passwordChgVO.reset();"  class="btn btn-link">초기화</a> -->
</div>

</form>

</body>
</html>
