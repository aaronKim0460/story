<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp" %>

<script type="text/javascript">

$(document).ready(function(){
});
</script>

<form name="frm" id="frm" method="post">
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />

<div id="contents">		
	<div class="tableBtn clearfix">
	</div>
	<table class="bbs_default list">
		<colgroup>
			<col style="width:16%" />
			<col style="width:*" />
			<col style="width:16%" />
			<col style="width:18%" />
			<col style="width:16%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">순번</th>
				<th scope="col">놀이시설명</th>
				<th scope="col">지역</th>
				<th scope="col">설치장소</th>								
				<th scope="col">처분코드명</th>
			</tr>
		</thead>
		<tbody>
			<!-- Open API 결과 출력 -->
        </tbody>
	</table>
</div><!-- //contents -->
</form>