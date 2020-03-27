<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
 /**
  * @Class Name : KorSchdulInqire.jsp
  * @Description : 일정 상세 조회 화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.23   이삼섭          최초 생성
  * @ 2009.06.26   한성곤          2단계 기능 추가 (댓글관리, 만족도조사)
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.23
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>
<script type="text/javascript">

	$('document').ready(function(){
		onloading();
	});

	function onloading() {
		var strRegDt = "<c:out value='${result.regDt}'/>";

		var tmpStr = strRegDt.substr(0,4) + "-" + strRegDt.substr(4,2) + "-" + strRegDt.substr(6,2);
		document.frm.regDtStr.value = tmpStr ;
	}

	function fn_egov_select_schdulList() {
		document.frm.action = "<c:url value='/cop/com/selectScheduleList.do'/>";
		document.frm.submit();
	}

	function fn_egov_delete_schdul() {
		if (confirm('<spring:message code="common.delete.msg" />')) {
			document.frm.action = "<c:url value='/cop/com/deleteSchedule.do'/>";
			document.frm.submit();
		}
	}

	function fn_egov_moveUpdt_schdul() {
		document.frm.action = "<c:url value='/cop/com/updateScheduleArticle.do'/>";
		document.frm.submit();
	}
	<c:if test="${!empty resultMsg}">alert("<c:out value='${resultMsg}'/>");</c:if>
	
</script>
</head>

<form name="frm" method="post" action="">
<input type="hidden" name="regDt" id="regDt" value="<c:out value='${result.regDt }'/>"/>
<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />






<div id="contents">
	<table class="bbs_default write" border="1">
	<caption>주요행사일정 상세조회</caption>
	<colgroup>
			<col width="20%" />
			<col width="80%" />
	</colgroup>
	<tbody>
		<tr>
		    <th scope="row"><label for="">일시</label></th>
		    <td> 
		    	<input name="regDtStr" type="text" size="10" value=""  readOnly>
		    </td>
		</tr>
		<tr>
		  	<th scope="row"><label for="">부서명</label></th>
		  	<td>
				<select id="departCd" name="departCd">
					<option value="">선택</option>
					<c:forEach var="departVO" items="${resultDptList }" varStatus="status">
	  					<option value="<c:out value='${departVO.departCd }'/>" <c:if test="${departVO.departCd == result.departCode}">selected</c:if>><c:out value='${departVO.departNm }'/></option>
	  				</c:forEach>
				</select>
	  		</td>
		</tr>		
		<tr>
		  	<th scope="row"><label for="">과명</label></th>
		  	<td>
		      	<select name="sectCd">
			  				<option value="">선택</option>
			  			<c:forEach var="sectVO" items="${resultSectList }" varStatus="status">
			  				<option value="<c:out value='${sectVO.sectCd }'/>" <c:if test="${sectVO.sectCd == result.sectCode}">selected</c:if>><c:out value='${sectVO.sectNm }'/></option>
			  			</c:forEach>
			  		</select>
	  		</td>
		</tr>
		<tr>
			<th scope="row"><label for="">순서</label><span title="필수입력">*</span></th>
			<td>
				<input type="text" name="seq" id="seq" value="<c:out value='${result.seq }'/>" readOnly/>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="">시간</label><span title="필수입력">*</span></th>
			<td>
				<input type="text" name="time" id="time" value="<c:out value='${result.time }'/>"/>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="">장소</label><span title="필수입력">*</span></th>
			<td>
				<input type="text" name="place" id="place" value="<c:out value='${result.place }'/>"/>
			</td>
		</tr>				
		<tr>
			<td class="board-write-editor" colspan="2">
				<textarea id="explane" name="explane" class="textarea-board" cols="50" rows="6"><c:out value='${result.explane }'/></textarea>
			</td>
		</tr>	
	</tbody>
	</table>
	<div class="t_center mt20">
		
		<a href="#none" onclick="fn_egov_select_schdulList();" class="btn gray">목록</a>

		<c:if test="${sessionUniqId != null }">
			<a href="#none" onclick="fn_egov_moveUpdt_schdul();" class="btn gray">수정</a>
			<a href="#none" onclick="fn_egov_delete_schdul();" class="btn gray">삭제</a>
	     </c:if>
		
	</div>	
</div>


<!-- //내용 -->
</form>
