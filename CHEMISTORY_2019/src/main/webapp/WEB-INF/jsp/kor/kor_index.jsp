<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" 	content="케미스토리 어린이 환경과 건강포털" />
<title>케미스토리 어린이 환경과 건강포털</title>

<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-138744497-1');
  gtag('config', 'AW-748958555');
</script>

<link rel="stylesheet" type="text/css" href="/assets/kor/css/common.css" />
<script type="text/javascript" src="/assets/kor/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/assets/kor/js/common.js"></script>
<script type="text/javascript" src="/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/js/jquery.easing.1.3.min.js"></script>

<!-- bxSlider Javascript file -->
<script src="/assets/kor/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">
var pageW;
$(function() {
	mainTime('.box01In','.slideControl1',1); //main베너 set
	mainTimeS1(0); //main베너 시작
	function mainS(){
		var delayN;
		var srcN;
		pageW = $(window).width();
		$(".chami_school > li").each(function(n){
			delayN = 300*(n+1);
			$(this).find(".main_child").delay(delayN).animate({"bottom":0},600,"easeOutCubic");
		});
		mainLength = $(".mainSUl > li").length;
		$(".mainSUl").css("width",pageW*mainLength);
		$(".mainSUl > li").css("width",pageW);
		$(".listOverUl > li").mouseenter(function(){
			srcN = $(this).find("img").attr("src");
			srcN = srcN.replace("_off","_on");
			$(this).find("img").attr("src",srcN);
		});
		$(".listOverUl > li").mouseleave (function(){
			srcN = $(this).find("img").attr("src");
			srcN = srcN.replace("_on","_off");
			$(this).find("img").attr("src",srcN);
		});
	}
	mainS();
		
	<c:if test="${popupList != null}">
		<c:forEach var="fvo" items="${popupList}" varStatus="status">
			var id = "${fvo.popupId}";
			if (getPopCookie(id) != id) {
				var popupLeftLocation = "${fvo.popupWidthLc}";
				var popupTopLocation = "${fvo.popupVrticlLc}";
				var popupWidth = "${fvo.popupWidthSize}";
				var popupHeight = "${fvo.popupVrticlSize}";
				
				popupHeight = parseInt(popupHeight) + parseInt(40);
				
				var popupid = id;
				var popupurl = "/kor/getMainPopup.do?popupId="+id;
				var feature = "left=" + popupLeftLocation + ",top=" + popupTopLocation + ",width=" + popupWidth + ",height=" + popupHeight + ",scrollbars=yes,location=no";
				window.open(popupurl, popupid, feature);	
			}
		</c:forEach>
	</c:if>
});


var mainLength = $(".mainSUl > li").length;
var mainT = 0;
function mainType(n){
	mainT = n;
	pageW = $(window).width();
	if(n == 0){
		$(".chami_school").find(".main_child").each(function(){
			$(this).css("bottom",-120);
		});
	}
	$(".mainSUl").stop().animate({"margin-left":-(pageW*n)},600,"easeOutCubic");
	$(".mainButton img").each(function(m){
		$(this).attr("src","/assets/kor/images/newMain/tap0"+(m+1)+"_off.png");
	});
	$(".mainButton img").eq(n).attr("src","/assets/kor/images/newMain/tap0"+(1+n)+"_on.png")
	if(n == 0){
		$(".chami_school > li").each(function(n){
			delayN = 300*(n+1);
			$(this).find(".main_child").delay(delayN).animate({"bottom":0},600,"easeOutCubic");
		});
	}
}


$(window).resize(function(){
	pageW = $(window).width();
	if (pageW > 1100){
		$(".mainSUl").css("width",pageW*mainLength);
		$(".mainSUl > li").css("width",pageW);
		$(".mainSUl").stop().animate({"margin-left":-(pageW*mainT)},600,"easeOutCubic");
	}
});

