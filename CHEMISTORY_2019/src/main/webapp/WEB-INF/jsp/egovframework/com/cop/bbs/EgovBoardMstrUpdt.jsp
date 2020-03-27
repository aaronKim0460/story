<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<validator:javascript formName="boardMaster" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
	function fn_egov_validateForm(obj){
		return true;
	}

	function fn_egov_update_brdMstr(){
		if (!validateBoardMaster(document.boardMaster)){
			return;
		}

		//----------------------------
		// 2009.06.26 : 2단계 기능 추가
		//----------------------------
		var theForm = document.boardMaster;
		if ('<c:out value="${result.bbsTyCode}"/>' == 'BBST04' &&
				(theForm.option.options[theForm.option.selectedIndex].value == 'comment' ||
				 theForm.option.options[theForm.option.selectedIndex].value == 'stsfdg')) {
			alert('방명록의 경우는 추가 선택사항을 지원하지 않습니다.');
			theForm.option.focus();
			return;
		}
		////--------------------------
		
		// 2011.11.11 : 첨부파일가능 선택 시 파일숫자를 선택하도록 함, 첨부파일가능 미선택시 파일 숫자를 없음으로 변경
		var list = document.getElementsByName('fileAtchPosblAt');
		var fileAtchPosblAt_value;
		for (var i=0; i < list.length; i++) {
			if(list[i].checked == true) {
				fileAtchPosblAt_value = list[i].value;
			}
		}
		
		if (fileAtchPosblAt_value == "Y" && document.boardMaster.posblAtchFileNumber.value == 0 ) {
			alert("첨부가능파일 숫자를 1개이상 선택하세요.");
			return;
		}
		
		if (fileAtchPosblAt_value == "N" && document.boardMaster.posblAtchFileNumber.value != 0 ) {
			document.boardMaster.posblAtchFileNumber.value = 0;
		}
		////--------------------------


		if(confirm('<spring:message code="common.update.msg" />')){
			document.boardMaster.action = "<c:url value='/cop/bbs/UpdateBBSMasterInf.do'/>";
			document.boardMaster.submit();
		}
	}

	function fn_egov_select_brdMstrList(){
		document.boardMaster.action = "<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>";
		document.boardMaster.submit();
	}

	function fn_egov_delete_brdMstr(){
		if(confirm('<spring:message code="common.delete.msg" />')){
			document.boardMaster.action = "<c:url value='/cop/bbs/DeleteBBSMasterInf.do'/>";
			document.boardMaster.submit();
		}
	}

	function fn_egov_inqire_tmplatInqire(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/tpl/selectTemplateInfsPop.do&typeFlag=BBS&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_tmplatInqire", openParam);
		if(typeof(retVal) == "undefined"){
			retVal = window.returnValue;
		}
		if(retVal != null){
			var tmp = retVal.split("|");
			document.boardMaster.tmplatId.value = tmp[0];
			document.boardMaster.tmplatNm.value = tmp[1];
		}
	}
</script>

<body>

<form:form commandName="boardMaster" name="boardMaster" action="${pageContext.request.contextPath}/cop/bbs/SelectBBSMasterInfs.do" method="post" >
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="bbsId" type="hidden" value="<c:out value='${result.bbsId}'/>" />
<input name="replyPosblAt" type="hidden" value="<c:out value='${result.replyPosblAt}'/>" />
<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>" />
<input name="siteId" type="hidden" value="<c:out value='${searchVO.siteId}'/>" />
<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>" />
<input name="loginReqAt" type="hidden" value="<c:out value='${searchVO.loginReqAt}'/>" />


