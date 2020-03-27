<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript">

	$(document).ready(function(){
		
		// 검색 텍스트 엔터 이벤트
		$("#searchWrd").keyup(function(e){
			
			if(e.keyCode==13)$("#btn_search").click();
		});
		
		// 검색
		$("#btn_search").click(function(){
			fn_egov_select_brdMstr('1');
		});
		
		// 게시물 상세보기
		$("#content_list tr td").click(function(){
			
			// 체크 선택시 return
			if($(this).parent().children().index(this) < 1)return;
			
			var bbsInfo = $(this).parent().find("input[name=chk_list]").attr("attr");
			bbsInfo = bbsInfo.split("|");
			
			if(bbsInfo.length != 2){
				alert("게시물 정보를 확인할 수 없습니다.");
				return;
			}
			
			var bbsId = bbsInfo[0];
			var nttId = bbsInfo[1]
			
			if(bbsId == null || bbsId == "" || nttId == null || nttId == ""){
				alert("게시물 정보를 확인할 수 없습니다.");
				return;
			}
			
			var param = "nttId="+nttId;
			param += "&bbsId="+bbsId;
			param += "&preview=Y";
			
			window.open("<c:url value='/cop/bbs/selectBoardArticle.do'/>?"+param, "content_preview", "scrollbars=yes, width=1000, height=800");
		});
		
		// 승인대기만 보기
		$("#btn_confm_ready").click(function(){
			
			$("#confmUseYn").val("R");
			
			$("#frm").attr("action", "<c:url value='/cop/bbs/bbsObjConfirm.do'/>");
			$("#frm").submit();
			
		});
		
		// 전체 보기
		$("#btn_all").click(function(){
			
			$("#siteId").val("");
			$("#searchCnd").val("0");
			$("#searchWrd").val("");
			$("#confmUseYn").val("");
			
			$("#frm").attr("action", "<c:url value='/cop/bbs/bbsObjConfirm.do'/>");
			$("#frm").submit();
			
		});
		
		// 전체 체크
		$("#chk_all").click(function(){
			
			var chkFlag = $(this).is(":checked");
			
			$("input[name=chk_list]").each(function(idx, val){
				
				if(!$(this).attr("disabled")){
					$(this).attr("checked", chkFlag);
				}
			});
		});
		
		// 게시물 승인
		$("#confirm_bbs").click(function(){
			
			var confirmObj = "";
			
			$("input[name=chk_list]").each(function(idx, val){
				
				if(!$(this).attr("disabled") && $(this).is(":checked")){
					confirmObj += "," + $(this).attr("attr");
				}
			});
			
			if(confirmObj.length < 1){
				alert("선택된 승인대상 게시물이 없습니다.");
				return;
			}
			
			if(!confirm("선택된 게시물을 승인하시겠습니까?"))return;
			
			var params = {};
			params["code"] = confirmObj.substring(1);
			
			fnGetAjaxData("<c:url value='/cop/bbs/bbsConfirm.do'/>", params, fnConfirmCB, false);
			
		});
		
		// 게시물 승인 대기
		$("#confirm_bbs_wait").click(function(){
			
			var confirmObj = "";
			
			$("input[name=chk_list]").each(function(idx, val){
				
				if(!$(this).attr("disabled") && $(this).is(":checked")){
					confirmObj += "," + $(this).attr("attr");
				}
			});
			
			if(confirmObj.length < 1){
				alert("선택된 승인대기대상 게시물이 없습니다.");
				return;
			}
			
			if(!confirm("선택된 게시물을 승인대기상태로 변경 하시겠습니까?"))return;
			
			var params = {};
			params["code"] = confirmObj.substring(1);
			
			fnGetAjaxData("<c:url value='/cop/bbs/bbsConfirmWait.do'/>", params, fnConfirmWaitCB, false);
			
		});
		
		
	});
	
	// 승인 후처리
	function fnConfirmCB(data){
		
		if(data.result == "A"){
			
			alert("승인 권한이 없습니다.");
			return;
		}
		
		if(data.result != "Y"){
			
			alert("게시물 승인에 실패하였습니다.");
			return;
		}
		
		alert("승인되었습니다.");
		
		$("#frm").attr("action", "<c:url value='/cop/bbs/bbsObjConfirm.do'/>");
		$("#frm").submit();
	}
	
	// 승인 대기 후처리
	function fnConfirmWaitCB(data){
		
		if(data.result == "A"){
			
			alert("승인대기 권한이 없습니다.");
			return;
		}
		
		if(data.result != "Y"){
			
			alert("게시물 승인대기 처리에 실패하였습니다.");
			return;
		}
		
		alert("승인대기 되었습니다.");
		
		$("#frm").attr("action", "<c:url value='/cop/bbs/bbsObjConfirm.do'/>");
		$("#frm").submit();
	}

	// 페이지 이동
	function fn_egov_select_brdMstr(pageNo){
		
		$("#pageIndex").val(pageNo);
		$("#frm").attr("action", "<c:url value='/cop/bbs/bbsObjConfirm.do'/>");
		$("#frm").submit();
		
	}
	
</script>

<body>

<div class="board-pages">
	<span class="board-pages-total">총 <strong><fmt:formatNumber type="currency" value="${paginationInfo.totalRecordCount }" pattern="###,###" /></strong>건</span>, 
	<span class="board-pages-total">현재 페이지 <strong><fmt:formatNumber type="currency" value="${paginationInfo.currentPageNo }" pattern="###,###" /></strong> / <fmt:formatNumber type="currency" value="${paginationInfo.totalPageCount }" pattern="###,###" /></span>
