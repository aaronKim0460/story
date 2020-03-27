<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>

<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
_editor_area = "nttCn";
</script>

<script type="text/javascript">

	function fn_egov_validateForm(obj) {
		return true;
	}

	function fn_egov_regist_notice() {
//		document.board.onsubmit();
  
    	document.board.nttCn.value = CKEDITOR.instances.nttCn.getData();
  
		var ntceBgnde = eval(document.getElementById("ntceBgnde").value);
		var ntceEndde = eval(document.getElementById("ntceEndde").value);
		
		if(ntceBgnde > ntceEndde){
			alert("게시기간 종료일이 시작일보다 빠릅니다.");
			return;
		}

		if(document.board.bbsTyCode.value != "BBST06"){
			if (!validateBoard(document.board)){
				return;
			}
		}
		
		if(document.board.bbsTyCode.value == "BBST05"){
			document.board.extStr9.value = document.getElementById("selBbsNttSe").options[document.getElementById("selBbsNttSe").selectedIndex].value;
		}
		
		document.board.ntcrNm.value = document.getElementById("ntcrNmA").value;
		
		//ntceDate 
		document.board.ntceDate.value = document.getElementById("ntceDate").value;
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			//document.board.onsubmit();
			<c:choose>
				<c:when test="${searchVO.nttId == '' || searchVO.nttId == '0'}">
					document.board.action = "<c:url value='/cop/bbs${prefix}/insertBoardArticle.do'/>";
				</c:when>
				<c:otherwise>
					document.board.action = "<c:url value='/cop/bbs${prefix}/replyBoardArticle.do'/>";
				</c:otherwise>
			</c:choose>
		
			document.board.submit();
		} 
	}

	function fn_egov_select_noticeList() {
		document.board.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
		document.board.submit();
	}
	
	function makeFileAttachment(){
		
		<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
			 
			 var maxFileNum = $("#posblAtchFileNumber").val();
			 
		     if(maxFileNum == null || maxFileNum == ""){
		    	 maxFileNum = 0;
		     }
		     
			 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
			 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
		</c:if>	
		
		var multi_selector_thumb = new MultiSelector( document.getElementById( 'thumbFileList' ), 1 );
		multi_selector_thumb.addThumbElement( document.getElementById( 'thumbFileUploader' ) );
	
		$("input[name=nttSj]").focus();
	}
	
	// 유해인자 목록 팝업
	doMeterialPopup = function() {
		var url = "<c:url value='/adm/contents/material/materialListPopup.do' />";
		var openParam = "width=712, height=384px, top=30,left=60";
		window.open(url, "p_meterial", openParam);
	};
	
	// 팝업 데이터 바인딩
	setMeterialValue = function(returnValue) {
		var form = $("form[name='board']");
		
		form.find("#meterialId").val(returnValue.id);
		form.find("#meterialName").val(returnValue.name);
		form.find("#meterialKname").val(returnValue.name);
		form.find("#meterialCas").val(returnValue.cas);
	};
	
	removeMeterialValue = function() {
		var form = $("form[name='board']");
		
		form.find("#meterialId").val('');
		form.find("#meterialName").val('');
		form.find("#meterialKname").val('');
		form.find("#meterialCas").val('');
	};
	
	$(document).ready(function(){
		makeFileAttachment();
		
		// 연동 게시판 선택
		$("#btn_link_bbs").click(function(){
			
			if($("#bbsId").val() == ""){
				alert("게시판 정보를 확인할 수 없습니다.");
				return;
			}
			
			var param = "bbsId="+$("#bbsId").val();
			param += "&linkBbsId="+$("#linkBbsId").val();
			
			window.open("/cop/bbs/linkBbsListPop.do?"+param, "bbs_preview", "scrollbars=yes, width=600, height=650");
			
		});
		
		// 미리보기
		$("#btn_preview").click(function(){
			
			var nttCn = CKEDITOR.instances.nttCn.getData();
			
			if($.trim(nttCn) == ""){
				alert("미리보기할 내용이 없습니다.");
				return;
			}
			
			nttCn.replaceAll("<script", "<nier");
			nttCn.replaceAll("</script", "</nier");
			
			$("#p_nttCn").val(nttCn);
			
			var previewForm = $("#preview_form");
			
			window.open("" ,"previewForm", "scrollbars=yes, width=1100, height=800"); 
			previewForm.attr("action", "<c:url value='/cop/bbs/bbsPreview.do'/>");
			previewForm.attr("method", "post");
			previewForm.attr("target", "previewForm");
			previewForm.submit();
			
		});
		
		<c:if test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
		var newDate = new Date();
		var yyyy = newDate.getFullYear();
		var mm = newDate.getMonth()+1;
		var dd = newDate.getDate();
		
        if (("" + mm).length == 1) { mm = "0" + mm; }
        if (("" + dd).length   == 1) { dd   = "0" + dd;   }
        
        var toDayHidden = yyyy + mm + dd;
		var toDay = yyyy + "-" + mm + "-" + dd;
		
		$('#ntceBgnde').val(toDayHidden);
		$('#ntceBgndeView').val(toDay);
		
		$('#ntceEndde').val("99991231");
		$('#ntceEnddeView').val("9999-12-31");
		</c:if>
	});
	