<div class="content-body">
<div class="board-list">

	<table class="board-write">
		<caption>글 등록</caption>
		<colgroup>
		    <col style="width:17%" />
		    <col style="width:33%" />
		    <col style="width:17%" />
		    <col style="width:33%" />
		</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">게시판명<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td" colspan="3">
					<input title="게시판명입력" name="bbsNm" type="text" class="input-text full" value='<c:out value="${result.bbsNm}"/>' maxlength="60" >
					<br/><form:errors path="bbsNm" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">게시판 소개<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td" colspan="3">
					<textarea title="게시판소개입력" name="bbsIntrcn" class="textarea"  cols="75" rows="10" ><c:out value="${result.bbsIntrcn}" escapeXml="true" /></textarea>
					<form:errors path="bbsIntrcn" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자 목록 페이지<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="userListPge" id="userListPge" class="board-search-select" style="width:220px">
					   <option value="kor/common/UserNormalBbsList" <c:if test="${result.userListPge == 'kor/common/UserNormalBbsList' }">selected</c:if>>일반게시판목록</option>
					   <option value="kor/common/UserImageBbsList" <c:if test="${result.userListPge == 'kor/common/UserImageBbsList' }">selected</c:if>>이미지게시판목록</option>
					   <option value="kor/common/UserHotIssueBbsList" <c:if test="${result.userListPge == 'kor/common/UserHotIssueBbsList' }">selected</c:if>>핫이슈게시판목록</option>
					   <option value="kor/common/UserTabBbsList" <c:if test="${result.userListPge == 'kor/common/UserTabBbsList' }">selected</c:if>>탭게시판목록</option>
					   <option value="kor/common/UserReferenceBbsList" <c:if test="${result.userListPge == 'kor/common/UserReferenceBbsList' }">selected</c:if>>자료게시판목록</option>
					   <option value="kor/common/UserBbsCmmnList" <c:if test="${result.userListPge == 'kor/common/UserBbsCmmnList' }">selected</c:if>>공통게시판목록</option>
					   <option value="kor/common/UserBbsCmmnFaqList"  <c:if test="${result.userListPge == 'kor/common/UserBbsCmmnFaqList' }">selected</c:if>>FAQ게시판목록</option>
					   <option value="kor/common/UserBbsCmmnImgList"  <c:if test="${result.userListPge == 'kor/common/UserBbsCmmnImgList' }">selected</c:if>>사진게시판목록</option>
					   <option value="kor/common/UserBbsCmmnVodList"  <c:if test="${result.userListPge == 'kor/common/UserBbsCmmnVodList' }">selected</c:if>>동영상게시판목록</option>
					   <option value="kor/common/UserBbsCmmnNewsList"  <c:if test="${result.userListPge == 'kor/common/UserBbsCmmnNewsList' }">selected</c:if>>갤러리게시판목록</option>
					   
					   <option value="eng/common/UserBbsCmmnList" <c:if test="${result.userListPge == 'eng/common/UserBbsCmmnList' }">selected</c:if>>공통게시판목록(영문)</option>
					   <option value="eng/common/UserBbsCmmnFaqList"  <c:if test="${result.userListPge == 'eng/common/UserBbsCmmnFaqList' }">selected</c:if>>FAQ게시판목록(영문)</option>
					   <option value="eng/common/UserBbsCmmnImgList"  <c:if test="${result.userListPge == 'eng/common/UserBbsCmmnImgList' }">selected</c:if>>사진게시판목록(영문)</option>
					   <option value="eng/common/UserBbsCmmnVodList"  <c:if test="${result.userListPge == 'eng/common/UserBbsCmmnVodList' }">selected</c:if>>동영상게시판목록(영문)</option>
					   <option value="eng/common/UserBbsCmmnNewsList"  <c:if test="${result.userListPge == 'eng/common/UserBbsCmmnNewsList' }">selected</c:if>>갤러리게시판목록(영문)</option>
					</select>
				</td>
				<th class="board-write-th">관리자 목록 페이지<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="mngrListPge" id="mngrListPge" class="board-search-select" style="width:220px">
					   <option value="commonBbs/normal/normalBbsList" <c:if test="${result.mngrListPge == 'commonBbs/normal/normalBbsList' }">selected</c:if>>일반게시판목록</option>
					   <option value="commonBbs/image/imageBbsList" <c:if test="${result.mngrListPge == 'commonBbs/image/imageBbsList' }">selected</c:if>>이미지게시판목록</option>
					   <option value="kor/common/BbsCmmnList"    <c:if test="${result.mngrListPge == 'kor/common/BbsCmmnList' }">selected</c:if>>공통게시판목록</option>
					   <option value="kor/common/BbsCmmnFaqList" <c:if test="${result.mngrListPge == 'kor/common/BbsCmmnFaqList' }">selected</c:if>>FAQ게시판목록</option>
					   <option value="kor/common/BbsCmmnImgList" <c:if test="${result.mngrListPge == 'kor/common/BbsCmmnImgList' }">selected</c:if>>사진게시판목록</option>
					   <option value="kor/common/BbsCmmnVodList" <c:if test="${result.mngrListPge == 'kor/common/BbsCmmnVodList' }">selected</c:if>>동영상게시판목록</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자 상세 페이지</th>
				<td class="board-write-td">
					<select name="userDetailPge" id="userDetailPge" class="board-search-select" style="width:220px">
					   <option value="">선택</option>
					   <option value="kor/common/UserNormalBbsInqire" <c:if test="${result.userDetailPge == 'kor/common/UserNormalBbsInqire' }">selected</c:if>>일반게시판상세</option>
					   <option value="kor/common/UserHotIssueBbsInqire" <c:if test="${result.userDetailPge == 'kor/common/UserHotIssueBbsInqire' }">selected</c:if>>핫이슈게시판상세</option>
					   <option value="kor/common/UserBbsCmmnInqire" <c:if test="${result.userDetailPge == 'kor/common/UserBbsCmmnInqire' }">selected</c:if>>공통게시판상세</option>
					   <option value="kor/common/UserBbsAuthInqire" <c:if test="${result.userDetailPge == 'kor/common/UserBbsAuthInqire' }">selected</c:if>>익명게시판상세</option>
					   <option value="kor/common/UserBbsCmmnVodInqire"  <c:if test="${result.userDetailPge == 'kor/common/UserBbsCmmnVodInqire' }">selected</c:if>>동영상게시판상세</option>
					   <option value="kor/common/UserBbsCmmnNewsInqire"  <c:if test="${result.userDetailPge == 'kor/common/UserBbsCmmnNewsInqire' }">selected</c:if>>갤러리게시판상세</option>
					   
					   <option value="eng/common/UserBbsCmmnInqire" <c:if test="${result.userDetailPge == 'eng/common/UserBbsCmmnInqire' }">selected</c:if>>공통게시판상세(영문)</option>
					   <option value="eng/common/UserBbsAuthInqire" <c:if test="${result.userDetailPge == 'eng/common/UserBbsAuthInqire' }">selected</c:if>>익명게시판상세(영문)</option>
					   <option value="eng/common/UserBbsCmmnVodInqire"  <c:if test="${result.userDetailPge == 'eng/common/UserBbsCmmnVodInqire' }">selected</c:if>>동영상게시판상세(영문)</option>
					   <option value="eng/common/UserBbsCmmnNewsInqire"  <c:if test="${result.userDetailPge == 'eng/common/UserBbsCmmnNewsInqire' }">selected</c:if>>갤러리게시판상세(영문)</option>
					</select>
				</td>
				<th class="board-write-th">관리자 상세 페이지<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="mngrDetailPge" id="mngrDetailPge" class="board-search-select" style="width:220px">
					   <option value="commonBbs/normal/normalBbsInqire"  <c:if test="${result.mngrDetailPge == 'commonBbs/normal/normalBbsInqire' }">selected</c:if>>일반게시판상세</option>
					   <option value="kor/common/BbsCmmnInqire"    <c:if test="${result.mngrDetailPge == 'kor/common/BbsCmmnInqire' }">selected</c:if>>공통게시판상세</option>
					   <option value="kor/common/BbsCmmnVodInqire" <c:if test="${result.mngrDetailPge == 'kor/common/BbsCmmnVodInqire' }">selected</c:if>>동영상게시판상세</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자 등록 페이지</th>
				<td class="board-write-td">
					<select name="userRegistPge" id="userRegistPge" class="board-search-select" style="width:220px">
					   <option value="">선택</option>
					   <option value="kor/common/UserBbsAuthRegist" <c:if test="${result.userRegistPge == 'kor/common/UserBbsAuthRegist' }">selected</c:if>>익명게시판등록</option>
					   <option value="eng/common/UserBbsAuthRegist" <c:if test="${result.userRegistPge == 'eng/common/UserBbsAuthRegist' }">selected</c:if>>익명게시판등록(영문)</option>
					</select>
				</td>
				<th class="board-write-th">관리자 등록 페이지<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="mngrRegistPge" id="mngrRegistPge" class="board-search-select" style="width:220px">
					   <option value="commonBbs/normal/normalBbsRegist" <c:if test="${result.mngrRegistPge == 'commonBbs/normal/normalBbsRegist' }">selected</c:if>>일반게시판등록</option>
					   <option value="kor/common/BbsCmmnRegist" <c:if test="${result.mngrRegistPge == 'kor/common/BbsCmmnRegist' }">selected</c:if>>공통게시판등록</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자 수정 페이지</th>
				<td class="board-write-td">
					<select name="userUpdtPge" id="userUpdtPge" class="board-search-select" style="width:220px">
					   <option value="">선택</option>
					   <option value="kor/common/UserBbsAuthUpdt" <c:if test="${result.userUpdtPge == 'kor/common/UserBbsAuthUpdt' }">selected</c:if>>익명게시판수정</option>
					   <option value="eng/common/UserBbsAuthUpdt" <c:if test="${result.userUpdtPge == 'eng/common/UserBbsAuthUpdt' }">selected</c:if>>익명게시판수정(영문)</option>
					</select>
				</td>
				<th class="board-write-th">관리자 수정 페이지<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="mngrUpdtPge" id="mngrUpdtPge" class="board-search-select" style="width:220px">
					   <option value="commonBbs/normal/normalBbsUpdt" <c:if test="${result.mngrUpdtPge == 'commonBbs/normal/normalBbsUpdt' }">selected</c:if>>일반게시판수정</option>
					   <option value="kor/common/BbsCmmnUpdt" <c:if test="${result.mngrUpdtPge == 'kor/common/BbsCmmnUpdt' }">selected</c:if>>공통게시판수정</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">게시판 유형<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select id="bbsTyCode" name="bbsTyCode" class="board-search-select" style="width:220px">
						<c:forEach var="typeList" items="${typeList}" varStatus="status">
						<option value="<c:out value='${typeList.code }'/>" <c:if test="${typeList.code == result.bbsTyCode }">selected</c:if>><c:out value="${typeList.codeNm}"/> </option>
						</c:forEach>
					</select>
				</td>
				<th class="board-write-th">게시판 속성<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select id="bbsAttrbCode" name="bbsAttrbCode" class="board-search-select" style="width:220px">
						<c:forEach var="attrbList" items="${attrbList}" varStatus="status">
						<option value="<c:out value='${attrbList.code }'/>" <c:if test="${attrbList.code == result.bbsAttrbCode }">selected</c:if>><c:out value="${attrbList.codeNm}"/> </option>
						</c:forEach>
					</select>
				</td>
			</tr>
			
			<tr>
			    <th class="board-write-th">게시판 분류1</th>
				<td class="board-write-td">
			    	<select name="cl1Code" class="board-search-select" id="cl1Code" style="width:220px">
			    		<option value=''>선택</option>
						<c:forEach var="resultCode" items="${cmmnCodeList}" varStatus="status">
						<option value='<c:out value="${resultCode.codeId}"/>' <c:if test="${resultCode.codeId == result.cl1Code }">selected</c:if>><c:out value="${resultCode.codeIdNm}"/></option>
						</c:forEach>
					</select>
				</td>
			    <th class="board-write-th">게시판 분류2</th>
			    <td class="board-write-td">
			        <select name="cl2Code" class="board-search-select" id="cl2Code" style="width:220px">
			        	<option value=''>선택</option>
						<c:forEach var="resultCode" items="${cmmnCodeList}" varStatus="status">
						<option value='<c:out value="${resultCode.codeId}"/>' <c:if test="${resultCode.codeId == result.cl2Code }">selected</c:if>><c:out value="${resultCode.codeIdNm}"/></option>
						</c:forEach>
					</select>
			    </td>
	  		</tr>
			<tr>
				<th class="board-write-th">기타1 분류명</th>
				<td class="board-write-td">
					<input type="text" name="etc0ClNm" id="etc0ClNm" class="input-text" value="<c:out value='${result.etc0ClNm }'/>"/>
				</td>
				<th class="board-write-th">기타2 분류명</th>
				<td class="board-write-td">
					<input type="text" name="etc1ClNm" id="etc1ClNm" class="input-text" value="<c:out value='${result.etc1ClNm }'/>"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">기타3 분류명</th>
				<td class="board-write-td">
					<input type="text" name="etc2ClNm" id="etc2ClNm" class="input-text" value="<c:out value='${result.etc2ClNm }'/>"/>
				</td>
				<th class="board-write-th">기타4 분류명</th>
				<td class="board-write-td">
					<input type="text" name="etc3ClNm" id="etc3ClNm" class="input-text" value="<c:out value='${result.etc3ClNm }'/>"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">답장가능여부<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
				<c:choose>
				<c:when test='${result.replyPosblAt == "Y"}'>
				가능
				</c:when>
				<c:otherwise>
				불가능
				</c:otherwise>
				</c:choose>
				</td>
				<th class="board-write-th">파일첨부가능여부<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
				 	가능&nbsp;&nbsp;<input type="radio" name="fileAtchPosblAt" class="radio2" value="Y" <c:if test="${result.fileAtchPosblAt == 'Y'}"> checked="checked"</c:if>>&nbsp;&nbsp;
					불가능&nbsp;&nbsp;<input type="radio" name="fileAtchPosblAt" class="radio2" value="N" <c:if test="${result.fileAtchPosblAt == 'N'}"> checked="checked"</c:if>>
					<br/><form:errors path="fileAtchPosblAt" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">첨부가능파일 숫자</th>
				<td class="board-write-td">
			 		<select name="posblAtchFileNumber" class="board-search-select">
						<option value="0" <c:if test="${result.posblAtchFileNumber == '0'}">selected="selected"</c:if>>없음</option>
			 			<c:forEach begin="1" end="10" step="1" var="fileCnt" varStatus="status">
			 				<option value="<c:out value='${fileCnt }'/>" <c:if test="${result.posblAtchFileNumber == fileCnt}">selected="selected"</c:if>><c:out value='${fileCnt }'/>개</option>
			 			</c:forEach>
					</select>
				<br/><form:errors path="posblAtchFileNumber" />
				</td>
				<th class="board-write-th">사이트 구분</th>
				<td class="board-write-td">
			 		<select id="siteType" class="board-search-select" >
						<c:forEach var="siteResult" items="${siteType}" varStatus="status">
						<option value="<c:out value='${siteResult.code }'/>" <c:if test="${siteResult.codeNm == result.codeNm }">selected</c:if>><c:out value="${siteResult.codeNm}"/> </option>
						</c:forEach>
					</select>
			    </td>
			</tr>
			<tr>
				<th class="board-write-th">페이지 단위 수</th>
				<td class="board-write-td">
					<input type="text" name="bbsPageSize" id="bbsPageSize" class="input-text" value="<c:out value='${result.bbsPageSize }'/>"/>
				</td>
				<th class="board-write-th">페이징 내 게시물 수</th>
				<td class="board-write-td">
					<input type="text" name="bbsPageUnit" id="bbsPageUnit" class="input-text" value="<c:out value='${result.bbsPageUnit }'/>"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">연동 여부</th>
				<td class="board-write-td">
					예&nbsp;&nbsp;<input type="radio" name="intrlckYn" value="Y" <c:if test="${result.intrlckYn == 'Y'}"> checked="checked"</c:if>/>&nbsp;&nbsp;
					아니오&nbsp;&nbsp;<input type="radio" name="intrlckYn" value="N" <c:if test="${result.intrlckYn == 'N'}"> checked="checked"</c:if>/>
					<br/><form:errors path="intrlckYn" />
				</td>
				<th class="board-write-th">승인사용 여부</th>
				<td class="board-write-td">
					예&nbsp;&nbsp;<input type="radio" name="confmUseYn" value="Y" <c:if test="${result.confmUseYn == 'Y'}"> checked="checked"</c:if>/>&nbsp;&nbsp;
					아니오&nbsp;&nbsp;<input type="radio" name="confmUseYn" value="N" <c:if test="${result.confmUseYn == 'N'}"> checked="checked"</c:if>/>
					<br/><form:errors path="confmUseYn" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용 여부</th>
				<td class="board-write-td">
					예&nbsp;&nbsp;<input type="radio" name="useAt" value="Y" <c:if test="${result.useAt == 'Y'}"> checked="checked"</c:if>/>&nbsp;&nbsp;
					아니오&nbsp;&nbsp;<input type="radio" name="useAt" value="N" <c:if test="${result.useAt != 'Y'}"> checked="checked"</c:if>/>
					<br/><form:errors path="useAt" />
				</td>
				<th class="board-write-th">추가선택사항선택</th>
				<td class="board-write-td">
					<select name="option" class="select" <c:if test="${result.option != 'na'}">disabled="disabled"</c:if> title="추가선택사항">
						<option value='na' <c:if test="${result.option == 'na'}">selected="selected"</c:if>>---선택하세요--</option>
						<option value='' <c:if test="${result.option == ''}">selected="selected"</c:if>>미선택</option>
						<c:if test="${useComment == 'true' }">
							<option value='comment' <c:if test="${result.option == 'comment'}">selected="selected"</c:if>>댓글</option>
						</c:if>
						<c:if test="${useSatisfaction == 'true' }">
							<option value='stsfdg' <c:if test="${result.option == 'stsfdg'}">selected="selected"</c:if>>만족도조사</option>
						</c:if>
			  		</select>
				</td>
				
			</tr>
		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<input type="submit" value="목록" onclick="fn_egov_select_brdMstrList(); return false;" class="btn btn-default" />
	<input type="button" value="저장" onclick="javascript:fn_egov_update_brdMstr(); return false;" class="btn btn-primary" />
<%-- 	<a href="<c:url value='/cop/bbs/DeleteBBSMasterInf.do'/>" onclick="fn_egov_delete_brdMstr(); return false;" class="btn btn-warning" />삭제</a> --%>
</div>

</form:form>
</body>
</html>
