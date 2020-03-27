<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>

<script language="javascript1.2" type="text/javaScript">
<!--

function insertCmsUserListManage() {
	
	if($.trim($("#staffNm").val()) == ""){
		alert("직원 이름을 입력하세요.");
		return false;
	}
	if($.trim($("#departCd").val()) == ""){
		alert("부서명을 입력하세요.");
		return false;
	}
	if($.trim($("#sectCd").val()) == ""){
		alert("과명을 입력하세요.");
		return false;
	}
	if($.trim($("#staffOrdr").val()) == ""){
		alert("순서를 입력하세요.");
		return false;
	}
	
	if(confirm("<spring:message code="common.save.msg"/>")){
		document.frm.action = "<c:url value='/cop/com/selectCmsUserRegist.do'/>";
		document.frm.submit();
	}
}

function selectList(){
	location.href = "<c:url value='/cop/com/selectCmsUserList.do?moveSite=ADMIN'/>";
}

 function fn_FocusStart(){
		var objFocus = document.getElementById('F1');
		objFocus.focus();
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
-->
</script>

<style type="text/css">
	.required {color:red;padding-left:5px;}
</style>


<body>

<form name="frm" method="post" >
<input name="cmd" type="hidden" value="<c:out value='insert'/>"/>
<input name="selectDpt" type="hidden" value="sss"/>
<div class="content-body">
<div class="board-list">

	<table class="board-write">
	<caption>등록</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
<!-- 			<tr> -->
<!-- 				<th class="board-write-th">직원코드</th> -->
<!-- 				<td class="board-write-td"> -->
<!-- 					<input type="text" name="staffCd" id="staffCd" class="input-text" value='' /> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<th class="board-write-th">직원 이름<span class="required">*</span></th>
				<td class="board-write-td">
					<input type="text" name="staffNm" id="staffNm" class="input-text" value='' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">직원 성 영문명</th>
				<td class="board-write-td">
					<input type="text" size="50" name="engLNm" id="engLNm" class="input-text" value='' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">직원 이름 영문명</th>
				<td class="board-write-td">
					<input type="text" size="50" name="engNm" id="engNm" class="input-text" value='' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">부서명<span class="required">*</span></th>
				<td class="board-write-td">
					<select name="departCd" id="departCd" onchange="selectedDpt(this.value)"  class="board-search-select" style="width:120px">
					   	<c:forEach var="departV" items="${ resultDptList}" varStatus="status">
						<option value="<c:out value='${departV.departCd }'/>"><c:out value='${departV.departNm }'/></option>
						</c:forEach>
				   </select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">과명<span class="required">*</span></th>
				<td class="board-write-td">
					<select name="sectCd" id="sectCd" class="board-search-select" style="width:120px">
						<option value="">선택</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">이메일</th>
				<td class="board-write-td">
					<input type="text" size="50" name="staffEmail" id="staffEmail" class="input-text" value='' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">전화번호</th>
				<td class="board-write-td">
					<input type="text" size="50" name="staffTel" id="staffTel" class="input-text" value='' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">핸드폰</th>
				<td class="board-write-td">
					<input type="text" size="50" name="staffMobile" id="staffMobile" class="input-text" value='' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">업무</th>
				<td class="board-write-td">
					<input type="text" size="50" name="staffWork" id="staffWork" class="input-text" value='' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">순서</th>
				<td class="board-write-td">
				 	<input type="text" name="staffOrdr" id="staffOrdr" class="input-text" value='' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">설명</th>
				<td class="board-write-td">
				 	<textarea name="stComment" id="stComment" rows="8" cols="75" ></textarea>
				</td>
			</tr>
		</tbody>
	</table>

</div>
</div>

<div class="text-center">
	<a href="<c:url value='/cop/com/selectCmsUserList.do?moveSite=ADMIN'/>" onclick="selectList(); return false;" class="btn btn-default">목록</a>
	<input type="submit" value="등록" onclick="insertCmsUserListManage();" class="btn btn-primary" />
</div>


</form>

</body>
</html>