</script>

<form id="preview_form" name="preview_form" enctype="multipart/form-data" method="post">
	<input type="hidden" id="p_nttCn" name="p_nttCn" />
</form>

<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" id="bbsId" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
<input type="hidden" name="bbsNttSe" value=""/>
<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
<input type="hidden" id="posblAtchFileNumber" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
<input type="hidden" name="extStr9" id="extStr9" value=""/>
<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
<input type="hidden" name="authFlag" value="<c:out value='${bdMstr.authFlag}'/>" />
<input type="hidden" id="linkBbsId" name="linkBbsId" />

<input type="hidden" name="searchCl1DetailCode" id="searchCl1DetailCode" value="<c:out value='${searchVO.searchCl1DetailCode}'/>" />

<c:if test="${anonymous != 'true'}">
<input type="hidden" name="ntcrNm" value="dummy">	<!-- validator 처리를 위해 지정 -->
<input type="hidden" name="password" value="dummy">	<!-- validator 처리를 위해 지정 -->
</c:if>
<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
<input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
<input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
</c:if>

<!-- 답변용 -->
<c:if test="${bdMstr.replyPosblAt == 'Y'}">
<input type="hidden" name="replyAt" value="Y" />
<input type="hidden" name="nttId" value="<c:out value='${searchVO.nttId}'/>" />
<input type="hidden" name="parnts" value="<c:out value='${searchVO.parnts}'/>" />
<input type="hidden" name="sortOrdr" value="<c:out value='${searchVO.sortOrdr}'/>" />
<input type="hidden" name="replyLc" value="<c:out value='${searchVO.replyLc}'/>" />
</c:if>

