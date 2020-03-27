<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="roleManage" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">
//alert("EgovRoleUpdate.jsp");
function fncSelectRoleList() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleList.do'/>";
    varFrom.submit();
}

function fncRoleUpdate() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleUpdate.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateRoleManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncRoleDelete() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleDelete.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}

</script>

<c:set var="registerFlag" value="${empty roleManageVO.roleCode ? 'INSERT' : 'UPDATE'}"/>
<c:set var="registerFlagName" value="${empty roleManageVO.roleCode ? '롤 등록' : '롤 수정'}"/>

</head>

<body>
<form:form commandName="roleManage" method="post" >
<c:if test="${registerFlag == 'UPDATE'}">
<input type="hidden" name="searchCondition" value="<c:out value='${roleManageVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${roleManageVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${roleManageVO.pageIndex}'/>"/>
</c:if>
<input type="hidden" name="roleCode"  value="<c:out value='${roleManage.roleCode}'/>"/>

<div class="content-body">
<div class="board-list">

	<table class="board-write">
	<caption>글 등록</caption>
		<colgroup>
		    <col style="width:15%" />
		    <col />
		</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">롤  코드</th>
				<td class="board-write-td">
					<c:out value='${roleManage.roleCode}'/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">롤 명<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<input name="roleNm" id="roleNm" type="text" value="<c:out value='${roleManage.roleNm}'/>" maxLength="50" class="input-text full" />
					<form:errors path="roleNm" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">롤 패턴<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<input name="rolePtn" id="rolePtn" type="text" value="<c:out value='${roleManage.rolePtn}'/>" maxLength="200" class="input-text full" />
					<form:errors path="rolePtn" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">설명</th>
				<td class="board-write-td">
					<input name="roleDc" id="roleDc" type="text" value="<c:out value='${roleManage.roleDc}'/>" maxLength="50" class="input-text full" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">롤 타입</th>
				<td class="board-write-td">
					<select name="roleTyp" class="board-search-select">
 					<c:forEach var="cmmCodeDetail" items="${cmmCodeDetailList}" varStatus="status">
						<option value="<c:out value="${cmmCodeDetail.code}"/>" <c:if test="${cmmCodeDetail.code == roleManage.roleTyp}">selected</c:if> ><c:out value="${cmmCodeDetail.codeNm}"/></option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">롤 Sort<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<input name="roleSort" id="roleSort" type="text" value="<c:out value='${roleManage.roleSort}'/>" maxLength="10" class="input-text" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">등록일자</th>
				<td class="board-write-td">
					<c:out value='${roleManage.roleCreatDe}'/>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<a href="#LINK" onclick="javascript:fncSelectRoleList()" class="btn btn-default">목록</a>
	<c:if test="${registerFlag == 'UPDATE'}">
	<a href="#LINK" onclick="javascript:fncRoleUpdate()" class="btn btn-primary">수정</a>
	<a href="#LINK" onclick="javascript:fncRoleDelete()" class="btn btn-warning">삭제</a>
	</c:if>
</div>

</form:form>

</body>
</html>

