<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
doDetailPopup = function(idx){
	alert(idx);
};
</script>
<table class="bbs_default list">
	<colgroup>
		<col style="width: 30%" />			
	</colgroup>
	<thead>			
	</thead>
	<tbody id="body_list" class="t_center list">
		<c:forEach var="result" items="${listData}" varStatus="status">
			<tr>
				<td>						
					●&nbsp;<a href="#none" onclick="doDetailPopup('<c:out value="${result.idx}"/>')"><c:out value="${result.kName}"/></a>
				</td>					
			</tr>
		</c:forEach>
	</tbody>
</table>