<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>

<script type="text/javascript">
	// 등록하기
	function fn_do_regist() {
		if ($("#productName").val() == null || $("#productName").val() == '') {
			alert("제품명을 입력해 주시기 바랍니다.");
			return;
		}
		if($('#publishDt').val().length != 8){
			alert("공표일을 다시 확인해 주세요.");
			return;
		}
		
		//구분이 국내일 때 && 분류가 선택되지 않았을 때
		//2018.10.17 장재영 대리
		//탭통일로 인한, 필수값 제거.
		/* if($('[name=domesticYn]').val() == 'Y' && $('#productTabCd').val().length == 0){
			alert("분류를 선택해 주시기 바랍니다.");
			return;
		} */
		if ($(":input[name='mIdxs']").length == 0) {
			alert("원인물질(유해물질)을 하나 이상 선택해 주시기 바랍니다.");
			return;
		}
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.recall.action = "<c:url value='/com/kids/recall/recallBBSInsert.do'/>";
		
			document.recall.submit();
		} 
	};

	// 목록으로 이동
	function fn_move_select_List() {
		location.href = "<c:url value='/com/kids/recall/selectRecallBBSList.do?domesticYn=${param.domesticYn}&menuNo=9010700'/>";
// 		document.recall.submit();
	};
	
	// 업로더 설정
	function makeFileAttachment(){
		 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), 1 );
		 multi_selector.addThumbElement( document.getElementById( 'egovComFileUploader' ) );
	};
	
	// 유해인자 목록 팝업
	doMeterialPopup = function() {
		var url = "<c:url value='/adm/contents/material/materialListPopup.do' />";
		var openParam = "width=712, height=384px, top=30,left=60";
		window.open(url, "p_meterial", openParam);
	};
	
	// 팝업 데이터 바인딩
	setMeterialValue = function(returnValue) {
		var html = [];

		html.push("<div><strong class='" + returnValue.id + "'>" + returnValue.name + "</strong>&nbsp;<a href='javascript:void(0);' onclick='fn_delete_material(this);' class='btn-sm btn-warning'>삭제</a><input name='mIdxs' type='hidden' value='" + returnValue.id + "' /></div>");
		html.join("");
		
		$("#materialArea").append(html);
	};
	
	// 유해인자 삭제
	fn_delete_material = function(element) {
		var $element = jQuery(element);
		
		$element.closest("div").remove();
	};
	
	$(document).ready(function(){

		makeFileAttachment();
		
		/* //구분값에 따라 분류 항목을 제어
		$('[name=domesticYn]').change(function(){
			if($('[name=domesticYn]:checked').val() == 'N'){
				$('#spot').hide();
				$('#productTabCd').empty();
			}else{
				$('#spot').show();
				$('#productTabCd').html('<option value="">분류 선택</option><option value="1100701">리콜명령</option><option value="1100702">환경유해인자 기준초과</option>');
			}
		}); */
	});
	
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	
</script>

