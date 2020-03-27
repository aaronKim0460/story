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
			document.board.action = "<c:url value='/user/cop/bbs${prefix}/anonymous/insertBoardArticle.do'/>";
			document.board.submit();
		} 
	}

	function fn_egov_select_noticeList() {
		document.board.action = "<c:url value='/user/cop/bbs${prefix}/selectBoardList.do'/>";
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
				<input name="nttSj" id="nttSj" type="text" value="" class="input-text full" maxlength="60" title="제목입력">
				<br/><form:errors path="nttSj" />
			</td>
		</tr>
		
		<c:if test="${bdMstr.cl1Code != null && bdMstr.cl1Code != ''}">
		<tr>
		  	<th scope="row"><label for=""><c:out value='${bdMstr.cl1CodeNm }'/></label><span title="필수입력">*</span></th>
		  	<td>
				<select id="cl1DetailCode" name="cl1DetailCode" class="board-search-select" style="width: 150px;">
					<c:forEach var="cl1result" items="${codeList}" varStatus="status">
					<option value="<c:out value='${cl1result.code }'/>"><c:out value="${cl1result.codeNm}"/> </option>
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
					<option value="<c:out value='${cl2result.code }'/>"><c:out value="${cl2result.codeNm}"/> </option>
					</c:forEach>
				</select>
			</td>
		</tr>
		</c:if>	
		<c:if test="${bdMstr.etc0ClNm != null && bdMstr.etc0ClNm != ''}">
		<tr>
		  	<th scope="row"><label for=""><c:out value='${bdMstr.etc0ClNm}'/></label></th>
		  	<td>
		  		<input name="extStr0" type="text" size="50" value="" class="input-text" maxlength="60">
		  	</td>
		</tr>
		</c:if>
		<c:if test="${bdMstr.etc1ClNm != null && bdMstr.etc1ClNm != ''}">
		<tr>
		  	<th scope="row"><label for=""><c:out value='${bdMstr.etc1ClNm}'/></label></th>
		  	<td>
		  		<input name="extStr1" type="text" size="50" value="" class="input-text" maxlength="60">
		  	</td>
		</tr>
		</c:if>
		<c:if test="${bdMstr.etc2ClNm != null && bdMstr.etc2ClNm != ''}">
		<tr>
		  	<th scope="row"><label for=""><c:out value='${bdMstr.etc2ClNm}'/></label></th>
		  	<td>
		  		<input name="extStr3" type="text" size="50" value="" class="input-text" maxlength="60">
		  	</td>
		</tr>
		</c:if>
		<c:if test="${bdMstr.etc3ClNm != null && bdMstr.etc3ClNm != ''}">
		<tr>
		  	<th scope="row"><label for=""><c:out value='${bdMstr.etc3ClNm}'/></label></th>
		  	<td>
		  		<input name="extStr4" type="text" size="50" value="" class="input-text" maxlength="60">
		  	</td>
		</tr>
		</c:if>
		
		<tr>
			<th scope="row"><label for="">작성자</label><span title="필수입력">*</span></th>
			<td>
				<input type="text" name="ntcrNm" id="ntcrNm"  class="input-text" value="${sessionNm }"/>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for=""><spring:message code="cop.password" /></label><span title="필수입력">*</span></th>
			<td>
				<input name="password" type="password" value="" maxlength="20"  class="input-text" title="비밀번호입력">
				<br/><form:errors path="password" />
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
	  	
	  	<tr>
			<td class="board-write-editor" colspan="2">
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
	
	<div class="t_center mt20">
		<a href="javascript:fn_egov_select_noticeList();" class="btn gray">목록</a>
		<a href="javascript:fn_egov_regist_notice();" class="btn seablue">등록</a>
	</div>

</div><!-- //contents -->
</form:form>