</div>

<form id="frm" name="frm" action="<c:url value='/cop/bbs/bbsObjConfirm.do'/>" method="post">
<input type="hidden" name="bbsId">
<input type="hidden" id="confmUseYn" name="confmUseYn">
<input id="pageIndex" name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div class="board-search">

	<fieldset>
	
		<select id="siteId" name="siteId" class="board-search-select">
			<option value="" <c:if test="${searchVO.siteId == ''}">selected</c:if> >전체</option>
		
			<c:forEach var="siteList" items="${siteList}" varStatus="status">
				<option value="<c:out value='${siteList.code }'/>" <c:if test="${searchVO.siteId == siteList.code}">selected</c:if> ><c:out value='${siteList.codeNm }'/></option>
			</c:forEach>
		
		</select>
		
		<legend>목록검색</legend>	
		<select id="searchCnd" name="searchCnd" class="board-search-select">
			<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
			<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >게시판명</option>
		</select>
		<input id="searchWrd" name="searchWrd" type="text" class="board-search-keyword" value='<c:out value="${searchVO.searchWrd}" />'  maxlength="35" />
		<input type="submit" value="검색" id="btn_search" class="btn btn-sm btn-default" />
		<input type="button" id="btn_confm_ready" class="btn-viewall btn btn-sm btn-link" value="승인대기만 보기" />
		<input type="button" id="btn_all" class="btn-viewall btn btn-sm btn-link" value="전체보기" />
	</fieldset>
	
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:3%" />
			<col style="width:5%" />
			<col style="width:10%" />
			<col style="width:*" />
			<col style="width:5%" />
			<col style="width:7%" />
			<col style="width:10%" />
			<col style="width:10%" />
			<col style="width:7%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no"><input type="checkbox" id="chk_all" name="chk_all" class="check2" /></th>
				<th class="board-default-th-no">사이트구분</th>
				<th class="board-default-th-title">게시판명</th>
				<th class="board-default-th-title">제목</th>
				<th class="board-default-th-no">작성자</th>
				<th class="board-default-th-no">승인상태</th>
				<th class="board-default-th-no">게시일<br />(등록일)</th>
				<th class="board-default-th-no">생성일</th>
				<th class="board-default-th-no">사용여부</th>
			</tr>
		</thead>
		<tbody id="content_list">
			
			<c:forEach var="result" items="${resultList}" varStatus="status">
			
			<tr style="cursor:pointer;">
				<td class="board-default-td-no">
					<input type="checkbox" name="chk_list" class="check2" attr="<c:out value='${result.bbsId }'/>|<c:out value='${result.nttId }'/>" />
				</td>
				<td class="board-default-td-no">
					<c:out value='${result.siteNm }'/>
				</td>
				<td class="board-default-td-title">
						<c:out value='${result.bbsNm}'/>
				</td>
				<td class="board-default-td-title">
					<c:choose>
						<c:when test="${result.useAt == 'N'}">
							<a href="#" class="btn-sm btn-warning">삭제</a>
							<span style="text-decoration:line-through;color:red"><c:out value='${result.nttSj}'/></span>
						</c:when>
						<c:otherwise>
							<c:out value='${result.nttSj}'/>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${userAuthority != null && result.publicNuriTy != '0' && result.publicNuriTy != ''&& result.publicNuriTy != null}">
						<img src="<c:url value='/images/common/bbs_mark_open${result.publicNuriTy}.png'/>" />
					</c:if>
				</td>
				<td class="board-default-td-no">
					<c:out value='${result.frstRegisterNm}'/>
				</td>
				<td class="board-default-td-no">
					<c:choose>
						<c:when test="${result.confmSttusCode == 'C'}">
							승인
						</c:when>
						<c:when test="${result.confmSttusCode == 'R'}">
							<span style="color:red">승인대기</span>
						</c:when>
						<c:otherwise>
							<span style="color:red">확인불가</span>
						</c:otherwise>
					</c:choose>
				</td>
				<td class="board-default-td-no">
					<c:out value='${result.ntceDate}'/>
				</td>
				<td class="board-default-td-no">
					<c:out value='${result.frstRegistPnttm}'/>
				</td>
				<td class="board-default-td-no">
					<c:choose>
						<c:when test="${result.useAt == 'Y'}">
							사용
						</c:when>
						<c:when test="${result.useAt == 'N'}">
							사용중지
						</c:when>
						<c:otherwise>
							확인불가
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
			
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td colspan="8">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image2" jsFunction="fn_egov_select_brdMstr" />
	</div>
	
	<c:if test="${userAuthority == 'ROLE_ADMIN' }">
	
		<div><strong>게시물 선택 후 승인 하실 수 있습니다.</strong></div>
	
		<div class="board-list">
			<table class="board-write">
				<caption>글 등록</caption>
				<colgroup>
				    <col style="width:15%" />
				    <col style="width:35%" />
		  		    <col style="width:15%" />
				    <col style="width:35%" />
				</colgroup>
				<tbody>
					<tr>
						<th class="board-write-th">선택한 게시물 </td>
					  	<td class="board-write-td">
							<a href="#" id="confirm_bbs" name="confirm_bbs" class="btn btn-primary">승인</a>
							<a href="#" id="confirm_bbs_wait" name="confirm_bbs_wait" class="btn btn-primary">승인대기</a>
						</td>
						<th class="board-write-th">
							&nbsp;
						</th>
						<td class="board-write-td">
							&nbsp;
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</c:if>
</div>
	
</form>
</body>
</html>
