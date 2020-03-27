<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
doMapList = function(gb){
	alert('유해인자 DB에서 뜨는 상세 팝업이 뜨드록 변경 :::: detailNoxiousMaterialKor.do');
	return;
	switch(gb){
	case 'airH' : $("#medium").val('air');$("#noxiousLevel").val('H');break; case 'airM' : $("#medium").val('air');$("#noxiousLevel").val('M');break; case 'airL' : $("#medium").val('air');$("#noxiousLevel").val('L');break;
	
	case 'inAirH' : $("#medium").val('inAir');$("#noxiousLevel").val('H');break; case 'inAirM' : $("#medium").val('inAir');$("#noxiousLevel").val('M');break; case 'inAirL' : $("#medium").val('inAir');$("#noxiousLevel").val('L');break;

	case 'waterH' : $("#medium").val('water');$("#noxiousLevel").val('H');break; case 'waterM' : $("#medium").val('water');$("#noxiousLevel").val('M');break; case 'waterL' : $("#water").val('inAir');$("#noxiousLevel").val('L');break;
	
	case 'soilH' : $("#medium").val('soil');$("#noxiousLevel").val('H');break; case 'soilM' : $("#medium").val('soil');$("#noxiousLevel").val('M');break; case 'soilL' : $("#water").val('soil');$("#noxiousLevel").val('L');break;
	
	case 'otherH' : $("#medium").val('other');$("#noxiousLevel").val('H');break; case 'otherM' : $("#medium").val('other');$("#noxiousLevel").val('M');break; case 'otherL' : $("#water").val('other');$("#noxiousLevel").val('L');break;
	
	case 'productH' : $("#medium").val('product');$("#noxiousLevel").val('H');break; case 'productM' : $("#medium").val('product');$("#noxiousLevel").val('M');break; case 'productL' : $("#water").val('product');$("#noxiousLevel").val('L');break;
	
 
	}
	
	//alert($("#medium").val() + "\n" + $("#noxiousLevel").val());
	
	
	
	
	var newPop = document.detailForm;
	var url = "<c:url value='/kor/contents/noxiousmaterial/selectNoxiousMaterialMapKorListData.do'/>";
	 
	var status = "width=712, height=384, top=30,left=60"; 
	window.open("","detailForm",status);
	
	newPop.action =url; 
	newPop.method="post";
	newPop.target="detailForm";
	newPop.submit();
	/*
	 $.ajax({
		type: "POST"
		,data:$("#detailForm").serialize()
		,url: "<c:url value="/adm/contents/material/NoxiousMaterialListData.do"/>"		
		,success: function(result){                
            $("#conData").html(result);
            $("#conData").show();            
        }
	}); 
	*/
	
	//var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=240, height=200, top=0,left=20";
	
	
};

doDetail = function(idx){
	$("#idx").val(idx);
	
	var newPop = document.detailForm;
	var url = "<c:url value='/kor/contents/noxiousmaterial/detailNoxiousMaterialKor.do'/>";
	 
	var status = "width=600, height=650, top=30, left=60 , resizable=yes" 
	window.open("","detailForm",status);
	
	newPop.action =url; 
	newPop.method="post";
	newPop.target="detailForm";
	newPop.submit();	
	
};
$(document).ready(function(){
	$(".mapSubTr").eq(0).show(300);
	$(".head h3").eq(0).addClass("on")
});
</script>

<form id="detailForm" name="detailForm" method="post">
	<input type="hidden" id="idx" name="idx" />
	<input type="hidden" id="medium" name="medium" />
	<input type="hidden" id="noxiousLevel" name="noxiousLevel" />
</form>

