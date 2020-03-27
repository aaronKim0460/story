<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript">
function insertUserMng() {
	if (!validateUserManageVO(document.userManageVO)){
		return;
	}
	
	if(confirm("<spring:message code="common.save.msg"/>")){
		document.userManageVO.action = "<c:url value='/uss/umt/EgovUserInsert.do'/>";
		document.userManageVO.submit();
	}
}

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
    varParam.checkId = document.userManageVO.emplyrId.value;
    var openParam = "dialogWidth:500px;dialogHeight:300px;scroll:no;status:no;center:yes;resizable:yes;";
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.userManageVO.emplyrId.value = retVal;
    }
}

function selectedDpt(obj){
	document.userManageVO.selectDpt.value = obj;
	var list1 = new Array();
	
	<c:forEach var="sectVO" items="${resultSectList }" varStatus="status">
		list1.push("<c:out value='${sectVO.sectNm}'/>");
		list1.push("<c:out value='${sectVO.sectCd}'/>");
		list1.push("<c:out value='${sectVO.departCd}'/>");
	</c:forEach>

	var s_sel = document.userManageVO.sectCd;

	document.userManageVO.sectCd.options.length = null;
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

<body>

<form:form commandName="userManageVO" name="userManageVO" method="post">

<input name="cmd" type="hidden" value="<c:out value='insert'/>"/>
<input name="selectDpt" type="hidden" value="sss"/>

<div class="content-body">
<div class="board-list">

	<table class="board-write">
   	<caption>업무사용자 등록</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">사용자아이디</th>
				<td class="board-write-td">
					<input type="text" id="emplyrId" name="emplyrId" class="input-text" size="20" class="input-text" />
					<a href="#LINK" onclick="fnIdCheck();">(중복아이디 검색)</a>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자 이름</th>
				<td class="board-write-td">
					<input type="text" class="input-text" size="20" maxlength="50" name="emplyrNm" id="emplyrNm" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">비밀번호</th>
				<td class="board-write-td">
					<input type="password" class="input-text" size="20" maxlength="50" name="password" id="password" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">비밀번호 확인</th>
				<td class="board-write-td">
					<input type="password" class="input-text" size="20" maxlength="50" name="password2" id="password2" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">조직아이디</th>
				<td class="board-write-td">
					<select name="orgnztId" id="orgnztId" class="board-search-select" style="width:145px">
				        <c:forEach var="orgList" items="${orgnztId_result}" varStatus="status">
						<option value="<c:out value='${orgList.code }'/>"><c:out value='${orgList.codeNm}'/></option>
						</c:forEach>
				    </select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">이메일 주소</th>
				<td class="board-write-td">
					<input type="text" name="emailAdres" id="emailAdres" class="input-text" size="50" maxlength="50" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">그룹아이디</th>
				<td class="board-write-td">
					<select name="groupId" id="groupId" class="board-search-select" style="width:145px">
						<c:forEach var="grpList" items="${groupId_result}" varStatus="status">
						<option value="<c:out value='${grpList.code }'/>"><c:out value='${grpList.codeNm}'/></option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자상태코드</th>
				<td class="board-write-td">
					<select name="emplyrSttusCode" id="emplyrSttusCode" class="board-search-select" style="width:145px">
						<c:forEach var="empStatList" items="${emplyrSttusCode_result}" varStatus="status">
						<option value="<c:out value='${empStatList.code }'/>"><c:out value='${empStatList.codeNm}'/></option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">부서명</th>
				<td class="board-write-td">
					<select name="departCd" onChange="selectedDpt(this.value)" class="board-search-select" style="width:145px">
						<option value="">선택</option>
						<c:forEach var="departVO" items="${resultDptList }" varStatus="status">
						<option value="<c:out value='${departVO.departCd }'/>"><c:out value='${departVO.departNm }'/></option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">과명</th>
				<td class="board-write-td">
					<select name="sectCd" class="board-search-select" style="width:140px">
						<option value="0000">선택</option>
					</select>
				</td>
			</tr>
			<tr>
		    	<th class="board-write-th">핸드폰번호</th>
			    <td class="board-write-td">
			    	<input name="moblphonNo" id="moblphonNo" class="input-text" size="50" maxlength="15" />
			    </td>
			</tr>
			<tr>	
				<th class="board-write-th">사무실전화번호</th>
				<td class="board-write-td">
					<input name="offmTelno" id="offmTelno" class="input-text" size="50" maxlength="15" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">구분</th>
				<td class="board-write-td">
					<input name="zip" id="zip" class="input-text" size="20" maxlength="15" />
				</td>
			</tr>
   		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<a href=#" onclick="selectList(); return false;" class="btn btn-default">목록</a>
	<input type="submit" value="등록" onclick="insertUserMng(); return false;" class="btn btn-primary" />
</div>

</form:form>

</body>
</html>