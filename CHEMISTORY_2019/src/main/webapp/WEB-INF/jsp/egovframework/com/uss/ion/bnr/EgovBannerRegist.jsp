<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<validator:javascript formName="banner" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

function fncSelectBannerList() {
    var varFrom = document.getElementById("banner");
    varFrom.action = "<c:url value='/uss/ion/bnr/selectBannerList.do'/>";
    varFrom.submit();       
}

function fncBannerInsert() {
    var varFrom = document.getElementById("banner");
    varFrom.action = "<c:url value='/uss/ion/bnr/addBanner.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateBanner(varFrom)){           
            return;
        }else{
            if(varFrom.bannerImage.value != '') {
                varFrom.submit();
            } else {
                alert("배너이미지는 필수 입력값입니다.");
                return;
            }
        } 
    }
}

function fncOnChangeImage() {
	var varFrom = document.getElementById("banner");
	varFrom.bannerImage.value = varFrom.file_1.value;
}

function fncBannerDelete() {
    var varFrom = document.getElementById("banner");
    varFrom.action = "<c:url value='/uss/ion/bnr/removeBanner.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}

</script>

<body>

<form:form commandName="banner" method="post" action="${pageContext.request.contextPath}/uss/ion/bnr/addBanner.do' />" enctype="multipart/form-data"> 
<input type="hidden" name="posblAtchFileNumber" value="1" >
<input type="hidden" name="bannerImage" >
<input type="hidden" name="bannerAtStr" value="<c:out value='${banner.bannerAtStr }'/>"/>
<input type="hidden" name="bannerAt" value="<c:out value='${param.bannerAtStr }'/>" />
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${bannerVO.searchCondition}'/>" >
<input type="hidden" name="searchKeyword" value="<c:out value='${bannerVO.searchKeyword}'/>" >
<input type="hidden" name="pageIndex" value="<c:out value='${bannerVO.pageIndex}'/>" >
<!-- 검색조건 유지 -->
<input type="hidden" name="reflctAtStr" value="<c:out value='${bannerVO.reflctAtStr}'/>" >

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
				<th class="board-write-th">배너 ID</th>
				<td class="board-write-td">
					<input name="bannerId" id="bannerId" type="text" class="input-text" value="<c:out value='${banner.bannerId}'/>" readonly />&nbsp;*자동 입력*
				</td>
			</tr>
			<tr style="display: none;">
				<th class="board-write-th">상세구분코드</th>
				<td class="board-write-td">
					<select name="detailAt" id="detailAt" class="board-search-select" style="width:125px">
						<c:forEach var="detailCd" items="${bannerDetail }" varStatus="status">
						<option value="<c:out value='${detailCd.code }'/>"><c:out value='${detailCd.codeNm }'/></option>
						</c:forEach>
					</select>
				</td> 
			</tr>
			<tr>
				<th class="board-write-th">배너명</th>
				<td class="board-write-td">
					<input name="bannerNm" id="bannerNm"  type="text" class="input-text full" value="<c:out value='${banner.bannerNm}'/>" maxLength="50" size="30" />
					<form:errors path="bannerNm" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">링크URL</th>
				<td class="board-write-td">
					<input name="linkUrl" id="linkUrl" type="text" class="input-text full" value="<c:out value='${banner.linkUrl}'/>" maxLength="255" size="50" />
					<br/>#noUrl 입력시 링크 기능을 사용하지 않음
					<form:errors path="linkUrl" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">배너 이미지</th>
				<td class="board-write-td">
				    <input type="file" name="file_1" id="egovComFileUploader" onchange="javascript:fncOnChangeImage();" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">배너설명(이미지 ALT)</th>
				<td class="board-write-td">
					<input name="bannerDc" id="bannerDc"  type="text" class="input-text full" value="<c:out value='${banner.bannerDc}'/>" maxLength="100" size="80" />
				</td>
			</tr>  
			<tr>
				<th class="board-write-th">정렬순서</th>
				<td class="board-write-td">
					<input name="sortOrdr" id="sortOrdr" type="text" class="input-text" value="<c:out value='${banner.sortOrdr}'/>" maxLength="5" size="10" />
					<form:errors path="sortOrdr" />
				</td>
			</tr>   
			<tr>
				<th class="board-write-th">타켓윈도우</th>
				<td class="board-write-td">
					새창&nbsp;&nbsp;<input type="radio" name="targetAt" id="targetAt" value="0" checked>&nbsp;&nbsp;
					현재 페이지&nbsp;&nbsp;<input type="radio" name="targetAt" id="targetAt" value="1">
				</td>
			</tr> 
			<tr>
				<th class="board-write-th">반영여부</th>
				<td class="board-write-td">
					<select name="reflctAt" id="reflctAt" class="board-search-select" >
					    <option value="Y" <c:if test="${banner.reflctAt == 'Y'}">selected</c:if> >반영</option>
						<option value="N" <c:if test="${banner.reflctAt == 'N'}">selected</c:if> >미반영</option>
					</select>
				</td> 
			</tr> 
			<tr>
				<th class="board-write-th">사이트 구분</th>
				<td class="board-write-td">
					<form:select path="siteType" id="siteType" class="board-search-select" >
						<c:forEach var="siteResult" items="${siteType}" varStatus="status">
						<option value="<c:out value='${siteResult.code }'/>"><c:out value="${siteResult.codeNm}"/> </option>
						</c:forEach>
					</form:select>
				</td>
			</tr> 
			<tr>
				<th class="board-write-th">등록일시</th>
				<td class="board-write-td">
					<input name="regDate" id="regDate" class="input-text" value="<c:out value="${banner.regDate}"/>" readonly />&nbsp;*자동 입력*
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<a href="<c:url value='/uss/ion/bnr/selectBannerList.do'/>?pageIndex=<c:out value='${bannerVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${bannerVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectBannerList(); return false;" class="btn btn-default">목록</a>
	<input type="submit" value="등록" onclick="fncBannerInsert(); return false;" class="btn btn-primary" />
</div>

</form:form>          

</body>
</html>