<div id="contents">
	<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
	
	<table class="info_map" summary="환경유해인자 정보맵을 제공합니다. 구분과 위해 정도에 따른 물질정보를 제공합니다.">
		<caption class="hide">어린이환경유해인자 정보맵</caption>

		<tbody>
			<tr class="first tHead">
				<th scope="row" class="head head1"><h3><img src="/assets/kor/images/newMain/air.png" alt="" /> 대기</h3></th>
				<td class="count bottom ar">
					<div class="chBox">
						<img src="/assets/kor/images/newMain/t1_14000.png" alt="" style="width:85px;"/>
					</div>
					<span class="">대기</span><strong class="fontSize">${mvo.airH+mvo.airM+mvo.airL}</strong>건
				</td>
			</tr>
			<tr class="mapSubTr">
				<th class="air_contents">
					<img src="/assets/kor/images/newMain/map01.png" alt="하늘사진">
					<p>대기 중 물질정보</p>		
				</th>
				<td class="air_conSub">
					<ul>
						<c:forEach var="result" items="${airHData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${airMData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${airLData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>				
					</ul>
				</td>
			</tr>
			<tr class="tHead">
				<th scope="row" class="head head2"><h3><img src="/assets/kor/images/newMain/innerAir.png" alt="" /> 실내공기</h3></th>
				<td class="count bottom ar">
					<div class="chBox" style="margin-left:80px;">
						<img src="/assets/kor/images/newMain/t1_11000.png" alt=""/>
					</div>
					<span class="">실내</span><strong class="fontSize">${mvo.inAirH+mvo.inAirM+mvo.inAirL}</strong>건
				</td>
			</tr>
			<tr class="mapSubTr">
				<th class="air_contents">
					<img src="/assets/kor/images/newMain/map02.png" alt="실내전경">
					<p>실내공기 중 물질정보</p>		
				</th>
				<td class="air_conSub">
					<ul>
						<c:forEach var="result" items="${inAirHData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${inAirMData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${inAirLData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
					</ul>
				</td>
			</tr>

			<tr class="tHead">
				<th scope="row" class="head head3"><h3><img src="/assets/kor/images/newMain/water.png" alt="" /> 먹는물</h3></th>
				<td class="count bottom ar">
					<div class="chBox">
						<img src="/assets/kor/images/newMain/t2_15000.png" alt="" style="width:80px;"/>
					</div>
					<span class="">먹는물</span><strong class="fontSize">${mvo.waterH+mvo.waterM+mvo.waterL}</strong>건
				</td>
			</tr>
			<tr class="mapSubTr">
				<th class="air_contents">
					<img src="/assets/kor/images/newMain/map03.png" alt="물을따르는 장면">
					<p>먹는물 속 물질정보</p>		
				</th>
				<td class="air_conSub">
					<ul>
						<c:forEach var="result" items="${waterHData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${waterMData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${waterLData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
					</ul>
				</td>
			</tr>
			<tr class="tHead">
				<th scope="row" class="head head4"><h3><img src="/assets/kor/images/newMain/ground.png" alt="" /> 토양</h3></th>
				<td class="count bottom ar">
					<div class="chBox" style="margin-left:80px;">
						<img src="/assets/kor/images/newMain/t2_18000.png" alt=""/>
					</div>
					<span class="">먹는물</span><strong class="fontSize">${mvo.soilH+mvo.soilM+mvo.soilL}</strong>건
				</td>
			</tr>
			<tr class="mapSubTr">
				<th class="air_contents">
					<img src="/assets/kor/images/newMain/map04.png" alt="밭 전경">
					<p>토양 속 물질정보</p>		
				</th>
				<td class="air_conSub">
					<ul>
						<c:forEach var="result" items="${soilHData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${soilMData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${soilLData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
					</ul>
				</td>
			</tr>
			<tr class="tHead">
				<th scope="row" class="head head5"><h3><img src="/assets/kor/images/newMain/etc.png" alt="" /> 기타</h3></th>
				<td class="count bottom ar">
					<div class="chBox">
						<img src="/assets/kor/images/newMain/t1_15000.png" alt=""/>
					</div>
					<span class="">기타</span><strong class="fontSize">${mvo.otherM+mvo.otherH+mvo.otherL}</strong>건
				</td>
			</tr>
			<tr class="mapSubTr">
				<th class="air_contents">
					<img src="/assets/kor/images/newMain/map05.png" alt="화학관련 기구 사진">
					<p>생활 속 물질정보</p>		
				</th>
				<td class="air_conSub">
					<ul>
						<c:forEach var="result" items="${otherHData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${otherMData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${otherLData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
					</ul>
				</td>
			</tr>
			<tr class="tHead">
				<th scope="row" class="head head6"><h3><img src="/assets/kor/images/newMain/goods.png" alt="" /> 제품</h3></th>
				<td class="count bottom ar">
					<div class="chBox" style=" margin-left:80px;">
						<img src="/assets/kor/images/newMain/t1_18000.png" alt="" style="width:85px;"/>
					</div>
					<span class="">제품</span><strong class="fontSize">${mvo.productH+mvo.productM+mvo.productL}</strong>건
				</td>
			</tr>
			<tr class="mapSubTr">
				<th class="air_contents">
					<img src="/assets/kor/images/newMain/map06.png" alt="용기 사진">
					<p>제품에 들어있는 물질정보 </p>		
				</th>
				<td class="air_conSub">
					<ul>
						<c:forEach var="result" items="${productHData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${productMData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
						<c:forEach var="result" items="${productLData}" varStatus="status">
							<li onclick="doDetail('${result.idx}');"><c:out value="${result.kName}"/> </li>
						</c:forEach>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<!-- //contents -->
