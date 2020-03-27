<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp" %>
</c:if>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
	//alert("KorNoticeUpdt");
	
	function fn_egov_validateForm(obj){
		return true;
	}

	function fn_egov_regist_notice(){
//		document.board.onsubmit();

    	document.board.nttCn.value = CKEDITOR.instances.nttCn.getData();

		var ntceBgnde = eval(document.getElementById("ntceBgnde").value);
		var ntceEndde = eval(document.getElementById("ntceEndde").value);


		if(ntceBgnde > ntceEndde){
			alert("게시기간 종료일이 시작일보다 빠릅니다.");
			return;
		}

		document.getElementById("ntcrNm").value = document.getElementById("ntcrNmA").value;
		
		if (!validateBoard(document.board)){
			return;
		}
		
		
		if (confirm('<spring:message code="common.update.msg" />')) {
			
			$("#extStr9").val($("#selBbsNttSe").val());
			
			document.board.action = "<c:url value='/user/cop/bbs${prefix}/updateBoardArticle.do'/>";
			document.board.submit();
		}
	}

	function fn_egov_select_noticeList() {
		document.board.action = "<c:url value='/user/cop/bbs${prefix}/selectBoardList.do'/>";
		document.board.submit();
	}

	function fn_egov_check_file(flag) {
		if (flag=="Y") {
			document.getElementById('file_upload_posbl').style.display = "block";
			document.getElementById('file_upload_imposbl').style.display = "none";
		} else {
			document.getElementById('file_upload_posbl').style.display = "none";
			document.getElementById('file_upload_imposbl').style.display = "block";
		}
	}
	function makeFileAttachment(){
		
	<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
	
		var existFileNum = document.board.fileListCnt.value;
		var maxFileNum = document.board.posblAtchFileNumber.value;
	
		if (existFileNum=="undefined" || existFileNum ==null) {
			existFileNum = 0;
		}
		if (maxFileNum=="undefined" || maxFileNum ==null) {
			maxFileNum = 0;
		}
		var uploadableFileNum = maxFileNum - existFileNum;
		if (uploadableFileNum<0) {
			uploadableFileNum = 0;
		}
		if (uploadableFileNum != 0) {
			fn_egov_check_file('Y');
			var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
			multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
		} else {
			fn_egov_check_file('N');
		}
	</c:if>	
	
		$("input[name=nttSj]").focus();
	}
	
	
	<c:if test="${userAuthority == 'ROLE_ADMIN' }">
	
		$(document).on("click", "#contentHistory", function(){
			
			var bbsId = $("input[name=bbsId]").val();
			var nttId = $("input[name=nttId]").val();
			
			if(bbsId == null || bbsId == "" || nttId == null || nttId == ""){
				alert("게시물 정보를 확인할 수 없습니다.");
				return;
			}
			
			var param = "bbsId="+bbsId;
			param += "&nttId="+nttId;
			
			window.open("/user/cop/bbs/contentBBSHistoryPop.do?"+param, "content_history", "scrollbars=yes, width=1000, height=800");
			
		});
		
	</c:if>	
	
	$(document).ready(function(){
		makeFileAttachment();
		
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
			previewForm.attr("action", "<c:url value='/user/cop/bbs/bbsPreview.do'/>");
			previewForm.attr("method", "post");
			previewForm.attr("target", "previewForm");
			previewForm.submit();
			
		});
	});
	
</script>

<!-- body onload="javascript:editor_generate('nttCn');"-->

<form id="preview_form" name="preview_form" enctype="multipart/form-data">
	<input type="hidden" id="p_nttCn" name="p_nttCn" />
</form>

<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >

<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="returnUrl" value="<c:url value='/user/cop/bbs/forUpdateBoardArticle.do'/>"/>
<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
<input type="hidden" id="extStr9" name="extStr9" />

<c:if test="${anonymous != 'true'}">
<input type="hidden" id="ntcrNm" name="ntcrNm" value="<c:out value='${result.ntcrNm }'/>">	<!-- validator 처리를 위해 지정 -->
<input type="hidden" name="password" value="dummy">	<!-- validator 처리를 위해 지정 -->
</c:if>

<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'  || (bdMstr.bbsAttrbCode == 'BBSA01' && bdMstr.codeNm == 'ENG')}">
<input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
<input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
</c:if>

<c:if test="${not empty param.moveSite}">
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
</c:if>

