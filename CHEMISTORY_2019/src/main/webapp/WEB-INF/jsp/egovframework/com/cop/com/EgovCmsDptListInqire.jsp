<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>
<script type="text/javascript">

	function fn_egov_updt_CmsDptInf(){
		document.frm.action = "<c:url value='/cop/com/selectCmsDptDetailSelectUpdt.do'/>";
		document.frm.submit();
	}
	function fn_egov_select_bbsUseInfs(){
		document.frm.action = "<c:url value='/cop/com/selectBBSUseInfs.do'/>";
		document.frm.submit();
	}

</script>

<body>
<form name="frm" method="post" action="<c:url value='/cop/com/updateBBSUseInf.do'/>">
<input type="hidden" id="departCd" name="departCd" value="<c:out value='${resultVO.departCd}'/>"/>
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>

<div class="content-body">
<div class="board-list">

	<table class="board-write">
   	<caption>부서 등록</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">부서코드</th>
				<td class="board-write-td"><c:out value="${resultVO.departCd}" /></td>
			</tr>
			<tr>
				<th class="board-write-th">부서명</th>
				<td class="board-write-td">
					<input type="text" class="input-text" size="50" name="departNm" id="departNm" value='<c:out value="${resultVO.departNm}" />' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">부서 영문명</th>
				<td class="board-write-td">
					<input type="text" class="input-text" size="50" name="departEng" id="departEng" value='<c:out value="${resultVO.departEng}" />' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">사용여부</th>
				<td class="board-write-td">
				 	사용&nbsp;&nbsp;<input type="radio" name="useyn" class="radio2" value="1" <c:if test="${resultVO.useyn == '1'}"> checked="checked"</c:if>>&nbsp;&nbsp;
					미사용&nbsp;&nbsp;<input type="radio" name="useyn" class="radio2" value="0" <c:if test="${resultVO.useyn == '0'}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<th class="board-write-th">순서</th>
				<td class="board-write-td">
				 	<input type="text" name="orders" id="orders" class="input-text" value='<c:out value="${resultVO.orders}" />' />
				</td>
			</tr>
			<tr>
				<th class="board-write-th">설명</th>
				<td class="board-write-td">
				 	<textarea name="comments" id="comments" rows="8" cols="75" ><c:out value='${resultVO.comments}'/></textarea>
				</td>	
			</tr>
		</tbody>
	</table>
</div>
</div>

<div align="center">
	<a href="<c:url value='/cop/com/selectCmsDptList.do'/>" class="btn btn-default">목록</a>
	<a href="javascript:fn_egov_updt_CmsDptInf();" class="btn btn-primary">저장</a>
</div>

</form>
</body>
</html>
