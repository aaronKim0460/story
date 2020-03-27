<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">	
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
doDetail = function(sn){
	$("#fcltySn").val(sn);
	document.listform.action = "<c:url value='/kor/space/conditionDetail.do'/>";
	document.listform.submit();	
	
};

function linkPage(pageNo){
    $("#pageIndex").val(pageNo);
    document.listform.action = "<c:url value='/kor/space/condition.do'/>";
    document.listform.submit();
};

doSearch = function(){
	$("#pageIndex").val(1);
	document.listform.action = "<c:url value='/kor/space/condition.do'/>";
    document.listform.submit();
};
</script>

<div id="contents">
	<div class="tableBtn clearfix">
		<div class="chBoxInZi">
			<div class="ziSBox" id="ziSBg1" style="margin: 30px 0px 0px 210px;" mapdivid="강원">
				<h2>강원도</h2>
			</div>
			<div class="ziSBox" id="ziSBg3" style="margin: 70px 0px 0px 120px;" mapdivid="서울">
				<h2>서울특별시</h2>
			</div>
			<div class="ziSBox" id="ziSBg4" style="margin: 60px 0px 0px 30px;" mapdivid="인천">
				<h2>인천광역시</h2>
			</div>
			<div class="ziSBox" id="ziSBg5" style="margin: 140px 0px 0px 30px;" mapdivid="충남">
				<h2>충청남도</h2>
			</div>
			<div class="ziSBox" id="ziSBg6" style="margin: 160px 0px 0px 130px;" mapdivid="세종">
				<h2>세종</h2>
			</div>
			<div class="ziSBox" id="ziSBg7" style="margin: 170px 0px 0px 150px;" mapdivid="대전">
				<h2>대전</h2>
			</div>
			<div class="ziSBox" id="ziSBg8" style="margin: 120px 0px 0px 130px;" mapdivid="충북">
				<h2>충청북도</h2>
			</div>
			<div class="ziSBox" id="ziSBg16" style="margin: 380px 0px 0px 140px;" mapdivid="제주">
				<h2>제주도</h2>
			</div>
			<div class="ziSBox" id="ziSBg15" style="margin: 280px 0px 0px 130px;" mapdivid="광주">
				<h2>광주광역시</h2>
			</div>
			<div class="ziSBox" id="ziSBg2" style="margin: 80px 0px 0px 160px;" mapdivid="경기">
				<h2>경기도</h2>
			</div>
			<div class="ziSBox" id="ziSBg13" style="margin: 320px 0px 0px 230px;" mapdivid="경남">
				<h2>경상남도</h2>
			</div>
			<div class="ziSBox" id="ziSBg10" style="margin: 220px 0px 0px 230px;" mapdivid="대구">
				<h2>대구</h2>
			</div>
			<div class="ziSBox" id="ziSBg12" style="margin: 310px 0px 0px 230px;" mapdivid="부산">
				<h2>부산</h2>
			</div>
			<div class="ziSBox" id="ziSBg9" style="margin: 170px 0px 0px 260px;" mapdivid="경북">
				<h2>경상북도</h2>
			</div>
			<div class="ziSBox" id="ziSBg11" style="margin: 270px 0px 0px 260px;" mapdivid="울산">
				<h2>울산</h2>
			</div>
			<div class="ziSBox" id="ziSBg17" style="margin: 250px 0px 0px 130px;" mapdivid="전북">
				<h2>전라북도</h2>
			</div>
			<div class="ziSBox" id="ziSBg14" style="margin: 320px 0px 0px 130px;" mapdivid="전남">
				<h2>전라남도</h2>
			</div>
			<img src="/assets/kor/images/newMain/zip_0.png" alt="지도" border="0" name="ziImg"  usemap="#ziImg" id="ziImg" />
			<map name="ziImg">
				<area shape="poly" coords="203,7,199,14,188,16,181,24,177,31,163,39,146,39,137,46,146,62,155,61,166,80,163,87,170,103,177,104,181,111,177,119,178,139,189,140,197,134,206,138,210,146,228,148,233,142,247,141,255,143,269,121,258,106,243,64,213,16" href="#" mapId="1" mName="강원">
				<area shape="poly" coords="136,46,146,61,155,61,166,81,163,86,170,101,178,105,181,111,177,117,178,139,171,145,163,147,151,158,124,158,120,153,111,154,104,146,109,137,107,133,121,113,130,118,141,118,147,109,141,97,128,95,125,102,110,101,105,97,107,91,107,83,114,80,114,71,121,66,120,55" href="#" mapId="2" mName="경기">
				<area shape="poly" coords="116,101,122,114,134,118,140,118,146,110,141,99,129,97,126,103" href="#" mapId="3" mName="서울">
				<area shape="poly" coords="106,81,96,77,83,85,79,98,99,121,109,118,114,122,121,114,116,101,108,100,104,96,108,89" href="#" mapId="4" mName="인천">
				<area shape="poly" coords="150,157,151,166,155,168,154,174,149,181,137,175,128,166,116,169,118,181,123,183,124,189,134,193,134,203,168,223,167,235,158,235,154,227,145,226,142,230,136,226,135,222,129,220,120,231,112,233,111,228,102,225,105,216,101,206,91,207,84,193,88,182,75,174,91,146,105,145,112,153,120,153,123,158" href="#" mapId="5" mName="충남">
				<area shape="poly" coords="149,181,139,187,134,193,125,189,123,183,119,181,115,169,127,166,138,177" href="#" mapId="6"  mName="세종">
				<area shape="poly" coords="149,182,156,191,149,201,149,212,135,203,134,193,139,186" href="#" mapId="7" mName="대전">
				<area shape="poly" coords="228,148,210,147,206,139,197,135,191,139,177,138,171,145,163,145,151,157,152,165,155,169,149,181,155,190,150,201,149,211,167,222,169,229,184,230,193,223,195,209,181,205,180,198,185,197,187,190,182,184,200,162,216,163" href="#" mapId="8" mName="충북">
				<area shape="poly" coords="269,122,255,143,234,142,218,163,201,163,181,183,187,189,185,196,180,198,182,205,195,209,193,223,185,230,185,242,191,252,202,262,207,261,211,254,211,238,218,237,220,233,227,232,235,237,231,246,233,252,227,262,234,265,243,261,251,264,260,254,265,260,270,257,281,260,287,217,276,224,274,187,279,167" href="#" mapId="9" mName="경북">
				<area shape="poly" coords="235,237,227,232,220,233,217,238,212,237,210,255,202,263,227,263,233,252,231,245" href="#" mapId="10" mName="대구">
				<area shape="poly" coords="282,259,272,258,266,260,260,254,251,264,250,272,257,280,263,284,273,288" href="#" mapId="11" mName="울산">
				<area shape="poly" coords="272,287,265,286,261,281,255,290,246,291,238,301,229,301,219,310,221,316,232,313,241,318,241,313" href="#" mapId="12" mName="부산">
				<area shape="poly" coords="259,280,251,272,251,265,242,260,236,264,229,262,204,262,190,250,185,242,171,252,172,262,170,270,171,281,166,289,171,296,177,311,175,323,184,338,191,338,195,340,206,339,208,333,216,332,227,336,242,322,241,316,233,312,222,315,219,311,229,302,238,301,248,291,256,290,262,283" href="#" mapId="13" mName="경남">
				<area shape="poly" coords="136,299,129,291,119,292,112,295,105,287,114,285,113,280,124,276,141,288,154,288,156,291,165,290,176,312,176,321,186,338,184,343,176,349,170,346,166,351,168,360,160,365,153,362,144,368,140,374,125,375,104,372,101,366,88,368,85,376,66,384,60,373,69,356,60,339,73,320,68,312,72,299,84,297,94,284,111,296,112,306,119,310,124,308,130,311" href="#" mapId="14" mName="전남">
				<area shape="poly" coords="113,295,118,291,126,291,137,298,132,308,124,309,119,311,112,307" href="#" mapId="15" mName="광주">
				<area shape="poly" coords="136,399,126,407,102,415,93,427,100,440,127,440,146,431,149,413" href="#" mapId="16" mName="제주">
				<area shape="poly" coords="168,235,168,229,185,230,185,242,171,253,174,265,170,269,172,282,164,291,155,291,142,288,124,276,114,281,114,287,106,287,95,284,93,275,97,259,105,252,107,243,102,237,103,225,114,232,128,222,136,222,137,227,143,231,146,227,155,228,157,234" href="#" mapId="17" mName="전북">
			</map>
		</div>
		
		
		<script type="text/javascript">
			function zido(){//지도 컨트롤
				var imgN = "0"
				var ziN = $("#searchAreaCl option:selected").val();
				var ziArea;
				$(".chBoxInZi").find("area").each(function(){
					ziArea = $(this).attr("mName");
					if(ziArea == ziN){
						imgN = $(this).attr("mapId");
						ziImg(imgN);
					}
				});
				$(".chBoxInZi > map > area").mouseenter(function(){
					imgN = $(this).attr("mapId");
					ziImg(imgN);
				});
				function ziImg(n){
					var urlN = "/assets/kor/images/newMain/zip_"+n+".png";
					$("#ziImg").attr("src",urlN);
					$(".ziSBox").hide();
					$("#ziSBg"+n).show();
				}
				$("#searchAreaCl").change(function(){
					ziN = $("#searchAreaCl option:selected").val();
					$(".chBoxInZi").find("area").each(function(){
						ziArea = $(this).attr("mName");
						if(ziArea == ziN){
							imgN = $(this).attr("mapId");
							
							ziImg(imgN);
						}
					});
				});
				$(".ziSBox").click(function(){
					ziN = $(this).attr("mapdivid");
					$("#searchAreaCl").val(ziN).attr("selected", "selected");
					document.listform.action = "<c:url value='/kor/space/condition.do'/>";
				    document.listform.submit();
				});
				$(".chBoxInZi > map > area").click(function(){
					ziN = $(this).attr("mName");
					$("#searchAreaCl").val(ziN).attr("selected", "selected");
					document.listform.action = "<c:url value='/kor/space/condition.do'/>";
				    document.listform.submit();
				});
			}
			
			
			$(document).ready(function(){
				zido();
			});
			
			
		</script>
		
		
		
		<div class="zidoR">
			<div class="zidoRIn">
				<form name="listform" id="listform" method="post">
				<div class="board_search">
						<input type="hidden" id=fcltySn name="fcltySn" value=""/>					
						<input type="hidden" id="pageIndex" name="pageIndex" value="<c:if test="${empty kfvo.pageIndex }">1</c:if><c:if test="${!empty kfvo.pageIndex }"><c:out value='${kfvo.pageIndex}'/></c:if>"> 
						<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
					<fieldset>
						<legend>목록검색</legend>
						<p>
							
							검색지역&nbsp;
							<select id="searchAreaCl" name="searchAreaCl" class="select_list">
								<option value="">전체</option>
								<option value="강원" <c:if test="${kfvo.searchAreaCl == '강원'}">selected="selected"</c:if>  >강원</option>
								<option value="경기" <c:if test="${kfvo.searchAreaCl == '경기'}">selected="selected"</c:if>  >경기</option>
								<option value="경남" <c:if test="${kfvo.searchAreaCl == '경남'}">selected="selected"</c:if>  >경남</option>
								<option value="경북" <c:if test="${kfvo.searchAreaCl == '경북'}">selected="selected"</c:if>  >경북</option>
								<option value="광주" <c:if test="${kfvo.searchAreaCl == '광주'}">selected="selected"</c:if>  >광주</option>
								<option value="대구" <c:if test="${kfvo.searchAreaCl == '대구'}">selected="selected"</c:if>  >대구</option>			
								<option value="대전" <c:if test="${kfvo.searchAreaCl == '대전'}">selected="selected"</c:if>  >대전</option>			
								<option value="부산" <c:if test="${kfvo.searchAreaCl == '부산'}">selected="selected"</c:if>  >부산</option>			
								<option value="서울" <c:if test="${kfvo.searchAreaCl == '서울'}">selected="selected"</c:if>  >서울</option>			
								<option value="세종" <c:if test="${kfvo.searchAreaCl == '세종'}">selected="selected"</c:if>  >세종</option>			
								<option value="울산" <c:if test="${kfvo.searchAreaCl == '울산'}">selected="selected"</c:if>  >울산</option>			
								<option value="인천" <c:if test="${kfvo.searchAreaCl == '인천'}">selected="selected"</c:if>  >인천</option>			
								<option value="전남" <c:if test="${kfvo.searchAreaCl == '전남'}">selected="selected"</c:if>  >전남</option>			
								<option value="전북" <c:if test="${kfvo.searchAreaCl == '전북'}">selected="selected"</c:if>  >전북</option>			
								<option value="제주" <c:if test="${kfvo.searchAreaCl == '제주'}">selected="selected"</c:if>  >제주</option>			
								<option value="충남" <c:if test="${kfvo.searchAreaCl == '충남'}">selected="selected"</c:if>  >충남</option>			
								<option value="충북" <c:if test="${kfvo.searchAreaCl == '충북'}">selected="selected"</c:if>  >충북</option>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							시설유형&nbsp;
							<select id="searchArea" name="searchArea" class="select_list">
								<option value="">전체</option>
								<option value="FTC001" <c:if test="${kfvo.searchArea == 'FTC001'}">selected="selected"</c:if>  >어린이놀이시설</option>
								<option value="FTC002" <c:if test="${kfvo.searchArea == 'FTC002'}">selected="selected"</c:if>  >어린이집</option>
								<option value="FTC003" <c:if test="${kfvo.searchArea == 'FTC003'}">selected="selected"</c:if>  >유치원</option>
								<option value="FTC004" <c:if test="${kfvo.searchArea == 'FTC004'}">selected="selected"</c:if>  >특수학교</option>
								<option value="FTC005" <c:if test="${kfvo.searchArea == 'FTC005'}">selected="selected"</c:if>  >초등학교</option>
								<option value="FTC006" <c:if test="${kfvo.searchArea == 'FTC006'}">selected="selected"</c:if>  >초등학교 도서관</option>			
							</select>	
						</p>					
						<p>
							<select name="searchCnd" class="select_list">
								<option value="fct" <c:if test="${krvo.searchCnd == 'fct'}">selected="selected"</c:if>>시설명</option>
								<option value="fix" <c:if test="${krvo.searchCnd == 'fix'}">selected="selected"</c:if>>인증번호</option>
							</select>
							<label for="" class="skip">검색단어입력</label>
							<input name=searchKeyword type="text" value='<c:out value="${krvo.searchKeyword}"/>' class="text" title="검색어 입력" onKeyPress="press(event);" />
						
							<input type="image" src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" onClick="doSearch(); return false;" />
						</p>
					</fieldset>
				</div>
				</form>
			</div>
			<div class="btn_left big" style="height:23px;">
				총 <span class="point"><c:out
						value='${paginationInfo.totalRecordCount }' /></span>건, 현재페이지 <span
					class="point"><c:out value='${paginationInfo.currentPageNo }' /></span>/
				<c:out value='${paginationInfo.totalPageCount }' />
			</div>

			<table class="bbs_default list">
				<colgroup>
					<col style="width: 15%" />
					<col style="width: *" />
					<col style="width: 20%" />
					<col style="width: 10%" />
				</colgroup>
				<thead>
					<tr>				
						<th scope="col">인증번호</th>				
						<th scope="col">[시설유형] 시설명</th>
						<th scope="col">설치장소</th>
						<th scope="col">지역</th>
					</tr>
				</thead>
				<tbody id="body_list" class="t_center list">
					<c:forEach var="kvo" items="${kvoList}" varStatus="status">
						<tr>
							<td class="ac">
								<c:out value="${kvo.fcltyNo eq null ? '-' : kvo.fcltyNo}"/>
							</td>
							<td>
								<strong style="color:#18a6e8;">
									[
									<c:choose>
										<c:when test="${kvo.fcltyTy eq 'FTC001'}">어린이놀이시설</c:when>
										<c:when test="${kvo.fcltyTy eq 'FTC002'}">어린이집</c:when>
										<c:when test="${kvo.fcltyTy eq 'FTC003'}">유치원</c:when>
										<c:when test="${kvo.fcltyTy eq 'FTC004'}">특수학교</c:when>
										<c:when test="${kvo.fcltyTy eq 'FTC005'}">초등학교</c:when>
										<c:when test="${kvo.fcltyTy eq 'FTC006'}">초등학교 도서관</c:when>
									</c:choose>
									]
									<!-- <a href="#none" onclick="doDetail('${kvo.fcltySn}');"><c:out value='${kvo.fcltyNm}'/></a>-->
									<c:out value='${kvo.fcltyNm}'/>
								</strong>
								<br/>
								<span style="font-size:12px; color:#666;">
								<c:choose>
									<c:when test="${!empty kvo.adres1}"><c:out value='${kvo.adres1}'/></c:when>
									<c:otherwise><c:out value='${kvo.adres2}'/></c:otherwise>
								</c:choose>
								</span>
							</td>
							<td class="ac">
								<c:out value="${kvo.plcstra}"/>
							</td>
							<td class="ac"><c:out value="${kvo.areaCl}"/></td>
						</tr>
					</c:forEach>
		
					<c:if test="${fn:length(kvoList) == 0}">
						<tr>
							<td colspan="4" class="no_data" align="center">작성된 게시물이 없습니다.</td>
						</tr>
					</c:if>
		
				</tbody>
			</table>

			<div class="pagination">
				<ui:pagination paginationInfo="${paginationInfo}" type="image"
					jsFunction="linkPage" />
			</div>
		</div>
	</div>
	
	<%-- <div class="pagenavi">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
    </div> --%>
	
</div>
<!-- //contents -->
