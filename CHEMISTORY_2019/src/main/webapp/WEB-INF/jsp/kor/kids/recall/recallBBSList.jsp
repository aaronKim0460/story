<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
	
	// enter로 검색하기
	function press(event) {
		if (event.keyCode==13) {
			fn_move_select_List('1');
		}
	}

	// 검색하기
	function fn_move_select_List(pageNo) {
		$('#pageIndex').val(pageNo);
		$('#frm').attr("action","<c:url value='/user/com/kids/recall/selectRecallBBSList.do'/>");
		$('#frm').submit();
	}

	// 상세화면으로 이동
	function fn_move_inqire(recallId) {
		$('#recallId').val(recallId);
		$('#frm').attr("action","<c:url value='/user/com/kids/recall/recallBBSInqire.do'/>");
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
					<input type="hidden" name="domesticYn" id="domesticYn" value="<c:out value='${recallBBSVO.domesticYn}'/>" />
					<fieldset>
						<legend>어린이유해용품리콜 검색</legend>
						<span>
							
							<select name="productType" class="select_list">
								<option value="" <c:if test="${recallBBSVO.productType == ''}">selected="selected"</c:if>>제품군</option>
								<option value="BCC901" <c:if test="${recallBBSVO.productType == 'BCC901'}">selected="selected"</c:if>>식생활기기</option>
								<option value="BCC902" <c:if test="${recallBBSVO.productType == 'BCC902'}">selected="selected"</c:if>>주방용품</option>
								<option value="BCC903" <c:if test="${recallBBSVO.productType == 'BCC903'}">selected="selected"</c:if>>가구</option>
								<option value="BCC905" <c:if test="${recallBBSVO.productType == 'BCC905'}">selected="selected"</c:if>>의류, 섬유신변용품</option>
								<option value="BCC908" <c:if test="${recallBBSVO.productType == 'BCC908'}">selected="selected"</c:if>>문화용품</option>
								<option value="BCC911" <c:if test="${recallBBSVO.productType == 'BCC911'}">selected="selected"</c:if>>스포츠, 레져, 취미용품</option>
								<option value="BCC912" <c:if test="${recallBBSVO.productType == 'BCC912'}">selected="selected"</c:if>>기타용품</option>
								<option value="BCC913" <c:if test="${recallBBSVO.productType == 'BCC913'}">selected="selected"</c:if>>장난감</option>
							</select>
							<select name="searchCondition" class="select_list">
								<option value="nm" <c:if test="${recallBBSVO.searchCondition == 'nm'}">selected="selected"</c:if>>제품명</option>
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
	
		
	<div class="foreignRecall">
		<ul>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<li class="clearfix">
				<div class="recallImg">
					<p> 데이터 : <c:out value="${result.recallId}"/> <br />
					 파일 : <c:out value="${result.atchFileId}"/>
					
						<c:choose>
							<c:when test="${!empty result.atchFileId}">
								<a href="javascript:fn_move_inqire('<c:out value="${result.recallId}"/>')">
									<img style="max-width:1000px;max-height: 490px;" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.atchFileId}"/>' onerror="imgError(this);"/></span>
								</a>
							</c:when>
							<c:otherwise>
								<img src="/assets/kor/images/newMain/noimgs.png" alt="리콜상품정보"/>
							</c:otherwise>
						</c:choose>
					</p>
				</div>
				<div class="recallText">
					<div class="clearfix recallHeader">
						<c:if test="${fn:length(result.productType) > 0}"><p class="btn_s_blue"><c:out value="${result.productType}" /></p></c:if>
						<%-- <p class="btn_s_orange"><span style="color:#fffbc6;"><c:out value="${result.afterRecallCn}" /></span></p> --%><br/>
					<h3><a href="javascript:void(0);" onclick="fn_move_inqire('<c:out value="${result.recallId}"/>')"><nobr><c:out value="${result.productName}" /></nobr></a></h3>
					<p class="date"><c:if test="${fn:length(result.publishDt) > 0}">공표일 : <td>${fn:substring(result.publishDt, 0, 4)}-${fn:substring(result.publishDt, 4, 6)}-${fn:substring(result.publishDt, 6, 8)}</td></c:if></p></div>
					<div class="recall_contents">				
						<h4><a href="javascript:void(0);" onclick="fn_move_inqire('<c:out value="${result.recallId}"/>')">
							<c:choose>
								<c:when test="${fn:length(result.materialName) > 0}"><c:out value="${result.materialName}" /></c:when>
								<c:otherwise><c:out value="${result.position}" /></c:otherwise>
							</c:choose>
						</a></h4>
						<p class="goods_explain"><nobr><a href="javascript:void(0);" onclick="fn_move_inqire('<c:out value="${result.recallId}"/>')"><c:out value="${result.recallCn}" /></a></nobr></p>
					</div>
				</div>
			</li>
			</c:forEach>
			<c:if test="${fn:length(resultList) == 0}">
			<li class="clearfix">
				<div style="padding:30px; text-align:center;">작성된 게시물이 없습니다.</div>
			</li>
			</c:if>
		</ul>
	</div>

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image"
			jsFunction="fn_move_select_List" />
	</div>

</div>
</body>
</html>