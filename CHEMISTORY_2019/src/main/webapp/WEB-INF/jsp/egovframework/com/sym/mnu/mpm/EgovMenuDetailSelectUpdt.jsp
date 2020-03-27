<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<validator:javascript formName="menuManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript">

/* 입력값 validator 함수  */
function fn_validatorMenuList() {

	if(document.menuManageVO.menuNo.value == ""){alert("메뉴번호는 Not Null 항목입니다."); return false;}
	if(!checkNumber(document.menuManageVO.menuNo.value)){alert("메뉴번호는 숫자만 입력 가능합니다."); return false;}

	if(document.menuManageVO.menuOrdr.value == ""){alert("메뉴DEPTH는 Not Null 항목입니다."); return false;}
	if(!checkNumber(document.menuManageVO.menuOrdr.value)){alert("메뉴DEPTH는 숫자만 입력 가능합니다."); return false;}

	if(document.menuManageVO.upperMenuId.value == ""){alert("상위메뉴번호는 Not Null 항목입니다."); return false;}
	if(!checkNumber(document.menuManageVO.upperMenuId.value)){alert("상위메뉴번호는 숫자만 입력 가능합니다."); return false;}

	if(document.menuManageVO.progrmFileNm.value == ""){alert("프로그램은 Not Null 항목입니다."); return false;}
	if(document.menuManageVO.menuNm.value == ""){alert("메뉴명은 Not Null 항목입니다."); return false;}

   return true;
}


/* 필드값 Number 체크 함수 */
function checkNumber(str) {
   var flag=true;
   if (str.length > 0) {
       for (var i = 0; i < str.length; i++) {
           if (str.charAt(i) < '0' || str.charAt(i) > '9') {
               flag=false;
           }
       }
   }
   return flag;
}


/* 메뉴이동 화면 호출 함수 */
function mvmnMenuList() {
	window.open("<c:url value='/sym/mnu/mpm/EgovMenuListSelectMvmn.do' />?searchKeyword=" + document.getElementById('siteType').value,'Pop_Mvmn','scrollbars=yes,width=600,height=600');
}

/* 수정처리 함수 */
function updateMenuManage(form) {
	if(!fn_validatorMenuList())return;
	
	var userContent = CKEDITOR.instances.progrmContent.getData();
	userContent = userContent.replaceAll("<script", "<nier");
	userContent = userContent.replaceAll("</script", "</nier");
	
	// 빈값 체크
	var contentFlag = true;
	
	$("#content_test").html(CKEDITOR.instances.progrmContent.getData());
	
	$("#content_test_tabMenu").html(CKEDITOR.instances.tabMenuCont.getData());
	
	// 빈값 체크
	var contentFlag = true;
	if($.trim($("#content_test").text()) == ""){
		contentFlag = false;
	}
	
	// 빈값 체크
	var contentFlagTabMenu = true;	
	if($.trim($("#content_test_tabMenu").text()) == ""){
		contentFlagTabMenu = false;
	}
	
	
	$("#progrmContent").val(CKEDITOR.instances.progrmContent.getData());
	
	$("#tabMenuCont").val(CKEDITOR.instances.tabMenuCont.getData());
	
	if($("input[name='contentViewTy']:checked").val() == "D"){
		
		if($("input[name='useAt']:checked").val() == "Y" && !contentFlag){
			
			alert("DB 컨텐츠 내용이 입력되지 않았습니다.");
			return;
			
		}else if($("input[name='useAt']:checked").val() == "N"){
			
			if(!confirm("사용 안함으로 수정시 DB컨텐츠가 삭제 처리 됩니다. \n 그래도 진행 하시겠습니까?"))return;
		}
	}
	
	if($("[name='tabMenuUseAt']:checked").val() == "Y"){
		
		/*
		if(!contentFlagTabMenu){
			
			alert("컨텐츠 Tab메뉴 내용이 입력되지 않았습니다.");
			return;
		}
		*/
	}	
	
	if(confirm("<spring:message code="common.save.msg"/>")){

		if(!validateMenuManageVO(form)){
			return;
		}else{
            form.action="<c:url value='/sym/mnu/mpm/EgovMenuDetailSelectUpdt.do' />";
			form.submit();
		}
	}
}

/* 삭제처리함수 */
function deleteMenuManage(form) {
	if(confirm("<spring:message code="common.delete.msg"/>")){
        form.action="<c:url value='/sym/mnu/mpm/EgovMenuManageDelete.do' />";
		form.submit();
	}
}
/* 파일목록조회  함수 */
function searchFileNm() {
	document.all.tmp_SearchElementName.value = "progrmFileNm";
	window.open("<c:url value='/sym/prm/EgovProgramListSearch.do' />",'','width=860,height=640');
}
/* 목록조회 함수 */
function selectList(){
	location.href = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do' />";
}

