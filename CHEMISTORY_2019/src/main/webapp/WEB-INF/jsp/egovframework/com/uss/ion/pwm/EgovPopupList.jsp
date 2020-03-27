<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
<script type="text/javaScript" language="javascript">
$(document).ready(function(){
	// 리스트 포인터 설정
	$("#banner_list tr").css("cursor", "pointer");
	// 상세보기
	$("#popup_list tr .detailMove").click(function(){
		var popupId = $(this).closest("tr").attr("popid");
		
		$("#popupId").val(popupId);
		
		$("#listForm").attr("action", "<c:url value='/uss/ion/pwm/updtPopup.do' />");
		$("#listForm").submit();
	    
	});
});
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************* */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/ion/pwm/listPopup.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_PopupManage(){
	location.href = "<c:url value='/uss/ion/pwm/registPopup.do' />";
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_PopupManage(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/ion/pwm/listPopup.do' />";
	vFrom.submit();

}
/* ********************************************************
* 체크 박스 선택 함수
******************************************************** */
function fn_egov_checkAll_PopupManage(){

	var FLength = document.getElementsByName("checkList").length;
	var checkAllValue = document.getElementById('checkAll').checked;

	//undefined
	if( FLength == 1){
		document.getElementById("checkList").checked = checkAllValue;
	}{
			for(var i=0; i < FLength; i++)
			{
				document.getElementsByName("checkList")[i].checked = checkAllValue;
			}
		}

}
/* ********************************************************
* 팝업창 미리보기
******************************************************** */
function fn_egov_view_PopupManage(){


	var FLength = document.getElementsByName("checkList").length;
	var checkCount = 0;
	
	jQuery("input[name='checkList']").each(function() {
		if (this.checked) {
			checkCount++;
		}
	});
	if ( checkCount == 0) {
		alert("미리보기 실행할 팝업창을 선택해 주세요.");
	}{
		if( FLength == 1){
			if(document.getElementById("checkList").checked == true){
				fn_egov_ajaxPopupInfo_PopupManage( document.getElementById("checkList").value );
			}
		}{
			for(var i=0; i < FLength; i++)
			{
				if(document.getElementsByName("checkList")[i].checked == true){
					fn_egov_ajaxPopupInfo_PopupManage( document.getElementsByName("checkList")[i].value );
				}
			}
		}
	}
	return;

}
/* ********************************************************
* 팝업창 정보 Ajax통신으로 정보 획득
******************************************************** */
function fn_egov_ajaxPopupInfo_PopupManage(popupIds){
	var url = "<c:url value='/uss/ion/pwm/ajaxPopupManageInfo.do' />";

	var param = {
			popupId: popupIds
	};
	
	$.ajax({
        type: 'post'
      , data : param
      , url: url
      , dataType : 'html'
      , beforeSend : function(){}
      , success: function(data) {
    	  	var returnValueArr = data.split("||");
  	   		fn_egov_popupOpen_PopupManage(popupIds,
      	    	returnValueArr[0],
      	    	returnValueArr[1],
      	    	returnValueArr[2],
      	    	returnValueArr[3],
      	    	returnValueArr[4],
      	    	returnValueArr[5]);
      }
	});
};

/* ********************************************************
* 팝업창  오픈
******************************************************** */
function fn_egov_popupOpen_PopupManage(popupId,fileUrl,width,height,top,left,stopVewAt){

	var url = "<c:url value='/uss/ion/pwm/openPopupManage.do' />?";
	url = url + "fileUrl=" + fileUrl;
	url = url + "&stopVewAt=" + stopVewAt;
	url = url + "&popupId=" + popupId;
	var name = popupId;
	var openWindows = window.open(url,name,"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");

	if (window.focus) {openWindows.focus()}
}

/* ********************************************************
* 팝업창  오픈 쿠키 정보 OPEN
******************************************************** */
function fnGetCookie(name) {
	  var prefix = name + "=";

	  var cookieStartIndex = document.cookie.indexOf(prefix);
	  if (cookieStartIndex == -1) return null;
	  var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
	  if (cookieEndIndex == -1) cookieEndIndex = document.cookie.length;


	  return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex));
}

</script>

