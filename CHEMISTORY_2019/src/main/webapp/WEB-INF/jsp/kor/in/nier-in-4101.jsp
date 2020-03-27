<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
	try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
</script>
<script>
	$(document).ready(function(){
		$('.tabmenu a').click(function(i){
			var href = $(this).attr('href');
			$('div[class^=contents]').hide();
			//alert(href);
			$(href.replace("#",'.')).show();
		});
		
		$('#transBusIn').click(function(){
			$('#transBusImg').slideDown();
			$('#transBusIn').hide();
			$('#transBusOut').show();
		});
		
		$('#transBusOut').click(function(){
			$('#transBusImg').slideUp();
			$('#transBusIn').show();
			$('#transBusOut').hide();	
		});
		
		$('#transBusOut').hide();
		$('#transBusImg').hide();
		$('.time').hide();
		$('.time2').hide();
	});
	</script>
<div id="contents">
<div class="contents1">

	<!-- 본문내용 시작  -->
	<ul class="tabmenu cell3 clearfix">
		<li class="on"><a href="#contents1">찾아오시는 길</a></li>
		<li><a href="#contents2">통근버스안내</a></li>
		<li><a href="#contents3">셔틀버스안내</a></li>
	</ul>

	<div class="cts10801">


		<div id="map" class="map"></div>


		<div class="bus">
			<h2 class="h0">
				<img src="/images/contents/cts10801_h2_01.png" alt="대중교통 이용시" />
			</h2>
			<div class="route">
				<h3 class="h0">
					<img src="/images/contents/cts10801_ico_bus.png" alt="간선버스" />
				</h3>

				<ul class="bus1">
					<li><span>111-2</span> <a
						href="http://map.naver.com/?busId=21116" target="_blank"
						title="새창">동춘동 ↔ 서부공단 하차</a></li>
					<li><span>770</span> <a
						href="http://map.naver.com/?busId=21169" target="_blank"
						title="새창">계양구청앞 ↔ 서부공단 하차</a></li>
				</ul>

				<h3 class="h0">
					<img src="/images/contents/cts10801_ico_busred.png" alt="광역버스" />
				</h3>
				<ul class="bus2">
					<li><span>111</span> <a
						href="http://map.naver.com/?busId=21046" target="_blank"
						title="새창">계산역 ↔ 인천국제공항 : 국립생물자원관 정류장하차</a></li>
					<li><span>302</span> <a
						href="http://map.naver.com/?busId=21118" target="_blank"
						title="새창">송내역 ↔ 왕산해수욕장 : 국립생물자원관 정류장하차</a></li>
					<li><span>306</span> <a
						href="http://map.naver.com/?busId=21120" target="_blank"
						title="새창">인천역 ↔ 왕산해수욕장 : 국립생물자원관 정류장하차</a></li>
					<li><span>308</span> <a
						href="http://map.naver.com/?busId=21222" target="_blank"
						title="새창">김포북변터미널 ↔ 인천국제공항 : 국립생물자원관 정류장하차</a></li>
				</ul>
				<p class="txt">대중교통이용시에는 서부공단 이나 국립생물자원관 정류장에서 하차하시어 도보로20분이
					소요됩니다.</p>
			</div>

		</div>

		<div class="car">
			<h2 class="h0">
				<img src="/images/contents/cts10801_h2_02.png" alt="자가용 이용시" />
			</h2>
			<div class="route">
				<h3>서울 외곽순환도로</h3>
				<p>인천 계양IC(인천 계양구 방향) 10.2km 직진 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 환경연구단지 진입로 입구 우회전 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 어린이 환경과 건강포털</p>
				<h3>경인고속국도(서인천IC)</h3>
				<p>서인천IC<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />지하차도 진입 후 3km 직진 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 공촌사거리 좌회전 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 환경연구단지 진입로 우회전(약3.7km
					지점) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 어린이 환경과 건강포털</p>
				<h3>88올림픽도로</h3>
				<p>행주대교 남단IC(부천(국도 39호선), 수도권매립지방향) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 백석고가교 11km 직진(1km 전방 LPG
					충전소) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 공촌사거리 우회전 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 환경연구단지 진입로 우회전(약3.7km 지점) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 어린이 환경과 건강포털</p>
				<h3>경인천 아라뱃길</h3>
				<p>행주대교 남단IC(부천(국도 39호선), 수도권매립지방향) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 수송도로삼거리 방향 우회전 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 고가도로 옆길
					진입 후 좌회전 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 정서진로 따라 13.58km 직진(약 11km 진입 후 좌측 빨간건물 단지 보임) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 비보호신호등 앞
					좌회전 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 어린이 환경과 건강포털</p>
			</div>
		</div>

	</div>

</div>
<!-- //contents -->