/* 파일명 엔터key 목록조회  함수 */
function press() {
    if (event.keyCode==13) {
    	searchFileNm();    // 원래 검색 function 호출
    }
}

$(document).ready(function() {
	
	$("[name='req_menuNo']").val($("input[name=menuNo]").val());
	
	var useAt = "${menuManageVO.useAt}";
	
	fnGetAjaxData("/sym/mnu/mpm/selectContentYN.do", 'menuManageVO', fnContentYN, false);
	
	$("#progrmFileNm").change(function() {
		fnGetAjaxData("/sym/mnu/mpm/selectContentYN.do", 'menuManageVO', fnContentYN, false);
	});
	
	$("[name='contentViewTy']").change(function() {
		$("[name='contentViewTy']").removeAttr("checked");
		$(this).attr("checked", true);
		
		if($("[name='contentViewTy']:checked").val() == "D"){
			$("#contentEdit").show();
			$("#useAtView").show();
			$("#contentDBHistory").show();
			$("input[name=useAt]").parent().find("input[value="+useAt+"]").attr("checked", true);
		}else{
			$("#contentEdit").hide();
			$("#useAtView").hide();
			$("#contentDBHistory").hide();
			$("input[name='useAt']").removeAttr("checked")
		}
	});
	
	$("[name='useAt']").change(function() {
		
		$("[name='useAt']").removeAttr("checked");
		$(this).attr("checked", true);
	});
	
});

function fnContentYN(data) {
	
	var contentViewTy = "${menuManageVO.contentViewTy}";
	var useAt = "${menuManageVO.useAt}";
	
	if(data.result == "Y"){
		
		$("[name='contentViewTy']").removeAttr("checked");
		$("input[name=contentViewTy]").parent().find("input[value="+contentViewTy+"]").attr("checked", true);
		
		$("#contentView").show();
		
		if($("[name='contentViewTy']:checked").val() == "D"){
			$("#contentEdit").show();
			$("#useAtView").show();
			$("#contentDBHistory").show();
			$("input[name=useAt]").parent().find("input[value="+useAt+"]").attr("checked", true);
		}else{
			$("#contentEdit").hide();
			$("#useAtView").hide();
			$("#contentDBHistory").hide();
			$("input[name='useAt']").removeAttr("checked");
		}
		
	}else{
		$("#contentView").show();
		
		$("#useAtView").hide();
		$("#contentEdit").hide();
		$("#contentDBHistory").hide();
		$("input[name='useAt']").removeAttr("checked");
	}
}

<c:if test="${userAuthority == 'ROLE_ADMIN' }">

$(document).on("click", "#contentDB", function(){
	
	var menuNo = $("input[name=menuNo]").val();
	
	if(menuNo == null || menuNo == ""){
		alert("메뉴 정보를 확인할 수 없습니다.");
		return;
	}
	
	var param = "menuNo="+menuNo;
	
	window.open("/sym/mnu/mpm/contentDBHistoryPop.do?"+param, "content_history", "scrollbars=yes, width=600, height=800");
	
});

</c:if>	

if ("<c:out value='${resultMsg}'/>" != "") {
	alert("<c:out value='${resultMsg}'/>");
}

</script>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<c:set var="ImgUrl" value="/images/egovframework/com/sym/mnu/mpm/"/>
<body>

