<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_userInfo('1');
		}
	}

	function fn_egov_select_userInfo(pageIndex) {
		
		var _target = document.frm.targetMethod.value;
		var actionUrl;

		if (_target == 'selectClubOprtrList') {
			actionUrl = "<c:url value='/cop/com/selectClubOprtrList.do'/>";
		} else if (_target == 'selectClubUserList') {
			actionUrl = "<c:url value='/cop/com/selectClubUserList.do'/>";
		} else if (_target == 'selectCmmntyMngrList') {
			actionUrl = "<c:url value='/cop/com/selectCmmntyMngrList.do'/>";
		} else if (_target == 'selectCmmntyUserList') {
			actionUrl = "<c:url value='/cop/com/selectCmmntyUserList.do'/>";
		} else {
			actionUrl = "<c:url value='/cop/com/selectNierUserList.do'/>?moveSite=<c:out value='${moveSite}'/>";
		}
		document.frm.pageIndex.value = pageIndex;
		document.frm.action = actionUrl;
		document.frm.submit(); 
	}

	function fn_egov_deleteUser(emplyrId) {
		var _target = document.frm.targetMethod.value;
		var url;

		if (confirm('<spring:message code="cop.withdraw.msg" />')) {

			if (_target == 'selectCmmntyUserList') {
				url = "<c:url value='/cop/com/deleteCmmntyUser.do'/>";
				document.frm.param_cmmntyId.value = document.frm.trgetId.value;
			} else if (_target == 'selectClubUserList') {
				url = "<c:url value='/cop/com/deleteClbUser.do'/>";
				document.frm.param_clbId.value = document.frm.trgetId.value;
			}
			document.frm.param_emplyrId.value = emplyrId;
			document.frm.action = url;
			document.frm.submit();
		}
	}

	function fn_egov_reRegistUser(emplyrId){
		var _target = document.frm.targetMethod.value;
		var url;

		if (confirm('<spring:message code="cop.reregist.msg" />')) {
			if (_target == 'selectCmmntyUserList') {
				url = "<c:url value='/cop/com/reRegistCmmntyUser.do'/>";
				document.frm.param_cmmntyId.value = document.frm.trgetId.value;
			} else if (_target == 'selectClubUserList') {
				url = "<c:url value='/cop/com/reRegistClbUser.do'/>";
				document.frm.param_clbId.value = document.frm.trgetId.value;
			}

			document.frm.param_emplyrId.value = emplyrId;
			document.frm.action = url;
			document.frm.submit();
		}
	}

	function fn_egov_registManager(emplyrId) {
		var _target = document.frm.targetMethod.value;
		var url;

		if (confirm('<spring:message code="cop.registmanager.msg" />')) {
			if (_target == 'selectCmmntyUserList') {
				url = "<c:url value='/cop/com/registCmmntyManager.do'/>";
				document.frm.param_cmmntyId.value = document.frm.trgetId.value;
			} else if (_target == 'selectClubUserList') {
				url = "<c:url value='/cop/com/registClbOprtr.do'/>";
				document.frm.param_clbId.value = document.frm.trgetId.value;
			}
			document.frm.param_emplyrId.value = emplyrId;
			document.frm.action = url;
			document.frm.submit();
		}
	}
