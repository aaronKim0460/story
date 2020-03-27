<%--
  Class Name : EgovPopupRegist.jsp
  Description : 팝업창관리 등록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.09.16    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.09.16

    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<validator:javascript formName="popupManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_PopupManage(){

}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_PopupManage(){

	var varFrom = document.popupManageVO;

	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/uss/ion/pwm/updtPopup.do' />";
		if(!validatePopupManageVO(varFrom)){
			return;
		}else{
			document.getElementById('popupCn').value = CKEDITOR.instances.popupCn.getData();
			
			var ntceBgndeYYYMMDD = document.getElementById('ntceBgndeYYYMMDD').value;
			var ntceEnddeYYYMMDD = document.getElementById('ntceEnddeYYYMMDD').value;

			var iChkBeginDe = Number( ntceBgndeYYYMMDD.replaceAll("-","") );
			var iChkEndDe = Number( ntceEnddeYYYMMDD.replaceAll("-","") );

			if(iChkBeginDe > iChkEndDe || iChkEndDe < iChkBeginDe ){
				alert("게시시작일자는 게시종료일자 보다 클수 없고,\n게시종료일자는 게시시작일자 보다 작을수 없습니다. ");
				return;
			}

			varFrom.ntceBgnde.value = ntceBgndeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('ntceBgndeHH') +  fn_egov_SelectBoxValue('ntceBgndeMM');
			varFrom.ntceEndde.value = ntceEnddeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('ntceEnddeHH') +  fn_egov_SelectBoxValue('ntceEnddeMM');

			varFrom.submit();
		}
	}
}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_PopupManage() {
	if(confirm("<spring:message code="common.delete.msg" />")){
		var varForm = $("#deleteForm");
		varForm.action =  "<c:url value='/uss/ion/pwm/deletePopup.do' />";
		varForm.submit();
	}
};
/* ********************************************************
* RADIO BOX VALUE FUNCTION
******************************************************** */
function fn_egov_RadioBoxValue(sbName)
{
	var FLength = document.getElementsByName(sbName).length;
	var FValue = "";
	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName(sbName)[i].checked == true){
			FValue = document.getElementsByName(sbName)[i].value;
		}
	}
	return FValue;
}
/* ********************************************************
* SELECT BOX VALUE FUNCTION
******************************************************** */
function fn_egov_SelectBoxValue(sbName)
{
	var FValue = "";
	for(var i=0; i < document.getElementById(sbName).length; i++)
	{
		if(document.getElementById(sbName).options[i].selected == true){

			FValue=document.getElementById(sbName).options[i].value;
		}
	}

	return  FValue;
}
/* ********************************************************
* PROTOTYPE JS FUNCTION
******************************************************** */
String.prototype.trim = function(){
	return this.replace(/^\s+|\s+$/g, "");
}

String.prototype.replaceAll = function(src, repl){
	 var str = this;
	 if(src == repl){return str;}
	 while(str.indexOf(src) != -1) {
	 	str = str.replace(src, repl);
	 }
	 return str;
}

$('document').ready(function(){
	if($("#ntceBgndeYYYMMDDView").length < 1)return;

	$("#ntceBgndeYYYMMDDView").datepicker();
	
	$("#ntceBgndeYYYMMDDView").change(function(){
		
		var date = ($.trim($(this).val())).replaceAll("-","");
		$("#ntceBgndeYYYMMDD").val(date);
	});	
	
	//관리자 게시판 등록시 개시일자 오늘 날짜로 세팅
	if($.trim($('#ntceBgndeYYYMMDD').val()) == ''){
		var newDate = new Date();
		var yyyy = newDate.getFullYear();
		var mm = newDate.getMonth()+1;
		var dd = newDate.getDate();
		
        if (("" + mm).length == 1) { mm = "0" + mm; }
        if (("" + dd).length   == 1) { dd   = "0" + dd;   }
        
		var toDay = yyyy + "-" + mm + "-" + dd;
		
		$('#ntceBgndeYYYMMDD').val(toDay);
		$('#ntceBgndeYYYMMDDView').val(toDay);
	}	
});

