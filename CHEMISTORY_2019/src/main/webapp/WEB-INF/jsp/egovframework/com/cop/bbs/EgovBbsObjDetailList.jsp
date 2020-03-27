<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<script type="text/javascript">

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_brdMstr('1');
		}
	}

	function fCheckAll() {
	    var checkField = document.frm.check1;
	    if(document.frm.checkAll.checked) {
	        if(checkField) {
	            if(checkField.length > 1) {
	                for(var i=0; i < checkField.length; i++) {
	                    checkField[i].checked = true;
	                }
	            } else {
	                checkField.checked = true;
	            }
	        }
	    } else {
	        if(checkField) {
	            if(checkField.length > 1) {
	                for(var j=0; j < checkField.length; j++) {
	                    checkField[j].checked = false;
	                }
	            } else {
	                checkField.checked = false;
	            }
	        }
	    }
	}
	
	function fn_obj_delete(){
		fn_select_objChk();

		if(confirm("해당 게시물을 정말 삭제하시겠습니까? 삭제 후 복구 불가합니다.")){
			document.frm.action = "<c:url value='/cop/bbs/realDeleteBoardArticles.do'/>";
			document.frm.submit(); 
		}
	}
	
	function fn_obj_delete_undo(){
		fn_select_objChk();

		if(confirm("해당 게시물을 삭제해제 하시겠습니까?")){
			document.frm.action = "<c:url value='/cop/bbs/deleteBoardArticlesUndo.do'/>";
			document.frm.submit(); 
		}
	}

	function fn_select_objChk(){
		
		var checkField = document.frm.check1;
    	var checkVal = document.frm.checkVal;
	    var checkcheckVals = "";
	    var checkedCount = 0;
	    alert(checkVal.value);
	    if(checkField) {
	    	if(checkField.length > 1) {
	            for(var i=0; i < checkField.length; i++) {
	                if(checkField[i].checked) {
	                    checkcheckVals += ((checkedCount==0? "" : ",") + checkVal[i].value);
	                    checkedCount++;
	                }
	            }
	        } else {
	            if(checkField.checked) {
	            	checkcheckVals = checkVal.value;
	            }
	        }
	    }

	    document.frm.nttDocSe.value = checkcheckVals;
			
	}
	
	function fn_obj_targetBbs(){
		
		window.open("<c:url value='/cop/bbs/SelectBBSMasterInfs_trget.do' />",'','width=790,height=510');
	}

	function fn_egov_select_brdMstr(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs/SelectBBSObjList.do'/>";
		document.frm.submit();
	}
	
	$(document).ready(function(){
		
		// 상세보기
		$("#bbs_list tr td").click(function(){
			
			// 체크 선택시 return
			if($(this).parent().children().index(this) < 1)return;
// 			$("#a_link_detail").attr("href", "<c:url value='/cop/bbs/selectNoLoginBoardArticle.do'/>"+$(this).parent().attr("nid"));
			window.open("<c:url value='/cop/bbs/selectBoardArticle.do'/>"+$(this).parent().attr("nid") + "&preview=Y", "bbs_preview", "scrollbars=yes, width=600, height=650");
// 			$("#a_link_new")[0].click();
		});
		
		// 복사 게시판 선택
		$("#btn_link_bbs").click(function(){
			
			if($("#bbsId").val() == ""){
				alert("게시판 정보를 확인할 수 없습니다.");
				return;
			}
			
			var param = "bbsId="+$("#bbsId").val();
			param += "&linkBbsId="+$("#linkBbsId").val();
			
			window.open("/cop/bbs/linkBbsListPop.do?"+param, "bbs_preview", "scrollbars=yes, width=600, height=650");
			
		});
		
		// 복사
		$("#btn_copy_bbs").click(function(){
			
			if($("input[name=check1]:checked").length < 1){
				
				alert("선택된 게시물이 없습니다.");
				return;
			}
			
			if($("#linkBbsId").val() == ""){
				
				alert("복사 대상 게시판이 선택되지 않았습니다.");
				return;
			}
			
			if(!confirm("해당 게시물을 정말 복사하시겠습니까?"))return;
			
			// bbsId 설정
			$("#relateLink").val($("#linkBbsId").val());
			
			// nttId 설정
			var copyNttId = "";
			var chkNtt = $("input[name=check1]:checked");
			
			
			$("input[name=check1]:checked").each(function(idx, val){
				
				copyNttId += "," + $(this).val();
				
			});
			
			var params = {};
			params["bbsId"] = $("#bbsId").val();
			params["copyNttId"] = copyNttId.substring(1);
			params["linkBbsId"] = $("#linkBbsId").val();
			
			fnGetAjaxData("<c:url value='/cop/bbs/realCopyBoardArticles.do'/>", params, fnCBCopyBbs, false);
			
		});
	});
	
	// 복사 후처리
	function fnCBCopyBbs(data){
		if(data == null || data.result == null || data.result != "Y"){
			alert("게시물 복사에 실패하였습니다.");
			return;
		}
		
		// 게시판 ID 해제
		$("#linkBbsId").val("");
		$("#btn_link_bbs_nm").text("");
		
		// 체크 해제
		$("input[name=check1]:checked").each(function(idx, val){
			$(this).attr("checked", false);
		});
		
		alert("게시물이 복사되었습니다.");
	}
	