<div class="content-body">
<div class="board-list">
<c:url var="formUrl" value="/sym/mnu/mpm/EgovMenuManageListDetailSelect.do" />
<form:form commandName="menuManageVO" name="menuManageVO" method="post" action="${formUrl}" enctype="multipart/form-data">
<input type="hidden" name="tmp_SearchElementName" value="" />
<input type="hidden" name="tmp_SearchElementVal" value="" />
<input type="hidden" name="cmd" value="update" />
<input type="hidden" id="tempValue" name="tempValue" />
<input name="req_menuNo" type="hidden"  />

	<table class="board-write">
	<caption>메뉴 수정</caption>
		<colgroup>
		    <col style="width:110px;" />
		    <col />
		    <col style="width:110px;" />
		    <col />
		</colgroup>
	    <tbody>
			<tr>
			    <th class="board-write-th">메뉴번호<i class="board-required"><span class="hide"></span></i></th>
			    <td class="board-write-td">
			    	<form:input path="menuNo" cssClass="input-text"  size="10" maxlength="10" title="메뉴No"/>
			    </td>
			    <th class="board-write-th">메뉴DEPTH<i class="board-required"><span class="hide"></span></i></th>
			    <td class="board-write-td">
			    	<form:select path="menuOrdr" class="board-search-select" title="메뉴DEPTH">
						<option value="1" <c:if test="${menuManageVO.menuOrdr =='1'}">selected="selected"</c:if>>1차메뉴</option>
						<option value="2" <c:if test="${menuManageVO.menuOrdr =='2'}">selected="selected"</c:if>>2차메뉴</option>
						<option value="3" <c:if test="${menuManageVO.menuOrdr =='3'}">selected="selected"</c:if>>3차메뉴</option>
						<option value="4" <c:if test="${menuManageVO.menuOrdr =='4'}">selected="selected"</c:if>>4차메뉴</option>
						<option value="5" <c:if test="${menuManageVO.menuOrdr =='5'}">selected="selected"</c:if>>5차메뉴</option>
		        	</form:select>
		        	
		        	<form:radiobutton path="sysMenuAt" value="N"  checked="checked" />콘텐츠관리메뉴&nbsp;&nbsp;
			    	<form:radiobutton path="sysMenuAt" value="Y" />시스템관리메뉴
			    </td>
			</tr>
			<tr>
			    <th class="board-write-th">메뉴명<i class="board-required"><span class="hide"></span></i></th>
			    <td class="board-write-td">
			    	<form:input path="menuNm" cssClass="input-text" size="50" maxlength="30" title="메뉴명" />
			    </td>
			    <th class="board-write-th">메뉴노출순서<i class="board-required"><span class="hide"></span></i></th>
			    <td class="board-write-td">
			    	<form:input path="orderNum" cssClass="input-text" size="10" maxlength="10" title="메뉴노출순서" />
			    </td>			    
			</tr>
			<tr>
		    	<th class="board-write-th">사이트구분명</th>
			    <td class="board-write-td">
			    	<form:select path="siteType" class="board-search-select" title="사이트구분명">
						<c:forEach var="siteResult" items="${siteType}" varStatus="status">
						<option value="<c:out value='${siteResult.code }'/>" <c:if test="${siteResult.codeNm == menuManageVO.siteType }">selected="selected"</c:if>><c:out value="${siteResult.codeNm}"/> </option>
						</c:forEach>
					</form:select>
		        </td>
		    	<th class="board-write-th">상위메뉴번호<i class="board-required"><span class="hide"></span></i></th>
			    <td class="board-write-td">
			    	<form:input path="upperMenuId" cssClass="input-text" readonly="true" cssStyle="background-color: #ddd" size="10" maxlength="10" title="상위메뉴No" />
			    	<a href="javascript:mvmnMenuList();" class="btn btn-link" title="메뉴 선택">메뉴선택</a>
			    </td>
		    </tr>
			<tr>
			    <th class="board-write-th">프로그램<i class="board-required"><span class="hide"></span></i></th>
			    <td class="board-write-td">
			    	<form:input path="progrmFileNm" cssClass="input-text" readonly="true" cssStyle="background-color: #ddd" size="60" maxlength="60" onkeypress="press();" title="파일명" />
			    	<a href="javascript:searchFileNm();" class="btn btn-link" alt="프로그램 선택">프로그램 선택</a>
			    </td>
	    	    <th class="board-write-th">메뉴타입구분</th>
			    <td class="board-write-td">
				    <form:radiobutton path="menuType" value="0"  checked="checked" />프로그램 사용&nbsp;&nbsp;
				    <form:radiobutton path="menuType" value="1" /> 단순 링크
				</td>
			</tr>
			<tr style="display:none">
			    <th class="board-write-th">관련이미지명</th>
			    <td class="board-write-td">
			    	<form:input path="relateImageNm" cssClass="input-text" size="30" maxlength="30" title="관련이미지명" />
			    </td>
			    <th class="board-write-th">관련이미지경로</th>
			    <td class="board-write-td">
			    	<form:input path="relateImagePath" cssClass="input-text" size="30" maxlength="50" title="관련이미지경로"/>
			    </td>
			</tr>
			<tr>
			    <th class="board-write-th">메뉴 TEXT</th>
			    <td colspan="3" class="board-write-td">
			    	<form:input path="tabMenuText" cssClass="input-text" size="150" maxlength="150" title="메뉴 TEXT"/>
			    </td>
			</tr>	
			<tr>
			    <th class="board-write-th">컨텐츠탭<br></>메뉴여부</th>
			    <td colspan="3" class="board-write-td">
				    <form:radiobutton path="tabMenuUseAt" value="N"  checked="checked" /> &nbsp;미사용&nbsp;&nbsp;
				    <form:radiobutton path="tabMenuUseAt" value="Y" /> &nbsp;사용
			    </td>
			</tr>	
			<tr style="display:none">
			    <th class="board-write-th">컨텐츠탭</th>
			    <td class="board-write-td" colspan="3">
			    	<textarea id="tabMenuCont" name="tabMenuCont" class="textarea-board" cols="75" rows="20"><c:out value="${menuManageVO.tabMenuCont}" escapeXml="false" /></textarea>
					<form:errors path="tabMenuCont" /> 
					<script type="text/javascript">
					CKEDITOR.replace( 'tabMenuCont',{
						allowedContent: true,
					  'filebrowserUploadUrl':'/html/ckeditor/upload.jsp?'
					    +'realUrl=http://www.nier.go.kr/ImgTemp/'
					    +'&realDir=ImgTemp'
					});
					</script>
			    </td>
			</tr>				
			<tr>
			    <th class="board-write-th">담당부서</th>
			    <td class="board-write-td">
			    	<form:input path="menuAdmDpt" cssClass="input-text" size="20" maxlength="20" value="${adminVO.menuAdmDpt}" title="담당부서"/>
			    </td>
			    <th class="board-write-th">연락처</th>
			    <td class="board-write-td">
			    	<form:input path="menuCttpc" cssClass="input-text" size="20" maxlength="20" value="${adminVO.menuCttpc}" title="연락처" />
			    </td>
			</tr>
			<tr style="display:none">
			    <th class="board-write-th">공공누리</th>
			    <td class="board-write-td" colspan="3">
			    	<form:radiobutton path="publicNuriTy" value="0" /><span>사용안함</span>&nbsp;&nbsp;
					<form:radiobutton path="publicNuriTy" value="1" /><span><strong>제1유형</strong> : 출처표시</span>&nbsp;&nbsp;
					<form:radiobutton path="publicNuriTy" value="2" /><span><strong>제2유형</strong>: 출처표시+상업적 이용금지</span>&nbsp;&nbsp;</br>
			    	<form:radiobutton path="publicNuriTy" value="3" /><span><strong>제3유형</strong>: 출처표시+변경금지</span>&nbsp;&nbsp;
			    	<form:radiobutton path="publicNuriTy" value="4" /><span><strong>제4유형</strong>: 출처표시+상업적 이용금지+변경금지</span>
			    </td>
			</tr>
			<tr>
			    <th class="board-write-th">메뉴 설명</th>
			    <td class="board-write-td" colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
			    	<form:textarea path="menuDc" cssClass="input-text" cssStyle="width: 100%; height: 100px;" title="메뉴설명"/>
			    </td>
			</tr>
			
			<c:if test="${userAuthority == 'ROLE_ADMIN' }">
			<tr id="contentView" style="display:none;">
			    <th class="board-write-th">컨텐츠 노출 방법</th>
			    <td class="board-write-td" colspan="3">
			    	<form:radiobutton path="contentViewTy" value="H" /><span><strong>HTML</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<form:radiobutton path="contentViewTy" value="D" /><span><strong>DB</strong></span>
			    </td>
			</tr>
			<tr id="contentDBHistory" style="display:none;">
				<th class="board-write-th">컨텐츠 이력관리</th>
				<td class="board-write-td" colspan="3">
					<a id="contentDB" name = "contentDB" class="btn btn-default">DB 컨텐츠 이력관리</a>
				</td>
			</tr>
			<tr id="useAtView" style="display:none;">
				<th class="board-write-th">컨텐츠 사용여부</th>
				<td class="board-write-td" colspan="3">
					<form:radiobutton path="useAt" value="Y" /><span><strong>사용</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<form:radiobutton path="useAt" value="N" /><span><strong>사용 안함</strong></span>
				</td>
			</tr>	
			<tr id="contentEdit" style="display:none;">
				<th class="board-write-th">컨텐츠</th>
				<td class="board-write-editor" colspan="3">
					<textarea id="progrmContent" name="progrmContent" class="textarea-board" cols="75" rows="20"><c:out value="${menuManageVO.progrmContent}" escapeXml="false" /></textarea>
					<form:errors path="progrmContent" /> 
					<script type="text/javascript">
					CKEDITOR.replace( 'progrmContent',{
						allowedContent: true,
					  'filebrowserUploadUrl':'/html/ckeditor/upload.jsp?'
					    +'realUrl=http://www.nier.go.kr/ImgTemp/'
					    +'&realDir=ImgTemp'
					});
					</script>
				</td>
			</tr>	
			</c:if>  
			
		</tbody>
	</table>
</div>
</div>
	
<div class="text-center">
	<a href="javascript:selectList();" class="btn btn-default">목록</a>
	<a href="javascript:updateMenuManage(document.menuManageVO);" class="btn btn-primary">수정</a>
	<a href="javascript:deleteMenuManage(document.menuManageVO);" class="btn btn-warning">삭제</a>
</div>
</form:form>

<div id="content_test" style="display:none"></div>
<div id="content_test_tabMenu" style="display:none"></div>
</body>
</html>