<div id="contents">

	<table class="bbs_default write" border="1">
	<caption>글 등록</caption>
		<colgroup>
		    <col style="width:20%" />
		    <col style="width:80%" />
		</colgroup>
		<tbody>	
			<tr>
				<th scope="row"><label for="">제목</label><span title="필수입력">*</span></th>
				<td>
					<input name="nttSj" type="text" class="input-text full" value='<c:out value="${result.nttSj}" />'  maxlength="60" title="제목수정">
					<br/><form:errors path="nttSj" />
				</td>
			</tr>
			
			<c:if test="${bdMstr.cl1Code != null && bdMstr.cl1Code != ''}">
			<tr>
				<th scope="row"><label for="">구분1</label><span title="필수입력">*</span></th>
				<td>
					<select id="cl1DetailCode" name="cl1DetailCode" class="board-search-select" style="width: 150px;">
						<c:forEach var="cl1result" items="${codeList}" varStatus="status">
						<option value="<c:out value='${cl1result.code }'/>" <c:if test="${cl1result.code == result.cl1DetailCode }">selected</c:if>><c:out value="${cl1result.codeNm}"/> </option>
						</c:forEach>
					</select>
				</td>
			</tr>
			</c:if>
			<c:if test="${bdMstr.cl2Code != null && bdMstr.cl2Code != ''}">
			<tr>
				<th scope="row"><label for="">구분2</label><span title="필수입력">*</span></th>
				<td>
					<select id="cl2DetailCode" name="cl2DetailCode" class="board-search-select" style="width: 150px;">
						<c:forEach var="cl2result" items="${codeList2}" varStatus="status">
						<option value="<c:out value='${cl2result.code }'/>" <c:if test="${cl2result.code == result.cl2DetailCode }">selected</c:if>><c:out value="${cl2result.codeNm}"/> </option>
						</c:forEach>
					</select>
				</td>
			</tr>
			</c:if>	
			<c:if test="${bdMstr.etc0ClNm != null && bdMstr.etc0ClNm != ''}">
			<tr>
				<th scope="row"><label for=""><c:out value='${bdMstr.etc0ClNm}'/></label></th>
				<td>
					<input name="extStr0" type="text" size="50" value="<c:out value='${result.extStr0 }'/>" class="input-text" maxlength="60">
				</td>
			</tr>
			</c:if>
			<c:if test="${bdMstr.etc1ClNm != null && bdMstr.etc1ClNm != ''}">
			<tr>
				<th scope="row"><label for=""><c:out value='${bdMstr.etc1ClNm}'/></label></th>
				<td>
					<input name="extStr1" type="text" size="50" value="<c:out value='${result.extStr1 }'/>" class="input-text" maxlength="60">
				</td>
			</tr>
			</c:if>
			<c:if test="${bdMstr.etc2ClNm != null && bdMstr.etc2ClNm != ''}">
			<tr>
				<th scope="row"><label for=""><c:out value='${bdMstr.etc2ClNm}'/></label></th>
				<td>
					<input name="extStr2" type="text" size="50" value="<c:out value='${result.extStr2 }'/>" class="input-text" maxlength="60">
				</td>
			</tr>
			</c:if>
			<c:if test="${bdMstr.etc3ClNm != null && bdMstr.etc3ClNm != ''}">
			<tr>
				<th scope="row"><label for=""><c:out value='${bdMstr.etc3ClNm}'/></label></th>
				<td>
					<input name="extStr3" type="text" size="50" value="<c:out value='${result.extStr3 }'/>" class="input-text" maxlength="60">
				</td>
			</tr>
			</c:if>
			
			<tr>
				<th scope="row"><label for="">공지 여부</label></th>
				<td>
					<input type="radio" name="noticeAt" value="0" <c:if test="${result.noticeAt == '0' }">checked</c:if>><span>일반 게시물 </span>&nbsp;
					<input type="radio" name="noticeAt" value="1" <c:if test="${result.noticeAt == '1'}">checked</c:if>><span>공지 게시물</span>
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="">작성자</label></th>
				<td>
					<input name="ntcrNmA" id="ntcrNmA"  type="text" class="input-text" value="<c:out value='${result.ntcrNm }'/>"  maxlength="60" title="제목입력">
				</td>
			</tr>
			<tr>
			    <th scope="row"><label for="">공공누리</label></th>
			    <td>
			    	<input type="radio" name="publicNuriTy" value="0" <c:if test="${result.publicNuriTy == '0' }">checked</c:if>><span><strong>사용안함</strong></span>&nbsp;&nbsp;
					<input type="radio" name="publicNuriTy" value="1" <c:if test="${result.publicNuriTy == '1' }">checked</c:if>><span><strong>제1유형</strong> : 출처표시</span>&nbsp;&nbsp;
					<input type="radio" name="publicNuriTy" value="2" <c:if test="${result.publicNuriTy == '2' }">checked</c:if>><span><strong>제2유형</strong>: 출처표시+상업적 이용금지</span>&nbsp;&nbsp;</br>
			    	<input type="radio" name="publicNuriTy" value="3" <c:if test="${result.publicNuriTy == '3' }">checked</c:if>><span><strong>제3유형</strong>: 출처표시+변경금지</span>&nbsp;&nbsp;
			    	<input type="radio" name="publicNuriTy" value="4" <c:if test="${result.publicNuriTy == '4' }">checked</c:if>><span><strong>제4유형</strong>: 출처표시+상업적 이용금지+변경금지</span>
			    </td>
			</tr>
			<tr>
			    <th scope="row"><label for="">개시일자</label></th>
			    <td> 
			    	<input id="ntceDate" name="ntceDate" type="hidden" value='<c:out value="${result.ntceDateH}" />' />
			    	<input name="ntceDateView" id="ntceDateView" type="text" class="search-date-picker" style="width:140px" value="<c:out value='${result.ntceDate}'/>" readOnly />
			    </td>
			</tr>
			
			<c:if test="${bdMstr.bbsAttrbCode == 'BBSA01' && bdMstr.codeNm != 'ENG'}">
			<tr>
				<th scope="row"><label for=""><spring:message code="cop.noticeTerm" /></label></th>
				<td>
					<input id="ntceBgnde" name="ntceBgnde" type="hidden" size="15" class="input-text" value='<c:out value="${result.ntceBgnde}" />' />
					<input name="ntceBgndeView" type="text" class="input-text" value="<c:out value='${fn:substring(result.ntceBgnde, 0, 4)}'/>-<c:out value='${fn:substring(result.ntceBgnde, 4, 6)}'/>-<c:out value='${fn:substring(result.ntceBgnde, 6, 8)}'/>"  readOnly title="게시시작일자수정"
					onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);" />
					<img src="<c:url value='/images/common/icon_calendar.png' />"
					onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);"
					width="15" height="15" alt="달력창팝업버튼이미지">
					 ~
					<input id="ntceEndde" name="ntceEndde" type="hidden"  value='<c:out value="${result.ntceEndde}" />'>
					<input name="ntceEnddeView" type="text" size="15" class="input-text" value="<c:out value='${fn:substring(result.ntceEndde, 0, 4)}'/>-<c:out value='${fn:substring(result.ntceEndde, 4, 6)}'/>-<c:out value='${fn:substring(result.ntceEndde, 6, 8)}'/>"  readOnly title="게시종료일자수정"
					onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView);"  />
					<img src="<c:url value='/images/common/icon_calendar.png' />"
					onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView);"
					width="15" height="15" alt="달력창팝업버튼이미지">
					<br/><form:errors path="ntceBgndeView" />
					<br/><form:errors path="ntceEnddeView" />
				</td>
			</tr>
			</c:if>
					
			<c:if test="${not empty result.atchFileId}">
			<tr>
				<th scope="row"><label for="">첨부파일목록</label></th>
				<td>
					<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
					<c:param name="param_atchFileId" value="${result.atchFileId}" />
					</c:import>
				</td>
			</tr>
			</c:if> 
			
			<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
			<c:if test="${fn:length(result.atchFileId) == 0}">
				<input type="hidden" name="fileListCnt" value="0" />
			</c:if>
			<tr>
				<th scope="row"><label for=""><spring:message code="cop.atchFile" /></label></th>
				<td>
				<div id="file_upload_posbl"  style="display:none;" >
					<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
					    <tr>
					        <td><input name="file_1" id="egovComFileUploader" type="file" title="첨부파일명 입력"/></td>
					    </tr>
					    <tr>
					        <td>
					        	<div id="egovComFileList"></div>
					        </td>
					    </tr>
		   	        </table>
				</div>
				<div id="file_upload_imposbl"  style="display:none;" >
		            <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
					    <tr>
					        <td><spring:message code="common.imposbl.fileupload" /></td>
					    </tr>
	       			</table>
				</div>
				</td>
			</tr>
			</c:if>
			
			<c:if test="${userAuthority == 'ROLE_ADMIN' }">
				<tr>
					<th scope="row"><label for="">컨텐츠 이력관리</label></th>
					<td>
						<a id="contentHistory" name = "contentHistory" class="btn btn-default">컨텐츠 이력관리</a>
					</td>
				</tr>
			</c:if>
			
			<tr>
				<td class="board-write-editor" colspan="2">
					<textarea id="nttCn" name="nttCn" class="textarea-board" cols="75" rows="25"><c:out value="${result.nttCn}" escapeXml="false" /></textarea>
					<script type="text/javascript">
					CKEDITOR.replace( 'nttCn',{
						allowedContent: true,
					   'filebrowserUploadUrl':'/html/ckeditor/upload.jsp?'
					    +'realUrl=http://www.nier.go.kr/ImgTemp/'
					    +'&realDir=ImgTemp'
					});
				    </script>
					<form:errors path="nttCn" />
				</td>
			</tr>
			
			<c:if test="${anonymous == 'true'}">
			<tr>
				<th scope="row"><label for=""><spring:message code="cop.ntcrNm" /></label></th>
				<td>
					<input name="ntcrNm" type="text" size="20" value='<c:out value="${result.ntcrNm}" />'  maxlength="10" title="작성자이름">
				</td>
			</tr>
			<tr>
				<th scope="row"><label for=""><spring:message code="cop.password" /></label></th>
				<td>
					<input name="password" type="password" size="20" value="" maxlength="20" title="비밀번호입력">
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>

	<div class="t_center mt20">
		<c:if test="${bdMstr.authFlag == 'Y'}">
		<a href="javascript:fn_egov_select_noticeList();" class="btn gray">목록</a>
		<c:if test="${sessionUniqId != null || sessionUniqId != ''}">
		<a href="#" id="btn_preview" class="btn orange">미리보기</a>
		<a href="javascript:fn_egov_regist_notice();" class="btn seablue">저장</a>
		</c:if>
		</c:if>
	</div>
</div><!-- //contents -->
	
</form:form>