<c:if test="${not empty param.moveSite}">
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
</c:if>
<div id="contents" class="con2">
	<h2 class="adminH2"><c:out value='${menuManageVO.menuNm }'/></h2>
	<table class="bbs_default write" border="1">
	<c:if test="${searchVO.nttId == ''}">
	<caption>글 등록</caption>
	</c:if>
	
	<c:choose>
		<c:when test="${searchVO.nttId == '' || searchVO.nttId == '0'}">
			<caption>글 등록</caption>
		</c:when>
		<c:otherwise>
			<caption>답글 등록</caption>
		</c:otherwise>
	</c:choose>
	    
	<colgroup>
			<col width="20%" />
			<col width="" />
			<col width="20%" />
			<col width="" />
	</colgroup>
	<tbody>
		<tr>
			<th scope="row"><label for="">제목</label><span title="필수입력">*</span></th>
			<td colspan="3">
				<c:choose>
					<c:when test="${searchVO.nttId == '' || searchVO.nttId == '0'}">
						<input name="nttSj" id="nttSj" type="text" value="" class="input-text full" maxlength="60" title="제목입력">
					</c:when>
					<c:otherwise>
						<input name="nttSj" id="nttSj" type="text" value="RE: <c:out value='${replyResult.nttSj}'/>" class="input-text full" maxlength="60" title="제목입력">
					</c:otherwise>
				</c:choose>
				<br/><form:errors path="nttSj" />
			</td>
		</tr>
		<c:if test="${(bdMstr.cl1Code != null && bdMstr.cl1Code != '') or (bdMstr.cl2Code != null && bdMstr.cl2Code != '')}">
			<tr>
				<c:if test="${bdMstr.cl1Code != null && bdMstr.cl1Code != ''}">
				  	<th scope="row"><label for=""><c:out value='${bdMstr.cl1CodeNm }'/></label><span title="필수입력">*</span></th>
				  	<td>
						<select id="cl1DetailCode" name="cl1DetailCode" class="board-search-select" style="width: 150px;">
							<c:forEach var="cl1result" items="${codeList}" varStatus="status">
							<option value="<c:out value='${cl1result.code }'/>" <c:if test="${cl1result.code == replyResult.cl1DetailCode }">selected</c:if>><c:out value="${cl1result.codeNm}"/> </option>
							</c:forEach>
						</select>
					</td>
					<c:if test="${empty bdMstr.cl2Code}">
						<td></td>
						<td></td>
					</c:if>
				</c:if>
				<c:choose>
					<c:when test="${bdMstr.bbsId eq 'BBSMSTR_000000000670'}">
						<th scope="row"><label for=""><c:out value='${bdMstr.cl2CodeNm }'/></label><span title="필수입력">*</span></th>
						<td>
							<select id="cl3DetailCode" name="cl3DetailCode" class="board-search-select" style="width: 150px;">
								<option value="A">학생용 </option>
								<option value="B">교사용 </option>
							</select>
						</td>
						<c:if test="${empty bdMstr.cl1Code}">
							<td></td>
							<td></td>
						</c:if>
					</c:when>
					<c:otherwise>
						<c:if test="${bdMstr.cl2Code != null && bdMstr.cl2Code != ''}">
						  	<th scope="row"><label for=""><c:out value='${bdMstr.cl2CodeNm }'/></label><span title="필수입력">*</span></th>
						  	<td>
								<select id="cl2DetailCode" name="cl2DetailCode" class="board-search-select" style="width: 150px;">
									<c:forEach var="cl2result" items="${codeList2}" varStatus="status">
									<option value="<c:out value='${cl2result.code }'/>" <c:if test="${cl2result.code == replyResult.cl1DetailCode }">selected</c:if>><c:out value="${cl2result.codeNm}"/> </option>
									</c:forEach>
								</select>
							</td>
							<c:if test="${empty bdMstr.cl1Code}">
								<td></td>
								<td></td>
							</c:if>
						</c:if>	
					</c:otherwise>
				</c:choose>
			</tr>
		</c:if>
		<c:if test="${bdMstr.etc0ClNm != null && bdMstr.etc0ClNm != ''}">
			<tr>
			  	<th scope="row"><label for=""><c:out value='${bdMstr.etc0ClNm}'/></label></th>
			  	<td colspan="3">
			  		<input name="extStr0" type="text" size="50" value="" class="input-text" maxlength="60">
			  	</td>
			</tr>
		</c:if>
		<c:if test="${bdMstr.etc1ClNm != null && bdMstr.etc1ClNm != ''}">
			<tr>
			  	<th scope="row"><label for=""><c:out value='${bdMstr.etc1ClNm}'/></label></th>
			  	<td colspan="3">
			  		<textarea id="extStr1" name="extStr1" class="textarea-board" cols="50" rows="2"></textarea>
			  	</td>
			</tr>
		</c:if>
		<c:if test="${bdMstr.etc2ClNm != null && bdMstr.etc2ClNm != ''}">
			<tr>
			  	<th scope="row"><label for=""><c:out value='${bdMstr.etc2ClNm}'/></label></th>
			  	<td colspan="3">
			  		<input name="extStr3" type="text" size="50" value="" class="input-text" maxlength="60">
			  	</td>
			</tr>
		</c:if>
		<c:if test="${bdMstr.etc3ClNm != null && bdMstr.etc3ClNm != ''}">
			<tr>
			  	<th scope="row"><label for=""><c:out value='${bdMstr.etc3ClNm}'/></label></th>
			  	<td colspan="3">
			  		<input name="extStr4" type="text" size="50" value="" class="input-text" maxlength="60">
			  	</td>
			</tr>
		</c:if>
		<tr>
			<td class="board-write-editor" colspan="4">
				<textarea id="nttCn" name="nttCn" class="textarea-board" cols="75" rows="20"></textarea>
				<form:errors path="nttCn" /> 
				<script type="text/javascript">
				CKEDITOR.replace( 'nttCn',{
				  'filebrowserUploadUrl':'/html/ckeditor/upload.jsp?'
				    +'realUrl=/ImgTemp/'
				    +'&realDir=ImgTemp'
				});
				</script>
			</td>
		</tr>
	</tbody>
	</table>	
	
	<br>
	
	<table class="bbs_default write" border="1">
		<caption>부가정보</caption>
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tbody>
			<c:if test="${param.bbsId ne 'BBSMSTR_000000000570' || param.bbsId ne 'BBSMSTR_000000000590'}">
			<tr>
				<th scope="row"><label for="">썸네일</label></th>
				<td>
					<font color="red"><strong>*</strong></font>이미지파일만 선택하셔야 정상적으로 노출됩니다.
					<br>
					<input name="thumbFile" id="thumbFileUploader" type="file" title="첨부파일입력" accept="image/*" />
					<div id="thumbFileList"></div>
				</td>
			</tr>
			<c:if test="${bdMstr.fileAtchPosblAt == 'Y' && bdMstr.posblAtchFileNumber > 0}">
				<tr>
				    <th scope="row"><label for=""><spring:message code="cop.atchFile" /></label></th>
				    <td>
						<input name="file_1" id="egovComFileUploader" type="file" title="첨부파일입력"/>
						<div id="egovComFileList"></div>
					</td>
				</tr>
		  	</c:if>
		  	</c:if>
			<tr>
			  	<th scope="row"><label for="">출처</label></th>
			  	<td>
			  		<input name="extStr5" id="extStr5" type="text" value="" class="input-text full" title="출처입력">
			  	</td>
			</tr>
			<tr>
			  	<th scope="row"><label for="">링크</label></th>
			  	<td>
			  		<input name="extStr6" id="extStr6" type="text" value="" class="input-text full" title="링크입력">
			  	</td>
			</tr>
			<tr>
			  	<th scope="row"><label for="">유해인자</label></th>
			  	<td>
			  		<input name="meterialId" id="meterialId" type="hidden" />
					<input name="meterialCas" id="meterialCas" type="hidden" />
					<input name="meterialKname" id="meterialKname" type="hidden" />
					<input name="meterialName" id="meterialName" type="text" value=""  maxlength="40" class="input-text full" readonly />
					<a href="javascript:void(0);" onclick="doMeterialPopup();" class="btn seablue">유해인자 찾기</a>
					<a href="javascript:void(0);" onclick="removeMeterialValue();" class="btn orange">유해인자 삭제</a>
			  	</td>
			</tr>
		</tbody>
	</table>
	
	<br>
	
	<table class="bbs_default write" border="1">
		<caption>저작권정보</caption>
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tbody>
			<tr>
			  	<th scope="row"><label for="">담당부서</label></th>
			  	<td>
			  		<input name="extStr7" id="extStr7" type="text" value="" class="input-text full" title="출처입력">
			  	</td>
			</tr>
			<tr>
			    <th scope="row"><label for="">개시일자</label></th>
			    <td> 
			    	<input id="ntceDate" name="ntceDate" type="hidden" value="" />
					<input name="ntceDateView" id="ntceDateView" type="text" class="search-date-picker" style="width:140px" value="" readOnly />
			    </td>
			</tr>
			<c:if test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
		  		<tr>
				    <th scope="row"><label for=""><spring:message code="cop.noticeTerm" /></label></th>
				    <td> 
				    	<input id="ntceBgnde" name="ntceBgnde" type="hidden" value="" />
						<input name="ntceBgndeView" id="ntceBgndeView" type="text" class="search-date-picker" style="width:140px" value="" readOnly />
						
						<input id="ntceEndde" name="ntceEndde" type="hidden" value="" />
						<input name="ntceEnddeView" id="ntceEnddeView" type="text" class="search-date-picker" style="width:140px" value="" readOnly />
				    </td>
				</tr>
		  	</c:if>
		  	<tr>
			    <th scope="row"><label for="">공공누리</label></th>
			    <td> 
					<input type="radio" name="publicNuriTy" value="0" checked><span>사용안함</span>&nbsp;&nbsp;
					<input type="radio" name="publicNuriTy" value="1" ><span><strong>제1유형</strong> : 출처표시</span>&nbsp;&nbsp;
					<input type="radio" name="publicNuriTy" value="2" ><span><strong>제2유형</strong>: 출처표시+상업적 이용금지</span>&nbsp;&nbsp;</br>
			    	<input type="radio" name="publicNuriTy" value="3" ><span><strong>제3유형</strong>: 출처표시+변경금지</span>&nbsp;&nbsp;
			    	<input type="radio" name="publicNuriTy" value="4" ><span><strong>제4유형</strong>: 출처표시+상업적 이용금지+변경금지</span>
			    </td>
			</tr>
		</tbody>
	</table>
	
	<br>
	
	<table class="bbs_default write" border="1">
		<caption>검색엔진용 데이터</caption>
		<colgroup>
			<col width="20%" />
			<col width="80%" />
		</colgroup>
		<tbody>
			<tr>
			  	<th scope="row"><label for="">Meta Descript</label></th>
			  	<td>
			  		<input name="extStr8" id="extStr8" type="text" value="" class="input-text full" title="출처입력">
			  	</td>
			</tr>
			<tr>
			  	<th scope="row"><label for="">Meta Keyword</label></th>
			  	<td>
			  		<input name="extStr9" id="extStr9" type="text" value="" class="input-text full" title="링크입력">
			  	</td>
			</tr>
		</tbody>
	</table>
	
	<div class="conR">
		<div class="t_center">
			<a href="javascript:fn_egov_select_noticeList();" class="btn gray">목록</a>
			<c:if test="${bdMstr.authFlag == 'Y'}">
			<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
			<a href="#" id="btn_preview" class="btn orange">미리보기</a>
			<a href="javascript:fn_egov_regist_notice();" class="btn seablue">등록</a>
			</c:if>
			</c:if>
		</div>
		<dl class="conRList">
			<dt>기본정보</dt>
			<dd>
				<dl>
					<dt>작성자</dt>
					<dd>
						<input type="text" name="ntcrNmA" id="ntcrNmA"  class="input-text" value="${sessionNm }"/>
					</dd>
					<dt>사용여부</dt>
					<dd>
						<input type="radio" name="confmSttus" value="C" <c:if test="${bdMstr.confmUseYn eq 'N'}"> checked="checked"</c:if>><span>승인</span>&nbsp;
						<input type="radio" name="confmSttus" value="R" <c:if test="${bdMstr.confmUseYn eq 'Y'}"> checked="checked"</c:if>><span>승인대기</span>
					</dd>
					<dt>공지여부</dt>
					<dd>
						<input type="radio" name="noticeAt" value="0" checked><span>일반 게시물 </span>&nbsp;
						<input type="radio" name="noticeAt" value="1" ><span>공지 게시물</span>
					</dd>
				</dl>
			</dd>
			<dt>키워드</dt>
			<dd>
				<input name="keywordTag" id="keywordTag" type="text" value="" class="input-text full" maxlength="200" title="키워드입력">
				<font color="red"><strong>*</strong></font>#으로 구분해서 검색어를 넣어주세요
			</dd>
		</dl>
	</div>

</div><!-- //contents -->
</form:form>
