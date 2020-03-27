<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
	
	function fn_egov_validateForm(obj){
		return true;
	}

	function fn_egov_regist_notice(){

    	document.board.nttCn.value = CKEDITOR.instances.nttCn.getData();

    	<c:if test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
    	var ntceBgnde = eval(document.getElementById("ntceBgnde").value);
		var ntceEndde = eval(document.getElementById("ntceEndde").value);

		if(ntceBgnde > ntceEndde){
			alert("게시기간 종료일이 시작일보다 빠릅니다.");
			return;
		}
		</c:if>
		
		document.getElementById("ntcrNm").value = document.getElementById("ntcrNmA").value;
		
		if (!validateBoard(document.board)){
			return;
		}
		
		
		if (confirm('<spring:message code="common.update.msg" />')) {
			
			document.board.action = "<c:url value='/cop/bbs${prefix}/updateBoardArticle.do'/>";
			document.board.submit();
		}
	}

	function fn_egov_select_noticeList() {
		document.board.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
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
	
	<c:if test="${empty result.thumbFileId}">
		var multi_selector_thumb = new MultiSelector( document.getElementById( 'thumbFileList' ), 1 );
		multi_selector_thumb.addThumbElement( document.getElementById( 'thumbFileUploader' ) );
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
			
			window.open("/cop/bbs/contentBBSHistoryPop.do?"+param, "content_history", "scrollbars=yes, width=1000, height=800");
			
		});
		
	</c:if>
	
	// 유해인자 목록 팝업
	doMeterialPopup = function() {
		var retVal;
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
	});
	
</script>

<!-- body onload="javascript:editor_generate('nttCn');"-->

<form id="preview_form" name="preview_form" enctype="multipart/form-data">
	<input type="hidden" id="p_nttCn" name="p_nttCn" />
</form>

<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >

<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="returnUrl" value="<c:url value='/cop/bbs/forUpdateBoardArticle.do'/>"/>
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

<input type="hidden" name="searchCl1DetailCode" id="searchCl1DetailCode" value="<c:out value='${searchVO.searchCl1DetailCode}'/>" />

<c:if test="${anonymous != 'true'}">
<input type="hidden" id="ntcrNm" name="ntcrNm" value="<c:out value='${result.ntcrNm }'/>">	<!-- validator 처리를 위해 지정 -->
<input type="hidden" name="password" value="dummy">	<!-- validator 처리를 위해 지정 -->
</c:if>

<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
<input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
<input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
</c:if>

<c:if test="${not empty param.moveSite}">
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
</c:if>

