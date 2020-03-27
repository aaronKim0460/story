<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">

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
    var returnValue = "";
    var returnBoolean = false;
    var checkCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else
                        returnValue = returnValue + ";" + checkField[i].value;
                }
            }
            if(checkCount > 0)
                returnBoolean = true;
            else {
                alert("선택된  배너가 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된 배너가 없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
    	alert("조회된 결과가 없습니다.");
    }

    document.listForm.bannerIds.value = returnValue;
    return returnBoolean;
}

function fncSelectBannerList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/bnr/selectBannerList.do'/>";
    document.listForm.submit();
}

function fncSelectBanner(bannerId) {
    document.listForm.bannerId.value = bannerId;
    document.listForm.action = "<c:url value='/uss/ion/bnr/getBanner.do'/>";
    document.listForm.submit();
}

function fncAddBannerInsert() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	}
    document.listForm.action = "<c:url value='/uss/ion/bnr/addViewBanner.do'/>";
    document.listForm.submit();
}

function fncBannerListDelete() {
	if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/uss/ion/bnr/removeBannerList.do'/>";
            document.listForm.submit();
        }
    }
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/bnr/selectBannerList.do'/>";
    document.listForm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectBannerList('1');
    }
}


	$(document).ready(function(){
		
		// 리스트 포인터 설정
		$("#banner_list tr").css("cursor", "pointer");
		
		// 상세보기
		$("#banner_list tr").click(function(){
			
			var bannerId = $(this).attr("baid");
			
			if(bannerId == ""){
				alert("배너 정보를 확인할 수 없습니다.");
				return;
			}
			
			$("#bannerId").val($(this).attr("baid"));
			
			$("#listForm").attr("action", "<c:url value='/uss/ion/bnr/getBanner.do'/>");
			$("#listForm").submit();
		    
		});
		
		// 사이트 변경
		$("#siteTypeStr").change(function(){
			fncSelectBannerList('1');
		});
		
	});	
</script>
<style>
	.adminH2 h2 {margin: 30px 0 5px 0; padding: 0 0 0 20px; background: url('../images/sub/h2bg.png') no-repeat 0px 4px; color: #2c6daf; font-weight: normal;font-weight:bold; font-size:16px; text-align: left; letter-spacing: -1px; clear:both; }
	.adminH2 h2:first-child{margin-top:15px}	
</style> 
<body>
<h2 class="adminH2">배너(알림판)관리</h2>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<div class="board-search">
<form id="listForm" name="listForm" action="<c:url value='/uss/ion/bnr/selectBannerList.do'/>" method="post">
<input type="hidden" id="bannerId" name="bannerId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty bannerVO.pageIndex }">1</c:if><c:if test="${!empty bannerVO.pageIndex }"><c:out value='${bannerVO.pageIndex}'/></c:if>">
<input type="hidden" name="bannerAtStr" value="0"/>
<input type="hidden" name="searchCondition" value="1">

	<fieldset>
	<legend>목록검색</legend>	
	  	<select id="siteTypeStr" name="siteTypeStr" class="board-search-select">
	  		<option value="">-사이트구분-</option>
		  	<c:forEach items="${siteTypeList }" var="siteVO" varStatus="status">
		  		<option value="<c:out value='${siteVO.code }'/>" <c:if test="${siteVO.code == bannerVO.siteTypeStr}"> selected</c:if>><c:out value='${siteVO.codeNm }'/></option>
	  		</c:forEach>
	 	</select>&nbsp;&nbsp;
		배너명&nbsp;<input name="searchKeyword" type="text" value="<c:out value="${bannerVO.searchKeyword}"/>" size="25" onkeypress="press();" id="searchKeyword" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="fncSelectBannerList('1'); return false;" />
		<!-- <input type="button" id="button" class="btn-viewall btn btn-sm btn-link" value="전체보기" /> -->
	</fieldset>
</form>
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:30%" />
			<col style="width:10%" />
			<col style="width:*" />
			<col style="width:10%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-title">배너 명</th>
				<th class="board-default-th-no"">사이트구분명</th>
				<th class="board-default-th-title">배너 설명</th>
				<th class="board-default-th-no">정렬 순서</th>
				<th class="board-default-th-no">반영여부</th>
			</tr>
		</thead>
		<tbody id="banner_list">
			
			<c:forEach var="banner" items="${bannerList}" varStatus="status">
			<tr baid="<c:out value='${banner.bannerId}'/>">
				<td class="board-default-td-title"><c:out value='${banner.bannerNm}'/></td>
				<td class="board-default-td-no"><c:out value="${banner.siteType}"/></td>
				<td class="board-default-td-title"><c:out value="${banner.bannerDc}"/></td>
				<td class="board-default-td-no"><c:out value="${banner.sortOrdr}"/></td>
				<td class="board-default-td-no"><c:out value="${banner.reflctAt}"/></td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(bannerList) == 0}">
			<tr>
				<td class="lt_text3" colspan="9">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<c:if test="${!empty bannerVO.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image2" jsFunction="linkPage" />
    </div>
</div>
</c:if>

<div class="board-detail-foot">
	<div class="btns clear fr">	
		<a href="<c:url value='/uss/ion/bnr/addViewBanner.do'/>?pageIndex=<c:out value='${bannerVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${bannerVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddBannerInsert(); return false;" class="btn btn-primary">등록</a>
 	</div>
</div>

</body>
</html>
