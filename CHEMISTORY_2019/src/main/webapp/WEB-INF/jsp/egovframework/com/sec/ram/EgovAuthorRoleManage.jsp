<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%

/**
 * @Class Name : EgovAuthorRoleManage.java
 * @Description : EgovAuthorRoleManage.jsp
 */

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var checkRegYn = document.listForm.regYn;
    var returnValue = "";
    var returnRegYns = "";
    var checkedCount = 0;
    var returnBoolean = false;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkedCount++;
                    checkField[i].value = checkId[i].value;

	                if(returnValue == "") {
	                    returnValue = checkField[i].value;
	                    returnRegYns = checkRegYn[i].value;
	                }
	                else {
	                    returnValue = returnValue + ";" + checkField[i].value;
	                    returnRegYns = returnRegYns + ";" + checkRegYn[i].value;
	                }
                }
            }

            if(checkedCount > 0)
            	returnBoolean = true;
            else {
                alert("선택된  롤이 없습니다.");
                returnBoolean = false;
            }
        } else {
        	 if(document.listForm.delYn.checked == false) {
                alert("선택된 롤이 없습니다.");
            	returnBoolean = false;
            }
            else {
            	returnValue = checkId.value;
                returnRegYns = checkRegYn.value;

                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.roleCodes.value = returnValue;
    document.listForm.regYns.value = returnRegYns;

    return returnBoolean;

}

function fncSelectAuthorRoleList() {
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = "1";
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorList(){
   // document.listForm.searchCondition.value = "1";
   // document.listForm.pageIndex.value = "1";
    document.listForm.searchKeyword.value = "";
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorRole(roleCode) {
    document.listForm.roleCode.value = roleCode;
    document.listForm.action = "<c:url value='/sec/ram/EgovRole.do'/>";
    document.listForm.submit();
}

function fncAddAuthorRoleInsert() {
	if(fncManageChecked()) {
	    if(confirm("등록하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleInsert.do'/>";
            document.listForm.submit();
	    }
	} else return;
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleList.do'/>";
    document.listForm.submit();
}


function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorRoleList();
    }
}
-->
</script>

<body>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<form id="listForm" name="listForm" action ="<c:url value='/sec/ram/EgovAuthorRoleList.do'/>" method="post" >
<input type="hidden" name="roleCodes"/>
<input type="hidden" name="regYns"/>
<input type="hidden" name="pageIndex" value="<c:out value='${authorRoleManageVO.pageIndex}'/>"/>
<input type="hidden" name="authorCode" value="<c:out value="${authorRoleManageVO.searchKeyword}"/>"/>
<input type="hidden" name="searchCondition"/>

<div class="board-search">
	<!--  검색  -->
	<fieldset>
	<legend>목록 검색</legend>
	권한코드
	<input name="searchKeyword" type="text" value='<c:out value="${authorRoleManageVO.searchKeyword}"/>' readonly="readonly" style="background-color: #ddd;" class="board-search-keyword" title="검색어 입력">
	<input type="button" id="board-search-submit" class="btn btn-sm btn-default" onclick="fncSelectAuthorRoleList();" value="검색" />
	</fieldset>
</div>

<div class="board-list">
<table class="board-default">
	<colgroup>
		<col style="width:30px;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />
		<col style="width:50px;" />
		<col />
		<col style="width:100px;" />
		<col style="width:120px;" />
	</colgroup>
	<thead>
	  	<tr>
	    	<th class="board-default-th-no"><input type="checkbox" name="checkAll" onclick="javascript:fncCheckAll()" title="전체선택"></th>
		    <th class="board-default-th-title">롤ID</th>
		    <th class="board-default-th-title">롤 명</th>
		    <th class="board-default-th-">롤 타입</th>
		    <th class="board-default-th-hit">순서</th>
		    <th class="board-default-th-title">롤 설명</th>
		    <th class="board-default-th">등록일자</th>
		    <th class="board-default-th">등록여부</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="authorRole" items="${authorRoleList}" varStatus="status">
			<input type="hidden" name="checkId" value="<c:out value="${authorRole.roleCode}"/>" />
			<tr <c:if test="${status.count % 2 == 1 }">class="bg"</c:if>>
				<td class="board-default-td"><input type="checkbox" name="delYn" title="선택"></td>
				<td class="board-default-td-title"><c:out value="${authorRole.roleCode}"/></td>
				<td class="board-default-td-title"><c:out value="${authorRole.roleNm}"/></td>
				<td class="board-default-td"><c:out value="${authorRole.roleTyp}"/></td>
				<td class="board-default-td-hit"><c:out value="${authorRole.roleSort}"/></td>
				<td class="board-default-td-title"><c:out value="${authorRole.roleDc}"/></td>
				<td class="board-default-td"><c:out value="${fn:substring(authorRole.creatDt, 0, 10)}" /></td>
				<td class="board-default-td"><select name="regYn" class="board-search-select" title="등록여부">
			            <option value="Y" <c:if test="${authorRole.regYn == 'Y'}">selected</c:if> >등록</option>
			            <option value="N" <c:if test="${authorRole.regYn == 'N'}">selected</c:if> >미등록</option>
        			</select></td>
			</tr>
		</c:forEach>

		<c:if test="${fn:length(authorRoleList) == 0}">
			<tr class="bg">
				<td colspan="8">작성된 게시물이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
	</table>
</div> 
</form>

<div class="board-footer">
	<div class="pagenavi">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
	</div>
</div>

<!-- 버튼 -->
<div class="board-detail-foot">
	<div class="btns clear fr">
		<a href="javascript:fncSelectAuthorList();"  class="btn btn-default">목록</a>
		<a href="javascript:fncAddAuthorRoleInsert();"  class="btn btn-primary">등록</a>
	</div>
</div>


<DIV id="main" style="display:">
<table border="0">
  <tr>
    <td width="700">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="20%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;권한 롤 관리</td>

  <td width="60%">권한코드 : <input name="searchKeyword" type="text" size="30" value="<c:out value='${authorRoleManageVO.searchKeyword}'/>" title="검색"  onkeypress="press();" readonly="readonly" /></td>
  <th width="20%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap="nowrap"><a href="#LINK" onclick="javascript:fncSelectAuthorList()" style="selector-dummy:expression(this.hideFocus=false);">목록</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;&nbsp;</td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap="nowrap"><a href="#LLINK" onclick="javascript:fncSelectAuthorRoleList()" style="selector-dummy:expression(this.hideFocus=false);">조회</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;&nbsp;</td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap="nowrap"><a href="#LINK" onclick="javascript:fncAddAuthorRoleInsert()" style="selector-dummy:expression(this.hideFocus=false);">등록</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
    </tr>
   </table>
  </th>
 </tr>
</table>
<table width="100%" cellpadding="8" class="table-line" summary="권한 롤을 관리하는 테이블입니다.롤 ID,롤 명,롤 타입,롤 Sort,롤 설명,등록일자,등록여부의 내용을 담고 있습니다.">
 <thead>
  <tr>
    <th class="title" width="3%" scope="col" nowrap="nowrap"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택"></th>
    <th class="title" width="10%" scope="col" nowrap="nowrap">롤 ID</th>
    <th class="title" width="20%" scope="col" nowrap="nowrap">롤 명</th>
    <th class="title" width="10%" scope="col" nowrap="nowrap">롤 타입</th>
    <th class="title" width="10%" scope="col" nowrap="nowrap">롤 Sort</th>
    <th class="title" width="30%" scope="col" nowrap="nowrap">롤 설명</th>
    <th class="title" width="12%" scope="col" nowrap="nowrap">등록일자</th>
    <th class="title" width="5%" scope="col" nowrap="nowrap">등록여부</th>
  </tr>
 </thead>
 <tbody>
  <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(authorRoleList) == 0}">
<tr>
<td class="lt_text3" colspan="9">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <c:forEach var="authorRole" items="${authorRoleList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap="nowrap"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${authorRole.roleCode}"/>" /></td>
    <td class="lt_text" nowrap="nowrap"><c:out value="${authorRole.roleCode}"/></td>
    <td class="lt_text" nowrap="nowrap"><c:out value="${authorRole.roleNm}"/></td>
    <td class="lt_text3" nowrap="nowrap"><c:out value="${authorRole.roleTyp}"/></td>
    <td class="lt_text3" nowrap="nowrap"><c:out value="${authorRole.roleSort}"/></td>
    <td class="lt_text3" nowrap="nowrap"><c:out value="${authorRole.roleDc}"/></td>
    <td class="lt_text3" nowrap="nowrap"><c:out value="${authorRole.creatDt}"/></td>
    <td class="lt_text3" nowrap="nowrap">
        <select name="regYn" title="등록여부">
            <option value="Y" <c:if test="${authorRole.regYn == 'Y'}">selected</c:if> >등록</option>
            <option value="N" <c:if test="${authorRole.regYn == 'N'}">selected</c:if> >미등록</option>
        </select>
    </td>
  </tr>
 </c:forEach>
 </tbody>

 <!--tfoot>
  <tr class="">
   <td colspan=6 align="center"></td>
  </tr>
 </tfoot -->
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty authorRoleManageVO.pageIndex }">
<div align="center">
    <div>
        <ui:pagination paginationInfo = "${paginationInfo}"
            type="default"
            jsFunction="linkPage"
            />
    </div>
    <div align="right">
        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
    </div>
</div>
</c:if>
<input type="hidden" name="roleCodes"/>
<input type="hidden" name="regYns"/>
<input type="hidden" name="pageIndex" value="<c:out value='${authorRoleManageVO.pageIndex}'/>"/>
<input type="hidden" name="authorCode" value="<c:out value="${authorRoleManageVO.searchKeyword}"/>"/>
<input type="hidden" name="searchCondition"/>
</td>
</tr>
</table>
</DIV>
</body>
</html>