<div class="contents2" style="display:none;">

	<!-- 본문내용 시작  -->
	<ul class="tabmenu cell3 clearfix">
		<li><a href="#contents1">찾아오시는 길</a></li>
		<li class="on"><a href="#contents2">통근버스안내</a></li>
		<li><a href="#contents3">셔틀버스안내</a></li>
	</ul>
	
	
	
	<div class="transBusstation">
    	<div class="transinfo">
            <span class="tit">탑승 예정시간보다 약 5분 일찍 나와 기다리세요.</span><br />
            문의전화 : 과학원 연구지원과(032-560-7011), 원더풀관광(031-977-7009), 수도관광(02-2636-2874)
            <span class="right" id="transBusIn"><a href="#none" class="btn01L btnlightgray"><img src="/assets/kor/images/contents/ic_bus.gif" alt="" /> 퇴근버스 탑승위치 <img src="/assets/kor/images/contents/ic_btnopen.gif" alt="" /></a></span>
            <span class="right" id="transBusOut"><a href="#none" class="btn01L btngreen"><img src="/assets/kor/images/contents/ic_buswhite.gif" alt="" /> 퇴근버스 탑승위치 <img src="/assets/kor/images/contents/ic_btnclose.gif" alt="" /></a></span>
        </div>
    	<div class="busstation" id="transBusImg">
        	<img src="/assets/kor/images/contents/map_commuter.gif" alt="퇴근버스 탑승위치" />
        </div>
    </div><!--//transBusstation-->

	<div id="route">
		<ul class="clearfix">
			<li>
            	<h2>서울</h2>
				<div class="obj">

					<div class="route_list section">
						<ul class="clearfix" id="routeMenu1">
							<li style="display: none;"><a href="#n" onclick="route('1')">강서구청/영등포구청 노선</a></li>
							<li><a href="#n" onclick="route('2')">불광/합정 노선</a></li>
							<li><a href="#n" onclick="route('3')">양재역/개포동 노선</a></li>
							<li><a href="#n" onclick="route('4')">개봉역/온수역 노선</a></li>
							<li style="display: none;"><a href="#n" onclick="route('5')">영등포구청 노선</a></li>
							<li style="display: none;"><a href="#n" onclick="route('6')">신도림/목동 노선</a></li>
							<li><a href="#n" onclick="route('7')">천호역/마포구청 노선</a></li>
							<li><a href="#n" onclick="route('8')">잠실역 노선</a></li>
							<li><a href="#n" onclick="route('9')">미아/공덕역 노선</a></li>
							<li><a href="#n" onclick="route('10')">서울대입구역/상도역 노선</a></li>
							<li><a href="#n" onclick="route('11')">태능/길음 노선</a></li>
							<li><a href="#n" onclick="route('12')">강남/이수 노선</a></li>
						</ul>
					</div>

					<div class="time r1">
						<h2>강서구청/영등포구청 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="강서구청/영등포구청 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:30</td>
									<td>화곡역</td>
									<td class="t_left">화곡역 1번출구 나와 버스정류장 지나 참요양병원 옆 동방약국 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=464503.125&urlY=1123221.875&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EC%84%9C%EA%B5%AC+%ED%99%94%EA%B3%A1%EB%8F%99+1052-5" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:38</td>
									<td>발산역</td>
									<td class="t_left">발산역 9번출구 나와 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=463882.5&urlY=1127651.875&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EC%84%9C%EA%B5%AC+%EB%A7%88%EA%B3%A1%EB%8F%99+727-1221" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:40</td>
									<td>마곡역</td>
									<td class="t_left">1번 출구 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=461566.25&urlY=1127963.75&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EC%84%9C%EA%B5%AC+%EB%A7%88%EA%B3%A1%EB%8F%99+727-715" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:43</td>
									<td>송정역</td>
									<td class="t_left">1번출구 50m 지나 횡단보도 미니스톱편의점앞</td>
                                    <td><a href="http://map.daum.net/?urlX=457995.625&urlY=1128412.5&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EC%84%9C%EA%B5%AC+%EA%B3%B5%ED%95%AD%EB%8F%99+45-39"  target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:48</td>
									<td>개화산역</td>
									<td class="t_left">1번출구에서 공항로까지 도보로이동 에스오일 스카이주유소 옆 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=456811.25&urlY=1131000&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EC%84%9C%EA%B5%AC+%EB%B0%A9%ED%99%94%EB%8F%99+524-11"  target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
								
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 매립지 공사 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 개화산 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 송정역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 마곡역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 발산역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 88체육관 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							염창역(→오목교역) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>신목동역(→영등포 구청역)</span>
						</div>
					</div>

					<div class="time r2">
						<h2>불광/합정 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="불광/합정 노선 정차명,승차장소,시간">
							<caption>출근</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:15</td>
									<td>연신내역</td>
									<td class="t_left">연신내역 4번 출구</td>
                                    <td><a href="http://map.daum.net/?urlX=482558.75&urlY=1144366.875&q=%EC%84%9C%EC%9A%B8+%EC%9D%80%ED%8F%89%EA%B5%AC+%EB%B6%88%EA%B4%91%EB%8F%99+487-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:17</td>
									<td>불광역</td>
									<td class="t_left">불광역 버스중앙차로 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=484777.5&urlY=1141535.625&q=%EC%84%9C%EC%9A%B8+%EC%9D%80%ED%8F%89%EA%B5%AC+%EB%8C%80%EC%A1%B0%EB%8F%99+15-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:25</td>
									<td>홍제동 사거리</td>
									<td class="t_left">온누리약국</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>7:35</td>
									<td>홍대입구역</td>
									<td class="t_left">2번 출구 및 공항철도 3번 출구 인근 홍익인간 오피스텔 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=483438.75&urlY=1127383.125&q=%EC%84%9C%EC%9A%B8+%EB%A7%88%ED%8F%AC%EA%B5%AC+%EB%8F%99%EA%B5%90%EB%8F%99+155-27" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:38</td>
									<td>합정역</td>
									<td class="t_left">2호선 1번 출구 하나은행앞  인천공항 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=481192.5&urlY=1125300&q=%EC%84%9C%EC%9A%B8+%EB%A7%88%ED%8F%AC%EA%B5%AC+%EC%84%9C%EA%B5%90%EB%8F%99+393-5-" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 합정역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 홍대입구 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연남동(대우 아파트) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 홍제동사거리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 불광역
							<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>연신내역</span>
						</div>

					</div>


					<div class="time r3">
						<h2>양재역/개포동 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="양재역/개포동 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:00</td>
									<td>수서역</td>
									<td class="t_left">수서역 1-1번출구 나와 뒤로돌아서 50m 지나 서울의료원 셔틀버스 정류장 간판에서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=522050&urlY=1108100&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EB%82%A8%EA%B5%AC+%EC%88%98%EC%84%9C%EB%8F%99+735" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>

							
								<tr>
									
									<td>7:10</td>
									<td>개포동 공무원(아)</td>
									<td class="t_left">수서에서 일원터널 나와 직진 대로변 마을버스 정류장 약150m전에서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=516631.875&urlY=1107760&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EB%82%A8%EA%B5%AC+%EC%9D%BC%EC%9B" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:14</td>
									<td>은마아파트 후문</td>
									<td class="t_left">학여울사거리 은마아파트 후문 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=516631.875&urlY=1107760&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EB%82%A8%EA%B5%AC+%EC%9D%BC%EC%9B%90%EB%8F%99+688" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:15</td>
									<td>도곡역</td>
									<td class="t_left">도곡역사거리 파출소지나서 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=512503.75&urlY=1108947.5&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EB%82%A8%EA%B5%AC+%EB%8C%80%EC%B9%98%EB%8F%99+600" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:24</td>
									<td>양재역</td>
									<td class="t_left">3번출구한남대교방향 50m전방 커피전문점</td>
                                    <td><a href="http://map.daum.net/?urlX=507507.5&urlY=1107207.5&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EB%82%A8%EA%B5%AC+%EB%8F%84%EA%B3%A1%EB%8F%99+953-3" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
							
								<tr>
									
									<td>7:37</td>
									<td>신사역</td>
									<td class="t_left">3호선 6번출구 한남대교방향공항버스 정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=504292.5&urlY=1116127.5&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EB%82%A8%EA%B5%AC+%EC%8B%A0%EC%82%AC%EB%8F%99+502-6" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 고속버스 터미널(성모병원) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 양재역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 도곡역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 대치역
							<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 개포동 공무원(아) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>수서역</span>
						</div>

					</div>

					<div class="time r4">
						<h2>개봉역/온수역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="개봉역/온수역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:15</td>
									<td>개봉역</td>
									<td class="t_left">개봉사거리방향 삼환로즈빌아파트 정문 탑승</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&target=car&rt=%2C%2C468716%2C1110561&rt1=&rt2=%EC%84%9C%EC%9A%B8+%EA%B5%AC%EB%A1%9C%EA%B5%AC+%EA%B3%A0%EC%B2%99%EB%8F%99+336&rtIds=%2C" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
									
								<tr>
									
									<td>7:16</td>
									<td>오류동 연세중앙교회</td>
									<td class="t_left">연세중앙교회 앞 횡단보도</td>
                                    <td><a href="http://map.daum.net/?urlX=463636.875&urlY=1109463.125&q=%EC%84%9C%EC%9A%B8+%EA%B5%AC%EB%A1%9C%EA%B5%AC+%EA%B6%81%EB%8F%99+189-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:20</td>
									<td>온수역</td>
									<td class="t_left">1호선 7번출구, 7호선 6번출구  횡단보도 건너 우측20m쯤 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=461035&urlY=1109302.5&q=%EC%84%9C%EC%9A%B8+%EA%B5%AC%EB%A1%9C%EA%B5%AC+%EC%98%A8%EC%88%98%EB%8F%99+11-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:50</td>
									<td>임학 지하도위</td>
									<td class="t_left">임학지하도 위 서해아파트 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=442820&urlY=1123407.5&q=%EC%9D%B8%EC%B2%9C+%EA%B3%84%EC%96%91%EA%B5%AC+%EB%B3%91%EB%B0%A9%EB%8F%99+440" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									<td>8:30<br />출발</td>
									<td>연구단지</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									<td>-</td>
									<td>매립지공사</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
								
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>(부천 노선) 연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 계양역입구 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 테크노파크 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 소풍 터미널 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 송내역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							중동역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>부천역</span>
						</div>

					</div>

					<div class="time r5">
						<h2>영등포구청노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="영등포구청노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:40</td>
									<td>영등포구청</td>
									<td class="t_left">영등포구청역 3번출구 구청사거리 횡단보도 건너 삼성생명빌딩 옆 동양타워버스정류장 앞(노무법인 산재)자전거대리점</td>
                                    <td><a href="http://map.daum.net/?urlX=477017.5&urlY=1119205&q=%EC%84%9C%EC%9A%B8+%EC%98%81%EB%93%B1%ED%8F%AC%EA%B5%AC+%EB%8B%B9%EC%82%B0%EB%8F%994%EA%B0%80+92-3" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:45</td>
									<td>신목동역</td>
									<td class="t_left">9호선 3번 출구 공항 및 시내버스정류장(식약청 건너편)</td>
                                    <td><a href="http://map.daum.net/?urlX=474291.875&urlY=1123384.375&q=%EC%84%9C%EC%9A%B8+%EC%96%91%EC%B2%9C%EA%B5%AC+%EB%AA%A9%EB%8F%99+143-27" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>

								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>없음</span>
						</div>

					</div>

					<div class="time r6">
						<h2>신도림/목동노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="신도림/목동노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:15</td>
									<td>신도림역</td>
									<td class="t_left">신도림역 나와 경인국도 인천방향 도로변 대우푸르지오 103동 정문앞(대일학원 앞 김밥분식집에서 탑승)(버스전용차로 아님)</td>
                                    <td><a href="http://map.daum.net/?urlX=475262.5&urlY=1113838.75&q=%EC%84%9C%EC%9A%B8+%EA%B5%AC%EB%A1%9C%EA%B5%AC+%EC%8B%A0%EB%8F%84%EB%A6%BC%EB%8F%99+337" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:17</td>
									<td>구로역</td>
									<td class="t_left">구로역에서 목동방향 우회전  공구상가 정문 입구 고려페인트 상가 앞 바닥에 CCTV라고 쓴곳에서 탑승 택시정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=473308.125&urlY=1112302.5&q=%EC%84%9C%EC%9A%B8+%EA%B5%AC%EB%A1%9C%EA%B5%AC+%EA%B5%AC%EB%A1%9C%EB%8F%99+604-19" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>7:27</td>
									<td>목동역</td>
									<td class="t_left">5번출구 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=470256.25&urlY=1118435&q=%EC%84%9C%EC%9A%B8+%EC%96%91%EC%B2%9C%EA%B5%AC+%EB%AA%A9%EB%8F%99+927" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:33</td>
									<td>현대백화점</td>
									<td class="t_left">백화점 맞은편 현대1차 아파트 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=472100&urlY=1118613.75&q=%EC%84%9C%EC%9A%B8+%EC%96%91%EC%B2%9C%EA%B5%AC+%EB%AA%A9%EB%8F%99+922" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>7:40</td>
									<td>신목동역</td>
									<td class="t_left">9호선 3번출구 공항및시내버스 정류장(식약청 맞은편)</td>
                                    <td><a href="http://map.daum.net/?urlX=474286.25&urlY=1123383.75&q=%EC%84%9C%EC%9A%B8+%EC%96%91%EC%B2%9C%EA%B5%AC+%EB%AA%A9%EB%8F%99+143-27" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>매립지공사</td>
									<td class="t_left">매립지공사</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>없음</span>
						</div>

					</div>

					<div class="time r7">
						<h2>천호역/마포구청 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="천호역/마포구청 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>6:55</td>
									<td>천호역</td>
									<td class="t_left">8번출구 광성교회 건너 GS25시 편의점 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=527225&urlY=1121631.25&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EB%8F%99%EA%B5%AC+%EC%84%B1%EB%82%B4%EB%8F%99+77-39" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:58</td>
									<td>광나루역</td>
									<td class="t_left">광나루역 1번 출구 에스오일 주유소지나 10m지나 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=522812.5&urlY=1123944.375&q=%EC%84%9C%EC%9A%B8+%EA%B4%91%EC%A7%84%EA%B5%AC+%EA%B4%91%EC%9E%A5%EB%8F%99+244-28" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>7:00</td>
									<td>군자역</td>
									<td class="t_left">중앙차로 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=518168.125&urlY=1126847.5&q=%EC%84%9C%EC%9A%B8+%EA%B4%91%EC%A7%84%EA%B5%AC+%EC%A4%91%EA%B3%A1%EB%8F%99+272-12" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:13</td>
									<td>신설동역</td>
									<td class="t_left">마리나병원 앞 중앙차로 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=505170&urlY=1132271.25&q=%EC%84%9C%EC%9A%B8+%EB%8F%99%EB%8C%80%EB%AC%B8%EA%B5%AC+%EC%8B%A0%EC%84%A4%EB%8F%99+85-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>7:42</td>
									<td>마포구청역</td>
									<td class="t_left">전철7번출구 버스정류장 지나서 5m</td>
                                    <td><a href="http://map.daum.net/?urlX=478497.5&urlY=1128692.5&q=%EC%84%9C%EC%9A%B8+%EB%A7%88%ED%8F%AC%EA%B5%AC+%EC%84%B1%EC%82%B0%EB%8F%99+350-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>(잠실역 노선) 연구단지(18:30)</span>  <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 외곽순환도로 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 천호역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 광성교회 앞 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							몽촌토성역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>잠실역</span>
						</div>

					</div>

					<div class="time r8">
						<h2>잠실역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="잠실역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:00</td>
									<td>개롱역</td>
									<td class="t_left">2번출구 30M후방 상아아파트 9동앞 택시정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=530040.625&urlY=1110654.375&q=%EC%84%9C%EC%9A%B8+%EC%86%A1%ED%8C%8C%EA%B5%AC+%EC%98%A4%EA%B8%88%EB%8F%99+165" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:02</td>
									<td>방이역</td>
									<td class="t_left">방이역 사거리 지나서 우측 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=527953.75&urlY=1113788.75&q=%EC%84%9C%EC%9A%B8+%EC%86%A1%ED%8C%8C%EA%B5%AC+%EC%98%A4%EA%B8%88%EB%8F%99+17-20" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:07</td>
									<td>몽촌토성역</td>
									<td class="t_left">남4문 임마누엘 교회(한미약품 건물) 맞은편 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=525358.75&urlY=1116041.25&q=%EC%84%9C%EC%9A%B8+%EC%86%A1%ED%8C%8C%EA%B5%AC+%EB%B0%A9%EC%9D%B4%EB%8F%99+88-21\" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:12</td>
									<td>잠실역</td>
									<td class="t_left">8번출구 후방50M 한라빌딩(시그마타워)앞</td>
                                    <td><a href="http://map.daum.net/?urlX=522639.375&urlY=1115258.125&q=%EC%84%9C%EC%9A%B8+%EC%86%A1%ED%8C%8C%EA%B5%AC+%EC%8B%A0%EC%B2%9C%EB%8F%99+7-19" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span>  <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 외곽순환도로 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 천호역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 광성교회 앞 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							몽촌토성역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>잠실역</span>
						</div>

					</div>

					<div class="time r9">
						<h2>미아/공덕역노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="미아/공덕역노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>6:55</td>
									<td>수유역</td>
									<td class="t_left">수유역 5번출구 중앙차로 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=505267.5&urlY=1149110&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EB%B6%81%EA%B5%AC+%EC%88%98%EC%9C%A0%EB%8F%99+140" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:57</td>
									<td>미아역</td>
									<td class="t_left">미아역 5번출구 버스중앙차로 버스정류장 맨 앞에서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=505867.5&urlY=1145842.5&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EB%B6%81%EA%B5%AC+%EB%AF%B8%EC%95%84%EB%8F%99+304-8" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:59</td>
									<td>미아삼거리역</td>
									<td class="t_left">미아삼거리역 버스중앙차로 버스정류장 앞에서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=506567.5&urlY=1142847.5&q=%EC%84%9C%EC%9A%B8+%EA%B0%95%EB%B6%81%EA%B5%AC+%EB%AF%B8%EC%95%84%EB%8F%99+61-81" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:02</td>
									<td>길음역</td>
									<td class="t_left">길음역 버스중앙차로에서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=505368.125&urlY=1140041.25&q=%EC%84%9C%EC%9A%B8+%EC%84%B1%EB%B6%81%EA%B5%AC+%EA%B8%B8%EC%9D%8C%EB%8F%99+541-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:06</td>
									<td>한성대 입구역</td>
									<td class="t_left">한성대입구 버스중앙차로 앞쪽에서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=501985&urlY=1136172.5&q=%EC%84%9C%EC%9A%B8+%EC%84%B1%EB%B6%81%EA%B5%AC+%EB%8F%99%EC%86%8C%EB%AC%B8%EB%8F%991%EA%B0%80+29-4" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:35</td>
									<td>공덕역</td>
									<td class="t_left">공덕역 3번출구나와 뒤돌아서 사이길안에 공덕약국에서 탑승(대성학원)</td>
                                    <td><a href="http://map.daum.net/?urlX=489332.5&urlY=1123835&q=%EC%84%9C%EC%9A%B8+%EB%A7%88%ED%8F%AC%EA%B5%AC+%EA%B3%B5%EB%8D%95%EB%8F%99+396-89" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>(태능/길음 노선) 연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 마포구청역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연대앞 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 경복궁역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 안국역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 혜화역
							<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 한성대입구역 (성신여대입구역 정차) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>길음역</span>
						</div>

					</div>

					<div class="time r10">
						<h2>서울대입구역/상도역노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="서울대입구역/상도역노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:25</td>
									<td>서울대입구역</td>
									<td class="t_left">2호선 서울대입구역 7번출구나와 신호등건너 버스전용차로 안내표지판 앞
									</td>
                                    <td><a href="http://map.daum.net/?urlX=489782.5&urlY=1106422.5&q=%EC%84%9C%EC%9A%B8+%EA%B4%80%EC%95%85%EA%B5%AC+%EB%B4%89%EC%B2%9C%EB%8F%99+974" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:27</td>
									<td>봉천고개</td>
									<td class="t_left">봉천고개 육교 밑</td>
                                    <td><a href="http://map.daum.net/?urlX=490400.625&urlY=1108999.375&q=%EC%84%9C%EC%9A%B8+%EB%8F%99%EC%9E%91%EA%B5%AC+%EC%83%81%EB%8F%84%EB%8F%99+407-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>7:34</td>
									<td>상도역</td>
									<td class="t_left">3번출구 상도동 성당 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=488360&urlY=1112353.125&q=%EC%84%9C%EC%9A%B8+%EB%8F%99%EC%9E%91%EA%B5%AC+%EC%83%81%EB%8F%84%EB%8F%99+34-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:37</td>
									<td>장승백이역</td>
									<td class="t_left">6번출구 20m 동작도서관입구(분수대)</td>
                                    <td><a href="http://map.daum.net/?urlX=486706.25&urlY=1112905&q=%EC%84%9C%EC%9A%B8+%EB%8F%99%EC%9E%91%EA%B5%AC+%EB%85%B8%EB%9F%89%EC%A7%84%EB%8F%99+310-150" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:40</td>
									<td>대방역</td>
									<td class="t_left">1호선 4번출구에서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=483811.875&urlY=1114860&q=%EC%84%9C%EC%9A%B8+%EC%98%81%EB%93%B1%ED%8F%AC%EA%B5%AC+%EC%8B%A0%EA%B8%B8%EB%8F%99+4203" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>(과천/사당 노선) 연구단지(18:30)</span><img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 이수역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 사당역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 과천9단지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 과천전화국 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>종합청사역</span>
						</div>

					</div>


					<div class="time r11">
						<h2>태능/길음 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="태릉/길음노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
                                <col width="12%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">시간(월)</th>
									<th scope="col">시간(화~금)</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
									<th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>6:30</td>
                                    <td>6:50</td>
									<td>하계역</td>
									<td class="t_left">6번 출구</td>
                                    <td><a href="http://map.daum.net/?urlX=514842.5&urlY=1149395&q=%EC%84%9C%EC%9A%B8+%EB%85%B8%EC%9B%90%EA%B5%AC+%ED%95%98%EA%B3%84%EB%8F%99+270" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:35</td>
                                    <td>6:55</td>
									<td>태릉역</td>
									<td class="t_left">1번 출구 메디홈스병원 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=516479.375&urlY=1143883.75&q=%EC%84%9C%EC%9A%B8+%EB%85%B8%EC%9B%90%EA%B5%AC+%EA%B3%B5%EB%A6%89%EB%8F%99+683-18" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:40</td>
                                    <td>7:00</td>
									<td>들곶이역</td>
									<td class="t_left">1번 출구 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=512386.25&urlY=1141959.375&q=%EC%84%9C%EC%9A%B8+%EC%84%B1%EB%B6%81%EA%B5%AC+%EC%9E%A5%EC%9C%84%EB%8F%99+64-115" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:47</td>
                                    <td>7:15</td>
									<td>길음역</td>
									<td class="t_left">2번출구 삼부 아파트106동 앞에서 탑승(동부센트러빌 건너)</td>
                                    <td><a href="http://map.daum.net/?urlX=505635&urlY=1139913.75&q=%EC%84%9C%EC%9A%B8+%EC%84%B1%EB%B6%81%EA%B5%AC+%EB%8F%88%EC%95%94%EB%8F%99+8-164" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:50</td>
                                    <td>7:20</td>
									<td>정릉숭덕초교</td>
									<td class="t_left">숭덕초등학교 교문 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=503083.75&urlY=1140061.25&q=%EC%84%9C%EC%9A%B8+%EC%84%B1%EB%B6%81%EA%B5%AC+%EC%A0%95%EB%A6%89%EB%8F%99+173-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
                                    <td>-</td>
									<td>매립지 공사</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
                                    <td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 마포구청역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연대앞 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 경복궁역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 안국역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 혜화역
							<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 한성대입구역 (성신여대입구역 정차) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>길음역</span>
						</div>

					</div>


					<div class="time r12">
						<h2>강남/이수 노선</h2>

						<h3>출근노선</h3>
						<table class="t1" summary="강남/이수 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:25</td>
									<td>강남역</td>
									<td class="t_left">9번 출구 나와서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=505850&urlY=1110655&q=%EC%84%9C%EC%9A%B8+%EC%84%9C%EC%B4%88%EA%B5%AC+%EC%84%9C%EC%B4%88%EB%8F%99+1317-20" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:28</td>
									<td>교대역</td>
									<td class="t_left">10번 출구 나와서 버스정류장 표지판에서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=502785&urlY=1109483.75&q=%EC%84%9C%EC%9A%B8+%EC%84%9C%EC%B4%88%EA%B5%AC+%EC%84%9C%EC%B4%88%EB%8F%99+1715-10" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:34</td>
									<td>방배역</td>
									<td class="t_left">4번 출구 나와서 20m 전방 골목건너 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=499465.625&urlY=1106256.25&q=%EC%84%9C%EC%9A%B8+%EC%84%9C%EC%B4%88%EA%B5%AC+%EB%B0%A9%EB%B0%B0%EB%8F%99+908-10" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:40</td>
									<td>이수역</td>
									<td class="t_left">4번 출구 전방15m 마을버스정류장(웬스타커피이수점)</td>
                                    <td><a href="http://map.daum.net/?urlX=496232.5&urlY=1107311.25&q=%EC%84%9C%EC%9A%B8+%EC%84%9C%EC%B4%88%EA%B5%AC+%EB%B0%A9%EB%B0%B0%EB%8F%99+3001-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									<td>8:30<br />출발</td>
									<td>연구단지</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									<td>-</td>
									<td>계량대</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									<td>-</td>
									<td>수처리처</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									<td>-</td>
									<td>그린에너지 앞</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									<td>-</td>
									<td>매립지공사</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
								
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>(과천/사당 노선) 연구단지(18:30)</span><img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 이수역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 사당역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 과천9단지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 과천전화국 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>종합청사역</span>
						</div>
					</div>

				</div>
			</li>
			<li>
            	<h2>수도권</h2>
				<div class="obj">
					<div class="route_list section2">
						<ul class="clearfix" id="routeMenu2">
							<li><a href="#n" onclick="route2('1')">김포/당하사거리</a></li>
							<li><a href="#n" onclick="route2('2')">과천/사당 노선</a></li>
							<li><a href="#n" onclick="route2('3')">수원 노선</a></li>
							<li><a href="#n" onclick="route2('4')">분당 노선</a></li>
							<li><a href="#n" onclick="route2('5')">일산/화정 노선</a></li>
							<li><a href="#n" onclick="route2('6')">일산/주엽 노선</a></li>
							<li><a href="#n" onclick="route2('7')">탄현/대화 노선</a></li>
							<li><a href="#n" onclick="route2('8')">평촌/범계 노선</a></li>
							<li><a href="#n" onclick="route2('9')">평촌/대림대학 노선</a></li>
							<li><a href="#n" onclick="route2('10')">산본/군포 노선</a></li>
							<li style="display: none;"><a href="#n" onclick="route2('11')">송내/삼산동 노선</a></li>
							<li><a href="#n" onclick="route2('12')">부천 노선</a></li>
							<li><a href="#n" onclick="route2('13')">부평/산곡동 노선</a></li>
							<li style="display: none;"><a href="#n" onclick="route2('14')">부평/작전 노선</a></li>
							<li style="display: none;"><a href="#n" onclick="route2('15')">검암1지구/검암역 노선</a></li>
							<li style="display: none;"><a href="#n" onclick="route2('16')">검암2지구/검암역 노선</a></li>
							<li><a href="#n" onclick="route2('17')">검단사거리 노선</a></li>
							<li><a href="#n" onclick="route2('18')">주안 노선</a></li>
							<li><a href="#n" onclick="route2('19')">송도/선학 노선</a></li>
							<li style="display: none;"><a href="#n" onclick="route2('20')">인천시청/길병원 노선</a></li>
							<li style="display: none;"><a href="#n" onclick="route2('21')">계산역 노선</a></li>
                            <li><a href="#n" onclick="route2('22')">검암역 노선</a></li>
                            <!--li><a href="#n" onclick="route2('23')">검암역 노선</a></li>
                            <li><a href="#n" onclick="route2('24')">검암역 노선</a></li>
                            <li><a href="#n" onclick="route2('25')">검암역 노선</a></li>
                            <li><a href="#n" onclick="route2('26')">검암역 노선</a></li-->
                            <li><a href="#n" onclick="route2('27')">청라 노선</a></li>
                            <li><a href="#n" onclick="route2('28')">계양역 노선</a></li>
							<li style="display: none;"><a href="#n" onclick="route2('100')">야간운행차량</a></li>
						</ul>
					</div>
					<div class="time2 r1">
						<h2>김포/당하사거리</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="김포/당하사거리 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="18%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:25</td>
									<td>고창중학교 버스정류장</td>
									<td class="t_left">장기사거리 지나 고창 중학교 버스정류장 김포한강4로91번 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=427222.5&urlY=1151105&q=%EA%B2%BD%EA%B8%B0+%EA%B9%80%ED%8F%AC%EC%8B%9C+%EC%9E%A5%EA%B8%B0%EB%8F%99+1592" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:37</td>
									<td>사우지구</td>
									<td class="t_left">사우삼거리 가기 전 육교아래</td>
                                    <td><a href="http://map.daum.net/?urlX=438506&urlY=1144377&q=%EA%B2%BD%EA%B8%B0+%EA%B9%80%ED%8F%AC%EC%8B%9C+%EC%82%AC%EC%9A%B0%EB%8F%99+915" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:40</td>
									<td>풍무사거리</td>
									<td class="t_left">풍무동 홈마트</td>
                                    <td><a href="http://map.daum.net/?urlX=438691.25&urlY=1140855&q=%EA%B2%BD%EA%B8%B0+%EA%B9%80%ED%8F%AC%EC%8B%9C+%ED%92%8D%EB%AC%B4%EB%8F%99+115-13" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:42</td>
									<td>유현 사거리</td>
									<td class="t_left">사거리 못미쳐 버스 정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=438273.75&urlY=1138736.25&q=%EA%B2%BD%EA%B8%B0+%EA%B9%80%ED%8F%AC%EC%8B%9C+%ED%92%8D%EB%AC%B4%EB%8F%99+743" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:46</td>
									<td>원당지구1</td>
									<td class="t_left">금호아파트 원당 사거리지나서 횡단보도</td>
                                    <td><a href="http://map.daum.net/?urlX=433508.75&urlY=1137238.75&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EB%8B%B9%ED%95%98%EB%8F%99+1028-17" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:47</td>
									<td>원당지구2</td>
									<td class="t_left">BYC 매장앞</td>
                                    <td><a href="http://map.daum.net/?urlX=432735&urlY=1137445&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EC%9B%90%EB%8B%B9%EB%8F%99+824-3" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:53</td>
									<td>당하 탑스빌</td>
									<td class="t_left">아파트 단지 입구 건너편 횡단보도 탑승 삼성디지털 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=427800&urlY=1136552.5&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EB%8B%B9%ED%95%98%EB%8F%99+1082-9" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>-</td>
									<td>매립지 공사</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span><img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 매립지 공사 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 왕길고가 좌회전 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 롯데마트 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 당하 사거리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 원당 지구 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							유현 사거리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 풍무동 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 사우동 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>장기사거리(고창 중학교)</span>
						</div>
					</div>

					<div class="time2 r2">
						<h2>과천/사당 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="과천/사당 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:10</td>
									<td>인덕원역</td>
									<td class="t_left">3번출구 후방 약200m 신성교회 (인덕원프라쟈빌딩) 개인택시정류장 횡단보도 지나탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=495005&urlY=1083250&q=%EA%B2%BD%EA%B8%B0+%EC%95%88%EC%96%91%EC%8B%9C+%EB%8F%99%EC%95%88%EA%B5%AC+%EA%B4%80%EC%96%91%EB%8F%99+1506-17" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:13</td>
									<td>과천2단지</td>
									<td class="t_left">2단지 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=497580&urlY=1089560&q=%EA%B2%BD%EA%B8%B0+%EA%B3%BC%EC%B2%9C%EC%8B%9C+%EC%9B%90%EB%AC%B8%EB%8F%99+2-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:15</td>
									<td>과천전화국종합청사역</td>
									<td class="t_left">과천전화국 맞은편 또는 1번 출구에서 사당방면 3 번째 횡단보도</td>
                                    <td><a href="http://map.daum.net/?urlX=498285&urlY=1091476.25&q=%EA%B2%BD%EA%B8%B0+%EA%B3%BC%EC%B2%9C%EC%8B%9C+%EB%B3%84%EC%96%91%EB%8F%99+1-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:17</td>
									<td>9단지입구</td>
									<td class="t_left">9단지 입구 버스 정류장 903동 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=499267.5&urlY=1093420&q=%EA%B2%BD%EA%B8%B0+%EA%B3%BC%EC%B2%9C%EC%8B%9C+%EB%B6%80%EB%A6%BC%EB%8F%99+56" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:27</td>
									<td>사당역</td>
									<td class="t_left">전철4호선 11번 출구 에스오일 가스충전소</td>
                                    <td><a href="http://map.daum.net/?urlX=496045&urlY=1105435.625&q=%EC%84%9C%EC%9A%B8+%EC%84%9C%EC%B4%88%EA%B5%AC+%EB%B0%A9%EB%B0%B0%EB%8F%99+443-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:33</td>
									<td>정금마을</td>
									<td class="t_left">버스중앙차로 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=496177.5&urlY=1109635.625&q=%EC%84%9C%EC%9A%B8+%EB%8F%99%EC%9E%91%EA%B5%AC+%EB%8F%99%EC%9E%91%EB%8F%99+55-3" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span><img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 이수역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 사당역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 과천9단지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 과천전화국 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>종합청사역</span>
						</div>

					</div>

					<div class="time2 r3">
						<h2>수원 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="수원 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="12%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">시간(월)</th>
									<th scope="col">시간(화~금)</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
									<th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>6:30</td>
									<td>6:45</td>
									<td>새수원주차장</td>
									<td class="t_left">담배인삼공사 정문 건너편 아래 버스정류장 (화서역에서 정자사거리방향)</td>
                                    <td><a href="http://map.daum.net/?urlX=500410&urlY=1046073.75&q=%EA%B2%BD%EA%B8%B0+%EC%88%98%EC%9B%90%EC%8B%9C+%ED%8C%94%EB%8B%AC%EA%B5%AC+%EB%A7%A4%EC%82%B0%EB%A1%9C1%EA%B0%80+57-42" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:34</td>
									<td>6:49</td>
									<td>중부경찰서</td>
									<td class="t_left">경찰서 정문 앞 건너편</td>
                                    <td><a href="http://map.daum.net/?urlX=499316.25&urlY=1054947.5&q=%EA%B2%BD%EA%B8%B0+%EC%88%98%EC%9B%90%EC%8B%9C+%EC%9E%A5%EC%95%88%EA%B5%AC+%EC%A0%95%EC%9E%90%EB%8F%99+897" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:38</td>
									<td>6:51</td>
									<td>종합운동장</td>
									<td class="t_left">북문지구대 대각선 건너편 성심한의원</td>
                                    <td><a href="http://map.daum.net/?urlX=501996&urlY=1054440&itemId=10475758" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:40</td>
									<td>6:55</td>
									<td>북문농협</td>
									<td class="t_left">농협 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=503170&urlY=1052490&q=%EA%B2%BD%EA%B8%B0+%EC%88%98%EC%9B%90%EC%8B%9C+%ED%8C%94%EB%8B%AC%EA%B5%AC+%EC%9E%A5%EC%95%88%EB%8F%99+2-6" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:45</td>
									<td>7:05</td>
									<td>수원 외국어마을</td>
									<td class="t_left">우만주공4단지 402동옆 건너편 (외국어마을) 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=506597.5&urlY=1053182.5&q=%EA%B2%BD%EA%B8%B0+%EC%88%98%EC%9B%90%EC%8B%9C+%ED%8C%94%EB%8B%AC%EA%B5%AC+%EC%9A%B0%EB%A7%8C%EB%8F%99+466-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:46</td>
									<td>7:06</td>
									<td>동성중학교</td>
									<td class="t_left">동성중학교 정문앞 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=507847.5&urlY=1051617.5&q=%EA%B2%BD%EA%B8%B0+%EC%88%98%EC%9B%90%EC%8B%9C+%ED%8C%94%EB%8B%AC%EA%B5%AC+%EC%9A%B0%EB%A7%8C%EB%8F%99+533" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:50</td>
									<td>7:10</td>
									<td>광교테크노벨리</td>
									<td class="t_left">광교테크노밸리 정문건너편 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=510530&urlY=1053640&q=%EA%B2%BD%EA%B8%B0+%EC%88%98%EC%9B%90%EC%8B%9C+%EC%98%81%ED%86%B5%EA%B5%AC+%EC%9D%B4%EC%9D%98%EB%8F%99+1331" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>-</td>
									<td>고속도로</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 자원관 정문 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 광교테크노벨리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 월드컵경기장 주차장입구 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							연무복지관 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 종합운동장 남문 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>새수원 주차장</span>
						</div>


					</div>

					<div class="time2 r4">
						<h2>분당 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="분당 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
                                <col width="12%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
									<th scope="col">시간(월)</th>
									<th scope="col">시간(화~금)</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
									<th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>6:30</td>
									<td>6:45</td>
									<td>오리역</td>
									<td class="t_left">3번출구 뒤돌아서 오리삼거리 모범택시 탑승장(신호등 밑)</td>
                                    <td><a href="http://map.daum.net/?urlX=524192.5&urlY=1066783.75&q=%EA%B2%BD%EA%B8%B0+%EC%84%B1%EB%82%A8%EC%8B%9C+%EB%B6%84%EB%8B%B9%EA%B5%AC+%EA%B5%AC%EB%AF%B8%EB%8F%99+196" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:32</td>
									<td>6:47</td>
									<td>미금역</td>
									<td class="t_left">1번 출구 모범택시 정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=524183.125&urlY=1069836.875&q=%EA%B2%BD%EA%B8%B0+%EC%84%B1%EB%82%A8%EC%8B%9C+%EB%B6%84%EB%8B%B9%EA%B5%AC+%EA%B8%88%EA%B3%A1%EB%8F%99+156" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:38</td>
									<td>6:52</td>
									<td>정자역</td>
									<td class="t_left">1번 출구 마을버스 정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=524000.625&urlY=1074187.5&q=%EA%B2%BD%EA%B8%B0+%EC%84%B1%EB%82%A8%EC%8B%9C+%EB%B6%84%EB%8B%B9%EA%B5%AC+%EC%A0%95%EC%9E%90%EB%8F%99+99-5" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:42</td>
									<td>6:58</td>
									<td>서현역</td>
									<td class="t_left">2번출구 육교건너와서육교밑(시범단지 버스정류장 옆)</td>
                                    <td><a href="http://map.daum.net/?urlX=527447.5&urlY=1078952.5&q=%EA%B2%BD%EA%B8%B0+%EC%84%B1%EB%82%A8%EC%8B%9C+%EB%B6%84%EB%8B%B9%EA%B5%AC+%EC%84%9C%ED%98%84%EB%8F%99+283-3" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:43</td>
									<td>7:00</td>
									<td>이매역</td>
									<td class="t_left">이매역 sk주유소앞 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=528522.5&urlY=1082891.25&q=%EA%B2%BD%EA%B8%B0+%EC%84%B1%EB%82%A8%EC%8B%9C+%EB%B6%84%EB%8B%B9%EA%B5%AC+%EC%9D%B4%EB%A7%A4%EB%8F%99+128-17" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:50</td>
									<td>7:05</td>
									<td>야탑역</td>
									<td class="t_left">1번 출구 버스정류장에서 성남방향으로 50m 지나 엘지전자 대리점상가앞</td>
                                    <td><a href="http://map.daum.net/?urlX=528605&urlY=1086867.5&q=%EA%B2%BD%EA%B8%B0+%EC%84%B1%EB%82%A8%EC%8B%9C+%EB%B6%84%EB%8B%B9%EA%B5%AC+%EC%95%BC%ED%83%91%EB%8F%99+364-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
                                <!-- <tr>
									
									<td>8:30</td>
									<td>8:30</td>
									<td>매립지 공사</td>
									<td class="t_left">종점(8:30 연구단지 출발)</td>
                                    <td>-</td>
								</tr> -->
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 자원관 정문 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 야탑역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 동신 아파트 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 서현역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 정자역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							 <span>미금역</span>
						</div>

					</div>

					<div class="time2 r5">
						<h2>일산/화정 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="일산/화정 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:40</td>
									<td>원당역</td>
									<td class="t_left">원당역 4번출구 신원당마을 방향으로 횡단보도 건너 자전거보관소옆 등나무정자</td>
                                    <td><a href="http://map.daum.net/?urlX=464802.5&urlY=1153862.5&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EB%8D%95%EC%96%91%EA%B5%AC+%EC%84%B1%EC%82%AC%EB%8F%99+392-7" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:42</td>
									<td>화정1동 사무소</td>
									<td class="t_left">화수빌딩 화수문고</td>
                                    <td><a href="http://map.daum.net/?urlX=463327.5&urlY=1151446.25&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EB%8D%95%EC%96%91%EA%B5%AC+%ED%99%94%EC%A0%95%EB%8F%99+864" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:47</td>
									<td>화정역</td>
									<td class="t_left">화정역4번출구 나와 화정버스 터미널 입구</td>
                                    <td><a href="http://map.daum.net/?urlX=463208.75&urlY=1148675&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EB%8D%95%EC%96%91%EA%B5%AC+%ED%99%94%EC%A0%95%EB%8F%99+1093" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:49</td>
									<td>17단지 롯데마트</td>
									<td class="t_left">17단지 버스정류장 30m 못미쳐 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=463765&urlY=1146487.5&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EB%258+C167:D167D%95%EC%96%91%EA%B5%AC+%ED%99%94%EC%A0%95%EB%8F%99+1137" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:50</td>
									<td>고양경찰서</td>
									<td class="t_left">중앙차로 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=462269.375&urlY=1146595&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EB%8D%95%EC%96%91%EA%B5%AC+%ED%99%94%EC%A0%95%EB%8F%99+1152" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:52</td>
									<td>대곡역</td>
									<td class="t_left">중앙차로 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=458525&urlY=1147725&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EB%8D%95%EC%96%91%EA%B5%AC+%ED%86%A0%EB%8B%B9%EB%8F%99+174-5" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 마두역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 백석역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 대곡역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 화정고가 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 고양경찰서
							<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 롯데마트 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 5단지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 2단지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>원당역</span>
						</div>


					</div>

					<div class="time2 r6">
						<h2>일산/주엽 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="일산/주엽 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:35</td>
									<td>후동공원</td>
									<td class="t_left">후동공원버스 정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=449027.5&urlY=1161657.5&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EC%84%9C%EA%B5%AC+%EC%9D%BC%EC%82%B0%EB%8F%99+1400" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:40</td>
									<td>후곡태영18단지</td>
									<td class="t_left">태영아파트 육교 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=449937.5&urlY=1159295&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EC%84%9C%EA%B5%AC+%EC%A3%BC%EC%97%BD%EB%8F%99+164" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:42</td>
									<td>정발우체국</td>
									<td class="t_left">우체국지나 정발성당앞</td>
                                    <td><a href="http://map.daum.net/?urlX=451358.75&urlY=1159061.25&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EB%8F%99%EA%B5%AC+%EC%A0%95%EB%B0%9C%EC%82%B0%EB%8F%99+1207-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:45</td>
									<td>하이스트학원</td>
									<td class="t_left">암센타에서 내려와 자유로 방향으로 우회전 후 코너에서 탑승(푸른학원 건너편)</td>
                                    <td><a href="http://map.daum.net/?urlX=452995&urlY=1155515&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EB%8F%99%EA%B5%AC+%EB%A7%88%EB%91%90%EB%8F%99+918" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:48</td>
									<td>마두역</td>
									<td class="t_left">마두역1번출구</td>
                                    <td><a href="http://map.daum.net/?urlX=450989.375&urlY=1153310&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EB%8F%99%EA%B5%AC+%EC%9E%A5%ED%95%AD%EB%8F%99+895" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:49</td>
									<td>백석역</td>
									<td class="t_left">버스중앙차로 백석역 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=453194.375&urlY=1151114.375&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EB%8F%99%EA%B5%AC+%EB%B0%B1%EC%84%9D%EB%8F%99+1628" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									<td>8:25<br />출발</td>
									<td>연구단지</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									<td>-</td>
									<td>매립지공사</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>(일산/화정 노선) 연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 마두역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 백석역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 대곡역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 화정고가 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 고양경찰서
							<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 롯데마트 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 5단지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 2단지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>원당역</span>
						</div>


					</div>

					<div class="time2 r7">
						<h2>탄현/대화 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="일산/대화 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:10</td>
									<td>탄현역</td>
									<td class="t_left">철산아파트 건너편 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=447055&urlY=1165362.5&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EC%84%9C%EA%B5%AC+%EB%8D%95%EC%9D%B4%EB%8F%99+274-34" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>7:22</td>
									<td>주엽역</td>
									<td class="t_left">5번출구 그랜드백화점</td>
                                    <td><a href="http://map.daum.net/?urlX=447251.25&urlY=1158681.25&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EC%84%9C%EA%B5%AC+%EC%A3%BC%EC%97%BD%EB%8F%99+22-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:25</td>
									<td>대화역</td>
									<td class="t_left">6번 출구 아래 우리은행</td>
                                    <td><a href="http://map.daum.net/?urlX=444646.25&urlY=1160107.5&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EC%84%9C%EA%B5%AC+%EB%8C%80%ED%99%94%EB%8F%99+2202-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:30</td>
									<td>대화마을</td>
									<td class="t_left">양우아파트 704동 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=441437.5&urlY=1158650&q=%EA%B2%BD%EA%B8%B0+%EA%B3%A0%EC%96%91%EC%8B%9C+%EC%9D%BC%EC%82%B0%EC%84%9C%EA%B5%AC+%EB%8C%80%ED%99%94%EB%8F%99+2579" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:43</td>
									<td>백두아파트</td>
									<td class="t_left">동성,길음아파트 건너편 백두아파트버스정류장 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=430620&urlY=1143072.5&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EB%B6%88%EB%A1%9C%EB%8F%99+776-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>매립지공사</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 매립지 공사 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 백두아파트 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 대화마을 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>대화역</span> 
						</div>


					</div>

					<div class="time2 r8">
						<h2>평촌/범계 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="평촌/범계 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
                                <col width="12%" />
								<col width="13%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">시간(월)</th>
									<th scope="col">시간(화~금)</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
									<th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>6:50</td>
                                    <td>7:10</td>
									<td>평촌역</td>
									<td class="t_left">평촌역1번 출구한림대병원 맞은편 도로변 현대아이 스페이스 빌딩 출입문</td>
                                    <td><a href="http://map.daum.net/?urlX=491680&urlY=1081545&q=%EA%B2%BD%EA%B8%B0+%EC%95%88%EC%96%91%EC%8B%9C+%EB%8F%99%EC%95%88%EA%B5%AC+%EA%B4%80%EC%96%91%EB%8F%99+1606" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:53</td>
                                    <td>7:13</td>
									<td>안양시청</td>
									<td class="t_left">안양시청 정문 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=490465&urlY=1082092.5&q=%EA%B2%BD%EA%B8%B0+%EC%95%88%EC%96%91%EC%8B%9C+%EB%8F%99%EC%95%88%EA%B5%AC+%EA%B4%80%EC%96%91%EB%8F%99+1590" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:55</td>
                                    <td>7:15</td>
									<td>범계역</td>
									<td class="t_left">범계역1번 출구 횡단보도건너 금강벤처텔앞 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=488873.75&urlY=1080936.25&q=%EA%B2%BD%EA%B8%B0+%EC%95%88%EC%96%91%EC%8B%9C+%EB%8F%99%EC%95%88%EA%B5%AC+%EB%B9%84%EC%82%B0%EB%8F%99+1107-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>6:56</td>
                                    <td>7:16</td>
									<td>비산사거리</td>
									<td class="t_left">비산사거리 버스정류장 지하도입구 로하스 안양효 노인병원 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=486517.5&urlY=1082542.5&q=%EA%B2%BD%EA%B8%B0+%EC%95%88%EC%96%91%EC%8B%9C+%EB%8F%99%EC%95%88%EA%B5%AC+%EB%B9%84%EC%82%B0%EB%8F%99+422-11" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
                                    <td>-</td>
									<td>외곽순환도로</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
                                    <td>-</td>
									<td>연구단지</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
                                <tr>
									
									<td>8:25</td>
                                    <td>8:25</td>
									<td>매립지</td>
									<td class="t_left">종점(8:25 연구단지 출발)</td>
                                    <td>-</td>
								</tr>

							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 관악역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 범계역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 평촌역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							<span>인덕원역</span>
						</div>


					</div>

					<div class="time2 r9">
						<h2>평촌/대림대학 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="평촌/대림대학 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="12%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">시간(월)</th>
									<th scope="col">시간(화~금)</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
									<th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:00</td>
                                    <td>7:10</td>
									<td>관양동 사거리</td>
									<td class="t_left">GS셀프주유소에서 탑승 효재점 향군회관 빌딩(한국요가연수원, 송원꽃화원)옆</td>
                                    <td><a href="http://map.daum.net/?urlX=490375.625&urlY=1084418.125&q=%EA%B2%BD%EA%B8%B0+%EC%95%88%EC%96%91%EC%8B%9C+%EB%8F%99%EC%95%88%EA%B5%AC+%EA%B4%80%EC%96%91%EB%8F%99+1385-5" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:01</td>
                                    <td>7:11</td>
									<td>뉴타운삼호아파트</td>
									<td class="t_left">삼호아파트 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=487865.625&urlY=1084609.375&q=%EA%B2%BD%EA%B8%B0+%EC%95%88%EC%96%91%EC%8B%9C+%EB%8F%99%EC%95%88%EA%B5%AC+%EB%B9%84%EC%82%B0%EB%8F%99+320-3" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
                                <tr>
									
									<td>7:05</td>
                                    <td>7:15</td>
									<td>비산삼성 래미안아파트</td>
									<td class="t_left">비산도서관 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=486222.5&urlY=1083261.25&q=%EA%B2%BD%EA%B8%B0+%EC%95%88%EC%96%91%EC%8B%9C+%EB%8F%99%EC%95%88%EA%B5%AC+%EB%B9%84%EC%82%B0%EB%8F%99+459-56" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
                                
								<tr>
									
									<td>7:06</td>
                                    <td>7:16</td>
									<td>대림대학</td>
									<td class="t_left">경수산업도로 대림대학 정문입구 버스정류장 5m전방에서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=484706.875&urlY=1084111.875&q=%EA%B2%BD%EA%B8%B0+%EC%95%88%EC%96%91%EC%8B%9C+%EB%8F%99%EC%95%88%EA%B5%AC+%EB%B9%84%EC%82%B0%EB%8F%99+526-7" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:08</td>
                                    <td>7:18</td>
									<td>관악역</td>
									<td class="t_left">경수산업도로 삼성초등학교지나서 버스정류장(관악역 맞은편버스정류장)</td>
                                    <td><a href="http://map.daum.net/?urlX=480161.25&urlY=1088985&q=%EA%B2%BD%EA%B8%B0+%EC%95%88%EC%96%91%EC%8B%9C+%EB%A7%8C%EC%95%88%EA%B5%AC+%EC%84%9D%EC%88%98%EB%8F%99+805" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
                                    <td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
								
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>(평촌/범계 노선) 연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 관악역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 범계역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 평촌역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							<span>인덕원역</span>
						</div>
					</div>

					<div class="time2 r10">
						<h2>산본/군포 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="산본/군포 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="12%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">시간(월)</th>
									<th scope="col">시간(화~금)</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
									<th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>6:55</td>
                                    <td>7:05</td>
									<td>군포역</td>
									<td class="t_left">군포역 안양방면 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=488017.5&urlY=1070430&q=%EA%B2%BD%EA%B8%B0+%EA%B5%B0%ED%8F%AC%EC%8B%9C+%EB%8B%B9%EB%8F%99+776-23" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
                                <tr>
									
									<td>7:00</td>
                                    <td>7:10</td>
									<td>산본1단지</td>
									<td class="t_left">아파트입구 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=485872.5&urlY=1071677.5&q=%EA%B2%BD%EA%B8%B0+%EA%B5%B0%ED%8F%AC%EC%8B%9C+%EA%B8%88%EC%A0%95%EB%8F%99+849-7" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:02</td>
                                    <td>7:12</td>
									<td>산본역</td>
									<td class="t_left">군포 우체국앞</td>
                                    <td><a href="http://map.daum.net/?urlX=485328.75&urlY=1072467.5&q=%EA%B2%BD%EA%B8%B0+%EA%B5%B0%ED%8F%AC%EC%8B%9C+%EA%B8%88%EC%A0%95%EB%8F%99+846" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
                                    <td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 자원관 정문 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 문화회관 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 산본역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 산본1단지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span> 군포역 </span>
						</div>


					</div>

					<div class="time2 r11">
						<h2>송내/삼산동 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="송내/삼산동 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:30</td>
									<td>송내역</td>
									<td class="t_left">송내역 북광장 뉴욕웨딩홀 광장</td>
                                    <td><a href="http://map.daum.net/?urlX=445672.5&urlY=1108040&q=%EA%B2%BD%EA%B8%B0+%EB%B6%80%EC%B2%9C%EC%8B%9C+%EC%9B%90%EB%AF%B8%EA%B5%AC+%EC%83%81%EB%8F%99+464-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:35</td>
									<td>상동홈플러스</td>
									<td class="t_left">홈플러스 건너 무지개고가도로 끝지점 좌석버스 정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=445891.25&urlY=1113026.25&q=%EA%B2%BD%EA%B8%B0+%EB%B6%80%EC%B2%9C%EC%8B%9C+%EC%9B%90%EB%AF%B8%EA%B5%AC+%EC%83%81%EB%8F%99+535-9" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:38</td>
									<td>삼산체육관</td>
									<td class="t_left">삼산체육관 정문(남문)앞 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=441978.75&urlY=1113267.5&q=%EC%9D%B8%EC%B2%9C+%EB%B6%80%ED%8F%89%EA%B5%AC+%EC%82%BC%EC%82%B0%EB%8F%99+458-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:40</td>
									<td>삼산동</td>
									<td class="t_left">삼산동 삼산타운 1단지 103동 옆(천대고가방향)버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=440782.5&urlY=1114822.5&q=%EC%9D%B8%EC%B2%9C+%EB%B6%80%ED%8F%89%EA%B5%AC+%EC%82%BC%EC%82%B0%EB%8F%99+440-6" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
								
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>없음 </span>
						</div>


					</div>

					<div class="time2 r12">
						<h2>부천 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="부천 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:30</td>
									<td>부천역</td>
									<td class="t_left">남쪽광장(남부역) 경인국도 시내,외 버스정류장 횡단보도 올리비아로렌에서 탑승(농협, 대신증권 길건너)</td>
                                    <td><a href="http://map.daum.net/?urlX=452082.5&urlY=1106663.75&q=%EA%B2%BD%EA%B8%B0+%EB%B6%80%EC%B2%9C%EC%8B%9C+%EC%86%8C%EC%82%AC%EA%B5%AC+%EC%8B%AC%EA%B3%A1%EB%B3%B8%EB%8F%99+551-5" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:33</td>
									<td>위브더스테이트</td>
									<td class="t_left">두산 위브더스테이트 302동 앞 육교 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=450854.375&urlY=1110935.625&q=%EA%B2%BD%EA%B8%B0+%EB%B6%80%EC%B2%9C%EC%8B%9C+%EC%9B%90%EB%AF%B8%EA%B5%AC+%EC%A4%91%EB%8F%99+1110-5" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:40</td>
									<td>부천시청</td>
									<td class="t_left">시청정문건너편 쌍용자동차 대리점 앞 </td>
                                    <td><a href="http://map.daum.net/?urlX=448527.5&urlY=1112605&q=%EA%B2%BD%EA%B8%B0+%EB%B6%80%EC%B2%9C%EC%8B%9C+%EC%9B%90%EB%AF%B8%EA%B5%AC+%EC%A4%91%EB%8F%99+1034-5" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:42</td>
									<td>상동역</td>
									<td class="t_left">상동역 5번출구</td>
                                    <td><a href="http://map.daum.net/?urlX=445280&urlY=1113031.25&q=%EA%B2%BD%EA%B8%B0+%EB%B6%80%EC%B2%9C%EC%8B%9C+%EC%9B%90%EB%AF%B8%EA%B5%AC+%EC%83%81%EB%8F%99+534-10" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 계양역입구 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 테크노파크 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 소풍 터미널 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 송내역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							중동역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>부천역</span>
						</div>


					</div>

					<div class="time2 r13">
						<h2>부평/산곡동 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="부평/산곡동 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>
							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:45</td>
									<td>백운사거리</td>
									<td class="t_left">현대(아)1단지 569번 마을 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=435546.25&urlY=1108015&q=%EC%9D%B8%EC%B2%9C+%EB%B6%80%ED%8F%89%EA%B5%AC+%EC%82%B0%EA%B3%A1%EB%8F%99+%EC%82%B0+40-7" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:50</td>
									<td>산곡사거리</td>
									<td class="t_left">롯데마트 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=434498.75&urlY=1112731.25&q=%EC%9D%B8%EC%B2%9C+%EB%B6%80%ED%8F%89%EA%B5%AC+%EC%82%B0%EA%B3%A1%EB%8F%99+159-52" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:58</td>
									<td>우리은행</td>
									<td class="t_left">(구)한빛은행 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=434330&urlY=1112470&q=%EC%9D%B8%EC%B2%9C+%EB%B6%80%ED%8F%89%EA%B5%AC+%EC%82%B0%EA%B3%A1%EB%8F%99+182" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>8:05</td>
									<td>미나리깡</td>
									<td class="t_left">신현 주공 후문 버스 정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=427742.5&urlY=1117427.5&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EC%8B%A0%ED%98%84%EB%8F%99+302-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<!-- <tr>
									<td>8:10</td>
									<td>청라지구</td>
									<td class="t_left">청라고등학교 입구 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=424932.5&urlY=1121672.5&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EC%97%B0%ED%9D%AC%EB%8F%99+786-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr> -->
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
								<!-- <tr>
									<td>8:35</td>
									<td>매립지 공사</td>
									<td class="t_left">종점(8:35 연구단지 출발)</td>
                                    <td>-</td>
								</tr> -->
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>매립지공사 홍보관(18:00)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 그린에너지앞(18:05)<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 수처리처(18:08)<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 계량대(18:13)<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연구단지(18:30)<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 미나리깡 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 석남동 우리은행 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 산곡사거리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 백운 사거리
							<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>부평역</span>
						</div>


					</div>

					<div class="time2 r14">
						<h2>부평/작전 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="부평/작전 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:40</td>
									<td>부평역</td>
									<td class="t_left">북광장으로 나와 택시정류장 횡단보도 건너 탑승(역 청사건너)</td>
                                    <td><a href="http://map.daum.net/?urlX=438927.5&urlY=1108805&q=%EC%9D%B8%EC%B2%9C+%EB%B6%80%ED%8F%89%EA%B5%AC+%EB%B6%80%ED%8F%89%EB%8F%99+224-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:50</td>
									<td>작전역</td>
									<td class="t_left">홈플러스 건너편 아웃백 주차장 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=438750&urlY=1119376.25&q=%EC%9D%B8%EC%B2%9C+%EA%B3%84%EC%96%91%EA%B5%AC+%EC%9E%91%EC%A0%84%EB%8F%99+866-26" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>8:00</td>
									<td>계양CGV</td>
									<td class="t_left">계양CGV앞</td>
                                    <td><a href="http://map.daum.net/?urlX=441288.75&urlY=1120723.125&q=%EC%9D%B8%EC%B2%9C+%EA%B3%84%EC%96%91%EA%B5%AC+%EC%9E%91%EC%A0%84%EB%8F%99+899-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>아라뱃길</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
                                <tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 계양역입구 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 임학지하도위 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 그랜드마트 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 계양CGV
							<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>삼산롯데마트</span>
						</div>

					</div>

					<div class="time2 r15">
						<h2>검암1지구/검암역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="검암1지구/검암역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>08:05</td>
									<td>빈정내사거리</td>
									<td class="t_left">빈정내사거리 검암1지구방향 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=427817.5&urlY=1127272.5&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EA%B2%80%EC%95%94%EB%8F%99+661-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>08:07</td>
									<td>삼보아파트</td>
									<td class="t_left">태건프라쟈 은혜교회 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=427843.75&urlY=1128618.125&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EA%B2%80%EC%95%94%EB%8F%99+626-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>08:08</td>
									<td>서해아파트</td>
									<td class="t_left">검암선두교회 서해아파트 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=428048.125&urlY=1129471.875&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EA%B2%80%EC%95%94%EB%8F%99+606-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>08:15</td>
									<td>검암역</td>
									<td class="t_left">검암역 셔틀버스 정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=428031.25&urlY=1130398.75&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EA%B2%80%EC%95%94%EB%8F%99+399-104" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30 정문밖에서 탑승) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 검암역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>검암1지구</span>
						</div>


					</div>

					<div class="time2 r16">
						<h2>검암2지구/검암역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="검암2지구/검암역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>08:15</td>
									<td>검암2지구</td>
									<td class="t_left">파리바게트 앞</td>
                                    <td><a href="http://map.daum.net/?urlX=430005&urlY=1130080&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EA%B2%80%EC%95%94%EB%8F%99+508-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>08:25</td>
									<td>검암역</td>
									<td class="t_left">검암역 셔틀버스 정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=428031.25&urlY=1130398.75&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EA%B2%80%EC%95%94%EB%8F%99+399-104" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>

								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:10 정문밖에서 탑승) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>검암역</span>
						</div>


					</div>

					<div class="time2 r17">
						<h2>검단사거리 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="검단사거리 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>8:00</td>
									<td>검단사거리</td>
									<td class="t_left">검단1동 사무소 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=424959.375&urlY=1139477.5&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EB%A7%88%EC%A0%84%EB%8F%99+982-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>8:02</td>
									<td>마전동 동아아파트</td>
									<td class="t_left">동아아파트 건너편 동아서점</td>
                                    <td><a href="http://map.daum.net/?urlX=427554.375&urlY=1137796.875&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EB%A7%88%EC%A0%84%EB%8F%99+1002-10" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>매립지공사</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>(김포/당하사거리 노선) 연구단지(18:30)</span><img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 매립지 공사 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 왕길고가 좌회전 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 롯데마트 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 당하 사거리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 원당 지구 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							유현 사거리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 풍무동 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 사우동 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>장기사거리(고창 중학교)</span>
						</div>


					</div>

					<div class="time2 r18">
						<h2>주안 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="주안 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:40</td>
									<td>석바위사거리</td>
									<td class="t_left">양소아 청소년과의원 앞</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EC%96%91%EC%86%8C%EC%95%84+%EC%B2%AD%EC%86%8C%EB%85%84%EA%B3%BC%EC%9D%98%EC%9B%90&urlX=430937&urlY=1099780&urlLevel=3&itemId=8433103" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:43</td>
									<td>주안 대한생명</td>
									<td class="t_left">구)시민회관 사거리 교보빌딩 버스정류장</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&q=37468(%EC%9D%B8%EC%B2%9C)&urlX=428895&urlY=1100172&urlLevel=3&busStopId=BS101516" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:45</td>
									<td>주안역</td>
									<td class="t_left">남부역 광장 사거리 신호등지나 우측 탑승 시계탑 조형물 앞에서 탑승</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EC%A3%BC%EC%95%88%EC%97%AD&urlX=429377&urlY=1101696&urlLevel=3&itemId=8517413" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:57</td>
									<td>동인천역</td>
									<td class="t_left">지구대 옆 버스정류장지나 터널쪽 구두가게에서 탑승</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EB%8F%99%EC%9D%B8%EC%B2%9C%EC%97%AD&urlX=418786&urlY=1104622&urlLevel=3&itemId=21160563" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									
									<td>8:00</td>
									<td>송현주공</td>
									<td class="t_left">솔빛마을 1단지 버스정류장</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EC%86%94%EB%B9%9B%EB%A7%88%EC%9D%84+1%EB%8B%A8%EC%A7%80&urlX=419302&urlY=1105755&urlLevel=3&itemId=9927419" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>8:40<br />출발</td>
									<td>연구단지</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>매립지공사</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
								
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>(송도/선학 노선) 매립지공사(18:10)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연구단지(18:30)  <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 송현주공 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 동인천역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 송도신도시 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 동춘역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							원인제역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>선학사거리</span>
						</div>


					</div>

					<div class="time2 r19">
						<h2>송도/선학 노선</h2>

						<h3>출근노선</h3>
						<table class="t1" summary="송도/선학 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:15</td>
									<td>선학사거리</td>
									<td class="t_left">선학 공영주차장 입구</td>
                                    <td><a href="http://map.daum.net/?urlX=433020&urlY=1089757.5&q=%EC%9D%B8%EC%B2%9C+%EC%97%B0%EC%88%98%EA%B5%AC+%EC%97%B0%EC%88%98%EB%8F%99+532-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:18</td>
									<td>원인제역</td>
									<td class="t_left">원인제역 6번 출구</td>
                                    <td><a href="http://map.daum.net/?urlX=431007.5&urlY=1087307.5&q=%EC%9D%B8%EC%B2%9C+%EC%97%B0%EC%88%98%EA%B5%AC+%EC%97%B0%EC%88%98%EB%8F%99+582-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:20</td>
									<td>동춘역</td>
									<td class="t_left">동춘역 4번출구</td>
                                    <td><a href="http://map.daum.net/?urlX=429082.5&urlY=1084980&q=%EC%9D%B8%EC%B2%9C+%EC%97%B0%EC%88%98%EA%B5%AC+%EB%8F%99%EC%B6%98%EB%8F%99+925-7" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:27</td>
									<td>송도신도시 1</td>
									<td class="t_left">송도풍림 아이원4단지</td>
                                    <td><a href="http://map.daum.net/?urlX=423968.75&urlY=1081668.75&q=%EC%9D%B8%EC%B2%9C+%EC%97%B0%EC%88%98%EA%B5%AC+%EC%86%A1%EB%8F%84%EB%8F%99+2-9" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:32</td>
									<td>송도신도시 2</td>
									<td class="t_left">송도더샾 7단지 그린에비뉴</td>
                                    <td><a href="http://map.daum.net/?urlX=421962.5&urlY=1083382.5&q=%EC%9D%B8%EC%B2%9C+%EC%97%B0%EC%88%98%EA%B5%AC+%EC%86%A1%EB%8F%84%EB%8F%99+16-8" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
								<!-- <tr>
									<td>8:40</td>
									<td>매립지공사</td>
									<td class="t_left">종점(8:40연구단지 출발)</td>
                                    <td>-</td>
								</tr> -->
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>매립지공사(18:10)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연구단지(18:30)  <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 송현주공 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 동인천역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 송도신도시 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 동춘역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							원인제역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>선학사거리</span>
						</div>

					</div>

					<div class="time2 r20">
						<h2>인천시청/길병원 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="인천시청/길병원 노선정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:30</td>
									<td>남동구 삼환(아)</td>
									<td class="t_left">삼환아파트</td>
                                    <td><a href="http://map.daum.net/?urlX=440958.75&urlY=1097080&q=%EC%9D%B8%EC%B2%9C+%EB%82%A8%EB%8F%99%EA%B5%AC+%EB%A7%8C%EC%88%98%EB%8F%99+983-4" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:40</td>
									<td>길병원</td>
									<td class="t_left">버스정류장 편의점 앞(이비인후과 병동 앞)</td>
                                    <td><a href="http://map.daum.net/?urlX=436100&urlY=1097416.25&q=%EC%9D%B8%EC%B2%9C+%EB%82%A8%EB%8F%99%EA%B5%AC+%EA%B5%AC%EC%9B%94%EB%8F%99+1206-2" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:45</td>
									<td>시청후문</td>
									<td class="t_left">컨벤션웨딩홀 앞에서 탑승</td>
                                    <td><a href="http://map.daum.net/?urlX=434831.25&urlY=1099406.25&q=%EC%9D%B8%EC%B2%9C+%EB%82%A8%EB%8F%99%EA%B5%AC+%EA%B0%84%EC%84%9D%EB%8F%99+411-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:53</td>
									<td>석바위 사거리</td>
									<td class="t_left">버스정류장앞</td>
                                    <td><a href="http://map.daum.net/?urlX=431051.25&urlY=1099761.25&q=%EC%9D%B8%EC%B2%9C+%EB%82%A8%EA%B5%AC+%EC%A3%BC%EC%95%88%EB%8F%99+1007-5" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>7:57</td>
									<td>주안대한생명</td>
									<td class="t_left">경인유통 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=428621.25&urlY=1099955.625&q=%EC%9D%B8%EC%B2%9C+%EB%82%A8%EA%B5%AC+%EC%A3%BC%EC%95%88%EB%8F%99+197-22" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>8:40</td>
									<td>연구단지</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>매립지공사</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>매립지 홍보관 앞(18:00) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연구단지(18:30) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 자원관 정문 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> (구)인천대 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							주 안 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 석바위사거리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 시청후문 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 길병원 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>남동구삼환</span>
						</div>

					</div>

					<div class="time2 r21">
						<h2>계산역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="계산역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>7:50</td>
									<td>계산역</td>
									<td class="t_left">계산역4번 출구 50m 지나 주방용품 가게 앞 </td>
                                    <td><a href="http://map.daum.net/?urlX=439557.5&urlY=1123434.375&q=%EC%9D%B8%EC%B2%9C+%EA%B3%84%EC%96%91%EA%B5%AC+%EA%B3%84%EC%82%B0%EB%8F%99+928-28" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>

								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">-</td>
                                    <td>-</td>
								</tr>
                                
                                <tr>
									
									<td>-</td>
									<td>당하사무실</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>

							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30 분수대 앞 탑승) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 자원관 정문 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 빈정내사거리(버스정류장 정차) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 공촌사거리(사거리 지나 주유소 앞) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 계산역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>임학지하도</span>
						</div>
					</div>
                    
                    
                    <div class="time2 r22">
						<h2>검암역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="검암역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="30%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">승차장소</th>
									<th scope="col">운행노선</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>08:25</td>
									<td rowspan=4>검암역 셔틀버스 탑승장</td>
									<td rowspan=3 class="t_left">검암역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연구단지(종점)</td>
                                    <td rowspan=4><a href="http://map.daum.net/?urlX=428031.25&urlY=1130398.75&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EA%B2%80%EC%95%94%EB%8F%99+399-104" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
                                <tr>
									<td>08:30</td>
								</tr>
                                <tr>
									<td>08:35</td>
								</tr>
                                <tr>									
									<td>08:40</td>
									<td class="t_left">검암역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연구단지(종점) [2대 운행]</td>
								</tr>
								
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<table class="t1" summary="검암역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="30%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">승차장소</th>
									<th scope="col">운행노선</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									
									<td>18:05</td>
								  <td>매립지공사 홍보관</td>
								  <td class="t_left">매립지공사 홍보관 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연구단지(18:30) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 검암역</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&target=car&rt=422568%2C1131425%2C%2C&rt1=&rt2=&rtIds=%2C" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
                                <tr>
									
									<td>18:10</td>
								  	<td rowspan=3>연구단지 정문밖 탑승장</td>
								  	<td class="t_left">연구단지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 검암역 [2대 운행]</td>
                                    <td rowspan=3><a href="http://map.daum.net/?map_type=TYPE_MAP&target=car&rt=420696%2C1130755%2C%2C&rt1=%ED%95%B4%EB%8B%B9+%EC%A7%80%EC%97%AD%EC%9D%80+%EC%A3%BC%EC%86%8C%EB%A5%BC+%ED%99%95%EC%9D%B8%ED%95%A0+%EC%88%98+%EC%97%86%EC%8A%B5%EB%8B%88%EB%8B%A4&rt2=&rtIds=Pundefined%2C" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
                                <tr>
									
									<td>18:20</td>

									<td rowspan=2 class="t_left">연구단지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 검암역</td>

								</tr>
                                <tr>
									
									<td>18:30</td>
								</tr>
								
							</tbody>
						</table>
					</div>
                    
                    <div class="time2 r23">
						<h2>검암역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="검암역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="30%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									<td>08:30</td>
									<td>검암역</td>
									<td class="t_left">검암역 셔틀버스 정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=428031.25&urlY=1130398.75&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EA%B2%80%EC%95%94%EB%8F%99+399-104" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:10 정문밖에서 탑승) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>검암역</span>
						</div>
					</div>
                    
                    <div class="time2 r24">
						<h2>검암역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="검암역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									<td>08:35</td>
									<td>검암역</td>
									<td class="t_left">검암역 셔틀버스 정류장</td>
                                    <td><a href="" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:20 정문밖에서 탑승) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>검암역</span>
						</div>
					</div>
                    
                    <div class="time2 r25">
						<h2>검암역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="검암역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									<td>08:40</td>
									<td>검암역</td>
									<td class="t_left">검암역 셔틀버스 정류장</td>
                                    <td><a href="" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30 정문밖에서 탑승) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>검암역</span>
						</div>
					</div>
					
					<div class="time2 r26">
						<h2>검암역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="검암역 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="16%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								<tr>
									<td>08:40</td>
									<td>검암역</td>
									<td class="t_left">검암역 셔틀버스 정류장</td>
                                    <td><a href="" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>매립지공사 홍보관(18:05) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연구단지(18:30)<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>검암역</span>
						</div>
					</div>
                    
                    <div class="time2 r27">
						<h2>청라 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="청라 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="18%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								
								<tr>
									<td>7:55</td>
									<td>삼용아파트</td>
									<td class="t_left">삼용타워 상가아파트 591번 버스정류장</td>
                                    <td><a href="http://map.daum.net/?urlX=429182.5&urlY=1123533.75&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EC%8B%AC%EA%B3%A1%EB%8F%99+282-1" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									<td>7:57</td>
									<td>서구보건소</td>
									<td class="t_left">보건소 입구 엘지마트 건너편 온누리약국</td>
                                    <td><a href="http://map.daum.net/?urlX=427902&urlY=1123637&q=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%ED%83%81%EC%98%A5%EB%A1%9C+37" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									<td>8:03</td>
									<td>청라고등학교</td>
									<td class="t_left">214동 앞 버스정류장 (버스정류장 ID : 42785)</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EB%B2%84%EC%8A%A4+%EC%A0%95%EB%A5%98%EC%9E%A5+42785&urlX=424803&urlY=1121821&urlLevel=3&busStopId=BS163377" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									<td>8:05</td>
									<td>엑슬루타워</td>
									<td class="t_left">엑슬루타워 입구 버스정류장 서인천농협 청라지점 앞 (중앙차로 아님)</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EC%84%9C%EC%9D%B8%EC%B2%9C%EB%86%8D%ED%98%91+%EC%B2%AD%EB%9D%BC&urlX=423281&urlY=1119782&urlLevel=2&itemId=18819025" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									<td>8:07</td>
									<td>한일베라체</td>
									<td class="t_left">한일베라체 아파트 버스정류장(지하도방향)</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&q=%ED%95%9C%EC%9D%BC%EB%B2%A0%EB%9D%BC%EC%B2%B4&urlX=420832&urlY=1120015&urlLevel=3&itemId=11333725" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								
								<tr>
									<td>8:08</td>
									<td>5단지 우미린 아파트 앞 사거리</td>
									<td class="t_left">4단지 지하차도 통과 후 바로 사거리에서 우회전 정차</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EC%9A%B0%EB%AF%B8%EB%A6%B0%EC%95%84%ED%8C%8C%ED%8A%B8&urlX=418032&urlY=1119475&urlLevel=3&itemId=11183562" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>

								<tr>
									<td>8:20</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:30) </span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 5단지 입구<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 한일베라체<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 엑슬루타워<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 청라고등학교<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 서부보건소<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>삼용아파트</span>
						</div>


					</div>
					
                    <div class="time2 r28">
						<h2>계양역 노선</h2>
						<h3>출근노선</h3>
						<table class="t1" summary="청라 노선 정차명,승차장소,시간">
							<caption>출근노선</caption>
							<colgroup>
								<col width="10%" />
								<col width="18%" />
								<col width="*" />
                                <col width="8%" />
							</colgroup>

							<thead>
								<tr>
                                	<th scope="col">시간</th>
									<th scope="col">정차명</th>
									<th scope="col">승차장소</th>
                                    <th scope="col">지도</th>
								</tr>
							</thead>
							<tbody class="t_center">
								
								<tr>
									<td>8:20</td>
									<td>계양역</td>
									<td class="t_left">계양역 나와 횡단보도 건너 왼쪽으로 약 30m지나 주차장 입구</td>
                                    <td><a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EA%B3%84%EC%96%91%EC%97%AD&urlX=441777&urlY=1130867&urlLevel=3&itemId=21160972" target="_blank"><img src="/assets/kor/images/contents/btn_map02.png" alt="지도보기" /></a></td>
								</tr>
								<tr>
									<td>-</td>
									<td>연구단지</td>
									<td class="t_left">종점</td>
                                    <td>-</td>
								</tr>
							</tbody>
						</table>

						<h3>퇴근노선</h3>
						<div class="out">
							<span>연구단지(18:10)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>계양역</span>
						</div>


					</div>

					<div class="time2 r100">
						<h2>야간버스 운행 노선표(4개 노선)</h2>


						<h3>38노선 계산/송내역(퇴근)</h3>
						<div class="out">
							<span>연구단지(과학원 본관 앞 승차, 21:10)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 자원관 정문 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 빈정내사거리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 공촌사거리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							계산역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 중동지구 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 소풍 터미널 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>송내역(종점)</span>
						</div>

						<h3>39노선 양재역(퇴근)</h3>
						<div class="out">
							<span>연구단지(과학원 본관 앞 승차, 21:10)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 아라뱃길<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 검암역(아라뱃길 정차 검암역 입구하차) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 이수역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 방배역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" />
							교대역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>강남역(종점)</span>
						</div>

						<h3>40노선 일산/화정(퇴근)</h3>
						<div class="out">
							<span>연구단지(과학원 본관 앞 승차, 21:10)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 매립지 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 당하사거리 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 원당사거리 소방서 앞
							<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 대화역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 주엽역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 정발산역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 마두역(화정롯데마트) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 백석역(화정5 단지) <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /><span> 고양경찰서(종점 화정1 단지)</span>
						</div>

						<h3>41노선 평촌(퇴근)</h3>
						<div class="out">
							<span>매립지공사(홍보관 앞 승차, 20:50)</span> <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 연구단지 (과학원 본관 앞 승차, 21:10 출발)
							<img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 계산역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> 관악역 <img src="/assets/kor/images/contents/ic_trans.gif" alt="다음" /> <span>범계역(종점)</span>
						</div>

					</div>


				</div>
			</li>
		</ul>
	</div>

	<script type="text/javascript">
		tabOn('route', 1, 'text');
	</script>

