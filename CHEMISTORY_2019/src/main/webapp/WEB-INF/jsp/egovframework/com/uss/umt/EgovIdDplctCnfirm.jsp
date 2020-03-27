<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript">
function fnCheckId(){
	if(fnCheckNotKorean(document.checkForm.checkId.value) && fnCheck(document.checkForm.checkId.value)){
		document.checkForm.submit();
    }else{
        return;
    }
}
function fnReturnId(){
	var retVal="";
    if (document.checkForm.usedCnt.value == 0){
	    retVal = document.checkForm.resultId.value;
	    
	    var browser=navigator.appName;
	    var parentPanel = null;

	    if(browser == "Microsoft Internet Explorer"){
	    	parentPanel = parent.window.document;
	    }else{
	    	parentPanel = opener.document;
	    }
	    
	    if(parentPanel.entrprsManageVO){
	    	parentPanel.entrprsManageVO.entrprsmberId.value = retVal;
	    }else if(parentPanel.userManageVO){
	    	parentPanel.userManageVO.emplyrId.value = retVal;
	    }else if(parentPanel.mberManageVO){
	    	parentPanel.mberManageVO.mberId.value = retVal;
	    }  

	    parent.window.returnValue = retVal;
        window.close();
    }else if (document.checkForm.usedCnt.value == 1){
        alert("이미사용중인 아이디입니다.");
        return;
    }else{
    	alert("먼저 중복확인을 실행하십시오");
        return;
    }
}
function fnClose(){
    var retVal="";
    window.returnValue = retVal;
    window.close();
}
function fnCheckNotKorean(koreanStr){
    for(var i=0;i<koreanStr.length;i++){
        var koreanChar = koreanStr.charCodeAt(i);
        if( !( 0xAC00 <= koreanChar && koreanChar <= 0xD7A3 ) && !( 0x3131 <= koreanChar && koreanChar <= 0x318E ) ) {
        }else{
            //hangul finding....
           	alert("한글은 사용할 수 없습니다.");
            return false;
        }
    }
    return true;
}

// 2011.10.25 보안점검 후속조치
function fnCheck(str){
    var blank_pattern = /[\s]/g;
    var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

    if( special_pattern.test(str) == true || blank_pattern.test(str) == true ){
        alert("공백 및 특수문자는 사용할 수 없습니다.");
        return false;
    } else {
   		return true;
	}
}

</script>

<body>

<form name="checkForm" action ="<c:url value='/uss/umt/EgovIdDplctCnfirm.do'/>">

<div class="content-body">
<div class="board-list">

    <table class="board-write">
    	<colgroup>
		    <col style="width:30%" />
		    <col style="width:70%" />
    	</colgroup>
    	<tbody>
        <tr><td height="20" colspan="2"></td></tr>
	        <tr>
	            <th class="board-write-th">사용할 아이디</th>
	            <td class="board-write-td">
	                <input type="hidden" name="resultId" value="<c:out value="${checkId}"/>" />
		            <input type="hidden" name="usedCnt" value="<c:out value="${usedCnt}"/>" />
		            <input type="text" name="checkId"  class="input-text" value="<c:out value="${checkId}"/>" maxlength="20" tabindex="1" title="아이디입력"/>
		        </td>
		    </tr>
		    <tr>
	            <th class="board-write-th">결과 : </th>
	            <td class="board-write-td">
	                <c:choose>
	                <c:when test="${usedCnt eq -1}">
	                    &nbsp; 중복확인을 실행하십시오
	                </c:when>
	                <c:when test="${usedCnt eq 0}">
	                    <c:out value='${checkId}'/> 는 사용가능한 아이디입니다.
	                </c:when>
	                <c:otherwise>
	                    <c:out value='${checkId}'/> 는 사용할수 없는 아이디입니다.
	                </c:otherwise>
	                </c:choose>
	            </td>
	        </tr>
	    </tbody>
    </table>
</div>
</div>

<div class="text-center">
	<input type="button" onclick="fnCheckId();" value="<spring:message code='button.inquire' />" />
	<input type="button" onclick="fnReturnId();" value="사용" />
	<input type="button" onclick="fnClose();" value="닫기" />
</div>         

    </form>

</body>
</html>
