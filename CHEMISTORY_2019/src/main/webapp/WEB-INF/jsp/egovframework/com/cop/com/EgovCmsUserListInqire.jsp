<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
<script type="text/javascript">

	function fn_egov_updt_CmsUserInf(){
		document.frm.action = "<c:url value='/cop/com/selectCmsUserDetailSelectUpdt.do'/>";
		document.frm.submit();
	}
	function fn_egov_select_bbsUseInfs(){
		document.frm.action = "<c:url value='/cop/com/selectBBSUseInfs.do'/>";
		document.frm.submit();
	}

	function selectedDpt(obj){
		document.frm.selectDpt.value = obj;
		var list1 = new Array();
		
		<c:forEach var="sectVO" items="${resultSectList }" varStatus="status">
			list1.push("<c:out value='${sectVO.sectNm}'/>");
			list1.push("<c:out value='${sectVO.sectCd}'/>");
			list1.push("<c:out value='${sectVO.departCd}'/>");
		</c:forEach>

		var s_sel = document.frm.sectCd;

		document.frm.sectCd.options.length = null;
		s_sel.options[0] = new Option("선택", "");
		var selInd = 1;
		for(var i=0; i<list1.length; i+=3){ // 0부터 짝수는 이름, 1부터홀수는 코드
			if(obj == list1[i+2]){
				s_sel.options[selInd] = new Option(list1[i], list1[i+1]);
				selInd++;
			}
		}
		
	}
	$(document).ready(function(){
		selectedDpt($('#departCd').val());
		$('#sectCd').val($.trim('<c:out value='${resultVO.sectCd}'/>'));
	});
</script>

<body>

<form name="frm" method="post" action="<c:url value='/cop/com/updateBBSUseInf.do'/>">
<input type="hidden" id="staffCd" name="staffCd" value="<c:out value='${resultVO.staffCd}'/>"/>
<input name="selectDpt" type="hidden" value="sss"/>

<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>

<div class="content-body">
<div class="board-list">
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="게시판명, 커뮤니티/ 동호회명, 사용여부  입니다" >
		<tr>
			<th class="board-write-th">직원코드</th>
			<td class="board-write-td">
				<c:out value="${resultVO.staffCd}" />
			</td>
		</tr>
		<tr>
			<th class="board-write-th">직원 이름</th>
			<td class="board-write-td">
				<input type="text" name="staffNm" id="staffNm" class="input-text" value='<c:out value="${resultVO.staffNm}" />' />
			</td>
		</tr>
		<tr>
			<th class="board-write-th">직원 성 영문명</th>
			<td class="board-write-td">
				<input type="text" size="50" name="engLNm" id="engLNm" class="input-text" value='<c:out value="${resultVO.engLNm}" />' />
			</td>
		</tr>
		<tr>
			<th class="board-write-th">직원 이름 영문명</th>
			<td class="board-write-td">
				<input type="text" size="50" name="engNm" id="engNm" class="input-text" value='<c:out value="${resultVO.engNm}" />' />
			</td>
		</tr>
		<tr>
			<th class="board-write-th">부서명</th>
			<td class="board-write-td">
				<select name="departCd" id="departCd" onchange="selectedDpt(this.value)"  class="board-search-select" style="width:120px">
					<c:forEach var="departV" items="${ resultDptList}" varStatus="status">
					<option value="<c:out value='${departV.departCd }'/>" <c:if test="${departV.departCd == resultVO.departCd }">selected</c:if>><c:out value='${departV.departNm }'/></option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">과명</th>
			<td class="board-write-td">
				<select name="sectCd" id="sectCd" class="board-search-select" style="width:120px">
					<option value="">선택</option>
				</select>
			</td>
		</tr>
		<tr>
			<th class="board-write-th">이메일</th>
			<td class="board-write-td">
				<input type="text" size="50" name="staffEmail" id="staffEmail" class="input-text" value='<c:out value="${resultVO.staffEmail}" />' />
			</td>
		</tr>
		<tr>
			<th class="board-write-th">전화번호</th>
			<td class="board-write-td">
				<input type="text" size="50" name="staffTel" id="staffTel" class="input-text" value='<c:out value="${resultVO.staffTel}" />' />
			</td>
		</tr>
		<tr>
			<th class="board-write-th">핸드폰</th>
			<td class="board-write-td">
				<input type="text" size="50" name="staffMobile" id="staffMobile" class="input-text" value='<c:out value="${resultVO.staffMobile}" />' />
			</td>
		</tr>
		<tr>
			<th class="board-write-th">업무</th>
			<td class="board-write-td">
				<input type="text" size="50" name="staffWork" id="staffWork" class="input-text" value='<c:out value="${resultVO.staffWork}" />' />
			</td>
		</tr>
		<tr>
			<th class="board-write-th">순서</th>
			<td class="board-write-td">
			 	<input type="text" name="staffOrdr" id="staffOrdr" class="input-text" value='<c:out value="${resultVO.staffOrdr}" />' />
			</td>
		</tr>
		<tr>
			<th class="board-write-th">설명</th>
			<td class="board-write-td">
				<textarea name="stComment" id="stComment" rows="8" cols="75" ><c:out value='${resultVO.stComment}'/></textarea>
			</td>
		</tr>
	</table>
</div>
</div>

<div class="text-center">
	<a href="<c:url value='/cop/com/selectCmsUserList.do?moveSite=ADMIN'/>" class="btn btn-default">목록</a>
	<a href="javascript:fn_egov_updt_CmsUserInf();" class="btn btn-primary">수정</a>
</div>

</form>
</body>
</html>