</div>
<!-- //contents -->

<div class="contents3" style="display:none;">

	<!-- 본문내용 시작  -->
	<ul class="tabmenu cell3 clearfix">
		<li><a href="#contents1">찾아오시는 길</a></li>
		<li><a href="#contents2">통근버스안내</a></li>
		<li class="on"><a href="#contents3">셔틀버스안내</a></li>
	</ul>

	<h2>승강장 위치</h2>
    <ul class="stationphoto clearfix">
    	<li>
        	<div class="img"><img src="/assets/kor/images/contents/img_station01.jpg" alt="승강장" /></div>
            <div class="tit">검암역 승강장</div>
        </li>
        <li class="right">
        	<div class="img"><img src="/assets/kor/images/contents/img_station02.jpg" alt="승강장" /></div>
            <div class="tit">매립지 홍보관</div>
        </li>
        <li>
        	<div class="img"><img src="/assets/kor/images/contents/img_station03.jpg" alt="승강장" /></div>
            <div class="tit">과학원 승차장</div>
        </li>
        <li class="right">
        	<div class="img"><img src="/assets/kor/images/contents/img_station04.jpg" alt="승강장" /></div>
            <div class="tit">자원관 승차장</div>
        </li>
    </ul><!--//stationphoto-->
	<div class="ruleContent">
    	<h2>검암역 평일 셔틀버스 운행시간표(1월 4일부터 운행)</h2>
        <div class="ngb mt20 transcomment">평일 오전 시간표</div>
        <table class="table_t1" width="100%" summary="평일 오전 시간표입니다.">
        <caption>구분, 연구단지에서 나가는 시간, 검암역에서 들어오는 시간 항목이 있습니다.</caption>
        <colgroup>
        	<col width="*%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
        </colgroup>
        <thead>
		<tr>
			<th rowspan="2">구분</th>
			<th class="th1" colspan="4">연구단지에서 나가는 시간</th>
			<th class="th2" colspan="3">검암역에서 들어오는 시간</th>
		</tr>
		<tr>
			<th class="th1">매립지<br />홍보관 출발</th>
			<th class="th1">자원관<br />관람객 주차장</th>
			<th class="th1">과학원  출발</th>
			<th class="th1">검암역 도착</th>
			<th class="th2">검암역 출발</th>
			<th class="th2">과학원 도착</th>
			<th class="th2">매립지<br />홍보관 도착</th>
		</tr>
        </thead>
        <tbody class="t_center">
        <tr>
        	<th>1</th>
            <td colspan="4"><!-- (1번 노선은 출근하는 직원을 위한 노선으로 검암역 출발 없음)<br />서구보건소 엘지마트(08:15)입구 출발 → 대동아파트 건너 슈퍼(08:20) <br />→ 연구단지(종점) --></td>
            <td>08:20</td>
            <td>08:30</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>2</th>
            <td colspan="4"></td>
            <td>08:30</td>
            <td>매립지 직통</td>
            <td>08:40</td>
		</tr>
        
        <tr>
        	<th>3</th>
            <td></td>
            <td>09:00</td>
            <td>09:01</td>
            <td>09:10</td>
            <td>09:00</td>
            <td>09:10</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>4</th>
            <td></td>
            <td>09:30</td>
            <td>09:31</td>
            <td>09:40</td>
            <td>09:30</td>
            <td>09:40</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>5</th>
            <td></td>
            <td>10:00</td>
            <td>10:01</td>
            <td>10:10</td>
            <td>10:00</td>
            <td>10:10</td>
            <td>10:20</td>
		</tr>
        
        <tr>
        	<th>6</th>
            <td>10:20</td>
            <td>10:30</td>
            <td>10:31</td>
            <td>10:40</td>
            <td>10:30</td>
            <td>10:40</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>7</th>
            <td></td>
            <td>11:00</td>
            <td>11:01</td>
            <td>11:10</td>
            <td>11:00</td>
            <td>11:10</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>8</th>
            <td></td>
            <td>11:30</td>
            <td>11:31</td>
            <td>11:40</td>
            <td>11:30</td>
            <td>11:40</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>9</th>
            <td></td>
            <td>12:00</td>
            <td>12:01</td>
            <td>12:10</td>
            <td>12:00</td>
            <td>12:10</td>
            <td></td>
		</tr>
        
        <tr class="point2">
            <td colspan="8">점심시간</td>
		</tr>
        
        </tbody>
        </table>
        
        <br />
         <div class="ngb mt20 transcomment">평일 오후 시간표</div>
        
          <table class="table_t1" width="100%" summary="평일 오후 시간표입니다.">
        <caption>구분, 수도권매립지관리공사에서 검암역, 검암역에서 수도권매립지관리공사 항목이 있습니다.</caption>
        <colgroup>
        	<col width="*%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
        </colgroup>
        <thead>
		<tr>
			<th rowspan="2">구분</th>
			<th class="th1" colspan="4">연구단지에서 나가는 시간</th>
			<th class="th2" colspan="3">검암역에서 들어오는 시간</th>
		</tr>
		<tr>
			<th class="th1">매립지<br />홍보관 출발</th>
			<th class="th1">자원관<br />관람객 주차장</th>
			<th class="th1">과학원  출발</th>
			<th class="th1">검암역 도착</th>
			<th class="th2">검암역 출발</th>
			<th class="th2">과학원 도착</th>
			<th class="th2">매립지<br />홍보관 도착</th>
		</tr>
        </thead>
        <tbody class="t_center">
        
        <tr>
        	<th>10</th>
            <td ></td>
            <td>13:00</td>
            <td>13:01</td>
            <td>13:10</td>
            <td>13:00</td>
            <td>13:10</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>11</th>
            <td ></td>
            <td>13:30</td>
            <td>13:31</td>
            <td>13:40</td>
            <td>13:30</td>
            <td>13:40</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>12</th>
            <td></td>
            <td>14:00</td>
            <td>14:01</td>
            <td>14:10</td>
            <td>14:00</td>
            <td>14:10</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>13</th>
            <td></td>
            <td>14:30</td>
            <td>14:31</td>
            <td>14:40</td>
            <td>14:30</td>
            <td>14:40</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>14</th>
            <td></td>
            <td>15:00</td>
            <td>15:01</td>
            <td>15:10</td>
            <td>15:00</td>
            <td>15:10</td>
            <td>15:20</td>
		</tr>
        
        <tr>
        	<th>15</th>
            <td>15:20</td>
            <td>15:30</td>
            <td>15:31</td>
            <td>15:40</td>
            <td>15:30</td>
            <td>15:40</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>16</th>
            <td></td>
            <td>16:00</td>
            <td>16:01</td>
            <td>16:10</td>
            <td>16:00</td>
            <td>16:10</td>
            <td>16:20</td>
		</tr>
        
        <tr>
        	<th>17</th>
            <td>16:20</td>
            <td>16:30</td>
            <td>16:31</td>
            <td>16:40</td>
            <td>16:30</td>
            <td>16:40</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>18</th>
            <td></td>
            <td>17:00</td>
            <td>17:01</td>
            <td>17:10</td>
            <td>17:00</td>
            <td>17:10</td>
            <td>17:20</td>
		</tr>
        
        <tr>
        	<th>19</th>
            <td>17:20</td>
            <td>17:30</td>
            <td>17:31</td>
            <td>17:40</td>
            <td>17:30</td>
            <td>17:40</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>20</th>
            <td>18:35</td>
            <td colspan="2">매립지 직통</td>
            <td>18:45</td>
            <td></td>
            <td></td>
            <td></td>
		</tr>
        
        </tbody>
        </table>
        
       <br />
       <div class="ngb mt20 transcomment">평일 야간 시간표</div>
       
        <table class="table_t1" width="100%" summary="평일 야간 시간표입니다.">
        <caption>구분, 수도권매립지관리공사 에서 검암역, 검암역에서 수도권매립지관리공사 항목이 있습니다.</caption>
       <colgroup>
        	<col width="*%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
            <col width="13%" />
        </colgroup>
        <thead>
		<tr>
			<th rowspan="2">구분</th>
			<th class="th1" colspan="4">연구단지에서 나가는 시간</th>
			<th class="th2" colspan="3">검암역에서 들어오는 시간</th>
		</tr>
		<tr>
			<th class="th1">자원관<br />수장연구동<br />주차장 입구<br />출발</th>
			<th class="th1">자원관<br />관람객 주차장</th>
			<th class="th1">과학원  출발</th>
			<th class="th1">검암역 도착</th>
			<th class="th2">검암역 출발</th>
			<th class="th2">과학원 도착</th>
			<th class="th2">매립지<br />홍보관 도착</th>
		</tr>
        </thead>
        <tbody class="t_center">
        <tr class="point2">
            <td colspan="8">야간운행</td>
		</tr>
        
        <tr>
        	<th>21</th>
            <td></td>
            <td>19:00</td>
            <td>19:01</td>
            <td>19:10</td>
            <td>19:10</td>
            <td>19:20</td>
            <td>19:30</td>
		</tr>
        
        <tr>
        	<th>22</th>
            <td></td>
            <td>19:30</td>
            <td>19:31</td>
            <td>19:40</td>
            <td>19:40</td>
            <td>19:50</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>23</th>
            <td>19:50</td>
            <td>20:00</td>
            <td>20:01</td>
            <td>20:10</td>
            <td>20:10</td>
            <td>20:20</td>
            <td>20:30</td>
		</tr>
        
        <tr>
        	<th>24</th>
            <td></td>
            <td>20:30</td>
            <td>20:31</td>
            <td>20:40</td>
            <td>20:40</td>
            <td>20:50</td>
            <td></td>
		</tr>
        
        <tr class="point2">
        	<th class="txt1">25</th>
            <td class="txt1">20:50</td>
            <td class="txt1">21:00</td>
            <td class="txt1">21:01</td>
            <td class="txt1">21:10<br />청라역 도착</td>
            <td class="txt1">21:10<br />청라역 출발</td>
            <td class="txt1">21:20</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>26</th>
            <td></td>
            <td>21:30</td>
            <td>21:31</td>
            <td>21:40</td>
            <td>21:40</td>
            <td>21:50</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>27</th>
            <td></td>
            <td>22:00</td>
            <td>22:01</td>
            <td>22:10</td>
            <td>22:10</td>
            <td>22:20</td>
            <td></td>
		</tr>
        
        <tr>
        	<th>28</th>
            <td></td>
            <td>22:30</td>
            <td>22:31</td>
            <td>22:40</td>
            <td></td>
            <td></td>
            <td></td>
		</tr>
        
        
        </tbody>
        </table>
		<div class="mt20">
			○종합환경연구단지 입주기관(4개 기관) 어린이 환경과 건강포털, 국립환경생물자원관, 국립환경인력개발원, 한국환경공단<br />
			○수도권매립지관리공사는 환경연구단지에서 아라뱃길 건너편에 소재하고 있습니다.<br />
			○야간셔틀버스(21~28번)생물자원관 탑승장소 : 수장연구동 주차장 입구
		</div>
    </div><!--//ruleContent-->

</div>
<!-- //contents -->
</div>
<%/* 테스트 서버
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=b49a5b26bf2548af3875b2219cb24a43"></script>
*/%>
<%/* 운영 서버
*/%>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=59ea2e9e78efddc198184fbac734ce64"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.5688488,126.6402078), // 지도의 중심좌표//
        level: 3 // 지도의 확대 레벨
    };
// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption); 
var marker = new daum.maps.Marker();

//타일 로드가 완료되면 지도 중심에 마커를 표시합니다
daum.maps.event.addListener(map, 'tilesloaded', displayMarker);

function displayMarker() {
 
 // 마커의 위치를 지도중심으로 설정합니다 
 marker.setPosition(new daum.maps.LatLng(37.5688488,126.6402078)); 
 marker.setMap(map);

 // 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
 // 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
 // daum.maps.event.removeListener(map, 'tilesloaded', displayMarker);
}
</script>