$('document').ready(function(){
	if($("#ntceEnddeYYYMMDDView").length < 1)return;

	$("#ntceEnddeYYYMMDDView").datepicker();
	
	$("#ntceEnddeYYYMMDDView").change(function(){
		
		var date = ($.trim($(this).val())).replaceAll("-","");
		$("#ntceEnddeYYYMMDD").val(date);
	});	
	
	//관리자 게시판 등록시 개시일자 오늘 날짜로 세팅
	if($.trim($('#ntceEnddeYYYMMDD').val()) == ''){
		var newDate = new Date();
		var yyyy = newDate.getFullYear();
		var mm = newDate.getMonth()+1;
		var dd = newDate.getDate();
		
        if (("" + mm).length == 1) { mm = "0" + mm; }
        if (("" + dd).length   == 1) { dd   = "0" + dd;   }
        
		var toDay = yyyy + "-" + mm + "-" + dd;
		
		$('#ntceEnddeYYYMMDD').val(toDay);
		$('#ntceEnddeYYYMMDDView').val(toDay);
	}	
});
</script>
<script type="text/javascript">
_editor_area = "popupCn";
</script>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/uss/umt/" />
<body onLoad="fn_egov_init_PopupManage()">

<form:form commandName="popupManageVO" name="popupManageVO" action="${pageContext.request.contextPath}/uss/ion/pwm/updtPopup.do" method="post" >

<div class="content-body">
<div class="board-list">

