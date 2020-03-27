<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<validator:javascript formName="menuManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript">

/* 메뉴이동 화면 호출 함수  */
function mvmnMenuList() {
	window.open("<c:url value='/sym/mnu/mpm/EgovMenuListSelectMvmn.do' />?searchKeyword=" + document.getElementById('siteType').value,'Pop_Mvmn','scrollbars=yes,width=600,height=600');
}

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
       for (i = 0; i < str.length; i++) {
           if (str.charAt(i) < '0' || str.charAt(i) > '9') {
               flag=false;
           }
       }
   }
   return flag;
}

/* 입력처리 함수 */
function insertMenuManage(form) {
	if(!fn_validatorMenuList()){return;}
	
	var userContent = CKEDITOR.instances.progrmContent.getData();
	
	var userContentTabMenu = CKEDITOR.instances.tabMenuCont.getData();
	
	
	userContent = userContent.replaceAll("<script", "<nier");
	userContent = userContent.replaceAll("</script", "</nier");
	

	
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
	
	if($("[name='contentViewTy']:checked").val() == "D"){
		
		$("input[name='useAt']").val("Y");
		
		if(!contentFlag){
			
			alert("DB 컨텐츠 내용이 입력되지 않았습니다.");
			return;
		}
	}
	
	if($("[name='contentViewTy']:checked").val() == "D"){
		
		$("input[name='useAt']").val("Y");
		
		if(!contentFlag){
			
			alert("DB 컨텐츠 내용이 입력되지 않았습니다.");
			return;
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
	
	
	if(confirm("<spring:message code="common.save.msg" />")){

		if(!validateMenuManageVO(form)){
			return;
		}else{
			form.submit();
		}
	}
}

/* 파일목록조회  함수 */
function searchFileNm() {
	document.all.tmp_SearchElementName.value = "progrmFileNm";
	window.open("<c:url value='/sym/prm/EgovProgramListSearch.do' />",'Pop_progrmFileNm','width=860,height=640');
}

/* 목록조회  함수 */
function selectList(){
	location.href = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do' />";
}

/* 파일명 엔터key 목록조회  함수  */
function press() {
    if (event.keyCode==13) {
    	searchFileNm();    // 원래 검색 function 호출
    }
}

$(document).ready(function() {
	
	fnGetAjaxData("/sym/mnu/mpm/selectContentYN.do", 'menuManageVO', fnContentYN, false);
	
	$("#progrmFileNm").change(function() {
		fnGetAjaxData("/sym/mnu/mpm/selectContentYN.do", 'menuManageVO', fnContentYN, false);
	});
	
	$("[name='contentViewTy']").change(function() {
		
		$("[name='contentViewTy']").removeAttr("checked");
		$(this).attr("checked", true);
		
		if($("[name='contentViewTy']:checked").val() == "D"){
			$("#contentEdit").show();
		}else{
			$("#contentEdit").hide();
		}
	});
	
});

function fnContentYN(data) {
	
	if(data.result == "Y"){
		$("#contentView").show();
		$("#contentEdit").hide();
		$("input[name='contentViewTy']").eq(0).attr("checked", true);
	}else{
		$("#contentView").hide();
		$("#contentEdit").hide();
		$("input[name='contentViewTy']").removeAttr("checked");
	}
}

if ("<c:out value='${resultMsg}'/>" != "") {
	alert("<c:out value='${resultMsg}'/>");
}

</script>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<c:set var="ImgUrl" value="<c:url value='/images/egovframework/com/sym/mnu/mpm/' />"/>
<body>
<div class="content-body">
<div class="board-list">
<c:url var="formUrl" value="/sym/mnu/mpm/EgovMenuRegistInsert.do" />
<form:form commandName="menuManageVO" name="menuManageVO" method="post" action="${formUrl}" enctype="multipart/form-data">
<input type="hidden" name="tmp_SearchElementName" value="" />
<input type="hidden" name="tmp_SearchElementVal" value="" />
<input type="hidden" name="cmd" value="insert" />
<input type="hidden" name="useAt" value="" />
	<table class="board-write">
	<caption>메뉴 등록</caption>
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
			    	<!--<form:input path="menuOrdr" cssClass="input-text" size="10" maxlength="10" title="메뉴DEPTH" />-->
			    	<form:select path="menuOrdr" class="board-search-select" title="메뉴DEPTH">
						<option value="1">1차메뉴</option>
						<option value="2">2차메뉴</option>
						<option value="3">3차메뉴</option>
						<option value="4">4차메뉴</option>
						<option value="5">5차메뉴</option>
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
						<option value="<c:out value='${siteResult.code }'/>"><c:out value="${siteResult.codeNm}"/> </option>
						</c:forEach>
		        	</form:select>
		        </td>
				<th class="board-write-th">상위메뉴번호<i class="board-required"><span class="hide"></span></i></th>
			    <td class="board-write-td"><form:input path="upperMenuId" cssClass="input-text" readonly="true" cssStyle="background-color: #ddd" size="10" maxlength="10" title="상위메뉴No" />
			    	<a href="javascript:mvmnMenuList();" class="btn btn-link" title="메뉴 선택">메뉴 선택</a>
			    </td>
			</tr>
			<tr>
			    <th class="board-write-th">프로그램<i class="board-required"><span class="hide"></span></i></th>
			    <td class="board-write-td">
			    	<form:input path="progrmFileNm" cssClass="input-text" readonly="true" cssStyle="background-color: #ddd" size="30" maxlength="60" title="파일명" />
			    	<a href="javascript:searchFileNm();" class="btn btn-link" alt="프로그램 선택">프로그램 선택</a>
			    </td>
		        <th class="board-write-th">메뉴타입구분</th>
			    <td class="board-write-td">
			    	<form:radiobutton path="menuType" value="0"  checked="checked" />프로그램 사용&nbsp;&nbsp;
			    	<form:radiobutton path="menuType" value="1" />단순 링크
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
			    	<input type="radio" name="tabMenuUseAt" value="N" checked="checked"><span><strong>&nbsp;미사용</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="tabMenuUseAt" value="Y"><span><strong>&nbsp;사용</strong></span>
			    </td>
			</tr>	
			<tr style="display:none">
			    <th class="board-write-th">컨텐츠탭</th>
			    <td class="board-write-td" colspan="3">
			    	<textarea id="tabMenuCont" name="tabMenuCont" class="textarea-board" cols="75" rows="20"></textarea>
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
			    	<form:input path="menuAdmDpt" cssClass="input-text" size="20" maxlength="20" title="담당부서"/>
			    </td>
			    <th class="board-write-th">연락처</th>
			    <td class="board-write-td">
			    	<form:input path="menuCttpc" cssClass="input-text" size="20" maxlength="20" title="연락처" />
			    </td>
			</tr>
			<tr style="display:none">
			    <th class="board-write-th">공공누리</th>
			    <td class="board-write-td" colspan="3"> 
			    	<input type="radio" name="publicNuriTy" value="0" checked><span>사용안함</span>&nbsp;&nbsp;
					<input type="radio" name="publicNuriTy" value="1" ><span><strong>제1유형</strong> : 출처표시</span>&nbsp;&nbsp;
					<input type="radio" name="publicNuriTy" value="2" ><span><strong>제2유형</strong>: 출처표시+상업적 이용금지</span>&nbsp;&nbsp;</br>
			    	<input type="radio" name="publicNuriTy" value="3" ><span><strong>제3유형</strong>: 출처표시+변경금지</span>&nbsp;&nbsp;
			    	<input type="radio" name="publicNuriTy" value="4" ><span><strong>제4유형</strong>: 출처표시+상업적 이용금지+변경금지</span>
			    </td>
			</tr>
			<tr>
			    <th class="board-write-th">메뉴 설명</th>
			    <td class="board-write-td" colspan="3"><form:textarea path="menuDc" cssClass="input-text" cssStyle="width: 100%; height: 100px;" title="메뉴설명"/></td>
			</tr>
			
			<c:if test="${userAuthority == 'ROLE_ADMIN' }">
			<tr id="contentView" style="display:none;">
				<th class="board-write-th">컨텐츠 노출 방법</th>
			    <td class="board-write-td" colspan="3"> 
			    	<input type="radio" name="contentViewTy" value="H"><span><strong>HTML</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="contentViewTy" value="D" ><span><strong>DB</strong></span>
			    </td>
			</tr>
			<tr id="contentEdit" style="display:none;">
				<th class="board-write-th">컨텐츠</th>
				<td class="board-write-editor" colspan="3">
					<textarea id="progrmContent" name="progrmContent" class="textarea-board" cols="75" rows="20"></textarea>
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
	<a href="javascript:insertMenuManage(document.menuManageVO);" class="btn btn-primary">등록</a>
</div>

<div id="content_test" style="display:none"></div>
<div id="content_test_tabMenu" style="display:none"></div>

</form:form>

</body>
</html>