</script>

<body>
<div style="display:none;">
	<a id="a_link_new" href="#" target="_blank"></a>
	<a id="a_link_detail" href="#" target="main_right"></a>		
</div>
<form name="frm" method="post">
<input type="hidden" id="bbsId" name="bbsId" value="<c:out value='${brdMstrVO.bbsId }'/>">
<input type="hidden" name="nttDocSe" id="nttDocSe" value=""/>
<input type="hidden" name="relateLink" id="relateLink" value=""/>
<input type="hidden" name="trgetId" />
<input type="hidden" id="linkBbsId" name="linkBbsId" />

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
게시판 이름&nbsp;&nbsp;<strong><c:out value="${brdMstrVO.bbsNm }"/></strong>
	
<div class="board-search">
	<fieldset>
		<legend>목록검색</legend>		
			<select name="searchCnd" class="board-search-select">
				<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
				<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >작성자</option>
			</select>
			<input  name="searchWrd" type="text" class="board-search-keyword" size="35" value='<c:out value="${searchVO.searchWrd}" />' maxlength="35" onkeypress="press(event);" title="검색단어입력" />
			<input type="submit" value="검색" id="board-search-submit" class="btn btn-sm btn-default" onclick="fn_egov_select_brdMstr('1'); return false;">
</div>

<div class="board-list">
	<table class="board-default">
		<colgroup>
			<col style="width:5%" />
			<col style="width:*" />
			<col style="width:10%" />
			<col style="width:10%" />
			<col style="width:15%" />
			<col style="width:5%" />
		</colgroup>
		<thead>
			<tr>
				<th class="board-default-th-no"><input type="checkbox" name="checkAll" class="check2" onClick="fCheckAll();"/></th>
				<th class="board-default-th-title">제목</th>
				<th class="board-default-th-no">작성자</th>
				<th class="board-default-th-no">승인상태</th>
				<th class="board-default-th-no">등록일</th>
				<th class="board-default-th-no">조회수</th>
			</tr>
		</thead>
		<tbody id="bbs_list">
		
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr nid="?bbsId=<c:out value='${result.bbsId}'/>&nttId=<c:out value='${result.nttId}'/>&bbsTyCode=<c:out value='${brdMstrVO.bbsTyCode}'/>&bbsAttrbCode=<c:out value='${brdMstrVO.bbsAttrbCode}'/>" style="cursor:pointer;">
				<td class="board-default-td-no">
					<input type="checkbox" name="check1" class="check2" value="<c:out value='${result.nttId }'/>" />
					<input type="hidden" name="checkVal" id="checkVal" value="<c:out value='${result.nttId }'/>"/>
				</td>
				<td class="board-default-td-title">
				
					<c:choose>
						<c:when test="${result.useAt == 'N'}">
							<div style="width:40px; height:22px; background-color: red; float:left; color:white; text-align:center;">삭제</div>
							<span style="text-decoration:line-through;color:red"><c:out value='${result.nttSj}'/></span>
						</c:when>
						<c:otherwise>
							<c:out value='${result.nttSj}'/>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${userAuthority != null && result.publicNuriTy != '0' && result.publicNuriTy != ''}">
						<img src="<c:url value='/images/common/bbs_mark_open${result.publicNuriTy}.png'/>" />
					</c:if>
					
				</td>
				<td class="board-default-td-no"><c:out value="${result.frstRegisterNm}"/></td>
				<td class="board-default-td-no">
					<c:choose>
						<c:when test="${result.confmSttus == 'C'}">
							승인
						</c:when>
						<c:when test="${result.confmSttus == 'R'}">
							<span style="color:red">승인대기</span>
						</c:when>
						<c:otherwise>
							<span style="color:red">확인불가</span>
						</c:otherwise>
					</c:choose>
				</td>
				<td class="board-default-td-no"><c:out value="${result.ntceDate}"/></td>
				<td class="board-default-td-no"><c:out value="${result.inqireCo}"/></td>
			</tr>
		
		</c:forEach>
		
		<c:if test="${fn:length(resultList) == 0}">
		<tr>
			<td class="board-default-td-title" colspan="6"><spring:message code="common.nodata.msg" /></td>
		</tr>
		</c:if>
		
		</tbody>
	</table>
</div>

<div class="board-footer">
	<div class="pagenavi">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_brdMstr" />
	</div>
</div>

<div><strong>게시물 선택 후 복사/삭제 하실 수 있습니다.</strong></div>

<div class="content-body">
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
					<a id="btn_copy_bbs" href="#" class="btn btn-primary">복사</a>
			        <a href="<c:url value='/cop/bbs/addBBSMaster.do'/>" onclick="fn_obj_delete(); return false;" class="btn btn-warning">DB삭제</a>
			        <a href="<c:url value='/cop/bbs/addBBSMaster.do'/>" onclick="fn_obj_delete_undo(); return false;" class="btn btn-warning">삭제해제</a>
				</td>
				<th class="board-write-th">
					<a id="btn_link_bbs" href="#" class="btn btn-link">대상게시판 선택</a>
				</th>
				<td class="board-write-td">
					<span id="btn_link_bbs_nm"></span>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>	
	
</form>
</body>
</html>