<table class="board-write">
	<caption>배너/알림 등록</caption>
		<colgroup>
		    <col style="width:20%" />
		    <col style="width:80%" />
		</colgroup>
		<tbody>
		
  <tr>
    <th class="board-write-th" ><label id="IdPopupTitleNm">팝업창명</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td class="board-write-td">
      <form:input path="popupTitleNm" size="73" cssClass="input-text" maxlength="255"/>
      <form:errors path="popupTitleNm" cssClass="error"/>
    </td>
  </tr>

  <tr>
    <th class="board-write-th" ><label id="IdFileUrl">팝업창URL</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td class="board-write-td">
      <form:input path="fileUrl" size="73" cssClass="input-text" maxlength="255"/>
      <form:errors path="fileUrl" cssClass="error"/>
    </td>
  </tr>

  <tr>
   <th class="board-write-th" ><label id="IdPopupWlc">팝업창위치</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td class="board-write-td">
       <form:input path="popupWlc" size="5" maxlength="10" cssClass="input-text"/>
       <form:input path="popupHlc" size="5" maxlength="10" cssClass="input-text"/>(가로, 세로)
  <form:errors path="popupWlc" cssClass="error"/>
  <form:errors path="popupHlc" cssClass="error"/>

    </td>
  </tr>

  <tr>
    <th class="board-write-th" ><label id="IdNtceBgndeYYYMMDD">팝업창사이즈</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td class="board-write-td">
  <form:input path="popupWSize" size="5" maxlength="10" cssClass="input-text"/>
  <form:input path="popupHSize" size="5" maxlength="10" cssClass="input-text"/> (WIDTH, HEIGHT)
  <form:errors path="popupWSize" cssClass="error"/>
  <form:errors path="popupHSize" cssClass="error"/>

    </td>
  </tr>

  <tr>
    <th class="board-write-th" rowspan="2"><label id="IdNtceBgndeYYYMMDD1">게시 기간</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td class="board-write-td">
    	<input id="ntceBgndeYYYMMDD" name="ntceBgndeYYYMMDD" type="hidden" value="<c:out value="${fn:substring(popupManageVO.ntceBgnde, 0, 8)}"/>" />
		<input name="ntceBgndeYYYMMDDView" id="ntceBgndeYYYMMDDView" type="text" class="search-date-picker" style="width:140px" value="<c:out value="${fn:substring(popupManageVO.ntceBgnde, 0, 4)}"/>-<c:out value="${fn:substring(popupManageVO.ntceBgnde, 4, 6)}"/>-<c:out value="${fn:substring(popupManageVO.ntceBgnde, 6, 8)}"/>" readOnly />
		&nbsp;&nbsp;&nbsp;
			
    <form:select path="ntceBgndeHH" class="board-search-select">
        <form:options items="${ntceBgndeHH}" itemValue="code" itemLabel="codeNm"/>
    </form:select>H
    <form:select path="ntceBgndeMM" class="board-search-select">
        <form:options items="${ntceBgndeMM}" itemValue="code" itemLabel="codeNm"/>
    </form:select>M
	</td>
  </tr>
  <tr>
  	<td class="board-write-td">
    
    <input id="ntceEnddeYYYMMDD" name="ntceEnddeYYYMMDD" type="hidden" value="<c:out value="${fn:substring(popupManageVO.ntceEndde, 0, 8)}"/>" />
	<input name="ntceEnddeYYYMMDDView" id="ntceEnddeYYYMMDDView" type="text" class="search-date-picker" style="width:140px" value="<c:out value="${fn:substring(popupManageVO.ntceEndde, 0, 4)}"/>-<c:out value="${fn:substring(popupManageVO.ntceEndde, 4, 6)}"/>-<c:out value="${fn:substring(popupManageVO.ntceEndde, 6, 8)}"/>" readOnly />
	&nbsp;&nbsp;&nbsp;
			
    <form:select path="ntceEnddeHH" class="board-search-select">
        <form:options items="${ntceEnddeHH}" itemValue="code" itemLabel="codeNm"/>
    </form:select>H
    <form:select path="ntceEnddeMM" class="board-search-select">
        <form:options items="${ntceEnddeMM}" itemValue="code" itemLabel="codeNm"/>
    </form:select>M
    </td>
  </tr>
  <tr>
	  	<td class="board-write-editor" colspan="2">
				<textarea id="popupCn" name="popupCn" class="textarea-board" cols="75" rows="20"><c:out value="${popupManageVO.popupCn}" escapeXml="false" /></textarea>
				<form:errors path="popupCn" /> 
				<script type="text/javascript">
				CKEDITOR.replace( 'popupCn',{
				  'filebrowserUploadUrl':'/html/ckeditor/upload.jsp?'
				    +'realUrl=/ImgTemp/'
				    +'&realDir=ImgTemp'
				});
				</script>
			</td>
  </tr>
  <tr>
   <th class="board-write-th" ><label id="IdStopVewAt">그만보기 설정 여부</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td class="board-write-td">
		<input type="radio" name="stopVewAt" value="Y" <c:if test="${popupManageVO.stopVewAt eq 'Y'}">checked</c:if>>&nbsp;&nbsp;Y
		&nbsp;&nbsp;
		<input type="radio" name="stopVewAt" value="N" <c:if test="${popupManageVO.stopVewAt eq 'N'}">checked</c:if>>&nbsp;&nbsp;N
    </td>
  </tr>
  <tr>
    <th class="board-write-th" ><label id="IdStceAt">계시 상태</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td class="board-write-td">
		<input type="radio" name="ntceAt" value="Y" <c:if test="${popupManageVO.ntceAt eq 'Y'}">checked</c:if>>&nbsp;&nbsp;Y
		&nbsp;&nbsp;
		<input type="radio" name="ntceAt" value="N" <c:if test="${popupManageVO.ntceAt eq 'N'}">checked</c:if>>&nbsp;&nbsp;N
    </td>
  </tr>
</tbody>
</table>
</div>
</div>

<div class="text-center">
	<a href="<c:url value='/uss/ion/pwm/listPopup.do'/>" onclick="fncSelectBannerList(); return false;" class="btn btn-default">목록</a>
	<input type="submit" value="저장" onclick="fn_egov_save_PopupManage(); return false;" class="btn btn-primary" />
	<a href="javascript:void(0);" onclick="fn_egov_PopupManage();" class="btn btn-warning">삭제</a>
</div>

<form:hidden path="ntceBgnde" />
<form:hidden path="ntceEndde" />
<input name="popupId" type="hidden" value="${popupManageVO.popupId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</DIV>

<form name="deleteForm" id="deleteForm" action="<c:url value='/uss/ion/pwm/deletePopup.do'/>">
	<input name="popupId" type="hidden" value="${popupManageVO.popupId}">
	<input name="cmd" type="hidden" value="<c:out value='del'/>"/>
</form>

</body>
</html>
