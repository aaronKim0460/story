<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>

<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
_editor_area = "nttCn";
</script>

<script type="text/javascript">

	function fn_egov_validateForm(obj) {
		return true;
	}

	function fn_egov_regist_notice() {
		//document.board.onsubmit();
  
    	document.board.nttCn.value = CKEDITOR.instances.nttCn.getData();
  
		var ntceBgnde = eval(document.getElementById("ntceBgnde").value);
		var ntceEndde = eval(document.getElementById("ntceEndde").value);
		
		if(ntceBgnde > ntceEndde){
			alert("게시기간 종료일이 시작일보다 빠릅니다.");
			return;
		}

		//if(document.board.bbsTyCode.value != "BBST06"){
			if (!validateBoard(document.board)){
				return;
			}
		//}
		
		if(document.board.bbsTyCode.value == "BBST05"){
			document.board.extStr9.value = document.getElementById("selBbsNttSe").options[document.getElementById("selBbsNttSe").selectedIndex].value;
		}
		
		//document.board.ntcrNm.value = document.getElementById("ntcrNmA").value;
		
		//ntceDate 
		//document.board.ntceDate.value = document.getElementById("ntceDate").value;
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			//document.board.onsubmit();
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
			
			window.open("/user/cop/bbs/linkBbsListPop.do?"+param, "bbs_preview", "scrollbars=yes, width=600, height=650");
			
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
			previewForm.attr("action", "<c:url value='/user/cop/bbs/bbsPreview.do'/>");
			previewForm.attr("method", "post");
			previewForm.attr("target", "previewForm");
			previewForm.submit();
			
		});
		
		
	});
	
</script>


<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" id="bbsId" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
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
<input id="ntceDate" name="ntceDate" type="hidden" value='<c:out value="${result.ntceDateH}" />' />

<input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
<input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">

<input id="noticeAt" name="noticeAt" type="hidden" value="0">

<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />

<div id="contents">
	
	<table class="bbs_default view" summary="상세보기로, 제목, 작성자, 내용, 첨부파일 등 정보제공" border="0">
	<caption>글 등록</caption>
	<colgroup>
			<col width="20%" />
			<col width="80%" />
	</colgroup>
	<tbody>
		<tr>
			<th scope="row"><label for="">제목</label><span title="필수입력">*</span></th>
			<td>
				<input name="nttSj" id="nttSj" type="text" value='<c:out value="${result.nttSj}" />' class="input-text full" maxlength="60" title="제목입력">
				<br/><form:errors path="nttSj" />
			</td>
		</tr>
		
		<c:if test="${bdMstr.cl1Code != null && bdMstr.cl1Code != ''}">
			<tr>
				<th scope="row"><label for=""><c:out value='${bdMstr.cl1CodeNm }'/></label><span title="필수입력">*</span></th>
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
				<th scope="row"><label for=""><c:out value='${bdMstr.cl2CodeNm }'/></label><span title="필수입력">*</span></th>
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
			<th scope="row"><label for="">작성자</label><span title="필수입력">*</span></th>
			<td>
				<input type="text" name="ntcrNm" id="ntcrNm"  class="input-text" value="<c:out value='${result.ntcrNm }'/>"/>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for=""><spring:message code="cop.password" /></label><span title="필수입력">*</span></th>
			<td>
				<input name="password" type="password" value="" maxlength="20"  class="input-text" title="비밀번호입력">
				<br/><form:errors path="password" />
			</td>
		</tr>
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
	</tbody>
	</table>
	
	<div class="t_center mt20">
		<a href="javascript:fn_egov_select_noticeList();" class="btn gray">목록</a>
		<a href="javascript:fn_egov_regist_notice();" class="btn seablue">등록</a>
	</div>

</div><!-- //contents -->
</form:form>