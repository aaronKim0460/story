<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>

<script language="javascript" type="text/javaScript">

function selectList(){
	location.href = "<c:url value='/uss/umt/EgovUserManage.do'/>";
}

function fn_FocusStart(){
	var objFocus = document.getElementById('F1');
	objFocus.focus();
}

function fnIdCheck(){
    var retVal;
    var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>";
    var varParam = new Object();
    varParam.checkId = document.frm.emplyrId.value;
    var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.frm.emplyrId.value = retVal;
    }
}

function fnListPage(){
    document.frm.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.frm.submit();
}

function fnUpdate(){
	if(confirm("<spring:message code="common.save.msg"/>")){
		document.frm.action = "<c:url value='/uss/umt/EgovUserSelectUpdt.do'/>";
		document.frm.submit();
	}
}

function fnDeleteUser(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg" />")){
	    document.frm.checkedIdForDel.value=checkedIds;
	    document.frm.action = "<c:url value='/uss/umt/EgovUserDelete.do'/>";
	    document.frm.submit();
	}
}

function fnPasswordMove(){
	document.frm.action = "<c:url value='/uss/umt/EgovUserPasswordUpdtView.do'/>";
    document.frm.submit();
}

function fnInit(){

	var selDpt = document.frm.departCd.value;
	var list1 = new Array();
	
	<c:forEach var="sectVO" items="${resultSectList }" varStatus="status">
		list1.push("<c:out value='${sectVO.sectNm}'/>");
		list1.push("<c:out value='${sectVO.sectCd}'/>");
		list1.push("<c:out value='${sectVO.departCd}'/>");
	</c:forEach>


	var s_sel = document.frm.sectCd;

	document.frm.sectCd.options.length = null;
	s_sel.options[0] = new Option("선택", "");
	var selInd = 1;
	for(var i=0; i<list1.length; i+=3){ // 0부터 짝수는 이름, 1부터홀수는 코드
		if(selDpt == list1[i+2]){
			s_sel.options[selInd] = new Option(list1[i], list1[i+1]);
			selInd++;
		}
		
	}

	for(var i=0; i<s_sel.length; i++){
		if(s_sel.options[i].value == "${userManageVO.sectCd}"){
			s_sel.options[i].selected = true;
		}
	}
}

function selectedDpt(obj){
	document.frm.selectDpt.value = obj;
	var list1 = new Array();
	
	<c:forEach var="sectVO" items="${resultSectList }" varStatus="status">
		list1.push("<c:out value='${sectVO.sectNm}'/>");
		list1.push("<c:out value='${sectVO.sectCd}'/>");
		list1.push("<c:out value='${sectVO.departCd}'/>");
	</c:forEach>

	var s_sel = document.frm.sectCd;

	document.frm.sectCd.options.length = null;
	s_sel.options[0] = new Option("선택", "");
	var selInd = 1;
	for(var i=0; i<list1.length; i+=3){ // 0부터 짝수는 이름, 1부터홀수는 코드
		if(obj == list1[i+2]){
			s_sel.options[selInd] = new Option(list1[i], list1[i+1]);
			selInd++;
		}
	}
}
<c:if test="${!empty resultMsg}">alert("<c:out value='${resultMsg}'/>");</c:if>

</script>

<body onload="fnInit();">

<form name="frm" method="post" >
<input name="selectDpt" type="hidden" value="sss"/>
<input name="checkedIdForDel" type="hidden" />
<input type="hidden" name="uniqId" id="uniqId" value="<c:out value='${userManageVO.uniqId }'/>" />
<input type="hidden" name="userTyForPassword" value="<c:out value='${userManageVO.userTy}'/>" />

<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
<input type="hidden" name="cmd"  value="<c:out value='insert'/>"/>
<input type="hidden" name="openType" value="<c:out value='${openType}'/>"/>
<input type="hidden" name="emplyrId" value="<c:out value='${userManageVO.emplyrId }'/>" />
<input type="hidden" name="emplyrNm" value="<c:out value='${userManageVO.emplyrNm }'/>" />
 