</script>
<!-- content-body -->
<div class="content-body">
	<div class="board-search">
		<form name="frm" action ="" method="get">
		<input type="hidden" name="targetMethod" value="<c:out value='${targetMethod}'/>" />
		<input type="hidden" name="trgetId" value="<c:out value='${trgetId}'/>" />
		<input type="hidden" name="param_emplyrId" />
		<input type="hidden" name="param_cmmntyId" />
		<input type="hidden" name="param_clbId" />
		<input type="hidden" name="searchCnd" value="0"/>
		
		<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
		<input type="hidden" name="moveSite" id="moveSite" value="ENG" />
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			<fieldset>
				<legend>콘텐츠 검색</legend>
				<select id="departCd" name="departCd" class="board-search-select">
						<option value="00000000" <c:if test="${fullDepartSearch =='00000000' }">selected</c:if>>ALL</option>
						<option value="00100000" <c:if test="${fullDepartSearch =='00100000' }">selected</c:if>>Environmental Health Research Department </option>
						<option value="00100030" <c:if test="${fullDepartSearch =='00100030' }">selected</c:if>>Risk Assessment Division</option>
						<option value="00100040" <c:if test="${fullDepartSearch =='00100040' }">selected</c:if>>Environmental Health Research Division</option>
						<option value="00100050" <c:if test="${fullDepartSearch =='00100050' }">selected</c:if>>Chemicals Research Division </option>
						<option value="00200000" <c:if test="${fullDepartSearch =='00200000' }">selected</c:if>>Climate & Air Quality Research Department </option>
						<option value="00200060" <c:if test="${fullDepartSearch =='00200060' }">selected</c:if>>Air Quality Research Division</option>
						<option value="00200070" <c:if test="${fullDepartSearch =='00200070' }">selected</c:if>>Global Environment Research Division</option>
						<option value="00200080" <c:if test="${fullDepartSearch =='00200080' }">selected</c:if>>Air Pollution Engineering Division</option>
						<option value="00200450" <c:if test="${fullDepartSearch =='00200450' }">selected</c:if>>Air Quality Monitoring & Forecasting Center</option>
						<option value="00300000" <c:if test="${fullDepartSearch =='00300000' }">selected</c:if>>Water Environment Research Department </option>
						<option value="00300090" <c:if test="${fullDepartSearch =='00300090' }">selected</c:if>>Water Environmental Engineering Research Division</option>
						<option value="00300100" <c:if test="${fullDepartSearch =='00300100' }">selected</c:if>>Watershed and Total Load Management Research Division</option>
						<option value="00300110" <c:if test="${fullDepartSearch =='00300110' }">selected</c:if>>Water Quality Assessment Research Division</option>
						<option value="00400000" <c:if test="${fullDepartSearch =='00400000' }">selected</c:if>>Environmental Resources Research Department </option>
						<option value="00400120" <c:if test="${fullDepartSearch =='00400120' }">selected</c:if>>Resource Recirculation Research Division</option>
						<option value="00400130" <c:if test="${fullDepartSearch =='00400130' }">selected</c:if>>Waste to Energy Research Division</option>
						<option value="00400140" <c:if test="${fullDepartSearch =='00400140' }">selected</c:if>>Natural Environment Research Division</option>
						<option value="00500000" <c:if test="${fullDepartSearch =='00500000' }">selected</c:if>>Environmental Infrastructure Research Department </option>
						<option value="00500150" <c:if test="${fullDepartSearch =='00500150' }">selected</c:if>>Indoor Environment & Noise Research Division</option>
						<option value="00500160" <c:if test="${fullDepartSearch =='00500160' }">selected</c:if>>Water Supply & Sewerage Research Division</option>
						<option value="00500170" <c:if test="${fullDepartSearch =='00500170' }">selected</c:if>>Environmental Measurement & Analysis Center</option>
						<option value="00500230" <c:if test="${fullDepartSearch =='00500230' }">selected</c:if>>Soil & Groundwater Research  Division</option>
						<option value="00600000" <c:if test="${fullDepartSearch =='00600000' }">selected</c:if>>Transportation Pollution Research Center</option>
						<option value="00700000" <c:if test="${fullDepartSearch =='00700000' }">selected</c:if>>Han River Environment Research Center</option>
						<option value="00800000" <c:if test="${fullDepartSearch =='00800000' }">selected</c:if>>Geum River Environment Research Center</option>
						<option value="00900000" <c:if test="${fullDepartSearch =='00900000' }">selected</c:if>>Nakdong River  Environment Research Center</option>
						<option value="01000000" <c:if test="${fullDepartSearch =='01000000' }">selected</c:if>>Yeongsan River Environment Research Center</option>
						<option value="00000010" <c:if test="${fullDepartSearch =='00000010' }">selected</c:if>>Research Support Division</option>
						<option value="00000020" <c:if test="${fullDepartSearch =='00000020' }">selected</c:if>>Research Strategy & Planning Division</option>
						<option value="00000240" <c:if test="${fullDepartSearch =='00000240' }">selected</c:if>>National Wetlands Center</option>
				</select>				
				<input type="text" name="searchWrd" id="searchWrd" title="Search Word Input" class="board-search-keyword" value="<c:out value="${searchVO.searchWrd}"/>" style="ime-mode:active;" />
				<input type="submit" value="Search" id="board-search-submit" class="btn btn-sm btn-default" />
			</fieldset>
		</form>
	</div>
	<h2 class="content-title">
	 <img src="/images/han/content-bullet.png" alt="courser" />STAFF SEARCH
	</h2>
	<div class="board-list">
		<table class="board-default" summary="">
			<colgroup>
				<col style="width:160px" />
				<col />
				<col style="width:200px" />
			</colgroup>
			<thead>
				<tr>
					<th class="board-default-th-no">NAME</th>
					<th class="board-default-th">POST</th>
					<th class="board-default-th-attach">TEL</th>
				</tr>
			</thead>
			<tbody>
				<!-- 루프영역 -->
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td class="board-default-td-no"><c:out value="${result.engNm}"/> <c:out value="${result.engLNm}"/></td>
						<td class="board-default-td-title">
						<c:choose>
							<c:when test="${result.sectEng != '' and not empty result.sectEng}">
								<c:out value="${result.sectEng}"/>
							</c:when>
							<c:otherwise>
								<c:out value="${result.departEng}"/>
							</c:otherwise>
						</c:choose>
						</td>
						<td class="board-default-td-attach"><c:out value="${result.staffTel}"/></td>
					</tr>
				</c:forEach>
				<c:if test="${fn:length(resultList) == 0}">
					  <tr>
					    <td class="board-default-td-title" nowrap colspan="3" style="text-align:center;" >Not Found</td>
					  </tr>
				 </c:if>
				<!-- //루프영역 -->
			</tbody>
		</table>
	</div>
	<div class="board-footer">
		<div class="pagenavi">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_userInfo" />
		</div>
	</div>
</div>
<!-- //content-body -->