//메인버너 set
function mainTime(n,m,l){
	var listN = $(n).find("li").length;
	var listW = $(n).width();
	$(m).find("ul").html('');
	$(n).find("ul").css("width",listN*listW);
	$(n).find("li").css("width",listW);
	$(n).find("li").each(function(i){
		if(l == 0){
			$(m).find("ul").append('<li class="on"><a href="javascript:mainTimeS'+l+'('+i+');" >'+(i+1)+'번(선택)</a></li>');
		}else{
			$(m).find("ul").append('<li><a href="javascript:mainTimeS'+l+'('+i+');" >'+(i+1)+'번</a></li>');
		}
	});
}
// 메인버너구동
var mainTime1;
var speed1 = 6000;
function mainTimeS1(n){
	clearTimeout(mainTime1);
	var slideName = '.box01In';
	var slideControl = '.slideControl1';
	var listN = $(slideName).find("li").length;
	var listW = $(slideName).width();
	$(slideControl).find("li").each(function(l){
		if(l == n){
			$(this).addClass('on');
		}else{
			$(this).removeClass('on');
		}
	});
	$(slideName).find("ul").animate({"margin-left":-(listW*n)},600);
	if(listN <= n+1){
		mainTime1=setTimeout(function(){ mainTimeS1(0); }, speed1 );
	}else{
		mainTime1=setTimeout(function(){ mainTimeS1(n+1); }, speed1 );
	}
}

function slideC1(n,m,l){
	var an = $(".box01In").find("li").length;
	if(n == "stop"){
		clearTimeout(m);
		$("#bu_stop"+l).hide();
		$("#bu_play"+l).show();
	}else{
		$(".slideControl"+l).find("li").each(function(n){
			if($(this).hasClass("on")){
				if(an <= n+1){
					an = 0;
				}else{
					an = n+1;
				}
			}
		});
		if(l==1){
			mainTime1=setTimeout(function(){ mainTimeS1(an); }, 500 );
		}else if(l==2){
			mainTime2=setTimeout(function(){ mainTimeS2(an); }, 500 );
		}else if(l==3){
			mainTime3=setTimeout(function(){ mainTimeS3(an); }, 500 );
		}
		$("#bu_stop"+l).show();
		$("#bu_play"+l).hide();
	}
	
}



function getPopCookie(name) {
	var Found = false;
	var start, end;
	var i = 0;
	while (i <= document.cookie.length) {
		start = i;
		end = start + name.length;
		if (document.cookie.substring(start, end) == name) {
			Found = true;
			break;
		}
		i++;
	}
	if (Found == true) {
		start = end + 1;
		end = document.cookie.indexOf(";", start);
		if (end < start) {
			end = document.cookie.length;
		}
		return document.cookie.substring(start, end);
	}
	return "";
};

function goSearchData(){
	if($('#query').val() == ''){
		alert('검색어를 입력해주세요.');
		$('#query').focus();
		return false;
	}else{
		return true;
	}
}

function imgError(image){
	$(image).attr('src','/assets/kor/images/newMain/main_visual01.png');
}

//핫이슈
var hotN=0;
var hotName;
var hotWdith;
var hotLength;
function hotS(n){
	hotLangth = $(".slideWrap li").length;
	hotWdith = $(".slideWrap").width();
	$(".slideWrap ul").css("width",hotLangth*hotWdith);
	if(n == "p"){
		if(hotN != 0){
			hotN--;
			hotName = -(hotWdith*hotN);
		}
	}else{
		if(hotN < hotLangth-1){
			hotN++;
			hotName = -(hotWdith*hotN);
		}
	}
	$(".slideWrap > ul").animate({"margin-left":hotName},300);
}

//국내어린이용품리콜
var reN=0;
var reName;
var reWdith;
var reLength;
function reS(n){
	reLangth = $(".recallWrapIn li").length;
	reWdith = $(".recallWrapIn").width();
	$(".recallWrapIn ul").css("width",reLangth*reWdith);
	if(n == "p"){
		if(reN != 0){
			reN--;
			reName = -(reWdith*reN)/2;
		}
	}else{
		if(reN < reLangth-2){
			reN++;
			reName = -(reWdith*reN)/2;
		}
	}
	$(".recallWrapIn > ul").animate({"margin-left":reName},300);
}