<div class="content-body">
<div class="board-list">
	<table class="board-write">
   	<caption>업무사용자 상세보기(수정)</caption>
 	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">사용자아이디</th>
				<td class="board-write-td">
					<c:out value='${userManageVO.emplyrId }'/>
				</td> 
			</tr>
			<tr>
				<th class="board-write-th">사용자 이름</th>
				<td class="board-write-td">
					<c:out value='${userManageVO.emplyrNm }'/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">조직 아이디</th>
				<td class="board-write-td">
					<select name="orgnztId" id="orgnztId" class="board-search-select" style="width:145px">
						<option value="0" >--선택하세요--</option>
						<c:forEach var="orgList" items="${orgnztId_result}" varStatus="status">
						<option value="<c:out value='${orgList.code }'/>" <c:if test="${orgList.code == userManageVO.orgnztId }">selected</c:if>><c:out value='${orgList.codeNm}'/></option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">이메일 주소</th>
				<td class="board-write-td">
					<input type="text" size="20" class="input-text" maxlength="50" name="emailAdres" id="emailAdres" value="<c:out value='${userManageVO.emailAdres }'/>">
				</td>
			</tr>
			<tr>
				<th class="board-write-th">그룹아이디</th>
				<td class="board-write-td">  
					<select name="groupId" id="groupId" class="board-search-select" style="width:145px">
						<option value="0">--선택하세요--</option>
						<c:forEach var="grpList" items="${groupId_result}" varStatus="status">
						<option value="<c:out value='${grpList.code }'/>" <c:if test="${grpList.code == userManageVO.groupId }">selected</c:if>><c:out value='${grpList.codeNm}'/></option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자상태코드</th>
				<td class="board-write-td">
					<select name="emplyrSttusCode" id="emplyrSttusCode" class="board-search-select" style="width:145px">
						<option value="0">--선택하세요--</option>
						<c:forEach var="empStatList" items="${emplyrSttusCode_result}" varStatus="status">
						<option value="<c:out value='${empStatList.code }'/>" <c:if test="${empStatList.code == userManageVO.emplyrSttusCode }">selected</c:if>><c:out value='${empStatList.codeNm}'/></option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">부서명</th>
				<td class="board-write-td">
					<select name="departCd" class="board-search-select" onChange="selectedDpt(this.value)" style="width:145px">
						<option value="">선택</option>
						<c:forEach var="departVO" items="${resultDptList }" varStatus="status">
						<option value="<c:out value='${departVO.departCd }'/>" <c:if test="${departVO.departCd == userManageVO.departCd }">selected</c:if>><c:out value='${departVO.departNm }'/></option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">과명</th>
				<td class="board-write-td">
					<select name="sectCd" class="board-search-select" style="width:145px">
						<option value="">선택</option>
						<c:forEach var="sectVO" items="${resultSectList }" varStatus="status">
						<option value="<c:out value='${sectVO.sectCd }'/>" <c:if test="${sectVO.sectCd == userManageVO.sectCd }">selected</c:if>><c:out value='${sectVO.sectNm }'/></option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">핸드폰번호</th>
				<td class="board-write-td">
					<input name="moblphonNo" id="moblphonNo" class="input-text" size="50" maxlength="15" value="<c:out value='${userManageVO.moblphonNo }'/>" />
				</td>
			</tr>
			<tr>	
				<th class="board-write-th">사무실전화번호</th>
				<td class="board-write-td">
					<input name="offmTelno" id="offmTelno" class="input-text" size="50" maxlength="15" value="<c:out value='${userManageVO.offmTelno }'/>" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">구분</th>
				<td class="board-write-td">
					<input name="zip" id="zip" class="input-text" size="20" maxlength="15" value="<c:out value='${userManageVO.zip }'/>" />
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>


<div class="text-center">
	<c:if test="${openType eq 'Y'}"><a href="#none" onclick="window.close();" class="btn btn-default">닫기</a></c:if>
	<c:if test="${openType ne 'Y'}"><a href="#none" onclick="fnListPage(); return false;" class="btn btn-default">목록</a></c:if>
	<input type="submit" value="저장" onclick="fnUpdate(); return false;" class="btn btn-primary"/>
	<a href="#none" onclick="fnPasswordMove(); return false;" class="btn btn-primary">비밀번호 변경</a>
</div>

</form>

</body>
</html>