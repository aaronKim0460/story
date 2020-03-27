<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp" %>
<!DOCTYPE html>

<script type="text/javascript">
var frm;
var vendVcnm;
var prodMdel;
var ecosClnm;
var prodPrnm;
var vendAddr;
var prodRsid;
var prodG2sn;

$().ready(function(){
	frm = document.getElementById("mainFrm");
	$('#pageUnit').change(function(){	proSearch()	});
	
	if( ($('#prodMdel').val() != '') || ($('#prodRsid').val() != '') || ($('#prodPrnm').val() != '') ) {
		var sType = '';
		var sKeyword = ''
		if($('#prodMdel').val() != '') sType = 'prodMdel';
		else if($('#prodRsid').val() != '') sType = 'prodRsid'; 
		else if($('#prodPrnm').val() != '') sType = 'prodPrnm';
		$('#searchCnd').val(sType);
		frm.searchKeyword.value = $('#'+sType).val();
	}

	if("${param.ecomEcom}" != null || "${param.ecomEcom}" != ""){
		ecomSearch();
		$('#ecomEcom option#mid_${param.ecomEcom}').prop('selected', true);
	}
});

function inputCheck_board(str){
	var RegExp = /[\'\"\<\>\=]/gi;//정규식 구문
	var obj = $('.' + str).val();
	    if (RegExp.test(obj)) {
        alert("특수문자는 입력하실 수 없습니다.");
		$('.' + str).val(obj.substring(0, obj.length - 1));
    }
}

function linkPage(pageNo){
    $("#pageIndex").val(pageNo);
    $('#mainFrm')
	.attr('action', "<c:url value='/user/com/certificationList.do?menuNo=14003'/>")
    .submit();
};

function preSearch(){
	if ( event.keyCode == 13 ) {
		event.returnValue = false;
		proSearch();
	}
}

function proSearch(){
	if($('#ecolEcol').val() != '' && $('#ecomEcom').val() == '') { 
		alert("중분류 선택은 필수 입니다.");
	} else {
		if($('#searchKeyword').val().length > 0){
			var sKeyword = $('#searchKeyword').val();
			var sType = $('#searchCnd').val();
			
			$('#prodMdel').val('');
			$('#prodRsid').val('');
			$('#prodPrnm').val('');
			$('#'+sType).val(sKeyword);
			$('#pageUnit').val($('#pageUnit').val());
		}
		$('#mainFrm')
		.attr('action', "<c:url value='/user/com/certificationList.do?menuNo=14003'/>")
	    .submit();
	}
}
	
function fn_detail_view(key){
	$(".popupLayout").show();
	
	if(key.length > 0)	$("#id_"+key).show();
	else				$("#id_none").show();
}

//상세 내용 닫기
function fn_close_detail() {
	$("[id^='id_']").hide();
	$(".popupLayout").hide();
}

function ecomSearch(){
	var ecolEcol = $('select[name="ecolEcol"]').val();
	$.ajax({
		type : "post"
		, url : "<c:url value='/user/com/middleCategory.do'/>"
		, dataType : "html"
		, data : {"ecolEcol" : ecolEcol}
		, contentType: "application/x-www-form-urlencoded; charset=utf-8"
		, success : function(result){
			var data = decodeURIComponent(result);
			var dataSize = Number(data.split("@@")[0].split("##")[0].replace("size_", ""));//size값을 분리
			var dataCode = new Array();
			var dataName = new Array();
			var html = "<option value=''>중분류</option>";
			
			for(var i = 0; i < dataSize; i++){
				dataCode[i] = data.split("@@")[i].split("##")[1].replace("num_", "");
				dataName[i] = data.split("@@")[i].split("##")[2].replace("name_", "");
				html += "<option value='" + dataCode[i] + "' id='mid_" + dataCode[i] + "'>" + dataName[i] + "</option>";
			}
			$('#ecomEcom').html(html);
		}
		, error : function(){
			alert( "페이지 초기화에 실패했습니다. 새로고침 후 사용해 주세요." );
		}
	});
}
</script>
<form name="mainFrm" id="mainFrm" method="post">
<%-- 	<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" /> --%>
	<input type="hidden" name="pageIndex" id="pageIndex" value="${paginationInfo.currentPageNo}" />

<div id="contents">		
	<h3 class="textH1">정의</h3>
	<ul class="listStyle">
		<li>[저탄소 녹색성장 기본법] 제2조제5호에 따른 에너지 · 자원의 투입과 온실가스 및 오염물질의 발생을 최소화하는 제품</li>
	</ul>
	<h3 class="textH1">대상제품</h3>
	<ul class="listStyle">
		<li>「환경기술 및 환경산업 지원법」 제17조제1항에 따라 같은 용도의 다른 제품(기기, 자재 및 환경에 영향을 미치는 서비스를 포함)에 비하여 제품의 환경성을 개선한 제품으로서 환경표지의 인증을 받은 제품 또는 같은 조 제3항에 따라 환경부장관이 정하여 고시하는 대상 제품별 인증기준에 적합한 제품</li>
	</ul>
	<table cellpadding="0" cellspacing="0" class="TBstat TBstat01" summary="환경표지인증제품 대상제품" style="width:100%">
		<caption>근거법, 대상제품, 인증현황, 인증기관의 항목이 있습니다.</caption>
		<colgroup>
			<col width="15%">
			<col width="10%">
			<col width="">
			<col width="10%">
			<col width="">
		</colgroup>
		<tbody>
			<tr>
				<td rowspan="2"><img src="/assets/kor/images/newMain/greenlogo.png" alt="친환경 건축자재" /> </td>
				<th>근거법</th>
				<td>[환경기술 및 환경산업 지원법]</td>
				<th>대상제품</th>
				<td>사무용기기, 건설용자재, 생활용품 등<br /> 161개 제품군</td>
			</tr>
			<tr>
				<th>인증현황</th>
				<td>3,375개 업체, 17,436개 제품 <br />(’16.9.30 기준)</td>
				<th>인증기관</th>
				<td>환경부 한국환경산업기술 (www.keiti.re.kr)</td>
			</tr>
		</tbody>
	</table>
<!-- 	<h3 class="textH1">인증기간 및 신청절차</h3> -->
	<h3 class="textH1">인증기간</h3>
	<ul class="listStyle">
<!-- 		<li>인증 기간은 2년이며, 자세한 인증절차 및 제도는 환경마크 홈페이지(http://el.keiti.re.kr), 녹색제품정보시스템 (http:// www.greenproduct.go.kr), 환경마크인증신청시스템(https://elms.keiti.re.kr)에서 확인 가능</li> -->
		<li>2년</li>
	</ul>
	<h3 class="textH1">신청절차</h3>
	<ul class="listStyle">
		<li>자세한 인증절차 및 제도는 환경마크 홈페이지(<a href="http://el.keiti.re.kr" target="_blank">http://el.keiti.re.kr</a>), 녹색제품정보시스템 (<a href="http://www.greenproduct.go.kr" target="_blank">http://www.greenproduct.go.kr</a>), 환경마크인증신청시스템(<a href="https://elms.keiti.re.kr" target="_blank">https://elms.keiti.re.kr</a>)에서 확인 가능</li>
	</ul>
	<%-- 센터 요청으로 API 오류 수정 전까지 임시러 주석 처리함 20170322
	<h3 class="textH1">제품현황</h3>
	<div class="zidoRIn" style="height:115px;">
		<div class="board_search">
			<input type="hidden" name="prodMdel" id="prodMdel" />
            <input type="hidden" name="prodRsid" id="prodRsid" />                            
            <input type="hidden" name="prodPrnm" id="prodPrnm" />
			<fieldset>
				<legend>목록검색</legend>
				<p>
					<select name="searchCnd" id="searchCnd" class="select_list">
            			<option value="prodMdel">상표명</option>
            			<option value="prodRsid">인증번호</option>
            			<option value="prodPrnm">용도</option>
            		</select>
					&nbsp;
					<input type="text" name="searchKeyword" id="searchKeyword" class="searchField text" style="width: 200px;" tabindex="2" value="" onkeydown="inputCheck_board('searchField');" onkeyup="inputCheck_board('searchField')">
				</p>
				<p>
					분류명&nbsp;&nbsp;
					<select name="ecolEcol" id="ecolEcol" class="select_list" onchange="ecomSearch();">
                		<option value="" <c:if test="${param.ecolEcol eq null || param.ecolEcol eq ''}">selected="selected"</c:if>>대분류</option>
                		<option value="01" <c:if test="${param.ecolEcol eq 01}">selected="selected"</c:if>>사무/교육/영상/가전</option>
                		<option value="02" <c:if test="${param.ecolEcol eq 02}">selected="selected"</c:if>>전자/정보/통신</option>
                		<option value="03" <c:if test="${param.ecolEcol eq 03}">selected="selected"</c:if>>섬유/고무/위생/여가</option>
                		<option value="04" <c:if test="${param.ecolEcol eq 04}">selected="selected"</c:if>>화학/소방/안전</option>
                		<option value="05" <c:if test="${param.ecolEcol eq 05}">selected="selected"</c:if>>차량/운반</option>
                		<option value="06" <c:if test="${param.ecolEcol eq 06}">selected="selected"</c:if>>전기/시험/계측</option>
                		<option value="07" <c:if test="${param.ecolEcol eq 07}">selected="selected"</c:if>>기계/설비</option>
                		<option value="08" <c:if test="${param.ecolEcol eq 08}">selected="selected"</c:if>>토목/건축자재</option>
                		<option value="09" <c:if test="${param.ecolEcol eq 09}">selected="selected"</c:if>>도로시설/자동차용품</option>
                		<option value="10" <c:if test="${param.ecolEcol eq 10}">selected="selected"</c:if>>원부자재/기타</option>
                		<option value="11" <c:if test="${param.ecolEcol eq 11}">selected="selected"</c:if>>서비스</option>
                	</select>
                	<select name="ecomEcom" id="ecomEcom" class="select_list">
                		<option value="">중분류</option>
                		<!-- 중분류 목록 Ajax -->
                	</select>
					<label style="display:inline-block; padding:0px 5px 0px 50px;" for="prodG2sn">G2B 식별번호</label>	
					<input type="text" class="text" name="prodG2sn" id="prodG2sn" tabindex="5" onkeydown="characterCheck_board('prodG2sn')" onkeyup="characterCheck_board('prodG2sn')"/>
				</p>					
				<p>
					업체명&nbsp;&nbsp;
					<input type="text" class="text" name="vendVcnm" id="vendVcnm" tabindex="6" onkeydown="characterCheck_board('vendVcnm')" onkeyup="characterCheck_board('vendVcnm')"/>
					
					<label style="display:inline-block; padding:0px 5px 0px 150px;" for="prodG2sn">지역</label>	
					<select name="vendAddr" id="vendAddr" class="select_list" tabindex="7">
                    	<option value="" <c:if test="${param.vendAddr == null || param.vendAddr == ''}">selected="selected"</c:if>>전체</option>
						<option value="서울" <c:if test="${param.vendAddr == '서울'}">selected="selected"</c:if>>서울특별시</option>
						<option value="부산" <c:if test="${param.vendAddr == '부산'}">selected="selected"</c:if>>부산광역시</option>
						<option value="대구" <c:if test="${param.vendAddr == '대구'}">selected="selected"</c:if>>대구광역시</option>
						<option value="인천" <c:if test="${param.vendAddr == '인천'}">selected="selected"</c:if>>인천광역시</option>
						<option value="광주" <c:if test="${param.vendAddr == '광주'}">selected="selected"</c:if>>광주광역시</option>
						<option value="대전" <c:if test="${param.vendAddr == '대전'}">selected="selected"</c:if>>대전광역시</option>		            
						<option value="울산" <c:if test="${param.vendAddr == '울산'}">selected="selected"</c:if>>울산광역시</option>		            		                        
						<option value="세종" <c:if test="${param.vendAddr == '세종'}">selected="selected"</c:if>>세종특별자치시</option>
						<option value="강원" <c:if test="${param.vendAddr == '강원'}">selected="selected"</c:if>>강원도</option>
						<option value="경기" <c:if test="${param.vendAddr == '경기'}">selected="selected"</c:if>>경기도</option>
						<option value="경상남도" <c:if test="${param.vendAddr == '경상남도'}">selected="selected"</c:if>>경상남도</option>
						<option value="경상북도" <c:if test="${param.vendAddr == '경상북도'}">selected="selected"</c:if>>경상북도</option>
						<option value="전라남도" <c:if test="${param.vendAddr == '전라남도'}">selected="selected"</c:if>>전라남도</option>
						<option value="전라북도" <c:if test="${param.vendAddr == '전라북도'}">selected="selected"</c:if>>전라북도</option>
						<option value="제주" <c:if test="${param.vendAddr == '제주'}">selected="selected"</c:if>>제주특별자치도</option>
						<option value="충청남도" <c:if test="${param.vendAddr == '충청남도'}">selected="selected"</c:if>>충청남도</option>
						<option value="충청북도" <c:if test="${param.vendAddr == '충청북도'}">selected="selected"</c:if>>충청북도</option>
               		</select>
					<img style="float:right; cursor:pointer;" src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" onclick="proSearch();"/>
				</p>
			</fieldset>
		</div>
		
	</div>
	<div class="boardlistnum" style="padding:0px 0px 5px; text-align:right;">
		<select name="pageUnit" id="pageUnit">
			<option value="5" <c:if test="${param.pageUnit eq null || param.pageUnit eq '' || param.pageUnit eq 5}">selected="selected"</c:if>>5개 보기</option>
            <option value="10" <c:if test="${param.pageUnit eq 10}">selected="selected"</c:if>>10개 보기</option>
            <option value="50" <c:if test="${param.pageUnit eq 50}">selected="selected"</c:if>>50개 보기</option>
            <option value="100" <c:if test="${param.pageUnit eq 100}">selected="selected"</c:if>>100개 보기</option>
        </select>
    </div>
	
	<table class="bbs_default list">
		<colgroup>
			<col style="width: 6.5%" />
			<col style="width: 8%" />
			<col style="width: 11%" />
			<col />
			<col style="width: 20%" />
			<col style="width: 10%" />
			<col style="width: 11%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제품사진</th>
				<th scope="col">업체명</th>
				<th scope="col">상표명(분류)</th>
				<th scope="col">용도</th>
				<th scope="col">지역</th>
				<th scope="col">인증번호/<br>G2B식별번호</th>
			</tr>
		</thead>
		<tbody id="body_list" class="t_center list">
		<c:choose>
		<c:when test="${ fn:length(list) > 0 }">
			<c:forEach var="list" items="${ list }">
				<tr>
					<td class="ac">${list.total - list.rnum + 1}</td>
			 		<td class="ac"><img src="http://www.greenproduct.go.kr/web/product/openProductImage.do?prodProd=${ list.prodProd }&prod_img_size=50" alt="" class="listThum" /></td>
	                <td class="ac">${ list.vendVcnm }</td>
					<td class="ac">
						<a href="javascript:fn_detail_view('${ list.idx }');">${ list.prodMdel } <br />(${ list.ecosClnm })</a>
				  	</td>
	                <td>${ list.prodPrnm }</td>
					<td class="ac">
						<c:choose>
							<c:when test="${ list.vendAddr != null }">
								<c:set var="addr_arr" value="${ fn:split(list.vendAddr, ' ') }"/>
								<c:forEach var="arr1" items="${addr_arr}" varStatus="arr">
								    <c:if test="${arr.count==1}"><c:out value="${arr1}"/></c:if> 
								</c:forEach> 	                            	
							</c:when>
						</c:choose>
					</td>
					<td class="ac">${ list.prodRsid }<c:if test="${ fn:length(list.prodG2sn) > 0 }">/ <br />${ list.prodG2sn }</c:if></td>
				</tr>				
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
			<td class="pds_list_con" colspan="7">등록된 자료가 없습니다.</td>
			</tr>
		</c:otherwise>
		</c:choose>
	<!--loop end-->
	</table>
<!-- List Table End-->
	<!-- layer popup -->
		<div class="popupLayout" style="display: none;">
			<dl>
				<dt class="cal_unvisible">환경표지인증제품 상세
					<div class="popupClose"><a href="javascript:fn_close_detail();"><img alt="close" src="/assets/kor/images/newMain/bu_close.png"></a></div>
				</dt>
				<c:choose>
				<c:when test="${ fn:length(list) > 0 }">
					<c:forEach var="row" items="${list}">
					<dd id="id_<c:out value="${row.idx}" />" style="display: none;">
						<table class="bbs_default" border="0" summary="환경인증제품 상세보기 정보를 제공합니다. 상표명, 일반분류등 인증제품 상세 정보로 구성되어 있습니다.">
							<caption>환경인증제품 상세 내용</caption>
							<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
							<tbody>
								<tr>
									<th>상표명</th>
									<td class="subject"><c:out value="${row.prodMdel}" /></td>
								</tr>
								<tr>
									<th>일반분류</th>
									<td><c:out value="${row.ecosClnm}" /></td>
								</tr>
								<tr>
									<th>용도</th>
									<td><c:out value="${row.prodPrnm}" /></td>
								</tr>
								<tr>
									<th>규격</th>
									<td><c:out value="${row.prodSpec}" /></td>
								</tr>
								<tr>
									<th>기업명</th>
									<td><c:out value="${row.vendVcnm}" /></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><c:out value="${row.vendTel}" /></td>
								</tr>
								<tr>
									<th>팩스번호</th>
									<td><c:out value="${row.vendFax}" /></td>
								</tr>
								<tr>
									<th>인증구분</th>
									<td><c:out value="${row.prodRsstnm}" /></td>
								</tr>
								<tr>
									<th>인증번호</th>
									<td><c:out value="${row.prodRsid}" /></td>
								</tr>
								<tr>
									<th>인증기간</th>
									<td><c:out value="${row.prodRsdt} ~ ${row.prodRedt}" /></td>
								</tr>
								<tr>
									<th>G2B식별번호</th>
									<td><c:out value="${row.prodG2sn}" /></td>
								</tr>
								<tr>
									<th>인증사유</th>
									<td><c:out value="${row.elstRson}" /></td>
								</tr>
								<tr>
									<td class="substance" colspan="2">
									</td>
								</tr>
							</tbody>
						</table>
						<div class="buttonbox ac">
							<a href="javascript:fn_close_detail();" class="btn gray">닫기</a>
						</div>
					</dd>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<dd id="id_none" style="display: none;">
						<div style="padding:100px 0px; text-align:center;">데이터가 없습니다.</div>
						<div class="buttonbox ac">
							<a href="javascript:fn_close_detail();" class="btn gray">닫기</a>
						</div>
					</dd>
				</c:otherwise>
				</c:choose>
				</dl>
			</div>

	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div> --%>
</div>
</form>