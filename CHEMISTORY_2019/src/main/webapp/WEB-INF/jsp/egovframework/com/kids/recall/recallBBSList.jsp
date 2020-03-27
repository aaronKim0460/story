<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp"%>
<script type="text/javascript">
	
	// enter로 검색하기
	function press(event) {
		if (event.keyCode==13) {
			fn_move_select_List('1');
		}
	}

	// 등록화면으로 이동
	function fn_move_regist() {
		$('#frm').attr("action","<c:url value='/com/kids/recall/recallBBSRegist.do?domesticYn=${param.domesticYn}'/>");
		$('#frm').submit();
	}

	// 검색하기
	function fn_move_select_List(pageNo) {
		$('#pageIndex').val(pageNo);
		$('#frm').attr("action","<c:url value='/com/kids/recall/selectRecallBBSList.do?domesticYn=${param.domesticYn}'/>");
		$('#frm').submit();
	}

	// 상세화면으로 이동
	function fn_move_inqire(recallId) {
		$('#recallId').val(recallId);
		$('#frm').attr("action","<c:url value='/com/kids/recall/recallBBSInqire.do?domesticYn=${param.domesticYn}'/>");
		$('#frm').submit();
	}
	
	// 첨부파일 전체 다운로드
	$(document).ready(function(){
		
		var fileFlag = false;
		
		// 전체 파일 다운로드
		$("a[name=down_file_all]").click(function(){
			
			fileFlag = true;
			
			var atchFileId = $(this).attr("fileinfo"); 
			
			if(atchFileId == null || atchFileId == ""){
				alert("파일 정보를 확인할 수 없습니다.");
				return;
			}
			
			$("#downForm input[name=atchFileId]").val(atchFileId);
			
			$("#downForm").attr("action" , "<c:url value='/cmm/fms/fileDownAll.do' />");
			$("#downForm").attr("target" , "fileDown");
			$("#downForm").submit();
		});
		
	});
</script>
</head>
<body>
<form id="downForm" name="downForm" method="post">
	<input type="hidden" name="atchFileId" />
</form>

<div style="width: 0px; height: 0px; display: none;">
	<iframe name="fileDown" title="fileDown"></iframe>
</div>

<div id="contents">
<h2 class="adminH2"><c:if test="${param.domesticYn eq 'Y' || result.domesticYn eq 'Y'}">국내어린이용품 환경유해인자 기준초과제품</c:if><c:if test="${param.domesticYn eq 'N' ||result.domesticYn eq 'N'}">국외위해어린이용품 리콜현황</c:if></h2>
	<div class="tableBtn clearfix">
		<div class="btn_left big">
			총 <span class="point"><c:out value='${paginationInfo.totalRecordCount }' /></span>건
			, 현재페이지 <span class="point"><c:out value='${paginationInfo.currentPageNo }' /></span>
			/<c:out value='${paginationInfo.totalPageCount }' />
		</div>
		<form name="frm" id="frm" action="<c:url value='/com/kids/recall/selectRecallBBSList.do'/>" method="post">
			<div class="btn_right">
				<div class="board_search">
					<input type="hidden" name="recallId" id="recallId"  />
					<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${recallBBSVO.pageIndex}'/>" />
					<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
					<fieldset>
						<legend>어린이유해용품리콜 검색</legend>
						<span>
							<select name="searchCondition" class="select_list">
								<option value="nm" <c:if test="${recallBBSVO.searchCondition == 'nm'}">selected="selected"</c:if>>제품명</option>
								<option value="whence" <c:if test="${recallBBSVO.searchCondition == 'whence'}">selected="selected"</c:if>>출처</option>
								<option value="material" <c:if test="${recallBBSVO.searchCondition == 'material'}">selected="selected"</c:if>>원인물질</option>
							</select>
						</span>
						<span>
							<label for="" class="skip">검색단어입력</label>
							<input name="searchKeyword" type="text" value='<c:out value="${recallBBSVO.searchKeyword}"/>' class="text" title="검색어 입력" onKeyPress="press(event);" />
						</span>
						<input type="image" src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" onClick="fn_move_select_List('1'); return false;" />
					</fieldset>
				</div>
			</div>
		</form>
	</div>
	<table class="bbs_default list">
		<colgroup>
			<col style="width: 6.5%" />
			<col style="width: 11.5%" />
			<col style="width: 20%" />
			<col style="width: 15%" />
			<col style="width: 15%" />
			<col style="width: 12%" />
			<col style="width: 20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">구분</th>
				<th scope="col">제품명</th>
				<th scope="col">원인물질</th>
				<th scope="col">출처</th>
				<th scope="col">등록일</th>
				<th scope="col">조치</th>
			</tr>
		</thead>
		<tbody id="body_list" class="t_center list">
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td>
						<c:out value="${paginationInfo.totalRecordCount - ((recallBBSVO.pageIndex -1)* recallBBSVO.pageSize + status.index)}" />
					</td>
					<td>
						<c:choose>
							<c:when test="${result.domesticYn eq 'Y'}">
								국내
							</c:when>
							<c:otherwise>
								국외
							</c:otherwise>
						</c:choose>
					</td>
					<td class="subject">
						<a href="javascript:void(0);" onclick="fn_move_inqire('<c:out value="${result.recallId}"/>')"><c:out value="${result.productName}" /></a>
					</td>
					<td class="board-default-td-name">
						<c:choose>
							<c:when test="${fn:length(result.materialName) > 0}"><c:out value="${result.materialName}" /></c:when>
							<c:otherwise><c:out value="${result.position}" /></c:otherwise>
						</c:choose>
						
					</td>
					<td class="board-default-td-name">
						<c:out value="${result.productWhence}" />
					</td>
					<td class="board-default-td-date">
						<c:out value="${result.frstRegistPnttm}" />
					</td>
					<td class="board-default-td-name">
						<c:out value="${result.afterRecallCn}" />
					</td>
				</tr>
			</c:forEach>

			<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="7" class="no_data" align="center">작성된 게시물이 없습니다.</td>
				</tr>
			</c:if>

		</tbody>
	</table>

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image"
			jsFunction="fn_move_select_List" />
	</div>

	<div class="t_center mt20">
		<c:if test="${fn:length(sessionUniqId) > 0}">
			<a href="javascript:fn_move_regist();" class="btn seablue">등록</a>
		</c:if>
	</div>

</div>
</body>
</html>