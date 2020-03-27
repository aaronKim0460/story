<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
function show(num){
	if(num == 0){
		$('#show1').show();
		$('#show2').hide();
	}else{
		$('#show1').hide();
		$('[id^=f]').removeClass('on')
		$('#fl'+num).addClass('on');
		$('#fimg'+num).addClass('on');
		$('#show2').show();
	}
}
</script>
<div id="contents">
<div id="show1">
	<h2>시설배치도</h2>
	<div class="facilAirview">
		<ul class="facilpointer">
			<li class="point01"><a href="javascript:show('1');"><span>1</span><em>본관</em></a></li>
			<li class="point07"><a href="javascript:show('7');"><span>7</span><em>환경독성실험동</em></a></li>
			<li class="point16"><a href="javascript:show('8');"><span>16</span><em>제6연구동</em></a></li>
			<li class="point15"><a href="javascript:show('9');"><span>15</span><em>제8연구동</em></a></li>
			<li class="point14"><a href="javascript:show('10');"><span>14</span><em>교통환경연구소</em></a></li>
			<li class="point13"><a href="javascript:show('16');"><span>13</span><em>지구환경연구동</em></a></li>
            <li class="point11"><a href="#none"><span>11</span><em>토양·지하수 시료동</em></a></li>
            <li class="point12"><a href="#none"><span>12</span><em>파워플랜트동</em></a></li>
			<li class="point10"><a href="#none"><span>10</span><em>연소실험동</em></a></li>
            <li class="point17"><a href="#none"><span>17</span><em class="right">자원순환매몰매립동</em></a></li>
            <li class="point18"><a href="#none"><span>18</span><em class="right">생물안전연구동</em></a></li>
			<li class="point05"><a href="#none"><span>5</span><em>국가환경시료은행</em></a></li>
			<li class="point06"><a href="#none"><span>6</span><em>수생태연구동</em></a></li>
			
			<li class="point09"><a href="javascript:show('5');"><span>9</span><em>실내환경종합연구동</em></a></li>
			<li class="point08"><a href="#none"><span>8</span><em>음향시험동</em></a></li>
			<li class="point02"><a href="javascript:show('2');"><span>2</span><em>제1연구동</em></a></li>
			<li class="point03"><a href="javascript:show('3');"><span>3</span><em>제2연구동</em></a></li>
			<li class="point04"><a href="javascript:show('4');"><span>4</span><em>제3연구동</em></a></li>

		</ul>
		<img src="/assets/kor/images/contents/img_facilmap.jpg" alt="시설배치도"
			usemap="#Map" border="0" />

	</div>
     <div class="facilLayout">
        <ul class="facimenuList clearfix">
            <li><span>1</span>본관</li>
            <li><span>2</span>제1연구동</li>
            <li><span>3</span>제2연구동</li>
            <li><span>4</span>제3연구동</li>
            <li><span>5</span>국가환경시료은행</li>
            <li><span>6</span>수생태연구동</li>
            <li><span>7</span>환경독성실험동</li>
            <li><span>8</span>음향시험동</li>
            <li><span>9</span>실내환경종합연구동</li>
            <li><span>10</span>연소실험동</li>
            <li><span>11</span>토양·지하수 시료동</li>
            <li><span>12</span>파워플랜트동</li>
            <li><span>13</span>지구환경연구동</li>
            <li><span>14</span>교통환경연구소</li>
            <li><span>15</span>제8연구동</li>
            <li><span>16</span>제6연구동</li>
            <li><span>17</span>자원순환매몰매립동</li>
            <li><span>18</span>생물안전연구동</li>
        </ul>
    </div>
	<!--//failmap-->

	<h2>소속기관 및 주요시설</h2>
	<div class="facilMap">
		<ul class="tbox">
			<li class="tbox01">백령도<span>대기오염집중측정소</span></li>
			<li class="tbox02">어린이 환경과 건강포털<span>(본원)</span></li>
			<li class="tbox03">호남권<span>대기오염집중측정소</span></li>
			<li class="tbox04">제주도<span>대기오염집중측정소</span></li>
			<li class="tbox05">수도권<span>대기오염집중측정소</span></li>
			<li class="tbox06">중부권<span>대기오염집중측정소</span></li>
			<li class="tbox07">영남권<span>대기오염집중측정소</span></li>
		</ul>
		<ul class="tbox2">
			<li class="tbox201">한강<br />물환경연구소(양평)
			</li>
			<li class="tbox202">금강<br />물환경연구소(옥천)
			</li>
			<li class="tbox203">낙동강<br />물환경연구소(고령)
			</li>
			<li class="tbox204">영산강<br />물환경연구소(광주)
			</li>
			<li class="tbox205">국립습지센터<br />(창녕)
			</li>
		</ul>
		<ul class="tbox3">
			<li class="tbox301">서울</li>
			<li class="tbox302">인천</li>
			<li class="tbox303">대전</li>
			<li class="tbox304">대구</li>
			<li class="tbox305">울산</li>
		</ul>
		<ul class="tbox4">
			<li class="tbox401">백령도</li>
			<li class="tbox402">제주도</li>
		</ul>
	</div>
	<!--//facilMap-->
	<h2>시설현황</h2>
	<table class="table_t1" summary="시설현황으로 건물 연면적, 부지 면적 안내">
		<caption>시설현황</caption>
		<colgroup>
			<col width="40%" />
			<col width="30%" />
			<col width="30%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">구 분</th>
				<th scope="col">건물 연면적</th>
				<th scope="col">부지 면적</th>
			</tr>
		</thead>
		<tfoot class="t_center">
			<tr class="point2">
				<th scope="row">본 원</th>
				<td>82,862㎡</td>
				<td>512,363㎡</td>
			</tr>
			<tr class="point2">
				<th scope="row">계</th>
				<td>89,672㎡</td>
				<td>567,780㎡</td>
			</tr>
		</tfoot>
		<tbody class="t_center">
			<tr>
				<td class="t_left">연구단지 청사 (본동, 연구동, 연소실험동 등)</td>
				<td>68,742㎡</td>
				<td>490,500㎡</td>
			</tr>
			<tr>
				<td class="t_left">불광동 청사(10개동)</td>
				<td>14,125㎡</td>
				<td>21,863㎡</td>
			</tr>
			<tr>
				<td class="t_left">물환경연구소(4개소)</td>
				<td>6,810㎡</td>
				<td>55,417㎡</td>
			</tr>
		</tbody>
	</table>
	<h2>장비현황</h2>
	<table class="table_t1"
		summary="장비현황을 구분하여 내역, 종류(종), 수량(대), 금액(백만원)을 제공">
		<caption>장비현황</caption>
		<colgroup>
			<col width="*" />
			<col width="30%" />
			<col width="15%" />
			<col width="15%" />
			<col width="15%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">구분</th>
				<th scope="col">내역</th>
				<th scope="col">종류(종)</th>
				<th scope="col">수량(대)</th>
				<th scope="col">금액(백만원)</th>
			</tr>
		</thead>
		<tfoot class="t_center">
			<tr class="point2">
				<th scope="colgroup" colspan="2">계</th>
				<td>303종</td>
				<td>697대</td>
				<td>54,777</td>
			</tr>
		</tfoot>
		<tbody class="t_center">
			<tr>
				<th scope="row" class="t_left">환경건강연구부</th>
				<td class="t_left">기체크로마토그래피 등</td>
				<td>83</td>
				<td>153</td>
				<td>13,557</td>
			</tr>
			<tr>
				<th scope="row" class="t_left">기후대기연구부</th>
				<td class="t_left">비행시간형 질량분석기 등</td>
				<td>99</td>
				<td>274</td>
				<td>17,947</td>
			</tr>
			<tr>
				<th scope="row" class="t_left">물환경연구부</th>
				<td class="t_left">분광광도계 등</td>
				<td>20</td>
				<td>37</td>
				<td>2,054</td>
			</tr>
			<tr>
				<th scope="row" class="t_left">환경자원연구부</th>
				<td class="t_left">원자방출분광기 등</td>
				<td>3</td>
				<td>29</td>
				<td>1,470</td>
			</tr>
			<tr>
				<th scope="row" class="t_left">환경기반연구부</th>
				<td class="t_left">투과전자현미경 등</td>
				<td>93</td>
				<td>199</td>
				<td>14,749</td>
			</tr>
			<tr>
				<th scope="row" class="t_left">교통환경연구소</th>
				<td class="t_left">소형차배출가스측정장비 등</td>
				<td>5</td>
				<td>5</td>
				<td>5,000</td>
			</tr>
		</tbody>
	</table>
	</div>
	<div id="show2" style="display:none;">	
		<h2>주요시설 <span class="right"><a href="javascript:show('0');" class="btn01 btnlightgray">시설배치도 보러가기 <img src="/assets/kor/images/contents/dot_arrow.gif" alt="" /></a></span></h2>
	    <div class="facilLayout">
	    	<ul class="facimenu clearfix">
	        	<li  class="on" id="fl1"><a href="javascript:show('1');"><span>1</span>본관</a></li>
	            <li  id="fl2"><a href="javascript:show('2');"><span>2</span>제1연구동</a></li>
	            <li id="fl3"><a href="javascript:show('3');"><span>3</span>제2연구동</a></li>
	            <li id="fl4"><a href="javascript:show('4');"><span>4</span>제3연구동</a></li>
	            <li id="fl7"><a href="javascript:show('7');"><span>7</span>환경독성연구동</a></li>
                <li id="fl5"><a href="javascript:show('5');"><span>9</span>실내환경종합연구동</a></li>
                <li id="fl16"><a href="javascript:show('16');"><span>13</span>지구환경연구동</a></li>
                <li id="fl10"><a href="javascript:show('10');"><span>14</span>교통환경연구소</a></li>
	            <li id="fl9"><a href="javascript:show('9');"><span>15</span>제8연구동</a></li>
                <li id="fl8"><a href="javascript:show('8');"><span>16</span>제6연구동</a></li>
	        </ul>
	        <div class="facilimg">
	        	<ul>
	            	<li class="on" id="fimg1">
	                	<img src="/assets/kor/images/contents/img_building0101.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0102.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0103.png" alt="" /><br />
	                </li>
	                <li id="fimg2">
	                	<img src="/assets/kor/images/contents/img_building0203.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0202.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0201.png" alt="" /><br />
	                </li>
	                <li id="fimg3">
	                	<img src="/assets/kor/images/contents/img_building0303.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0302.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0301.png" alt="" /><br />
	                </li>
	                <li id="fimg4">
	                	<img src="/assets/kor/images/contents/img_building0403.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0402.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0401.png" alt="" /><br />
	                </li>
	                <li id="fimg5">
	                	<img src="/assets/kor/images/contents/img_building0501.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0502.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0503.png" alt="" /><br />
	                </li>
	                <li id="fimg7">
	                	<img src="/assets/kor/images/contents/img_building0702.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0701.png" alt="" /><br />
	                </li>
	                <li id="fimg8">
	                	<img src="/assets/kor/images/contents/img_building0801.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building0802.png" alt="" /><br />
	                </li>
	                <li id="fimg9">
	                	<img src="/assets/kor/images/contents/img_building0901.png" alt="" /><br />
	                </li>
	                <li id="fimg10">
	                	<img src="/assets/kor/images/contents/img_building1002.png" alt="" /><br />
	                    <img src="/assets/kor/images/contents/img_building1001.png" alt="" /><br />
	                </li>
                    <li id="fimg16">
                    	<div class="facil_carbon">
                            <h2>Carbon Zero Building <span>저탄소녹색성장의실증건물</span></h2>
                            <h3>배경</h3>
                            <dl class="facil_list01">
                                <dd>우리나라는 덴마크 코펜하겐에서 개최된 제 15차 유엔 기후변화협약 당사국 총회(COP15)에서 2020년에 우리나라 온실가스 배출량(BAU) 대비 30%를 감출하는 국가온실가스 중기감축목표를 발표한 바 있습니다.</dd>
                                <dd>건물에서 배출되는 온실가스의 양은 국내 온실가스 총 배출량의 25% 이상을 차지하고 있어, 저탄소 사회를 구현하기 위해서는 건물에서 배출되는 온실가스 저감이 필수적입니다.</dd>
                            </dl>
                            <h3>건물개요</h3>
                            <dl>
                            	<dd><strong>사업기간 : </strong> '08년 ~ '10년 (3년)</dd>
                                <dd><strong>규모 : </strong> 지하1층, 지상2층(2,500㎡)</dd>
                                <dd><strong>건설비 : </strong>약 355만원/㎡ (일반건물의 약 1.4배소요)</dd>
                            </dl>
                            <h3>탄소배출 제도란?</h3>
                            <dl>
                            	<dd>건물 내 소비되는 에너지를 에너지부하 절감 기술을 이용하여 에너지 사용량을 저감하고부족한 에너지는 자연에너지 기술을 이용하여 충당함으로써, 연간 건물에서 배출되는 온실가스를 제로(Zero)화 하는 것입니다.</dd>
                                <dd>지구환경연구동은 에너지 분석 시뮬레이션을 통해 에너지 사용량 및 절감량을 예측한 결과 총 에너지 부하는 123kWh/㎡이었으며 에너지 부하 절감 기술로 40%를 줄이고, 자연에너지 기술적용으로 60%를 충당함으로써 탄소 배출 제로를 구현하였습니다.<p class="img"><img src="/assets/kor/images/contents/carbon_graph.gif" alt="탄소배출 제로 그래프" /></p></dd>
                            </dl>
                            <h2>66가지 녹색 기술</h2>
                            <p>지구환경연구동은 업무용 건물로소는 세계 최초로 탄소배출제로를 달성하기 위하여 건물에너지 부하저감기술(30종), 건물에너지 효율기술(18종), 신재생에너지 기술(13종), 친환경 요소 기술(5종)을 포함한 총 66가지 기술을 적용하여 건축하였습니다.</p>
                            <p class="img"><img src="/assets/kor/images/contents/carbon_tech.jpg" alt="녹색기술" /></p>
                            <h2>관람안내</h2>
                            <dl>
                            	<dd><strong>관람시간 : </strong> 오전 10시~오후5시 (월~금) (예약 접수로 관람할 수 있습니다.)</dd>
                                <dd><strong>전화 : </strong>032-560-7290</dd>
                            </dl>
                        </div>
	                </li>
	            </ul>
	        </div>
	    </div>
	</div>
	
</div>