<form id="recall" name="recall" enctype="multipart/form-data" method="post">
	<input name="pageIndex" type="hidden" value="<c:out value='${recallBBSVO.pageIndex}'/>"/>
	<input name="menuNo" type="hidden" value="<c:out value='${menuManageVO.menuNo}'/>"/>
	<input name="searchCondition" type="hidden" value="<c:out value='${recallBBSVO.searchCondition}'/>"/>
	<input name="searchKeyword" type="hidden" value="<c:out value='${recallBBSVO.searchKeyword}'/>"/>
	<input type="hidden" name="domesticYn" value="${param.domesticYn}" />
	
	<div id="contents">
		<h2 class="adminH2"><c:if test="${param.domesticYn eq 'Y' || result.domesticYn eq 'Y'}">국내어린이용품 환경유해인자 기준초과제품</c:if><c:if test="${param.domesticYn eq 'N' ||result.domesticYn eq 'N'}">국외위해어린이용품 리콜현황</c:if></h2>
		<table class="bbs_default write" border="1">
			<caption>유해물질 리콜 등록</caption>
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="">제품명 </label><span title="필수입력">*</span></th>
					<td>
						<input name="productName" id="productName" type="text" value="" class="input-text full" title="제품명 입력"/>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">제품군</label><span title="필수입력">*</span></th>
					<td>
						<select id="productType" name="productType" class="board-search-select" style="width:220px">
							<c:forEach var="productTypeList" items="${productTypeList}" varStatus="status">
							<option value="<c:out value='${productTypeList.code }'/>" <c:if test="${productTypeList.code == result.productType }">selected</c:if>><c:out value="${productTypeList.codeNm}"/> </option>
							</c:forEach>
						</select>						
					</td>
				</tr>	
				<tr>
					<th scope="row"><label for="">공표일</label></th>
					<td>
						<input name="publishDt" id="publishDt" type="text" class="input-text full" title="공표일입력" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
						<font color="red"><strong>*</strong></font>반드시 8자리 숫자만 입력해주세요.(예 : 20170201)
					</td>
				</tr>			
				<!-- <tr>
					<th scope="row"><label for="">구분</label><span title="필수입력">*</span></th>
					<td>
						<input type="radio" name="domesticYn" value="Y" checked="checked" /> 국내 &nbsp;
						<input type="radio" name="domesticYn" value="N" /> 국외
					</td>
				</tr> -->
				<c:if test="${param.domesticYn eq 'Y'}">
				<tr id="spot">
					<th scope="row"><label for="">분류</label><!-- <span title="필수입력">*</span> --></th>
					<td>
						<select name="productTabCd" id="productTabCd" class="board-search-select" style="width:220px">
							<option value="">분류 선택</option>
							<option value="1100701">리콜명령</option>
							<option value="1100702">환경유해인자 기준초과</option>
						</select><br/>
					</td>
				</tr>
				</c:if>
				<tr>
					<th scope="row"><label for="">키워드</label></th>
					<td>
						<input name="keywordTag" id="keywordTag" type="text" value="" class="input-text full" maxlength="200" title="키워드입력"/>
						<font color="red"><strong>*</strong></font>#으로 구분해서 검색어를 넣어주세요
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">출처</label></th>
					<td>
						<input name="productWhence" id="productWhence" type="text" value="" class="input-text" size="50" title="출처 입력"/>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">국가</label></th>
					<td>
						<input name="countryName" id="countryName" type="text" value="" class="input-text" size="50" title="국가 입력"/>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">유해물질</label><span title="필수입력">*</span></th>
					<td>
						<a href="javascript:void(0);" onclick="doMeterialPopup();" class="btn seablue">유해인자 찾기</a>
						<div id="materialArea"></div>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">제품설명</label></th>
					<td>
						<textarea id="productCn" name="productCn" class="textarea-board" cols="50" rows="2" title="제품설명 입력"></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">세부사항</label></th>
					<td>
						<textarea id="recallCn" name="recallCn" class="textarea-board" cols="50" rows="2" title="세부사항 입력"></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">후속 조치 내용</label></th>
					<td>
						<input name="afterRecallCn" id="afterRecallCn" type="text" value="" class="input-text full" title="후속 조치 내용 입력"/>
					</td>
				</tr>
				<tr>
				    <th scope="row"><label for="">썸네일</label></th>
				    <td>
						<font color="red"><strong>*</strong></font>이미지파일만 선택하셔야 정상적으로 노출됩니다.
						<br/>
						<input name="file_1" id="egovComFileUploader" type="file" title="첨부파일입력" accept="image/*" />
						<div id="egovComFileList"></div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="t_center mt20">
			<a href="javascript:fn_move_select_List();" class="btn gray">목록</a>
			<a href="javascript:fn_do_regist();" class="btn seablue">등록</a>
		</div>
		
	</div>
	
</form>