<body>
<h2 class="adminH2">팝업창관리</h2>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<div class="board-search">
<form name="listForm" id="listForm" action="<c:url value='/uss/ion/pwm/listPopup.do'/>" method="post">

	<fieldset>
	<legend>목록검색</legend>
		<select name="searchCondition" id="searchCondition" class="board-search-select">
		   < <option value=''>--선택하세요--</option>
		   <option value='POPUP_SJ_NM' <c:if test="${searchCondition == 'POPUP_SJ_NM'}">selected</c:if>>팝업창명</option>
		   <option value='FILE_URL' <c:if test="${searchCondition == 'FILE_URL'}">selected</c:if>>팝업창URL</option>
		</select>
		<input name="searchKeyword" type="text" value="<c:out value="${searchKeyword}"/>" size="25" id="searchKeyword" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="fn_egov_search_PopupManage(); return false;" />
		
		<input type="button" value="미리보기" onclick="fn_egov_view_PopupManage(); return false;" class="btn btn-primary" />
	</fieldset>
<input name="popupId" id="popupId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${popupManageVO.pageIndex}'/>"/>
</form>
</div>

<div class="board-list">
<table class="board-default">
<colgroup>
			<col style="width:5%" />
			<col style="width:5%" />
			<col style="width:*" />
			<col style="width:20%" />
			<col style="width:20%" />
			<col style="width:10%" />
		</colgroup>
<thead>
  <tr>
    <th class="board-default-th-title"><input type="checkbox" name="checkAll" id="checkAll" class="check2" value="1" onClick="fn_egov_checkAll_PopupManage();"></th>
    <th class="board-default-th-title">순번</th>
    <th class="board-default-th-title">제목</th>
    <th class="board-default-th-title">게시 기간</th>
    <th class="board-default-th-title">파일URL</th>
    <th class="board-default-th-title">게시상태</th>
  </tr>
</thead>
<tbody id="popup_list">
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="7">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<form name="detailForm" id="detailForm" method="post" action="<c:url value='/uss/ion/pwm/detailPopup.do'/>">
	<tr popid="<c:out value="${resultInfo.popupId}" />">
	    <td class="board-default-td-no">
			<input type="checkbox" name="checkList" id="checkList" class="check2" value="${resultInfo.popupId}">
	    </td>
	    <td class="board-default-td-no detailMove"><c:out value="${(popupManageVO.pageIndex-1) * popupManageVO.pageSize + status.count}"/></td>
	    <td class="board-default-td-title detailMove">
	    	<c:out value="${resultInfo.popupTitleNm}"/>
	    </td>
	    <td class="board-default-td-no detailMove">
	 	<c:out value="${fn:substring(resultInfo.ntceBgnde, 0, 4)}"/>-<c:out value="${fn:substring(resultInfo.ntceBgnde, 4, 6)}"/>-<c:out value="${fn:substring(resultInfo.ntceBgnde, 6, 8)}"/> <c:out value="${fn:substring(resultInfo.ntceBgnde, 8, 10)}"/>H <c:out value="${fn:substring(resultInfo.ntceBgnde, 10, 12)}"/>M
	 	<br/>
	 	<c:out value="${fn:substring(resultInfo.ntceEndde, 0, 4)}"/>-<c:out value="${fn:substring(resultInfo.ntceEndde, 4, 6)}"/>-<c:out value="${fn:substring(resultInfo.ntceEndde, 6, 8)}"/> <c:out value="${fn:substring(resultInfo.ntceEndde, 8, 10)}"/>H <c:out value="${fn:substring(resultInfo.ntceEndde, 10, 12)}"/>M
	    <td class="board-default-td-title detailMove">
	    <c:out value="${resultInfo.fileUrl}"/>
	    </td>
	    <td class="board-default-td-no detailMove">
	       <c:out value="${resultInfo.ntceAt}"/>
	    </td>
	</tr>
</form>
</c:forEach>
</tbody>
</table>
</div>

<c:if test="${!empty popupManageVO.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image2" jsFunction="linkPage" />
    </div>
</div>
</c:if>

<div class="board-detail-foot">
	<div class="btns clear fr">	
		<a href="<c:url value='/uss/ion/pwm/registPopup.do'/>?pageIndex=<c:out value='${popupManageVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${searchKeyword}"/>&amp;searchCondition=<c:out value="${searchCondition}"/>" onclick="fncAddBannerInsert(); return false;" class="btn btn-primary">등록</a>
 	</div>
</div>

</body>
</html>