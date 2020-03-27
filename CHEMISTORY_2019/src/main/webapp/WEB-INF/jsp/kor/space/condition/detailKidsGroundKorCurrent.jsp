<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javaScript">
$(document).ready(function(){
});
	

doList = function(){
	document.formKids.action = "<c:url value='/kor/space/condition.do'/>";
	document.formKids.submit();
};
</script>

<form id="formKids" name="formKids" method="post">
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
<input name="fcltyNo" id="fcltyNo" type="hidden" value="<c:out value="${detail.fcltyNo}"/>"/>
<input name="searchArea" id="searchArea" type="hidden" value="<c:out value="${kfvo.searchArea}"/>"/>
<input name="searchCnd" id="searchCnd" type="hidden" value="<c:out value="${kfvo.searchCnd}"/>"/>
<input name="searchKeyword" id="searchKeyword" type="hidden" value="<c:out value="${kfvo.searchKeyword}"/>"/>
<input type="hidden" name="pageIndex" value="<c:if test="${empty kfvo.pageIndex }">1</c:if><c:if test="${!empty kfvo.pageIndex }"><c:out value='${kfvo.pageIndex}'/></c:if>">

<div id="contents">
	<table class="bbs_default view">
   	<caption>어린이 활동공간 현황/시설 상세</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody id="body_list" class="t_center list">
			<tr>
				<th class="board-write-th">시설번호</th>
				<td class="board-write-td"><c:out value="${detail.fcltyNo}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">시설명</th>
				<td class="board-write-td"><c:out value="${detail.fcltyNm}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">지번주소</th>
				<td class="board-write-td"><c:out value="${detail.adres1}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">도로명주소</th>
				<td class="board-write-td"><c:out value="${detail.adres2}"/></td>
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
				<th class="board-write-th">설치일자</th>
				<td class="board-write-td"><c:out value="${detail.instlDt}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">교육지원청</th>
				<td class="board-write-td"><c:out value="${detail.ofcdc}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">본분교</th>
				<td class="board-write-td"><c:out value="${detail.pcpskl}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">설립구분</th>
				<td class="board-write-td"><c:out value="${detail.fondSe}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">학교상태</th>
				<td class="board-write-td"><c:out value="${detail.schulSttus}"/></td>
			</tr>
		</tbody>
	</table>
	
</div>

<div class="buttonBox ac">
	<a href="javascript:doList();" class="btn gray">목록</a>
</div>

</form>