//국외어린이용품리콜
var reN2=0;
var reName2;
var reWdith2;
var reLength2;
function reS2(n){
	reLangth2 = $(".recallWrapIn2 li").length;
	reWdith2 = $(".recallWrapIn2").width();
	$(".recallWrapIn2 ul").css("width",reLangth2*reWdith2);
	if(n == "p"){
		if(reN2 != 0){
			reN2--;
			reName2 = -(reWdith2*reN2)/2;
		}
	}else{
		if(reN2 < reLangth2-2){
			reN2++;
			reName2 = -(reWdith2*reN2)/2;
		}
	}
	$(".recallWrapIn2 > ul").animate({"margin-left":reName2},300);
}
function tabS2(n,m){
	$(".m3_tabs > li").removeClass("on");
	$(n).parent().addClass("on");
	$(".m3_tabs > li > ul").hide();
	$(m).show();
}

//Set cookie
function setCookie(name, value, expiredays) {
	var today = new Date();
	today.setDate(today.getDate() + expiredays);
	document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + ';'
}
// Get cookie function
function getCookie(name) {
	var cookieName = name + "=";
	var x = 0;
	while (x <= document.cookie.length) {
		var y = (x + cookieName.length);
		if (document.cookie.substring(x, y) == cookieName) {
			if ((lastChrCookie = document.cookie.indexOf(";", y)) == -1)
				lastChrCookie = document.cookie.length;
			return decodeURI(document.cookie.substring(y, lastChrCookie));
		}
		x = document.cookie.indexOf(" ", x) + 1;
		if (x == 0)
			break;
	}
	return "";
}



$(document).ready(function(){
   
	var reRsMsg = "${param.useMemberManage}"; 
	if(reRsMsg == "true"){
		alert("허용되지 않은 접근입니다.");
	}
	
	// 전체 파일 다운로드
	$("button[name=down_file_all]").click(function(){
		var atchFileId = $(this).attr("fileinfo"); 
		
		if(atchFileId == null || atchFileId == ""){
			alert("파일 정보를 확인할 수 없습니다.");
			return;
		}
		
		$("#downForm input[name=atchFileId]").val(atchFileId);
		
		$("#downForm")
		.attr("target" , "fileDown")
		.attr("action" , "<c:url value='/cmm/fms/fileDownAll.do' />")
		.submit();
	});
});
</script>
</head>