<div id="contents" class="con2">
	<h2 class="adminH2"><c:out value='${menuManageVO.menuNm }'/></h2>
	<table class="bbs_default write" border="1">
	<caption>글 수정</caption>
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
					<input name="nttSj" type="text" class="input-text full" value='<c:out value="${result.nttSj}" />'  maxlength="60" title="제목수정">
					<br/><form:errors path="nttSj" />
				</td>
			</tr>
			<c:if test="${bdMstr.cl1Code != null && bdMstr.cl1Code != ''}">
				<tr>
					<c:if test="${bdMstr.cl1Code != null && bdMstr.cl1Code != ''}">
						<th scope="row"><label for=""><c:out value='${bdMstr.cl1CodeNm }'/></label><span title="필수입력">*</span></th>
						<td>
							<select id="cl1DetailCode" name="cl1DetailCode" class="board-search-select" style="width: 150px;">
								<c:forEach var="cl1result" items="${codeList}" varStatus="status">
								<option value="<c:out value='${cl1result.code }'/>" <c:if test="${cl1result.code == result.cl1DetailCode }">selected</c:if>><c:out value="${cl1result.codeNm}"/> </option>
								</c:forEach>
							</select>
						</td>
						<c:if test="${empty bdMstr.cl2Code}">
							<td></td>
							<td></td>
						</c:if>
					</c:if>
					<c:choose>
						<c:when test="${result.bbsId eq 'BBSMSTR_000000000670'}">
							<c:if test="${result.cl3DetailCode != null && result.cl3DetailCode != ''}">
								<th scope="row"><label for=""><c:out value='${bdMstr.cl2CodeNm }'/></label><span title="필수입력">*</span></th>
								<td>
									<select id="cl3DetailCode" name="cl3DetailCode" class="board-search-select" style="width: 150px;">
										<option value="<c:out value='A'/>" <c:if test="${result.cl3DetailCode eq 'A'}">selected</c:if>>학생용 </option>
										<option value="<c:out value='B'/>" <c:if test="${result.cl3DetailCode eq 'B'}">selected</c:if>>교사용 </option>
									</select>
								</td>
								<c:if test="${empty bdMstr.cl1Code}">
									<td></td>
									<td></td>
								</c:if>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${bdMstr.cl2Code != null && bdMstr.cl2Code != ''}">
								<th scope="row"><label for=""><c:out value='${bdMstr.cl2CodeNm }'/></label><span title="필수입력">*</span></th>
								<td>
									<select id="cl2DetailCode" name="cl2DetailCode" class="board-search-select" style="width: 150px;">
										<c:forEach var="cl2result" items="${codeList2}" varStatus="status">
										<option value="<c:out value='${cl2result.code }'/>" <c:if test="${cl2result.code == result.cl2DetailCode }">selected</c:if>><c:out value="${cl2result.codeNm}"/> </option>
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
						<input name="extStr0" type="text" size="50" value="<c:out value='${result.extStr0 }'/>" class="input-text" maxlength="60">
					</td>
				</tr>
			</c:if>
			<c:if test="${bdMstr.etc1ClNm != null && bdMstr.etc1ClNm != ''}">
				<tr>
					<th scope="row"><label for=""><c:out value='${bdMstr.etc1ClNm}'/></label></th>
					<td colspan="3">
						<textarea id="extStr1" name="extStr1" class="textarea-board" cols="50" rows="2"><c:out value="${result.extStr1}" escapeXml="false" /></textarea>
					</td>
				</tr>
			</c:if>
			<c:if test="${bdMstr.etc2ClNm != null && bdMstr.etc2ClNm != ''}">
				<tr>
					<th scope="row"><label for=""><c:out value='${bdMstr.etc2ClNm}'/></label></th>
					<td colspan="3">
						<input name="extStr2" type="text" size="50" value="<c:out value='${result.extStr2 }'/>" class="input-text" maxlength="60">
					</td>
				</tr>
			</c:if>
			<c:if test="${bdMstr.etc3ClNm != null && bdMstr.etc3ClNm != ''}">
				<tr>
					<th scope="row"><label for=""><c:out value='${bdMstr.etc3ClNm}'/></label></th>
					<td colspan="3">
						<input name="extStr3" type="text" size="50" value="<c:out value='${result.extStr3 }'/>" class="input-text" maxlength="60">
					</td>
				</tr>
			</c:if>
			<tr>
				<td class="board-write-editor" colspan="4">
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
			<c:if test="${userAuthority == 'ROLE_ADMIN' }">
				<tr>
					<th scope="row"><label for="">컨텐츠 이력관리</label></th>
					<td colspan="3">
						<a id="contentHistory" name = "contentHistory" class="btn btn-default">컨텐츠 이력관리</a>
					</td>
				</tr>
			</c:if>
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
				<c:choose>
					<c:when test="${not empty result.thumbFileId}">
						<tr>
							<th scope="row"><label for="">썸네일파일 목록</label></th>
							<td>
								<c:import url="/cop/bbs/selectFileInfsForUpdate.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.thumbFileId}" />
								<c:param name="param_thumbYn" value="Y" />
								</c:import>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th scope="row"><label for="">썸네일</label></th>
							<td>
								<font color="red"><strong>*</strong></font>이미지파일만 선택하셔야 정상적으로 노출됩니다.
								<br>
								<input name="thumbFile" id="thumbFileUploader" type="file" title="첨부파일입력" accept="image/*" />
								<div id="thumbFileList"></div>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				<c:if test="${not empty result.atchFileId}">
					<tr>
						<th scope="row"><label for="">첨부파일목록</label></th>
						<td>
							<c:import url="/cop/bbs/selectFileInfsForUpdate.do" charEncoding="utf-8">
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
			</c:if>
			<tr>
			  	<th scope="row"><label for="">출처</label></th>
			  	<td>
			  		<input name="extStr5" id="extStr5" type="text" value="<c:out value="${result.extStr5}" />" class="input-text full" title="출처입력">
			  	</td>
			</tr>
			<tr>
			  	<th scope="row"><label for="">링크</label></th>
			  	<td>
			  		<input name="extStr6" id="extStr6" type="text" value="<c:out value="${result.extStr6}" />" class="input-text full" title="링크입력">
			  	</td>
			</tr>
			<tr>
			  	<th scope="row"><label for="">유해인자</label></th>
			  	<td>
			  		<input name="meterialId" id="meterialId" type="hidden" value="<c:out value="${result.meterialId}" />" />
			  		<input name="meterialCas" id="meterialCas" type="hidden" value="<c:out value="${result.meterialCas}" />"/>
			  		<input name="meterialKname" id="meterialKname" type="hidden" value="<c:out value="${result.meterialKname}" />"/>
					<input name="meterialName" id="meterialName" type="text" value="<c:out value="${result.meterialName}" />"  maxlength="40" class="input-text full" readonly />
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
			  		<input name="extStr7" id="extStr7" type="text" value="<c:out value="${result.extStr7}" />" class="input-text full" title="출처입력">
			  	</td>
			</tr>
			<tr>
			    <th scope="row"><label for="">개시일자</label></th>
			    <td> 
			    	<input id="ntceDate" name="ntceDate" type="hidden" value='<c:out value="${result.ntceDateH}" />' />
			    	<input name="ntceDateView" id="ntceDateView" type="text" class="search-date-picker" style="width:140px" value="<c:out value='${result.ntceDate}'/>" readOnly />
			    </td>
			</tr>
			<c:if test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
		  		<tr>
				    <th scope="row"><label for=""><spring:message code="cop.noticeTerm" /></label></th>
				    <td> 
				    	<input id="ntceBgnde" name="ntceBgnde" type="text" value="<c:out value='${fn:replace(fn:substring(result.ntceBgnde,0,10),"-","")}'/>" />
						<input name="ntceBgndeView" id="ntceBgndeView" type="text" class="search-date-picker" style="width:140px" value="<c:out value='${fn:substring(result.ntceBgnde,0,10)}'/>" readOnly />
						
						<input id="ntceEndde" name="ntceEndde" type="text" value="<c:out value='${fn:replace(fn:substring(result.ntceEndde,0,10),"-","")}'/>" />
						<input name="ntceEnddeView" id="ntceEnddeView" type="text" class="search-date-picker" style="width:140px" value="<c:out value='${fn:substring(result.ntceEndde,0,10)}'/>" readOnly />
				    </td>
				</tr>
		  	</c:if>
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
			  		<input name="extStr8" id="extStr8" type="text" value="<c:out value="${result.extStr8}" />" class="input-text full" title="출처입력">
			  	</td>
			</tr>
			<tr>
			  	<th scope="row"><label for="">Meta Keyword</label></th>
			  	<td>
			  		<input name="extStr9" id="extStr9" type="text" value="<c:out value="${result.extStr9}" />" class="input-text full" title="링크입력">
			  	</td>
			</tr>
		</tbody>
	</table>
	
	<div class="conR">
		<div class="t_center">
			<c:if test="${bdMstr.authFlag == 'Y'}">
			<a href="javascript:fn_egov_select_noticeList();" class="btn gray">목록</a>
			<c:if test="${sessionUniqId != null || sessionUniqId != ''}">
			<a href="#" id="btn_preview" class="btn orange">미리보기</a>
			<a href="javascript:fn_egov_regist_notice();" class="btn seablue">저장</a>
			</c:if>
			</c:if>
		</div>
		<dl class="conRList">
			<dt>기본정보</dt>
			<dd>
				<dl>
					<dt>작성자</dt>
					<dd>
						<input name="ntcrNmA" id="ntcrNmA"  type="text" class="input-text" value="<c:out value='${result.ntcrNm }'/>"  maxlength="60" title="제목입력">
					</dd>
					<dt>등록일</dt>
					<dd><c:out value="${result.ntceDate}" /></dd>
					<dt>사용여부</dt>
					<dd>
						<input type="radio" name="confmSttus" value="C" <c:if test="${result.confmSttus eq 'C'}"> checked="checked"</c:if>><span>승인</span>&nbsp;
						<input type="radio" name="confmSttus" value="R" <c:if test="${result.confmSttus eq 'R'}"> checked="checked"</c:if>><span>승인대기</span>
					</dd>
					<dt>공지여부</dt>
					<dd>
						<input type="radio" name="noticeAt" value="0" <c:if test="${result.noticeAt eq '0'}"> checked="checked"</c:if>><span>일반 게시물 </span>&nbsp;
						<input type="radio" name="noticeAt" value="1" <c:if test="${result.noticeAt eq '1'}"> checked="checked"</c:if>><span>공지 게시물</span>
					</dd>
				</dl>
			</dd>
			<dt>키워드</dt>
			<dd>
				<input name="keywordTag" id="keywordTag" type="text" value="<c:out value="${result.keywordTag}" />" class="input-text full" maxlength="200" title="키워드입력">
				<font color="red"><strong>*</strong></font>#으로 구분해서 검색어를 넣어주세요
			</dd>
			<dt>조회수</dt>
			<dd>
				<input name="rdcnt" id="rdcnt"  type="text" class="input-text" value="<c:out value="${result.inqireCo}" />"  maxlength="60" title="조회수입력">
			</dd>
		</dl>
	</div>
</div><!-- //contents -->
	
</form:form>
