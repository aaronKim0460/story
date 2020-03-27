<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
<script type="text/javaScript">
$(document).ready(function(){
});
	

doList = function(){
	document.formKids.action = "<c:url value='/adm/contents/kidsGround/selectKidsGroundRelief.do'/>";
	document.formKids.submit();
};
</script>

<body>

<form id="formKids" name="formKids" method="post">
<input name="crtfcSn" id="crtfcSn" type="hidden" value="<c:out value="${detail.crtfcSn}"/>"/>
<input name="searchArea" id="searchArea" type="hidden" value="<c:out value="${krvo.searchArea}"/>"/>
<input name="searchCnd" id="searchCnd" type="hidden" value="<c:out value="${krvo.searchCnd}"/>"/>
<input name="searchKeyword" id="searchKeyword" type="hidden" value="<c:out value="${krvo.searchKeyword}"/>"/>
<input type="hidden" name="pageIndex" value="<c:if test="${empty krvo.pageIndex }">1</c:if><c:if test="${!empty krvo.pageIndex }"><c:out value='${krvo.pageIndex}'/></c:if>">
<div class="content-body">
<div class="board-list">
	<h2 class="adminH2">어린이활동공간 환경안심인증현황</h2>
	<table class="board-write">
   	<caption>안심인증현황</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">인증순서번호</th>
				<td class="board-write-td"><c:out value="${detail.crtfcSn}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">시설명</th>
				<td class="board-write-td"><c:out value="${detail.fcltyNm}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">주소</th>
				<td class="board-write-td"><c:out value="${detail.locplc}"/></td>
			</tr>			
			<tr>
				<th class="board-write-th">시설유형</th>
				<td class="board-write-td"><c:out value="${detail.fcltyTy}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">지역</th>
				<td class="board-write-td"><c:out value="${detail.areaCl}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">지역상세</th>
				<td class="board-write-td"><c:out value="${detail.areaDetailCl}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">대표자</th>
				<td class="board-write-td"><c:out value="${detail.rprsntv}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">인증시작일</th>
				<td class="board-write-td"><c:out value="${detail.crtfcBgnde}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">인증종료일</th>
				<td class="board-write-td"><c:out value="${detail.crtfcEndde}"/></td>
			</tr>			
		</tbody>
	</table>
	
</div>
</div>

<div class="text-center">
	<a href="javascript:doList();" class="btn btn-default">목록</a>
</div>

</form>

</body>
</html>