<body id="section1" class="mainLayout">
	<!-- header -->
	<c:import url="/sym/mnu/mpm/EgovNoLoginMainMenuHead.do?vSiteType=KOR&mainYN=Y" charEncoding="UTF-8" />
	<!-- //header -->
	<div id="container">
		<div class="mainButton">
			<a href="javascript:mainType(0)"><img src="/assets/kor/images/newMain/tap01_on.png" alt="어린이" /></a>
			<a href="javascript:mainType(1)"><img src="/assets/kor/images/newMain/tap02_off.png" alt="학부모" /></a>
			<a href="javascript:mainType(2)"><img src="/assets/kor/images/newMain/tap03_off.png" alt="교사" /></a>
		</div>
		<div class="mainSDiv">
			<ul class="mainSUl">
				<li>
					<div class="main1">
						<div class="box01">
							<div class="slideControl1">
								<ul>
									<li></li>
								</ul>
								<a href="javascript:slideC1('stop',mainTime1,1)" id="bu_stop1"><img src="/assets/kor/images/newMain/pause.png" alt="일시정지 아이콘"/></a>
								<a href="javascript:slideC1('play',mainTime1,1)" id="bu_play1" style="display:none;"><img src="/assets/kor/images/newMain/play.png" alt="재생 아이콘"/></a>
							</div>
							<div class="box01In">
								<ul>
								<c:forEach var="fileVO" items="${fileList}" varStatus="status">
                   				<c:if test="${status.count < 7 }">
			                   	<li class="img">
                   					<c:choose>
                   						<c:when test="${fileVO.linkUrl eq '#noUrl'}">
                   							<img alt="<c:out value='${fileVO.bannerDc }'/>" onerror="imgError(this);" src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.bannerImageFile}"/>"  />
                   						</c:when>
                   						<c:otherwise>
					                    	<a href="<c:out value="${fileVO.linkUrl}"/>" <c:choose><c:when test="${fileVO.targetAt == '0' }">target="_blank"</c:when><c:otherwise>target="_top"</c:otherwise></c:choose> title="새 창으로 이동">
					                        	<img alt="<c:out value='${fileVO.bannerDc }'/>" onerror="imgError(this);" src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.bannerImageFile}"/>"  />
					                      	</a>
                   						</c:otherwise>
                   					</c:choose>
			                   	</li>
                     			</c:if>
               					</c:forEach>
		                        </ul>
	                        </div>		
						</div>
						<div class="box02">
							<h3>케미어린이교실</h3>
							<!--  
							<div class="Box2Indicator">
								<img src="/assets/kor/images/newMain/pause.png" alt="일시정지 아이콘"/>
								<img src="/assets/kor/images/newMain/indicator01.png" alt="선택된 인디케이터"/>
								<img src="/assets/kor/images/newMain/indicator03.png" alt="선택 안 된 인디케이터"/>
							</div>
							-->
							<ul class="chami_school">
								<li>
									<div class="main_child"><img src="/assets/kor/images/newMain/main_child01.png" alt="" /></div>
									<div class="chami_schoolIn">
									<a href="/user/com/kids/quiz/quizInqire.do?menuNo=15004">
										<div class="schoolImgWrap"><img src="/assets/kor/images/newMain/sub_visual01.jpg" alt="케미퀴즈 예시화면"/></div>
										<div class="schoolContents">
											<h4>케미퀴즈</h4>
											<p>환경물질에 대한 퀴즈를
											풀어보면서 재미있게 배워보세요.</p>
										</div>
									</a>
									</div>
								</li>
								<li>
									<div class="main_child"><img src="/assets/kor/images/newMain/main_child02.png" alt="" /></div>
									<div class="chami_schoolIn">
									<a href="javascript:void(0);" onclick="window.open('/quiz/index.html','quiz','width=850, height=800, resizable=yes')">
										<img src="/assets/kor/images/newMain/newIcon.png" alt="New Icon" class="newIcon"/>
										<div class="schoolImgWrap"><img src="/assets/kor/images/newMain/sub_visual02.jpg" alt="단어찾기1 예시화면"/></div>
										<div class="schoolContents">
											<h4>가로세로<br/>낱말맞추기</h4>
										<p>빈칸의 단어를 맞추면서 환경공부도 함께 해요</p>
										</div>
									</a>
									</div>
								</li>
								<li>
									<div class="main_child"><img src="/assets/kor/images/newMain/main_child03.png" alt="" /></div>
									<div class="chami_schoolIn">
									<a href="/common/game/industry_game.jsp" onclick="window.open(this.href, '', 'width=560, height=420, scrollbars=no'); return false;" onkeypress="window.open(this.href, '', 'width=560, height=420, scrollbars=yes'); return false;">
										<div class="schoolImgWrap"><img src="/assets/kor/images/newMain/sub_visual03.jpg" alt="카드맞추기 예시화면"/></div>
										<div class="schoolContents">
											<h4>카드맞추기</h4>
											<p>조각의 움직임이 진행된 후, 따라해야할 조각수가 늘어나요.</p>
										</div>
									</a>
									</div>
								</li>
								<li>
									<div class="main_child"><img src="/assets/kor/images/newMain/main_child04.png" alt="" /></div>
									<div class="chami_schoolIn">
									<a href="javascript:void(0);" onclick="window.open('/game/index.html','game','width=600, height=800, resizable=yes')">
										<img src="/assets/kor/images/newMain/newIcon.png" alt="New Icon" class="newIcon"/>
										<div class="schoolImgWrap"><img src="/assets/kor/images/newMain/sub_visual04.jpg" alt="그린콩콩 예시화면"/></div>
										<div class="schoolContents">
											<h4>분리수거의 달인</h4>
											<p>게임을 통해 분리수거에 대해 알아보세요. </p>
										</div>
									</a>
									</div>
								</li>
							</ul>
		
						</div>
						<div class="box03">
							<div class="box3In">
								<h3>생활 속 유해물질</h3>
								<a href="/kor/material/living.do?menuNo=12003&envId=ENV_0000001"><p class="plus">+</p></a>
								<ul class="listOverUl box3InUl">
									<li class="home">
										<a href="/kor/material/living.do?menuNo=12003&envId=ENV_0000001"><img src="/assets/kor/images/newMain/list_01_off.gif" alt="우리집" /></a>
									</li>
									<li class="kindergarden">
										<a href="/kor/material/living.do?menuNo=12003&envId=ENV_0000008"><img src="/assets/kor/images/newMain/list_02_off.gif" alt="어린이집/유치원" /></a>
									</li>
									<li class="playground">
										<a href="/kor/material/living.do?menuNo=12003&envId=ENV_0000009"><img src="/assets/kor/images/newMain/list_03_off.gif" alt="놀이터" /></a>
									</li>
									<li class="school">
										<a href="/kor/material/living.do?menuNo=12003&envId=ENV_0000010"><img src="/assets/kor/images/newMain/list_04_off.gif" alt="학교" /></a>
									</li>
									<li class="publicPlace">
										<a href="/kor/material/living.do?menuNo=12003&envId=ENV_0000011"><img src="/assets/kor/images/newMain/list_05_off.gif" alt="공공장소" /></a>
									</li>
									<li class="more">
										<a href="/kor/material/living.do?menuNo=12003&envId=ENV_0000001"><img src="/assets/kor/images/newMain/list_06_off.gif" alt="더보기" /></a>
									</li>
								</ul>
		
							<div class="mainCourse">
									<div class="mainCourseIn0${status.count}">
										<div class="health_course">
											<h4>환경보건 교육과정</h4><a href="/user/com/kids/lms/lmsCourseListForUser.do?menuNo=15001"><p class="plus">+</p></a>
											<c:if test="${fn:length(courseList) ge 0}">
												<c:forEach var="courseVO" items="${courseList}" varStatus="i">
													<div class="course_first">
														<div class="courseChild"><img src="/assets/kor/images/newMain/edu.png" alt="교육 내용 이미지"/></div>
														<p class="course_text"><a href="/user/com/kids/lms/lmsCourseListForUser.do?menuNo=15001&streamIdx=${i.index}#cData${i.index}">${courseVO.courseNm}</a></p>
													</div>
												</c:forEach>
											</c:if>
										</div>
									</div>
								<div class="commonSense"><!-- 화학물질상식 -->
									<a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000640&menuNo=12005"><img src="/assets/kor/images/newMain/commonSense.png" alt="" /></a>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="main2">
						<div class="box01">
							<div class="box01_firstWrap">
								<img src="/assets/kor/images/newMain/main_visual02.png" alt="행복한 우리집 깨긋한 우리집" />
							</div>
							<div class="box01_secondWrap">
								<h3>환경뉴스</h3>
								<a href="/user/com/kids/common/withinNews.do?menuNo=1100201" class="plus">+</a>
								<ul>
									<c:if test="${fn:length(newsList) gt 0}">
										<c:forEach var="newsVO" items="${newsList}">
											<li><a href="/user/cop/bbs/selectBoardArticle.do?nttId=${newsVO.nttId}&bbsId=BBSMSTR_000000000590&menuNo=1100202">
												<strong><nobr>${newsVO.nttSj}</nobr></strong><span class="date">${newsVO.frstRegisterPnttm}</span></a></li>
										</c:forEach>
										<c:forEach var="i" begin="1" end="${4 - fn:length(newsList)}" step="1">
											<li><a>작성된 게시물이 없습니다.</a></li>
										</c:forEach>		
									</c:if>
								</ul>
								<div class="newsLetter">
									<a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000600&menuNo=11006"><img src="/assets/kor/images/newMain/newsLetter.gif" alt="환경부 어린이 화학교실, 화학물질 유해성 정보 사이트, 건강, 화학물질 관리현황 등 안내 뉴스레터" /></a>
								</div>
							</div>
						</div>
						<div class="box02">
							<h3>핫 이슈</h3>
							<a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000580&menuNo=11001" class="plus">+</a>
							<div class="slideWrap">
								<a href="javascript:hotS('p')" class="leftArrow1"><img src="/assets/kor/images/newMain/slide_arrow_left.png" alt="왼쪽슬라이드 버튼"/></a>
								<a href="javascript:hotS('n')" class="rightArrow1"><img src="/assets/kor/images/newMain/slide_arrow_right.png" alt="오른쪽 슬라이드 버튼"/></a>
								<ul>
									<c:forEach var="issueVO" items="${issueList}">
										<li class="chemi_imgWrap">
											<a href="/user/cop/bbs/selectBoardArticle.do?nttId=${issueVO.nttId}&bbsId=BBSMSTR_000000000580&menuNo=11001&nttSj=${issueVO.nttSj}" class="chemi_imgWrapA"><img src="/cmm/fms/getImage.do?atchFileId=${issueVO.thumbFileId}" alt="${issueVO.nttSj}"/></a>
											<a href="/user/cop/bbs/selectBoardArticle.do?nttId=${issueVO.nttId}&bbsId=BBSMSTR_000000000580&menuNo=11001&nttSj=${issueVO.nttSj}"><p class="explain">${issueVO.nttSj}</p></a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="box03">
							<div class="box3In">
								<h3>Quick Menu</h3>
								<ul class="listOverUl">
									<li class="news">
										<a href="/user/com/kids/common/withinNews.do?menuNo=1100201"><img src="/assets/kor/images/newMain/list2_01_off.gif" alt="환경뉴스" /></a>
									</li>
									<li class="report">
										<a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000570&menuNo=11004"><img src="/assets/kor/images/newMain/list2_02_off.gif" alt="국내환경보건동향" /></a>
									</li>
									<li class="facilities">
										<a href="/kor/space/condition.do?menuNo=13002"><img src="/assets/kor/images/newMain/list2_03_off.gif" alt="어린이활동공간 현황/시설" /></a>
									</li>
									<li class="referenceRoom">
										<a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000641&menuNo=13005"><img src="/assets/kor/images/newMain/list2_04_off.gif" alt="어린이활동공간 자료실" /></a>
									</li>
									<li class="knowledge">
										<a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000610&menuNo=14001"><img src="/assets/kor/images/newMain/list2_05_off.gif" alt="환경보건지식" /></a>
									</li>
									<li class="information">
										<a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000620&menuNo=14002"><img src="/assets/kor/images/newMain/list2_06_off.gif" alt="환경성질환정보" /></a>
									</li>
								</ul>
							</div>
						</div>
		
						<div class="box04">
							<h3>국내어린이용품리콜</h3>
							<a href="/user/com/kids/recall/selectRecallBBSList.do?domesticYn=Y&menuNo=1100701" class="plus">+</a>
							<div class="recallWrap">
								<a href="javascript:reS('p')" class="leftArrow2"><img src="/assets/kor/images/newMain/leftArrow02.gif" alt="왼쪽슬라이드 버튼"/></a>
								<a href="javascript:reS('n')" class="rightArrow2"><img src="/assets/kor/images/newMain/rightArrow02.gif" alt="오른쪽슬라이드 버튼"/></a>
								<div class="recallWrapIn">
									<ul>
										<c:forEach var="recallVO" items="${recallListY}" varStatus="i">
											<c:if test="${recallVO.domesticYn eq 'Y' && i.count lt 6}">
												<li>
													<div class="imgWrap">
													<a href="/user/com/kids/recall/recallBBSInqire.do?menuNo=${recallVO.productTabCd}&domesticYn=${recallVO.domesticYn}&recallId=${recallVO.recallId}">
														<img src="/cmm/fms/getImage.do?atchFileId=${recallVO.atchFileId}" alt="${recallVO.productName}"/>
													</a>			 
													</div>
													<div class="textWrap">
														<h4><nobr>
															<a href="/user/com/kids/recall/recallBBSInqire.do?menuNo=${recallVO.productTabCd}&domesticYn=${recallVO.domesticYn}&recallId=${recallVO.recallId}">${recallVO.productName}</a>
														</nobr></h4>
														<strong>조치결과</strong>
														<p>${recallVO.afterRecallCn} </p>	
													</div>		
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>						
						</div>
		
						<div class="box04">
							<h3>국외어린이용품리콜</h3>
							 <a href="/user/com/kids/recall/selectRecallBBSList.do?domesticYn=N&menuNo=11008" class="plus">+</a>
							<div class="recallWrap">
								<a href="javascript:reS2('p')" class="leftArrow2"><img src="/assets/kor/images/newMain/leftArrow02.gif" alt="왼쪽슬라이드 버튼"/></a>
								<a href="javascript:reS2('n')" class="rightArrow2"><img src="/assets/kor/images/newMain/rightArrow02.gif" alt="오른쪽슬라이드 버튼"/></a>
								<div class="recallWrapIn2">
									<ul>
										<c:forEach var="recallVO" items="${recallListN}" varStatus="j">
											<c:if test="${recallVO.domesticYn eq 'N' && j.count lt 6}">
												<li>
													<div class="imgWrap">
													<a href="/user/com/kids/recall/recallBBSInqire.do?menuNo=11008&domesticYn=${recallVO.domesticYn}&recallId=${recallVO.recallId}">
														<img src="/cmm/fms/getImage.do?atchFileId=${recallVO.atchFileId}" alt="${recallVO.productName}"/>
													</a>
													</div>
													<div class="textWrap">
														<h4><nobr>
															<a href="/user/com/kids/recall/recallBBSInqire.do?menuNo=11008&domesticYn=${recallVO.domesticYn}&recallId=${recallVO.recallId}">${recallVO.productName}</a>
														</nobr></h4>
														<strong>조치결과</strong>
														<p>${recallVO.afterRecallCn} </p>	
													</div>					 
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>						
						</div>
					</div>
				</li>
				<li>
					<div class="main3">
						<div class="box01">
							<img src="/assets/kor/images/newMain/main_visual03.png" alt="케미스토리에서 환경보건 교육정보를 나눕니다. 보호하고 모두의 건강과 안전을 위해 실천하고 어린이 환경부터 꼼꼼하게 벗어나서 유해환경과 환경호르몬으로부터 함께하는 교육으로 건강한 미래를"/>
						</div>

						<div class="box02">
							<div class="box2In">
								<h3>Quick Menu</h3>
								<ul class="listOverUl">
									<li class="m3_news">
									<a href="/user/com/kids/common/withinNews.do?menuNo=1100201"><img src="/assets/kor/images/newMain/list3_01_off.gif" alt="환경뉴스"/></a>
									</li>
									<li class="m3_report">
									<a href="/user/com/kids/calender/calenderView.do?menuNo=11005"><img src="/assets/kor/images/newMain/list3_02_off.gif" alt="환경보건행사"/></a>
									</li>
									<li class="m3_facilities">
									<a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000640&menuNo=12005"><img src="/assets/kor/images/newMain/list3_03_off.gif" alt="화학상식+"/></a>
									</li>
									<li>
									<a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000622&menuNo=14005"><img src="/assets/kor/images/newMain/list3_04_off.gif" alt="전문가칼럼"/></a>
									</li>
								</ul>
							</div>
						</div>


						<div class="box03">
							<ul class="m3_tabs">
								<li class="on"><a href="#" onclick="tabS2(this,'.m3_tab1')"><h3>공지사항</h3></a>
									<ul class="m3_tab1">
										<c:forEach var="alrimVO" items="${alrimList}">
											<li><p class="m3_tab_contents">
												<a href="/user/cop/bbs/selectBoardArticle.do?bbsId=BBSMSTR_000000000012&nttId=${alrimVO.nttId}&menuNo=18002"><nobr>${alrimVO.nttSj}</nobr></a></p>
												<p class="date">${alrimVO.frstRegisterPnttm}</p>
											</li>
										</c:forEach>
									</ul>
								</li>
								<li><a href="#" onclick="tabS2(this,'.m3_tab2')"><h3>환경보건행사</h3></a>
									<ul class="m3_tab2">
										<c:forEach var="calVO" items="${calenderList}" begin="0" end="2" step="1">
											<li><p class="m3_tab_contents">
												<a href="/user/com/kids/calender/calenderView.do?menuNo=11005"><nobr>${calVO.title}</nobr></a></p>
												<p class="date">${fn:substring(calVO.inputDate, 0, 4)}-${fn:substring(calVO.inputDate, 5, 7)}-${fn:substring(calVO.inputDate, 8, 10)}</p>
											</li>
										</c:forEach>
									</ul>
								</li>
							</ul>
							<a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000660&searchCl1DetailCode=BCC601&menuNo=12004"class="m3_linkImg"><img src="/assets/kor/images/newMain/multy.gif" alt="멀티미디어 자료 링크"/></a>
						</div>

						<div class="box04">
							<h3>교육자료</h3>
							 <a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000670&menuNo=15002" class="plus">+</a>
							<div class="m3_resourseWrap">
								<ul>
								<c:forEach var="tEduVO" items="${eduDataList}" varStatus="status" begin="0" end="3" step="1">
									<li <c:if test="${status.count eq 1}">class="m3_first"</c:if><c:if test="${status.count eq 3}">class="m3_third"</c:if><c:if test="${status.count eq 4}">class="m3_forth"</c:if>>
										<h4>${tEduVO.nttSj}</h4>
										<p>${tEduVO.cl1DetailCodeNm}</p>
										<div class="al_contents">
											<div class="m3_circleWrap">
												<c:choose>
													<c:when test="${fn:length(tEduVO.thumbFileId) > 0}"><img src="/cmm/fms/getImage.do?atchFileId=${tEduVO.thumbFileId}" alt="${tEduVO.nttSj}"></img></c:when>
												
													<c:otherwise><img src="/assets/kor/images/newMain/chemiCircle.png" alt="알레르기 설명사진"></img></c:otherwise>
												</c:choose>
											</div>
											<div class="m3_box4_contents">
												<p class="overhidden">${fn:replace(fn:replace(tEduVO.nttCn, '<p>', ''), '</p>', '')}</p>
<%-- 												<p class="m3_resourse">출처 : ${tEduVO.extStr5}</p> --%>
											</div>
										</div>
										<button type="button" class="m3_btn_download" name="down_file_all" fileinfo="<c:out value='${tEduVO.atchFileId}'/>">
											<c:choose>
												<c:when test="${fn:length(tEduVO.atchFileId) gt 0 && fn:length(tEduVO.cl3DetailCode) gt 0}">${tEduVO.cl3DetailCode eq 'A' ? '학생용' : '교사용'} 다운로드</c:when>
												<c:otherwise>자료 준비중</c:otherwise>
											</c:choose>
										</button>
									</li>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
  
	<form id="downForm" name="downForm" method="post">
		<input type="hidden" name="atchFileId" />
	</form>
	
	<div style="width: 0px; height: 0px; display: none;">
		<iframe name="fileDown" title="fileDown"></iframe>
	</div>
     
</div><!-- container -->
<c:import url="/WEB-INF/jsp/kor/kor_bottom.jsp" charEncoding="UTF-8" />
</body>
</html>
