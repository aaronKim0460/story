<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<style type="text/css">
#div_img_preview { position:absolute; width:400px; height:160px; overflow:hidden; cursor:pointer; background-color:#FFFFFF;}
</style>

<validator:javascript formName="banner" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fncSelectBannerList() {
    var varFrom = document.getElementById("banner");
    varFrom.action = "<c:url value='/uss/ion/bnr/selectBannerList.do'/>";
    varFrom.submit();       
}

function fncBannerUpdate() {
    var varFrom = document.getElementById("banner");
    varFrom.action = "<c:url value='/uss/ion/bnr/updtBanner.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateBanner(varFrom)){           
            return;
        }else{
            varFrom.submit();
        } 
    }
}

function fncBannerDelete() {
    var varFrom = document.getElementById("banner");
    varFrom.action = "<c:url value='/uss/ion/bnr/removeBanner.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}


	$(document).ready(function(){
		
		<c:if test="${banner.bannerImageFile != null}">
			
			// 팝업 이미지 보기
			$("#img_view").click(function(e){
				
				$("#div_img_preview").css("left", e.pageX - 200);
				$("#div_img_preview").css("top", e.pageY - 80);
				
				$("#div_img_preview").show();
				
			});
			
			// 팝업 닫기
			$("#div_img_preview").click(function(){
				
				$(this).hide();
				
			});
			
		</c:if>
		
	});

</script>

<body>

<form:form commandName="banner" method="post" action="${pageContext.request.contextPath}/uss/ion/bnr/updtBanner.do' />" enctype="multipart/form-data"> 
<input type="hidden" name="posblAtchFileNumber" value="1"  >
<input type="hidden" name="bannerAtStr" value="${bannerAtStr }"/>
<input type="hidden" name="bannerAt" value="1" />
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${bannerVO.searchCondition}'/>" >
<input type="hidden" name="searchKeyword" value="<c:out value='${bannerVO.searchKeyword}'/>" >
<input type="hidden" name="pageIndex" value="<c:out value='${bannerVO.pageIndex}'/>" >

<input type="hidden" name="reflctAtStr" value="<c:out value='${bannerVO.reflctAtStr}'/>" >
<input type="hidden" name="siteTypeStr" value="<c:out value='${bannerVO.siteTypeStr}'/>" >

<div class="content-body">
<div class="board-list">

	<table class="board-write">
	<caption>팝업 수정</caption>
		<colgroup>
		    <col style="width:20%" />
		    <col style="width:80%" />
		</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">팝업 ID</th>
				<td class="board-write-td">
					<input name="bannerId" id="bannerId" type="text" class="input-text" size="27" value="<c:out value='${banner.bannerId}'/>" readonly>&nbsp;*자동 입력*
				</td>
			</tr>
			<tr style="display: none;">
				<th class="board-write-th">상세구분코드</th>
				<td class="board-write-td">
					<select name="detailAt" id="detailAt" class="board-search-select" style="width:125px">
						<c:forEach var="detailCd" items="${bannerDetail }" varStatus="status">
						<option value="<c:out value='${detailCd.code }'/>" <c:if test="${banner.detailAt == detailCd.code }">selected</c:if>><c:out value='${detailCd.codeNm }'/></option>
						</c:forEach>
					</select>
				</td> 
			</tr>
			<tr>
				<th class="board-write-th">팝업명</th>
				<td class="board-write-td">
			    	<input name="bannerNm" id="bannerNm" class="input-text full" type="text" value="<c:out value='${banner.bannerNm}'/>" maxLength="50" size="30" >
			    	<form:errors path="bannerNm" />
			    </td>
			</tr>
			<tr>
				<th class="board-write-th">링크URL</th>
				<td class="board-write-td">
					<input name="linkUrl" id="linkUrl" type="text" class="input-text full" value="<c:out value='${banner.linkUrl}'/>" maxLength="255" size="50" >
					<br/>#noUrl 입력시 링크 기능을 사용하지 않음
					<form:errors path="linkUrl" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">팝업 이미지</th>
				<td class="board-write-td">
				    <input type="file" name="file_1" id="egovComFileUploader" />
				    <c:if test="${banner.bannerImage != null && banner.bannerImage != ''}">
				    	<a id="img_view" class="btn-sm btn-primary" href="#"><c:out value='${banner.bannerImage}'/></a>
				    </c:if>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">팝업설명(이미지 ALT)</th>
				<td class="board-write-td">
					<input name="bannerDc" id="bannerDc" type="text" class="input-text full" value="<c:out value='${banner.bannerDc}'/>" maxLength="100" size="80" >
				</td>
			</tr> 
			<tr>
				<th class="board-write-th">정렬순서</th>
				<td class="board-write-td">
					<input name="sortOrdr" id="sortOrdr" type="text" class="input-text" value="<c:out value='${banner.sortOrdr}'/>" maxLength="5" size="10" >
					<form:errors path="sortOrdr" />
				</td>
			</tr> 
			<tr>
				<th class="board-write-th">타켓윈도우</th>
				<td class="board-write-td">
					새창&nbsp;&nbsp;<input type="radio" name="targetAt" id="targetAt" value="0" <c:if test="${banner.targetAt == '0' }">checked</c:if> />&nbsp;&nbsp;
					현재 페이지&nbsp;&nbsp;<input type="radio" name="targetAt" id="targetAt" value="1" <c:if test="${banner.targetAt == '1' }">checked</c:if> />
				</td>
			</tr>    
			<tr>
				<th class="board-write-th">반영여부</th>
				<td class="board-write-td">
					<select name="reflctAt" id="reflctAt" class="board-search-select">
					    <option value="Y" <c:if test="${banner.reflctAt == 'Y'}">selected</c:if> >Y</option>
						<option value="N" <c:if test="${banner.reflctAt == 'N'}">selected</c:if> >N</option>
					</select>
				</td> 
			</tr>
			<tr>
				<th class="board-write-th">사이트 구분</th>
				<td class="board-write-td">
					<form:select path="siteType" id="siteType" class="board-search-select">
						<c:forEach var="siteResult" items="${siteType}" varStatus="status">
						<option value="<c:out value='${siteResult.code }'/>" <c:if test="${siteResult.codeNm == banner.siteType }">selected="selected"</c:if>><c:out value="${siteResult.codeNm}"/> </option>
						</c:forEach>
					</form:select>
				</td>
			</tr>  
			<tr>
				<th class="board-write-th">등록일시</th>
				<td class="board-write-td">
					<input name="regDate" id="regDate" type="text" class="input-text" size="27" value="<c:out value="${banner.regDate}"/>" readonly />&nbsp;*자동 입력*
				</td>
			</tr>
  		</tbody>
	</table>
</div>
</div>


<div class="text-center">
	<a href="<c:url value='/uss/ion/bnr/selectBannerList.do'/>?pageIndex=<c:out value='${bannerVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${bannerVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectBannerList(); return false;" class="btn btn-default">목록</a>
	<input type="submit" value="저장" onclick="fncBannerUpdate(); return false;" class="btn btn-primary">
	<a href="<c:url value='/uss/ion/bnr/removeBanner.do'/>?bannerId=<c:out value='${bannerVO.bannerId}'/>" onclick="fncBannerDelete(); return false;" class="btn btn-warning">삭제</a>
</div>



</form:form>

<c:if test="${banner.bannerImageFile != null}">
	<div id="div_img_preview" style="display:none;">
		<img id="img_preview" src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${banner.bannerImageFile}'/>" width="400px;" height="160px;"/>
	</div>
</c:if>
 
</body>
</html>

