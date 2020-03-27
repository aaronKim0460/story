<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<validator:javascript formName="boardMaster" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
	function fn_egov_regist_brdMstr(){
		if (!validateBoardMaster(document.boardMaster)){
			return;
		}

		//----------------------------
		// 2009.06.26 : 2단계 기능 추가
		//----------------------------
		var theForm = document.boardMaster;
		if (theForm.bbsTyCode.options[theForm.bbsTyCode.selectedIndex].value == 'BBST04' &&
				theForm.option.options[theForm.option.selectedIndex].value != '') {
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

		if (confirm('<spring:message code="common.regist.msg" />')) {
			form = document.boardMaster;
			form.action = "<c:url value='/cop/bbs/insertBBSMasterInf.do'/>";
			form.submit();
		}
	}
	
	function fn_egov_select_brdMstrList(){
		
		location.href = "<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>";

	}

	function fn_egov_inqire_tmplatInqire(){
		form = document.boardMaster;
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do'/>"+"?requestUrl=/cop/tpl/selectTemplateInfsPop.do&typeFlag=BBS&width=850&height=360";
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

<form:form commandName="boardMaster" name="boardMaster" method="post" action="<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>">
<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
<input type="hidden" name="loginReqAt" value="N" />

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
					<form:input title="게시판명입력" path="bbsNm" size="60" class="input-text full" />
					<br/><form:errors path="bbsNm" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">게시판 소개<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td" colspan="3">
				   <form:textarea title="게시판소개입력" path="bbsIntrcn" cols="75" rows="10" cssStyle="width:100%" />
				  <br/><form:errors path="bbsIntrcn" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자 목록 페이지<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="userListPge" id="userListPge" class="board-search-select" style="width:220px">
					   <option value="kor/common/UserNormalBbsList">일반게시판목록</option>
					   <option value="kor/common/UserImageBbsList">이미지게시판목록</option>
					   <option value="kor/common/UserHotIssueBbsList">핫이슈게시판목록</option>
					   <option value="kor/common/UserTabBbsList">탭게시판목록</option>
					   <option value="kor/common/UserReferenceBbsList">자료게시판목록</option>
					   <option value="kor/common/UserBbsCmmnList">공통게시판목록</option>
					   <option value="kor/common/UserBbsCmmnFaqList">FAQ게시판목록</option>
					   <option value="kor/common/UserBbsCmmnImgList">사진게시판목록</option>
					   <option value="kor/common/UserBbsCmmnVodList">동영상게시판목록</option>
					   <option value="kor/common/UserBbsCmmnNewsList">갤러리게시판목록</option>
					   
					   <option value="eng/common/UserBbsCmmnList">공통게시판목록(영문)</option>
					   <option value="eng/common/UserBbsCmmnFaqList">FAQ게시판목록(영문)</option>
					   <option value="eng/common/UserBbsCmmnImgList">사진게시판목록(영문)</option>
					   <option value="eng/common/UserBbsCmmnVodList">동영상게시판목록(영문)</option>
					   <option value="eng/common/UserBbsCmmnNewsList">갤러리게시판목록(영문)</option>
					</select>
				</td>
				<th class="board-write-th">관리자 목록 페이지<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="mngrListPge" id="mngrListPge" class="board-search-select" style="width:220px">
					   <option value="commonBbs/normal/normalBbsList">일반게시판목록</option>
					   <option value="commonBbs/image/imageBbsList">이미지게시판목록</option>
					   <option value="kor/common/BbsCmmnList">공통게시판목록</option>
					   <option value="kor/common/BbsCmmnFaqList">FAQ게시판목록</option>
					   <option value="kor/common/BbsCmmnImgList">사진게시판목록</option>
					   <option value="kor/common/BbsCmmnVodList">동영상게시판목록</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자 상세 페이지</th>
				<td class="board-write-td">
					<select name="userDetailPge" id="userDetailPge" class="board-search-select" style="width:220px">
					   <option value="">선택</option>
					   <option value="kor/common/UserNormalBbsInqire">일반게시판상세</option>
					   <option value="kor/common/UserHotIssueBbsInqire">핫이슈게시판상세</option>
					   <option value="kor/common/UserBbsCmmnInqire">공통게시판상세</option>
					   <option value="kor/common/UserBbsAuthInqire">익명게시판상세</option>
					   <option value="kor/common/UserBbsCmmnVodInqire">동영상게시판상세</option>
					   <option value="kor/common/UserBbsCmmnNewsInqire">갤러리게시판상세</option>
					   
					   <option value="eng/common/UserBbsCmmnInqire">공통게시판상세(영문)</option>
					   <option value="eng/common/UserBbsAuthInqire">익명게시판상세(영문)</option>
					   <option value="eng/common/UserBbsCmmnVodInqire">동영상게시판상세(영문)</option>
					   <option value="eng/common/UserBbsCmmnNewsInqire">갤러리게시판상세(영문)</option>
					</select>
				</td>
				<th class="board-write-th">관리자 상세 페이지<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="mngrDetailPge" id="mngrDetailPge" class="board-search-select" style="width:220px">
					   <option value="commonBbs/normal/normalBbsInqire">일반게시판상세</option>
					   <option value="kor/common/BbsCmmnInqire">공통게시판상세</option>
					   <option value="kor/common/BbsCmmnVodInqire">동영상게시판상세</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자 등록 페이지</th>
				<td class="board-write-td">
					<select name="userRegistPge" id="userRegistPge" class="board-search-select" style="width:220px">
					   <option value="">선택</option>
					   <option value="kor/common/UserBbsAuthRegist">익명게시판등록</option>
					   <option value="eng/common/UserBbsAuthRegist">익명게시판등록(영문)</option>
					</select>
				</td>
				<th class="board-write-th">관리자 등록 페이지<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="mngrRegistPge" id="mngrRegistPge" class="board-search-select" style="width:220px">
					   <option value="commonBbs/normal/normalBbsRegist">일반게시판등록</option>
					   <option value="kor/common/BbsCmmnRegist">공통게시판등록</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용자 수정 페이지</th>
				<td class="board-write-td">
					<select name="userUpdtPge" id="userUpdtPge" class="board-search-select" style="width:220px">
					   <option value="">선택</option>
					   <option value="kor/common/UserBbsAuthUpdt">익명게시판수정</option>
					   <option value="eng/common/UserBbsAuthUpdt">익명게시판수정(영문)</option>
					</select>
				</td>
				<th class="board-write-th">관리자 수정 페이지<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
					<select name="mngrUpdtPge" id="mngrUpdtPge" class="board-search-select" style="width:220px">
					   <option value="commonBbs/normal/normalBbsUpdt">일반게시판수정</option>
					   <option value="kor/common/BbsCmmnUpdt">공통게시판수정</option>
					</select>
				</td>
			</tr>
	  		<tr>
			    <th class="board-write-th">게시판 유형<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
			    	<form:select path="bbsTyCode" class="board-search-select" style="width:115px">
				  		<form:option value='' label="--선택하세요--" />
				  		<form:options items="${typeList}" itemValue="code" itemLabel="codeNm"/>
			 		</form:select>
				  	<br/><form:errors path="bbsTyCode" />
				</td>
			    <th class="board-write-th">게시판 속성<i class="board-required"><span class="hide"></span></i></th>
			    <td class="board-write-td">
			        <form:select path="bbsAttrbCode" class="board-search-select" style="width:115px">
		    	  		<form:option value='' label="--선택하세요--" />
			      		<form:options items="${attrbList}" itemValue="code" itemLabel="codeNm"/>
		      		</form:select>
			  	    <br/><form:errors path="bbsAttrbCode" />
			    </td>
	  		</tr>
	  		
	  		<tr>
			    <th class="board-write-th">게시판 분류1</th>
				<td class="board-write-td">
			    	<select name="cl1Code" class="board-search-select" id="cl1Code" style="width:220px">
			    		<option value=''>선택</option>
						<c:forEach var="resultCode" items="${cmmnCodeList}" varStatus="status">
						<option value='<c:out value="${resultCode.codeId}"/>' ><c:out value="${resultCode.codeIdNm}"/></option>
						</c:forEach>
					</select>
				</td>
			    <th class="board-write-th">게시판 분류2</th>
			    <td class="board-write-td">
			        <select name="cl2Code" class="board-search-select" id="cl2Code" style="width:220px">
			        	<option value=''>선택</option>
						<c:forEach var="resultCode" items="${cmmnCodeList}" varStatus="status">
						<option value='<c:out value="${resultCode.codeId}"/>' ><c:out value="${resultCode.codeIdNm}"/></option>
						</c:forEach>
					</select>
			    </td>
	  		</tr>
	  		<tr>
				<th class="board-write-th">기타1 분류명</th>
				<td class="board-write-td">
					<input type="text" name="etc0ClNm" id="etc0ClNm" class="input-text" value=""/>
				</td>
				<th class="board-write-th">기타2 분류명</th>
				<td class="board-write-td">
					<input type="text" name="etc1ClNm" id="etc1ClNm" class="input-text" value=""/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">기타3 분류명</th>
				<td class="board-write-td">
					<input type="text" name="etc2ClNm" id="etc2ClNm" class="input-text" value=""/>
				</td>
				<th class="board-write-th">기타4 분류명</th>
				<td class="board-write-td">
					<input type="text" name="etc3ClNm" id="etc3ClNm" class="input-text" value=""/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">답장가능여부<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
				 	가능&nbsp;&nbsp;<form:radiobutton path="replyPosblAt"  value="Y" />&nbsp;&nbsp;
				 	불가능&nbsp;&nbsp;<form:radiobutton path="replyPosblAt"  value="N"  />
					<br/><form:errors path="replyPosblAt" />
				</td>
				<th class="board-write-th">파일첨부가능여부<i class="board-required"><span class="hide"></span></i></th>
				<td class="board-write-td">
				 	<spring:message code="button.possible" />&nbsp;&nbsp;<form:radiobutton path="fileAtchPosblAt"  value="Y" />&nbsp;
				 	<spring:message code="button.impossible" />&nbsp;&nbsp;<form:radiobutton path="fileAtchPosblAt"  value="N"  />
			 	 	<br/><form:errors path="fileAtchPosblAt" />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">첨부가능파일 숫자</th>
				<td class="board-write-td">
					<form:select path="posblAtchFileNumber" class="board-search-select"	>
						<form:option value="0"  label="없음" />
						<form:option value='1'>1개</form:option>
						<form:option value='2'>2개</form:option>
						<form:option value='3'>3개</form:option>
					</form:select>
					<br/><form:errors path="posblAtchFileNumber" />
				</td>
				<th class="board-write-th">사이트 구분</th>
				<td class="board-write-td">
				 	<form:select path="siteType" id="siteType" class="board-search-select" style="width:115px">
						<c:forEach var="siteResult" items="${siteType}" varStatus="status">
						<option value="<c:out value='${siteResult.code }'/>"><c:out value="${siteResult.codeNm}"/> </option>
						</c:forEach>
					</form:select>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">페이지 단위 수</th>
				<td class="board-write-td">
					<input type="text" name="bbsPageSize" id="bbsPageSize" value="" class="input-text"/>
				</td>
				<th class="board-write-th">페이징 내 게시물 수</th>
				<td class="board-write-td">
					<input type="text" name="bbsPageUnit" id="bbsPageUnit" value="" class="input-text"/>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">연동 여부</th>
				<td class="board-write-td">
					예&nbsp;&nbsp;<form:radiobutton path="intrlckYn"  value="Y" checked="checked" />&nbsp;&nbsp;
				 	아니오&nbsp;&nbsp;<form:radiobutton path="intrlckYn"  value="N"  />
					<br/><form:errors path="intrlckYn" />
				</td>
				<th class="board-write-th">승인사용 여부</th>
				<td class="board-write-td">
					예&nbsp;&nbsp;<form:radiobutton path="confmUseYn"  value="Y" checked="checked" />&nbsp;&nbsp;
				 	아니오&nbsp;&nbsp;<form:radiobutton path="confmUseYn"  value="N"  />
					<br/><form:errors path="confmUseYn" />
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>

<div class="text-center">
	<input type="submit" value="목록" onclick="fn_egov_select_brdMstrList(); return false;" class="btn btn-default" />
	<input type="button" value="등록" onclick="javascript:fn_egov_regist_brdMstr(); return false;" class="btn btn-primary" />
</div>

</form:form>
</body>
</html>
