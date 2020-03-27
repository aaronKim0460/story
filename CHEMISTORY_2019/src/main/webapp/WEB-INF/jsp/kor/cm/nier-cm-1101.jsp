<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="./conf/properties.jsp" %>
<%@ include file="./comm/TotalSearchCmd.jsp" %>
<%@ include file="./comm/PopularKey.jsp" %>
<script type="text/javascript" src="/js/kor/dq_common.js"></script>

<div id="contents">
	<div class="search_unite">
		<form name="<% if(detail==null || detail.equals("0")) { %>formSearch<% } else { %>detailSearch<% } %>" method="post" action="<%=pageName%>">
			<input type="hidden" name="pageSn" value="<%=pageSn%>" /> <!-- 페이지시작  -->
			
			<input type="hidden" name="orderSet" value="<%=orderSet%>" /> <!--정렬  -->
			<input type="hidden" name="prevQuery" value="<%=prevQuery%>" /> <!--이전 검색어  -->
			<input type="hidden" name="prevQuery_tmp" value="<%=prevQuery_tmp%>" /> <!--이전 임시 검색어  -->
			<input type="hidden" name="staffPrevQuery" value="<%=staffPrevQuery%>" /> <!-- 직원검색 재검색 -->
			<input type="hidden" name="nierPrevQuery" value="<%=nierPrevQuery%>" /> <!-- 어린이 환경과 건강포털 국문 재검색 -->
			<input type="hidden" name="atmoPrevQuery" value="<%=atmoPrevQuery%>" /> <!-- 대기분야 재검색 -->
			<input type="hidden" name="waterPrevQuery" value="<%=waterPrevQuery%>" /> <!-- 수질분야 재검색 -->
			<input type="hidden" name="ecoPrevQuery" value="<%=ecoPrevQuery%>" /> <!-- 자연상태분야 재검색 -->
			<input type="hidden" name="healthPrevQuery" value="<%=healthPrevQuery%>" /> <!-- 환경보건분야 재검색 -->
			<input type="hidden" name="chemPrevQuery" value="<%=chemPrevQuery%>" /> <!-- 화학물질분야 재검색 -->
			<input type="hidden" name="tprcPrevQuery" value="<%=tprcPrevQuery%>" /> <!-- 교통환경분야 재검색 -->
			<input type="hidden" name="allPrevQuery" value="<%=allPrevQuery%>" />
			<input type="hidden" name="detail" value="<%=detail %>" /> <!-- 상세검색 체크 --> 
			<input type="hidden" name="srhRange" value="<%=srhRange %>" /> <!-- 검색범위 -->
			<input type="hidden" name="orderSet" value="<%=orderSet %>" /> <!-- 정렬순서 -->
			<input type="hidden" name="sday" value="<%=sday %>" /> <!-- 시작일 -->
			<input type="hidden" name="eday" value="<%=eday %>" /> <!-- 종료일 -->
			<input type="hidden" name="srhDate" value="<%=srhDate %>" /> <!-- 종료일 -->
			
			<fieldset>
				<legend>게시물 검색</legend>
				<p>
					<span> <select name="category" id="a" title="검색 구분 선택" class="select_list">
							<option value="total" <% if(category.equals("total") || category.equals("")){%>  selected="selected" <%}%>>전체검색</option>
							<option value="staff" <% if(category.equals("staff")){%>  selected="selected" <%}%>>직원검색</option>
							<option value="nier" <% if(category.equals("nier")){%>  selected="selected" <%}%>>어린이 환경과 건강포털</option>
							<!--<option value="atmo" <% if(category.equals("atmo")){%>  selected="selected" <%}%>>대기분야</option>
							<option value="water" <% if(category.equals("water")){%>  selected="selected" <%}%>>수질분야</option>
							<option value="eco" <% if(category.equals("eco")){%>  selected="selected" <%}%>>자연생태분야</option>
							<option value="health" <% if(category.equals("health")){%>  selected="selected" <%}%>>환경보건분야</option>
							<option value="chem" <% if(category.equals("chem")){%>  selected="selected" <%}%>>화학물질분야</option>
							<option value="tprc" <% if(category.equals("tprc")){%>  selected="selected" <%}%>>교통환경분야</option>-->
					</select>
					</span> <span> <label for="" class="skip">검색단어입력</label> <input
						type="text" name="query" id="query" value="<%=query %>" class="text" title="검색단어입력"
						onfocus="this.value=''" style="width: 400px;">
					</span> <span> <a href="#" onclick="<% if(detail==null || detail.equals("0")) { %>javascript:search_tab();<% } else { %>javascript:search_detail();<% } %>" title="검색" class="btnSearch">검색</a></span> 
					<% if(detail.equals("1")){%>
					<span class="right"> <a href="<%=pageName%>&query=<%=query%>&category=<%=category%>&detail=0" class="btn01LL btngreen">단순검색
							<img src="/assets/kor/images/bbs/ic_searchunit.gif" alt="검색" />
					</a>
					</span>
					<% }else{ %>
					<span class="right"> <a href="<%=pageName%>&query=<%=query%>&category=<%=category%>&detail=1" class="btn01LL btngreen">상세검색
							<img src="/assets/kor/images/bbs/ic_searchunit.gif" alt="검색" />
					</a>
					</span>
					<% } %>
				</p>
				<% if(detail.equals("1")){%>
				<div class="detail clearfix">
					<label>검색기간</label>
					<ul class="btngroup">
						<li <%if(srhDate.equals("")){ %>class="on"<%}%>><a href="<%=pageName%>&query=<%=query%>&category=<%=category%>&detail=<%=detail%>&detail=<%=detail%>&orderSet=<%=orderSet%>&srhRange=<%=srhRange%>">전체</a></li>
						<li <%if(srhDate.equals("0")){ %>class="on"<%}%>><a href="#" onclick="setDate('0');">1일</a></li>
						<li <%if(srhDate.equals("1")){ %>class="on"<%}%>><a href="#" onclick="setDate('1');">1주일</a></li>
						<li <%if(srhDate.equals("2")){ %>class="on"<%}%>><a href="#" onclick="setDate('2');">1개월</a></li>
						<li <%if(srhDate.equals("4")){ %>class="on"<%}%>><a href="#" onclick="setDate('4');">1년</a></li>
					</ul>
					<label><input type="radio" name="srhDateDirect" id="k" value="3" <%if(srhDate.equals("3")){ %> checked="checked" <%}%> onClick="javascript:setDate('3');" /> 직접입력</label> <span> 
						<select name="syear" title="검색할 시작년도 선택" <%if(!srhDate.equals("3")){ %> disabled="disabled" <%}%> class="select_list">
							<option value="" <%if(syear.equals("")){ %> selected="selected" <%}%>></option>
							<option value="2010" <%if(syear.equals("2014")){ %> selected="selected" <%}%>>2014년</option>
							<option value="2010" <%if(syear.equals("2013")){ %> selected="selected" <%}%>>2013년</option>
							<option value="2010" <%if(syear.equals("2012")){ %> selected="selected" <%}%>>2012년</option>
							<option value="2010" <%if(syear.equals("2011")){ %> selected="selected" <%}%>>2011년</option>
							<option value="2010" <%if(syear.equals("2010")){ %> selected="selected" <%}%>>2010년</option>
							<option value="2009" <%if(syear.equals("2009")){ %> selected="selected" <%}%>>2009년</option>
							<option value="2008" <%if(syear.equals("2008")){ %> selected="selected" <%}%>>2008년</option>
							<option value="2007" <%if(syear.equals("2007")){ %> selected="selected" <%}%>>2007년</option>
						</select>
						<select name="smonth" title="검색할 시작월 선택" <%if(!srhDate.equals("3")){ %> disabled="disabled" <%}%> class="select_list">
							<option value="" <%if(smonth.equals("")){ %> selected="selected" <%}%>></option>
							<option value="01" <%if(smonth.equals("01")){ %> selected="selected" <%}%>>01월</option>
							<option value="02" <%if(smonth.equals("02")){ %> selected="selected" <%}%>>02월</option>
							<option value="03" <%if(smonth.equals("03")){ %> selected="selected" <%}%>>03월</option>
							<option value="04" <%if(smonth.equals("04")){ %> selected="selected" <%}%>>04월</option>
							<option value="05" <%if(smonth.equals("05")){ %> selected="selected" <%}%>>05월</option>
							<option value="06" <%if(smonth.equals("06")){ %> selected="selected" <%}%>>06월</option>
							<option value="07" <%if(smonth.equals("07")){ %> selected="selected" <%}%>>07월</option>
							<option value="08" <%if(smonth.equals("08")){ %> selected="selected" <%}%>>08월</option>
							<option value="09" <%if(smonth.equals("09")){ %> selected="selected" <%}%>>09월</option>
							<option value="10" <%if(smonth.equals("10")){ %> selected="selected" <%}%>>10월</option>
							<option value="11" <%if(smonth.equals("11")){ %> selected="selected" <%}%>>11월</option>
							<option value="12" <%if(smonth.equals("12")){ %> selected="selected" <%}%>>12월</option>
						</select> ~ <select name="eyear" title="검색할 마지막년도 선택" <%if(!srhDate.equals("3")){ %> disabled="disabled" <%}%>  class="select_list">
							<option value="" <%if(eyear.equals("")){ %> selected="selected" <%}%>></option>
							<option value="2010" <%if(eyear.equals("2014")){ %> selected="selected" <%}%>>2014년</option>
							<option value="2010" <%if(eyear.equals("2013")){ %> selected="selected" <%}%>>2013년</option>
							<option value="2010" <%if(eyear.equals("2012")){ %> selected="selected" <%}%>>2012년</option>
							<option value="2010" <%if(eyear.equals("2011")){ %> selected="selected" <%}%>>2011년</option>
							<option value="2010" <%if(eyear.equals("2010")){ %> selected="selected" <%}%>>2010년</option>
							<option value="2009" <%if(eyear.equals("2009")){ %> selected="selected" <%}%>>2009년</option>
							<option value="2008" <%if(eyear.equals("2008")){ %> selected="selected" <%}%>>2008년</option>
							<option value="2007" <%if(eyear.equals("2007")){ %> selected="selected" <%}%>>2007년</option>
						</select>
						<select name="emonth" title="검색할 마지막월 선택" <%if(!srhDate.equals("3")){ %> disabled="disabled" <%}%>  class="select_list">
							<option value="" <%if(emonth.equals("")){ %> selected="selected" <%}%>></option>
							<option value="01" <%if(emonth.equals("01")){ %> selected="selected" <%}%>>01월</option>
							<option value="02" <%if(emonth.equals("02")){ %> selected="selected" <%}%>>02월</option>
							<option value="03" <%if(emonth.equals("03")){ %> selected="selected" <%}%>>03월</option>
							<option value="04" <%if(emonth.equals("04")){ %> selected="selected" <%}%>>04월</option>
							<option value="05" <%if(emonth.equals("05")){ %> selected="selected" <%}%>>05월</option>
							<option value="06" <%if(emonth.equals("06")){ %> selected="selected" <%}%>>06월</option>
							<option value="07" <%if(emonth.equals("07")){ %> selected="selected" <%}%>>07월</option>
							<option value="08" <%if(emonth.equals("08")){ %> selected="selected" <%}%>>08월</option>
							<option value="09" <%if(emonth.equals("09")){ %> selected="selected" <%}%>>09월</option>
							<option value="10" <%if(emonth.equals("10")){ %> selected="selected" <%}%>>10월</option>
							<option value="11" <%if(emonth.equals("11")){ %> selected="selected" <%}%>>11월</option>
							<option value="12" <%if(emonth.equals("12")){ %> selected="selected" <%}%>>12월</option>
						</select>

					</span>
				</div>
				<% } %>
			</fieldset>
	</div>
	<!--//search_unite-->
	<%
		if(totalSize != 0) {	//검색결과가 있으면

		String fieldNm = "";
		String name = "";
		String staff_name = "";
		String work = "";
		String tel = "";
		String title = "";
		String content = "";
		String regdate = "";
		String regdate_tmp = "";
		String url = "";
		String col_nm = "";
		String board_nm = "";
		String type = "";
		
		
	%>
	<div class="unit_tit">
		"<span><%=query%></span>"에 대한 검색결과는 총 <span><%=totalSize%>건</span> 입니다.
		<% query = URLEncoder.encode(query, request.getCharacterEncoding()); %>
	</div>
	<div class="btnBoth unit_btngroup">
		<div class="btnLet">
			<ul class="btngroup green">
				<li <% if(orderSet==null || orderSet.equals("")) { %>class="on"<% } %>><a href="<%=pageName%>&query=<%=query%>&category=<%=category%>&detail=<%=detail%>&detail=<%=detail%>&orderSet=">정확도순</a></li>
				<li <% if(orderSet!=null && orderSet.equals("desc")) { %>class="on"<% } %>><a href="<%=pageName%>&query=<%=query%>&category=<%=category%>&detail=<%=detail%>&detail=<%=detail%>&orderSet=desc">최신순</a></li>
			</ul>
		</div>
		<div class="btnRight">
			<ul class="btngroup">
				<li <% if(srhRange==null || srhRange.equals("all")) { %>class="on"<% } %>><a href="<%=pageName%>&query=<%=query%>&category=<%=category%>&detail=<%=detail%>&detail=<%=detail%>&orderSet=<%=orderSet%>&srhRange=">전체</a></li>
				<li <% if(srhRange!=null && srhRange.equals("title")) { %>class="on"<% } %>><a href="<%=pageName%>&query=<%=query%>&category=<%=category%>&detail=<%=detail%>&detail=<%=detail%>&orderSet=<%=orderSet%>&srhRange=title">제목</a></li>
				<li <% if(srhRange!=null && srhRange.equals("content")) { %>class="on"<% } %>><a href="<%=pageName%>&query=<%=query%>&category=<%=category%>&detail=<%=detail%>&detail=<%=detail%>&orderSet=<%=orderSet%>&srhRange=content">본론</a></li>
				<!-- <li><a href="<%=pageName%>&query=<%=query%>&category=<%=category%>&detail=<%=detail%>&detail=<%=detail%>&orderSet=<%=orderSet%>&srhRange=content">파일명</a></li> -->
			</ul>
		</div>
	</div>
	</form>
	<!--//btnBoth-->
	
	<%
			//query = encodeURIComponent(query);
			
			if(category.equals("total") || category.equals("staff")){
				if(staffTotalSize > 0){
		%>
	<h2>
		직원 검색 <span class="subtxt">[검색결과 <%=staffTotalSize%>건]</span><span class="right"><a
			href="<%=pageName%>&query=<%=query%>&category=staff&researchFlag=<%=researchFlag%>&srhRange=<%=srhRange%>&srhDate=<%=srhDate%>&sday=<%=sday%>&eday=<%=eday%>&syear=<%=syear%>&smonth=<%=smonth%>&eyear=<%=eyear%>&emonth=<%=emonth%>&orderSet=<%=orderSet%>&detail=<%=detail%>&staffPrevQuery=<%=staffPrevQuery%>" class="btn03">검색결과 더보기 <img
				src="/assets/kor/images/common/ic_locationarrow.gif" alt="" /></a>
	</h2>
	<table class="table_t1" summary="직원검색결과">
		<caption>부서명, 이름, 담당업무, 전화번호 항목이 있습니다.</caption>
		<colgroup>
			<col width="" />
		</colgroup>
		<thead>
			<tr>
				<th>부서명</th>
				<th>이름</th>
				<th>담당업무</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody class="t_center">
			
			<%
				for (int i = 0; i < staffRealSize; i++){
					for(int j = 0; j < staffResult.getNumField(); j++){
						fieldNm = new String(getStaffSelectSet[j].getField());

						if(fieldNm.equals("NAME")){
							name = new String(staffResult.getResult(i, j));
						}else if(fieldNm.equals("STAFF_NAME")){
							staff_name = new String(staffResult.getResult(i, j));
						}else if(fieldNm.equals("WORK")){
							work = new String(staffResult.getResult(i, j));
						}else if(fieldNm.equals("TEL")){
							tel = new String(staffResult.getResult(i, j));
						}
					}
				%>
				<tr>
					<th><%=name%></th>
					<td><%=staff_name%></td>
					<td><%=work%></td>
					<td><%=tel%></td>
				</tr>
				<!-- 검색결과 루프영역 끝 -->
				<%
				}
				%>
		</tbody>
	</table>
	<%
				}
			}
						
		%>
		
		<!-- 어린이 환경과 건강포털 국문검색 시작-->
		<%
			if(category.equals("total") || category.equals("nier")){
				if(nierTotalSize > 0){
		%>
				<!-- 일반검색결과  제목, num -->
				<h2>
					어린이 환경과 건강포털 검색 <span class="subtxt">[검색결과 <%=nierTotalSize%>건]</span><span class="right"><a
						href="<%=pageName%>&query=<%=query%>&category=nier&researchFlag=<%=researchFlag%>&srhRange=<%=srhRange%>&srhDate=<%=srhDate%>&sday=<%=sday%>&eday=<%=eday%>&syear=<%=syear%>&smonth=<%=smonth%>&eyear=<%=eyear%>&emonth=<%=emonth%>&orderSet=<%=orderSet%>&detail=<%=detail%>&nierPrevQuery=<%=nierPrevQuery%>" class="btn03">검색결과 더보기 <img src="/assets/kor/images/common/ic_locationarrow.gif" alt="" /></a>
				</h2>	
				<!-- //일반검색결과 제목, num -->

				<ul class="search_resultList">
				<!-- 검색결과 루프영역 시작 -->
				<%
				for (int i = 0; i < nierRealSize; i++){
					for(int j = 0; j < nierResult.getNumField(); j++){
						fieldNm = new String(getNierSelectSet[j].getField());

						if(fieldNm.equals("TITLE")){
							title = new String(nierResult.getResult(i, j));
						}else if(fieldNm.equals("CONTENT")){
							content = new String(nierResult.getResult(i, j));
						}else if(fieldNm.equals("REGDATE")){
							regdate_tmp = new String(nierResult.getResult(i, j));
							if(regdate_tmp.equals("1970.01.01") || regdate_tmp.equals("")){
								regdate = "";
							}else{
								regdate = regdate_tmp.substring(0, 4) + "." + regdate_tmp.substring(4, 6) + "." + regdate_tmp.substring(6, 8) + " ";
							}
						}else if(fieldNm.equals("URL")){
							url = new String(nierResult.getResult(i, j));
						}else if(fieldNm.equals("COL_NM")){
							col_nm = new String(nierResult.getResult(i, j));
						}else if(fieldNm.equals("BOARD_NM")){
							board_nm = new String(nierResult.getResult(i, j));
						}else if(fieldNm.equals("TYPE")){
							type = new String(nierResult.getResult(i, j));
						}
					}
				%>
				<li>
					<div class="tit"><a href="<%=url%>" target="_blank" title="새창"><%=title%></a><span class="date"><% if(type.equals("D")){ %><%=regdate%><% } %></span> <span class="newpop"><a href="<%=url%>" target="_blank" title="새창" class="btn01 btndarkgray">새창</a></span></div>
					<div class="txt"><%=content%></div>
					<div class="txt2">출처 : <%=col_nm%> > <%=board_nm%> </div>
				</li>
				<%
				}		
				%>
				</ul>
				<!-- 검색결과 루프영역 끝 -->				
				<!-- //검색결과 -->
		<%
				}
			}
		%>
		<!-- 어린이 환경과 건강포털 국문검색 끝-->
		<!-- 대기분야 검색 시작-->
		<%
			if(schMenuNo.equals("45003") || category.equals("atmo")){
				if(atmoTotalSize > 0){
		%>
				<!-- 일반검색결과  제목, num -->
				<h2>
					대기분야 검색 <span class="subtxt">[검색결과 <%=atmoTotalSize%>건]</span><span class="right"><a
						href="<%=pageName%>&query=<%=query%>&category=nier&researchFlag=<%=researchFlag%>&srhRange=<%=srhRange%>&srhDate=<%=srhDate%>&sday=<%=sday%>&eday=<%=eday%>&syear=<%=syear%>&smonth=<%=smonth%>&eyear=<%=eyear%>&emonth=<%=emonth%>&orderSet=<%=orderSet%>&detail=<%=detail%>&nierPrevQuery=<%=nierPrevQuery%>" class="btn03">검색결과 더보기 <img src="/assets/kor/images/common/ic_locationarrow.gif" alt="" /></a>
				</h2>	
				<!-- //일반검색결과 제목, num -->

				<ul class="search_resultList">
				<!-- 검색결과 루프영역 시작 -->
				<%
				for (int i = 0; i < atmoRealSize; i++){
					for(int j = 0; j < atmoResult.getNumField(); j++){
						fieldNm = new String(getAtmoSelectSet[j].getField());

						if(fieldNm.equals("TITLE")){
							title = new String(atmoResult.getResult(i, j));
						}else if(fieldNm.equals("CONTENT")){
							content = new String(atmoResult.getResult(i, j));
						}else if(fieldNm.equals("REGDATE")){
							regdate_tmp = new String(atmoResult.getResult(i, j));
							if(regdate_tmp.equals("1970.01.01") || regdate_tmp.equals("")){
								regdate = "";
							}else{
								regdate = regdate_tmp.substring(0, 4) + "." + regdate_tmp.substring(4, 6) + "." + regdate_tmp.substring(6, 8) + " ";
							}
						}else if(fieldNm.equals("URL")){
							url = new String(atmoResult.getResult(i, j));
						}else if(fieldNm.equals("COL_NM")){
							col_nm = new String(atmoResult.getResult(i, j));
						}else if(fieldNm.equals("BOARD_NM")){
							board_nm = new String(atmoResult.getResult(i, j));
						}else if(fieldNm.equals("TYPE")){
							type = new String(atmoResult.getResult(i, j));
						}
					}
				%>
				<li>
					<div class="tit"><a href="<%=url%>" target="_blank" title="새창"><%=title%></a><span class="date"><% if(type.equals("D")){ %><%=regdate%><% } %></span> <span class="newpop"><a href="<%=url%>" target="_blank" title="새창" class="btn01 btndarkgray">새창</a></span></div>
					<div class="txt"><%=content%></div>
					<div class="txt2">출처 : <%=col_nm%> > <%=board_nm%> </div>
				</li>
				<%
				}		
				%>
				</ul>
				<!-- 검색결과 루프영역 끝 -->
		<%
				}
			}
		%>
		<!-- 대기분야 검색 끝-->
		<!-- 수질분야 검색 시작-->
		<%
			if(schMenuNo.equals("45004") || category.equals("water")){
				if(waterTotalSize > 0){
		%>
				<!-- 일반검색결과  제목, num -->
				<h2>
					수질분야 검색 <span class="subtxt">[검색결과 <%=waterTotalSize%>건]</span><span class="right"><a
						href="<%=pageName%>&query=<%=query%>&category=nier&researchFlag=<%=researchFlag%>&srhRange=<%=srhRange%>&srhDate=<%=srhDate%>&sday=<%=sday%>&eday=<%=eday%>&syear=<%=syear%>&smonth=<%=smonth%>&eyear=<%=eyear%>&emonth=<%=emonth%>&orderSet=<%=orderSet%>&detail=<%=detail%>&nierPrevQuery=<%=nierPrevQuery%>" class="btn03">검색결과 더보기 <img src="/assets/kor/images/common/ic_locationarrow.gif" alt="" /></a>
				</h2>	
				<!-- //일반검색결과 제목, num -->

				<ul class="search_resultList">
				<!-- 검색결과 루프영역 시작 -->
				<%
				for (int i = 0; i < waterRealSize; i++){
					for(int j = 0; j < waterResult.getNumField(); j++){
						fieldNm = new String(getWaterSelectSet[j].getField());

						if(fieldNm.equals("TITLE")){
							title = new String(waterResult.getResult(i, j));
						}else if(fieldNm.equals("CONTENT")){
							content = new String(waterResult.getResult(i, j));
						}else if(fieldNm.equals("REGDATE")){
							regdate_tmp = new String(waterResult.getResult(i, j));
							if(regdate_tmp.equals("1970.01.01") || regdate_tmp.equals("")){
								regdate = "";
							}else{
								regdate = regdate_tmp.substring(0, 4) + "." + regdate_tmp.substring(4, 6) + "." + regdate_tmp.substring(6, 8) + " ";
							}
						}else if(fieldNm.equals("URL")){
							url = new String(waterResult.getResult(i, j));
						}else if(fieldNm.equals("COL_NM")){
							col_nm = new String(waterResult.getResult(i, j));
						}else if(fieldNm.equals("BOARD_NM")){
							board_nm = new String(waterResult.getResult(i, j));
						}else if(fieldNm.equals("TYPE")){
							type = new String(waterResult.getResult(i, j));
						}
					}
				%>
				<li>
					<div class="tit"><a href="<%=url%>" target="_blank" title="새창"><%=title%></a><span class="date"><% if(type.equals("D")){ %><%=regdate%><% } %></span> <span class="newpop"><a href="<%=url%>" target="_blank" title="새창" class="btn01 btndarkgray">새창</a></span></div>
					<div class="txt"><%=content%></div>
					<div class="txt2">출처 : <%=col_nm%> > <%=board_nm%> </div>
				</li>
				<%
				}		
				%>
				</ul>
				<!-- 검색결과 루프영역 끝 -->
		<%
				}
			}
		%>
		<!-- 수질분야 검색 끝-->
		<!-- 자연상태분야 검색 시작-->
		<%
			if(schMenuNo.equals("45005") || category.equals("eco")){
				if(ecoTotalSize > 0){
		%>
				<!-- 일반검색결과  제목, num -->
				<h2>
					자연상태분야 검색 <span class="subtxt">[검색결과 <%=ecoTotalSize%>건]</span><span class="right"><a
						href="<%=pageName%>&query=<%=query%>&category=nier&researchFlag=<%=researchFlag%>&srhRange=<%=srhRange%>&srhDate=<%=srhDate%>&sday=<%=sday%>&eday=<%=eday%>&syear=<%=syear%>&smonth=<%=smonth%>&eyear=<%=eyear%>&emonth=<%=emonth%>&orderSet=<%=orderSet%>&detail=<%=detail%>&nierPrevQuery=<%=nierPrevQuery%>" class="btn03">검색결과 더보기 <img src="/assets/kor/images/common/ic_locationarrow.gif" alt="" /></a>
				</h2>	
				<!-- //일반검색결과 제목, num -->

				<ul class="search_resultList">
				<!-- 검색결과 루프영역 시작 -->
				<%
				for (int i = 0; i < ecoRealSize; i++){
					for(int j = 0; j < ecoResult.getNumField(); j++){
						fieldNm = new String(getEcoSelectSet[j].getField());

						if(fieldNm.equals("TITLE")){
							title = new String(ecoResult.getResult(i, j));
						}else if(fieldNm.equals("CONTENT")){
							content = new String(ecoResult.getResult(i, j));
						}else if(fieldNm.equals("REGDATE")){
							regdate_tmp = new String(ecoResult.getResult(i, j));
							if(regdate_tmp.equals("19700101") || regdate_tmp.equals("")){
								regdate = "";
							}else{
								regdate = regdate_tmp.substring(0, 4) + "." + regdate_tmp.substring(4, 6) + "." + regdate_tmp.substring(6, 8) + " ";
							}
						}else if(fieldNm.equals("URL")){
							url = new String(ecoResult.getResult(i, j));
						}else if(fieldNm.equals("COL_NM")){
							col_nm = new String(ecoResult.getResult(i, j));
						}else if(fieldNm.equals("BOARD_NM")){
							board_nm = new String(ecoResult.getResult(i, j));
						}else if(fieldNm.equals("TYPE")){
							type = new String(ecoResult.getResult(i, j));
						}
					}
				%>
				<li>
					<div class="tit"><a href="<%=url%>" target="_blank" title="새창"><%=title%></a><span class="date"><% if(type.equals("D")){ %><%=regdate%><% } %></span> <span class="newpop"><a href="<%=url%>" target="_blank" title="새창" class="btn01 btndarkgray">새창</a></span></div>
					<div class="txt"><%=content%></div>
					<div class="txt2">출처 : <%=col_nm%> > <%=board_nm%> </div>
				</li>
				<%
				}		
				%>
				</ul>
				<!-- 검색결과 루프영역 끝 -->
		<%
				}
			}
		%>
		<!-- 자연상태분야 검색 끝-->
		<!-- 환경보건분야 검색 시작-->
		<%
			if(schMenuNo.equals("45006") || category.equals("health")){
				if(healthTotalSize > 0){
		%>
				<!-- 일반검색결과  제목, num -->
				<h2>
					환경보건분야 검색 <span class="subtxt">[검색결과 <%=healthTotalSize%>건]</span><span class="right"><a
						href="<%=pageName%>&query=<%=query%>&category=nier&researchFlag=<%=researchFlag%>&srhRange=<%=srhRange%>&srhDate=<%=srhDate%>&sday=<%=sday%>&eday=<%=eday%>&syear=<%=syear%>&smonth=<%=smonth%>&eyear=<%=eyear%>&emonth=<%=emonth%>&orderSet=<%=orderSet%>&detail=<%=detail%>&nierPrevQuery=<%=nierPrevQuery%>" class="btn03">검색결과 더보기 <img src="/assets/kor/images/common/ic_locationarrow.gif" alt="" /></a>
				</h2>	
				<!-- //일반검색결과 제목, num -->

				<ul class="search_resultList">
				<!-- 검색결과 루프영역 시작 -->
				<%
				for (int i = 0; i < healthRealSize; i++){
					for(int j = 0; j < healthResult.getNumField(); j++){
						fieldNm = new String(getHealthSelectSet[j].getField());

						if(fieldNm.equals("TITLE")){
							title = new String(healthResult.getResult(i, j));
						}else if(fieldNm.equals("CONTENT")){
							content = new String(healthResult.getResult(i, j));
						}else if(fieldNm.equals("REGDATE")){
							regdate_tmp = new String(healthResult.getResult(i, j));
							if(regdate_tmp.equals("1970.01.01") || regdate_tmp.equals("")){
								regdate = "";
							}else{
								regdate = regdate_tmp.substring(0, 4) + "." + regdate_tmp.substring(4, 6) + "." + regdate_tmp.substring(6, 8) + " ";
							}
						}else if(fieldNm.equals("URL")){
							url = new String(healthResult.getResult(i, j));
						}else if(fieldNm.equals("COL_NM")){
							col_nm = new String(healthResult.getResult(i, j));
						}else if(fieldNm.equals("BOARD_NM")){
							board_nm = new String(healthResult.getResult(i, j));
						}else if(fieldNm.equals("TYPE")){
							type = new String(healthResult.getResult(i, j));
						}
					}
				%>
				<li>
					<div class="tit"><a href="<%=url%>" target="_blank" title="새창"><%=title%></a><span class="date"><% if(type.equals("D")){ %><%=regdate%><% } %></span> <span class="newpop"><a href="<%=url%>" target="_blank" title="새창" class="btn01 btndarkgray">새창</a></span></div>
					<div class="txt"><%=content%></div>
					<div class="txt2">출처 : <%=col_nm%> > <%=board_nm%> </div>
				</li>
				<%
				}		
				%>
				</ul>
				<!-- 검색결과 루프영역 끝 -->
		<%
				}
			}
		%>
		<!-- 환경보건분야 검색 끝-->
		<!-- 화학물질분야 검색 시작-->
		<%
			if(schMenuNo.equals("45007") || category.equals("chem")){
				if(chemTotalSize > 0){
		%>
				<!-- 일반검색결과  제목, num -->
				<h2>
					화학물질분야 검색 <span class="subtxt">[검색결과 <%=chemTotalSize%>건]</span><span class="right"><a
						href="<%=pageName%>&query=<%=query%>&category=nier&researchFlag=<%=researchFlag%>&srhRange=<%=srhRange%>&srhDate=<%=srhDate%>&sday=<%=sday%>&eday=<%=eday%>&syear=<%=syear%>&smonth=<%=smonth%>&eyear=<%=eyear%>&emonth=<%=emonth%>&orderSet=<%=orderSet%>&detail=<%=detail%>&nierPrevQuery=<%=nierPrevQuery%>" class="btn03">검색결과 더보기 <img src="/assets/kor/images/common/ic_locationarrow.gif" alt="" /></a>
				</h2>	
				<!-- //일반검색결과 제목, num -->

				<ul class="search_resultList">
				<!-- 검색결과 루프영역 시작 -->
				<%
				for (int i = 0; i < chemRealSize; i++){
					for(int j = 0; j < chemResult.getNumField(); j++){
						fieldNm = new String(getChemSelectSet[j].getField());

						if(fieldNm.equals("TITLE")){
							title = new String(chemResult.getResult(i, j));
						}else if(fieldNm.equals("CONTENT")){
							content = new String(chemResult.getResult(i, j));
						}else if(fieldNm.equals("REGDATE")){
							regdate_tmp = new String(chemResult.getResult(i, j));
							if(regdate_tmp.equals("1970.01.01") || regdate_tmp.equals("")){
								regdate = "";
							}else{
								regdate = regdate_tmp.substring(0, 4) + "." + regdate_tmp.substring(4, 6) + "." + regdate_tmp.substring(6, 8) + " ";
							}
						}else if(fieldNm.equals("URL")){
							url = new String(chemResult.getResult(i, j));
						}else if(fieldNm.equals("COL_NM")){
							col_nm = new String(chemResult.getResult(i, j));
						}else if(fieldNm.equals("BOARD_NM")){
							board_nm = new String(chemResult.getResult(i, j));
						}else if(fieldNm.equals("TYPE")){
							type = new String(chemResult.getResult(i, j));
						}
					}
				%>
				<li>
					<div class="tit"><a href="<%=url%>" target="_blank" title="새창"><%=title%></a><span class="date"><% if(type.equals("D")){ %><%=regdate%><% } %></span> <span class="newpop"><a href="<%=url%>" target="_blank" title="새창" class="btn01 btndarkgray">새창</a></span></div>
					<div class="txt"><%=content%></div>
					<div class="txt2">출처 : <%=col_nm%> > <%=board_nm%> </div>
				</li>
				<%
				}		
				%>
				</ul>
				<!-- 검색결과 루프영역 끝 -->
		<%
				}
			}
		%>
		<!-- 화학물질분야 검색 끝-->
		<!-- 교통환경분야 검색 시작-->
		<%
			if(schMenuNo.equals("45008") || category.equals("tprc")){
				if(tprcTotalSize > 0){
		%>
				<!-- 일반검색결과  제목, num -->
				<h2>
					교통환경분야 검색 <span class="subtxt">[검색결과 <%=tprcTotalSize%>건]</span><span class="right"><a
						href="<%=pageName%>&query=<%=query%>&category=nier&researchFlag=<%=researchFlag%>&srhRange=<%=srhRange%>&srhDate=<%=srhDate%>&sday=<%=sday%>&eday=<%=eday%>&syear=<%=syear%>&smonth=<%=smonth%>&eyear=<%=eyear%>&emonth=<%=emonth%>&orderSet=<%=orderSet%>&detail=<%=detail%>&nierPrevQuery=<%=nierPrevQuery%>" class="btn03">검색결과 더보기 <img src="/assets/kor/images/common/ic_locationarrow.gif" alt="" /></a>
				</h2>	
				<!-- //일반검색결과 제목, num -->

				<ul class="search_resultList">
				<!-- 검색결과 루프영역 시작 -->
				<%
				for (int i = 0; i < tprcRealSize; i++){
					for(int j = 0; j < tprcResult.getNumField(); j++){
						fieldNm = new String(getTprcSelectSet[j].getField());

						if(fieldNm.equals("TITLE")){
							title = new String(tprcResult.getResult(i, j));
						}else if(fieldNm.equals("CONTENT")){
							content = new String(tprcResult.getResult(i, j));
						}else if(fieldNm.equals("REGDATE")){
							regdate_tmp = new String(tprcResult.getResult(i, j));
							if(regdate_tmp.equals("1970.01.01") || regdate_tmp.equals("")){
								regdate = "";
							}else{
								regdate = regdate_tmp.substring(0, 4) + "." + regdate_tmp.substring(4, 6) + "." + regdate_tmp.substring(6, 8) + " ";
							}
						}else if(fieldNm.equals("URL")){
							url = new String(tprcResult.getResult(i, j));
						}else if(fieldNm.equals("COL_NM")){
							col_nm = new String(tprcResult.getResult(i, j));
						}else if(fieldNm.equals("BOARD_NM")){
							board_nm = new String(tprcResult.getResult(i, j));
						}else if(fieldNm.equals("TYPE")){
							type = new String(tprcResult.getResult(i, j));
						}
					}
				%>
				<li>
					<div class="tit"><a href="<%=url%>" target="_blank" title="새창"><%=title%></a><span class="date"><% if(type.equals("D")){ %><%=regdate%><% } %></span> <span class="newpop"><a href="<%=url%>" target="_blank" title="새창" class="btn01 btndarkgray">새창</a></span></div>
					<div class="txt"><%=content%></div>
					<div class="txt2">출처 : <%=col_nm%> > <%=board_nm%> </div>
				</li>
				<%
				}		
				%>
				</ul>
				<!-- 검색결과 루프영역 끝 -->
		<%
				}
			}
		%>
		<!-- 교통환경분야 검색 끝-->
		<%
		} else {		
		%>
		<h2><span>“<%=prevQuery%>”</span>에 대한 검색결과는 <%=totalSize%>건입니다.</h2>
		<% } %>
		
		<!-- paging -->
    <%
		if(LinkStart > 0){
			String pLink = "";
			String prev = "";
			int pageNo = 1;
			prev = category + "PrevQuery";
    %>
		 <div class="pagination">
		 <%
			// 처음 목록
			//pageNo = (LinkStart-2)*pageSize+1;
			pageNo = 1;
			if (LinkStart != 1) out.println("<a href=\""+pageName+ "&query=" +query+ "&category=" +category+ "&pageSn=" +pageNo+ "&researchFlag=" +researchFlag+ "&orderSet=" +orderSet+ "&srhRange=" +srhRange+ "&srhDate=" +srhDate+ "&sday=" +sday+ "&eday=" +eday+ "&sday=" +sday+ "&eday=" +eday+ "&syear=" +syear+ "&smonth=" +smonth+ "&eyear=" +eyear+ "&emonth=" +emonth+ "&detail=" +detail+ "&"+prev+"=" + allPrevQuery + "\" class='first prevEnd'><img src=\"/images/cms2/bbs/page_btn_prev1.png\" alt=\"처음페이지\" border=\"0\"></a>");
			else out.println("<img src=\"/images/cms2/bbs/page_btn_prev1.png\" alt=\"처음페이지\" border=\"0\">");
		

			// 이전 10 페이지
			pageNo = (LinkStart-2)*pageSize+1;
			if (LinkNow > 10) out.println("<a href=\""+pageName+ "&query=" +query+ "&category=" +category+ "&pageSn=" +pageNo+ "&researchFlag=" +researchFlag+ "&orderSet=" +orderSet+ "&srhRange=" +srhRange+ "&srhDate=" +srhDate+ "&sday=" +sday+ "&eday=" +eday+ "&sday=" +sday+ "&eday=" +eday+ "&syear=" +syear+ "&smonth=" +smonth+ "&eyear=" +eyear+ "&emonth=" +emonth+ "&detail=" +detail+ "&"+prev+"=" + allPrevQuery + "\"><img src=\"/images/cms2/bbs/page_btn_prev2.png\" alt=\"이전페이지\" border=\"0\"></a>");
			else out.println("<img src=\"/images/cms2/bbs/page_btn_prev2.png\" alt=\"이전페이지\" border=\"0\">");
		 %>
		 <%
			// 리스트    srhRange  orderSet srhDate  sday  eday  syear  smonth  eyear  emonth &waterPrevQuery
			for (int i = LinkStart; i <= LinkEnd; i++)
			{
				pageNo = (i-1)*pageSize+1;
				if (i == LinkNow) out.println("<a title=\"" + i + "\" class='page'><strong>" + i + "</strong></a>");
				else out.println("<a href=\""+pageName+ "&query=" +query+ "&category=" +category+ "&pageSn=" +pageNo+ "&researchFlag=" +researchFlag+ "&orderSet=" +orderSet+ "&srhRange=" +srhRange+ "&srhDate=" +srhDate+ "&sday=" +sday+ "&eday=" +eday+ "&sday=" +sday+ "&eday=" +eday+ "&syear=" +syear+ "&smonth=" +smonth+ "&eyear=" +eyear+ "&emonth=" +emonth+ "&detail=" +detail+ "&"+prev+"=" + allPrevQuery + "\" title=\"" +i+ "\" class='page'>" + i + "</a>");
			}
		 %>
		 <%
			// 다음 10 페이지
			pageNo = LinkEnd * pageSize + 1;
			if (LinkNow * pageSize < totalSize && totalSize > pageNo) out.println("<a href=\""+pageName+ "&query=" +query+ "&category=" +category+ "&pageSn=" +pageNo+ "&researchFlag=" +researchFlag+ "&orderSet=" +orderSet+ "&srhRange=" +srhRange+ "&srhDate=" +srhDate+ "&sday=" +sday+ "&eday=" +eday+ "&sday=" +sday+ "&eday=" +eday+ "&syear=" +syear+ "&smonth=" +smonth+ "&eyear=" +eyear+ "&emonth=" +emonth+ "&detail=" +detail+ "&"+prev+"=" + allPrevQuery + "\"><img src=\"/images/cms2/bbs/page_btn_next2.png\" alt=\"다음\" border=\"0\"></a>");
			else out.println("<img src=\"/images/cms2/bbs/page_btn_next2.png\" alt=\"다음\" border=\"0\">");

			// 마지막 목록
			pageNo = (totalSize / pageSize) * pageSize + 1;
			if(LinkEnd * pageSize < totalSize) out.println("<a href=\""+pageName+ "&query=" +query+ "&category=" +category+ "&pageSn=" +pageNo+ "&researchFlag=" +researchFlag+ "&orderSet=" +orderSet+ "&srhRange=" +srhRange+ "&srhDate=" +srhDate+ "&sday=" +sday+ "&eday=" +eday+ "&sday=" +sday+ "&eday=" +eday+ "&syear=" +syear+ "&smonth=" +smonth+ "&eyear=" +eyear+ "&emonth=" +emonth+ "&detail=" +detail+ "&"+prev+"=" + allPrevQuery + "\" class='last nextEnd'><img src=\"/images/cms2/bbs/page_btn_next1.png\" alt=\"맨끝으로\" border=\"0\"></a>");
			else out.println("<img src=\"/images/cms2/bbs/page_btn_next1.png\" alt=\"맨끝으로\" border=\"0\">");
		%>
		</div>
	<%
		}
    %>
	<!-- //paging -->
		
	<!--//search_resultList-->
</div>
<!-- //content-body -->
