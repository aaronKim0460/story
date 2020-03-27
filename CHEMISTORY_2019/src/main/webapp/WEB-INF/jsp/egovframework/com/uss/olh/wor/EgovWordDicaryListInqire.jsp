<%
 /**
  * @Class Name : EgovWordDicaryListInqire.jsp
  * @Description : EgovWordDicaryListInqire 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *   2011.09.19   서준식              등록일자 Char 변경으로 fmt기능 사용안함
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<link rel="stylesheet" type="text/css" href="/css/css2/sub_content.css" media="screen" />
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
<script type="text/javaScript" language="javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_worddicary(){

	// 첫 입력란에 포커스..
	document.WordDicaryForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.WordDicaryForm.pageIndex.value = pageNo;
	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>";
   	document.WordDicaryForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_worddicary(){

	document.WordDicaryForm.pageIndex.value = 1;
	document.WordDicaryForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_worddicary(){

	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/addWordDicaryView.do'/>";
	document.WordDicaryForm.submit();	
	
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_worddicary(){

	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/updateWordDicaryView.do'/>";
	document.WordDicaryForm.submit();	

}
/* ********************************************************
 * 용어사서전 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_worddicarydetail(wordId) {		

	// 용어사전 키값(wordId) 셋팅.
	document.WordDicaryForm.wordId.value = wordId;	
  	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/WordDicaryDetailInqire.do'/>";
  	document.WordDicaryForm.submit();	
	   	   		
}


</script>
</head>
<body onLoad="fn_egov_initl_worddicary();">
<h2 class="adminH2">환경용어사전</h2>
<div class="board-pages">
	<span class="board-pages-total">총 <strong><c:out value='${paginationInfo.totalRecordCount }'/></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><c:out value='${paginationInfo.currentPageNo }'/></strong>/<c:out value='${paginationInfo.totalPageCount }'/></span>
</div>

<div class="board-search">
<form name="WordDicaryForm" id="WordDicaryForm" action="<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>" method="post">
	<fieldset>
	<legend>용어사전목록조회</legend>
		ㄱ~ㅎ:
		<select name="firstChar" class="board-search-select">
			<option value=''>선택하세요</option>
			<option value="1" <c:if test="${searchVO.firstChar eq '1'}">selected="selected"</c:if> >ㄱ</option>
			<option value="2" <c:if test="${searchVO.firstChar eq '2'}">selected="selected"</c:if> >ㄴ</option>
			<option value="3" <c:if test="${searchVO.firstChar eq '3'}">selected="selected"</c:if> >ㄷ</option>
			<option value="4" <c:if test="${searchVO.firstChar eq '4'}">selected="selected"</c:if> >ㄹ</option>
			<option value="5" <c:if test="${searchVO.firstChar eq '5'}">selected="selected"</c:if> >ㅁ</option>
			<option value="6" <c:if test="${searchVO.firstChar eq '6'}">selected="selected"</c:if> >ㅂ</option>
			<option value="7" <c:if test="${searchVO.firstChar eq '7'}">selected="selected"</c:if> >ㅅ</option>
			<option value="8" <c:if test="${searchVO.firstChar eq '8'}">selected="selected"</c:if> >ㅇ</option>
			<option value="9" <c:if test="${searchVO.firstChar eq '9'}">selected="selected"</c:if> >ㅈ</option>
			<option value="10" <c:if test="${searchVO.firstChar eq '10'}">selected="selected"</c:if> >ㅊ</option>
			<option value="11" <c:if test="${searchVO.firstChar eq '11'}">selected="selected"</c:if> >ㅋ</option>
			<option value="12" <c:if test="${searchVO.firstChar eq '12'}">selected="selected"</c:if> >ㅌ</option>
			<option value="13" <c:if test="${searchVO.firstChar eq '13'}">selected="selected"</c:if> >ㅍ</option>
			<option value="14" <c:if test="${searchVO.firstChar eq '14'}">selected="selected"</c:if> >ㅎ</option>
		</select>
		A~Z : 
		<select name="firstAlphabet" class="board-search-select">
			<option value=''>선택하세요</option>
			<option value="A" <c:if test="${searchVO.firstAlphabet eq 'A'}">selected="selected"</c:if> >A</option>
			<option value="B" <c:if test="${searchVO.firstAlphabet eq 'B'}">selected="selected"</c:if> >B</option>
			<option value="C" <c:if test="${searchVO.firstAlphabet eq 'C'}">selected="selected"</c:if> >C</option>
			<option value="D" <c:if test="${searchVO.firstAlphabet eq 'D'}">selected="selected"</c:if> >D</option>
			<option value="E" <c:if test="${searchVO.firstAlphabet eq 'E'}">selected="selected"</c:if> >E</option>
			<option value="F" <c:if test="${searchVO.firstAlphabet eq 'F'}">selected="selected"</c:if> >F</option>
			<option value="G" <c:if test="${searchVO.firstAlphabet eq 'G'}">selected="selected"</c:if> >G</option>
			<option value="H" <c:if test="${searchVO.firstAlphabet eq 'H'}">selected="selected"</c:if> >H</option>
			<option value="I" <c:if test="${searchVO.firstAlphabet eq 'I'}">selected="selected"</c:if> >I</option>
			<option value="J" <c:if test="${searchVO.firstAlphabet eq 'J'}">selected="selected"</c:if> >J</option>
			<option value="K" <c:if test="${searchVO.firstAlphabet eq 'K'}">selected="selected"</c:if> >K</option>
			<option value="L" <c:if test="${searchVO.firstAlphabet eq 'L'}">selected="selected"</c:if> >L</option>
			<option value="M" <c:if test="${searchVO.firstAlphabet eq 'M'}">selected="selected"</c:if> >M</option>
			<option value="N" <c:if test="${searchVO.firstAlphabet eq 'N'}">selected="selected"</c:if> >N</option>
			<option value="O" <c:if test="${searchVO.firstAlphabet eq 'O'}">selected="selected"</c:if> >O</option>
			<option value="P" <c:if test="${searchVO.firstAlphabet eq 'P'}">selected="selected"</c:if> >P</option>
			<option value="Q" <c:if test="${searchVO.firstAlphabet eq 'Q'}">selected="selected"</c:if> >Q</option>
			<option value="R" <c:if test="${searchVO.firstAlphabet eq 'R'}">selected="selected"</c:if> >R</option>
			<option value="S" <c:if test="${searchVO.firstAlphabet eq 'S'}">selected="selected"</c:if> >S</option>
			<option value="T" <c:if test="${searchVO.firstAlphabet eq 'T'}">selected="selected"</c:if> >T</option>
			<option value="U" <c:if test="${searchVO.firstAlphabet eq 'U'}">selected="selected"</c:if> >U</option>
			<option value="V" <c:if test="${searchVO.firstAlphabet eq 'V'}">selected="selected"</c:if> >V</option>
			<option value="W" <c:if test="${searchVO.firstAlphabet eq 'W'}">selected="selected"</c:if> >W</option>
			<option value="X" <c:if test="${searchVO.firstAlphabet eq 'X'}">selected="selected"</c:if> >X</option>
			<option value="Y" <c:if test="${searchVO.firstAlphabet eq 'Y'}">selected="selected"</c:if> >Y</option>
			<option value="Z" <c:if test="${searchVO.firstAlphabet eq 'Z'}">selected="selected"</c:if> >Z</option>
		</select>
		<select name="searchCondition" id="searchCondition" class="board-search-select">
		   <option value=''>선택하세요</option>
		   <option value="wordNm"  <c:if test="${searchVO.searchCondition == 'wordNm'}">selected="selected"</c:if> >용어명</option>
		   <option value="engNm"   <c:if test="${searchVO.searchCondition == 'engNm'}">selected="selected"</c:if> >영문명</option>	
		</select>
		<input name="searchKeyword" type="text" value="<c:out value="${searchVO.searchKeyword}"/>" size="35" id="searchKeyword" class="board-search-keyword" />
		<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="fn_egov_search_worddicary(); return false;" />
		
		
	</fieldset>
	<input name="wordId" type="hidden" value="">
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>
</div>

<div class="board-list">
<table class="board-default">
<caption>용어사전목록</caption>
<thead>
<tr>      
    <th scope="col" class="title" width="10%" nowrap>순번</th>    
    <th scope="col" class="title" width="20%" nowrap>용어명</th>        
    <th scope="col" class="title" width="30%" nowrap>영문명</th>       
    <th scope="col" class="title" width="10%" nowrap>동의어</th>
    <th scope="col" class="title" width="15%" nowrap>등록자</th>    
    <th scope="col" class="title" width="15%" nowrap>등록일자</th>               
</tr>
</thead> 

 <c:if test="${fn:length(resultList) == 0}">
  <tr> 
  	<td class="lt_text3" colspan=10>
  		<spring:message code="common.nodata.msg" />
  	</td>
  </tr>   	          				 			   
 </c:if>
   
<tbody class="t_center list">
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr>
		<td class="board-default-td"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>	        
		<td class="lt_text3">
			<a href="javascript:void(0);" onclick="fn_egov_inquire_worddicarydetail('<c:out value="${resultInfo.wordId}"/>')"><c:out value="${resultInfo.wordNm}"/></a>
		</td>
		<td class="lt_text3"><c:out value="${resultInfo.engNm}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.synonm}"/></td>
		<td class="board-default-td"><c:out value="${resultInfo.emplyrNm}"/></td>
		<td class="board-default-td"><c:out value="${resultInfo.frstRegisterPnttm}"/></td>					
			
  </tr>   
</c:forEach>
</tbody>  
</table>
</div>

<c:if test="${!empty popupManageVO.pageIndex }">
<div class="board-footer">
	<div class="pagenavi">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image2" jsFunction="fn_egov_select_linkPage" />
    </div>
</div>
</c:if>

<div class="board-detail-foot">
	<div class="btns clear fr">	
		<a href="<c:url value='/uss/olh/wor/addWordDicaryView.do'/>" onclick="fn_egov_regist_worddicary(); return false;" class="btn btn-primary"><spring:message code="button.create" /></a>
 	</div>
</div>
</body>
</html>