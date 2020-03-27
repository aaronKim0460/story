<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeNew.jsp" %>
</c:if>

<%pageContext.setAttribute("crlf", "\r\n"); %> 

<script type="text/javascript">
//alert("KorSchdulList.jsp");
<!--
	function submitFrm(obj)
	{
		return true;
	}
	
	function submitFrmSchedule(yearStr, monthStr, dayStr){
		document.frm.yearStr.value = yearStr;
		document.frm.monthStr.value = monthStr;
		document.frm.dayStr.value = dayStr;
		document.frm.action = "<c:url value='/user/cop/com/selectScheduleList.do'/>";
		document.frm.submit();
	}
	
	function fn_egov_schdulInqire(stRegdt, stSeq, deptCd, sectCd){
		document.frm.regDt.value = stRegdt;
		document.frm.seqStr.value = stSeq;
		document.frm.departCode.value = deptCd;
		document.frm.sectCode.value = sectCd;
		document.frm.action = "<c:url value='/user/cop/com/selectSchedule.do'/>";
		document.frm.submit();
	}
//-->
</script>
<form name="frm" id="frm">
<input type="hidden" name="yearStr" id="yearStr" value=""/>
<input type="hidden" name="monthStr" id="monthStr" value=""/>
<input type="hidden" name="dayStr" id="dayStr" value=""/>
<input type="hidden" name="regDt" id="regDt" value=""/>
<input type="hidden" name="seqStr" id="seqStr" value=""/>
<input type="hidden" name="departCode" id="departCode" value=""/>
<input type="hidden" name="sectCode" id="sectCode" value=""/>

<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
<div id="contents">
	<!-- 본문내용 시작  -->
	<div class="calendar">
		<div class="clearfix">
			<div class="cal_left">
				<div class="month">
					<c:out value='${year}'/>년 <c:out value='${month}'/>월 <a href="javascript:submitFrmSchedule(<c:out value='${prevyear}'/>,<c:out value='${prevmonth}'/>,'');" class="prev"><img
						src="/images/bbs/cal_prev.png" alt="이전 월 이동" /></a> <a href="javascript:submitFrmSchedule(<c:out value='${nextyear}'/>,<c:out value='${nextmonth}'/>,'')"
						class="next"><img src="/images/bbs/cal_next.png" alt="다음 월 이동" /></a>
				</div>
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="curday" />
				<table class="table_cal" summary="일,월,화,수,목,금,토로 구성된 달력 테이블">
					<caption>행사일정 달력</caption>
					<thead>
						<tr>
							<th scope="col">일</th>
							<th scope="col">월</th>
							<th scope="col">화</th>
							<th scope="col">수</th>
							<th scope="col">목</th>
							<th scope="col">금</th>
							<th scope="col">토</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${dayList}" var="day" varStatus="status">
					<c:set var="selDay" >${year}${(month < 10) ? 0 : ''}${month}${(day.day < 10) ? 0 : ''}${day.day}</c:set>
					<c:if test="${status.count %7 == 1}"><tr></c:if>
					<c:choose>
						<c:when test="${day.day == 0}">
							<td>&nbsp;</td>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${status.count%7 == 1}">
									<td <c:if test="${selDay eq curday}">class="today"</c:if><c:if test="${selDay ne curday}">class="sunday"</c:if>><c:out value='${day.day}'/></td>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${day.reserve == 1}">
											<td <c:if test="${selDay eq curday}">class="today"</c:if>><a href="javascript:submitFrmSchedule(<c:out value='${day.year}'/>,<c:out value='${day.month}'/>,<c:out value='${day.day}'/>)"><c:out value='${day.day}'/></a></td>
										</c:when>
										<c:otherwise>
											<td <c:if test="${selDay eq curday}">class="today"</c:if>><c:out value='${day.day}'/></td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<c:if test="${status.count%7 == 0}"></tr></c:if>
					</c:forEach>
					</tbody>
				</table>

			</div>
			<div class="cal_right">
				<c:set var="selDay2" >${year}${(month < 10) ? 0 : ''}${month}${(day < 10) ? 0 : ''}${day}</c:set>
				<h2 class="h0"><c:out value='${fn:substring(selDay2, 4,6)}'/>월 <c:out value='${fn:substring(selDay2, 6,8)}'/>일 일정</h2>
				<div class="list_frame" tabindex="0">

				    <!-- <p class="empty">오늘 일정이 없습니다.</p>  -->
					<!-- 루프영역 -->
					<c:choose>
						<c:when test="${fn:length(eventList) > 0}">
							<ul class="list">
							<c:forEach items="${eventList}" var="row" varStatus="status">
							<li>
							<c:choose>
								<c:when test="${sessionUniqId != null && fn:length(sessionUniqId) > 0}">
								<c:if test="${fn:length(tilesPrefix) < 1 && empty param.moveSite}">
									<a href="javascript:fn_egov_schdulInqire('<c:out value='${row.regDt }'/>','<c:out value='${row.seq }'/>', '<c:out value='${row.departCode }'/>', '<c:out value='${row.sectCode }'/>');">시간 : <c:out value='${row.time}'/></a>
								</c:if>
								</c:when>
								<c:otherwise>
								시간 : <c:out value='${row.time}'/>
								</c:otherwise>
							</c:choose>
							<br />
							<c:choose>
								<c:when test="${row.sectCode eq '0000'}">
									<c:choose>
										<c:when test="${row.departCode eq '0000'}">
										-부서 : <br />
										</c:when>
										<c:otherwise>
										-부서 : <c:out value='${row.departName}'/><br />
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
								-부서 : <c:out value='${row.sectName}'/><br />
								</c:otherwise>
							</c:choose>
							-장소 : <c:out value='${row.place}'/><br />-일정 : <c:out value='${fn:replace(row.explane,crlf,"<BR/>")}' escapeXml="false"/></li> 
						</c:forEach>
						</ul>
						</c:when>
					<c:otherwise>
					<p class="empty">오늘 일정이 없습니다.</p>
					</c:otherwise>
					</c:choose>
					<!-- //루프영역 -->
<!-- 										
						<li><strong>오전 9시 20분</strong><br /> - 부서 : 기후대기연구부<br /> -
							장소 : 소회의실<br /> - 일정 : 간부회의</li>
						<li><strong>오전 9시 20분</strong><br /> - 부서 : 기후대기연구부<br /> -
							장소 : 소회의실<br /> - 일정 : 간부회의</li>
						<li><strong>오전 9시 20분</strong><br /> - 부서 : 기후대기연구부<br /> -
							장소 : 소회의실<br /> - 일정 : 간부회의</li> -->
					
				</div>

				<div class="btn_day">
					<a href="javascript:submitFrmSchedule(<c:out value='${prevDayDisp}'/>)">이전일</a> <a href="javascript:submitFrmSchedule(<c:out value='${nextDayDisp}'/>)">다음일</a>
				</div>

			</div>


		</div>
	</div>
</div>
</form>
<!-- //contents -->