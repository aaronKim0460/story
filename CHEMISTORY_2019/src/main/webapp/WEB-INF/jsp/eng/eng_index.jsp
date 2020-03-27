<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="keywords" content="national institute of environmental research" />
<meta name="description" content="national institute of environmental research" />
<title>Natlonal institute of environmental research</title>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-138744497-1"></script>
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-748958555"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-138744497-1');
  gtag('config', 'AW-748958555');
</script>

<%@ include file="/WEB-INF/jsp/tiles/css/eng_css.jsp" %>
<%@ include file="/WEB-INF/jsp/tiles/script/eng_script.jsp" %>

<script type="text/javascript"> 
	$(function() {
		// GNB 애니메이션 높이 지정
		gnb_subbg_height = 320;
		gnb_height = 390;
		
		$.get("<c:url value='/cop/bbs/selectNoLoginBoardOnlyList.do?menuNo=74002&pSize=7' />", function(data){ 
		    $('#notice1').after(data);
		  });
		$.get("<c:url value='/cop/bbs/selectNoLoginBoardOnlyList.do?menuNo=73001&pSize=7' />", function(data){
		    $('#notice2').after(data);
		  });
		
		/* 왼쪽 영역 마우스 액션 */
		$('.main-l-section h3 a').on('mouseover focus',function(e){
			TweenMax.to($('.main-l-over'), 0.1, {
				width: 0,
				ease: Strong.easeInOutExpo
			});
			TweenMax.to($(this).parent().next('.main-l-over'), 0.2, {
				width: 1024,
				ease: Strong.easeInOutExpo
			});
		});
		$('.main-left').on('mouseleave',function(e){
			TweenMax.to($('.main-l-over'), 0.1, {
				width: 0,
				ease: Strong.easeInOutExpo
			});
		});

		/* news 탭 */
		$('.main-c-news > ul > li:first-child > ul').show();
		$('.main-c-news > ul > li:first-child .more').show();
		$('.main-c-news h3 a').on('mouseover focus',function(e){
			$('.main-c-news > ul > li').removeClass('active');
			$('.main-c-news > ul > li > ul').hide();
			$('.main-c-news > ul > li .more').hide();
			$(this).parent('h3').parent('li').addClass('active');
			$(this).parent('h3').parent('li').children('ul').show();
			$(this).parent('h3').parent('li').children('.more').show();
		});

		/* news 제목 글 자르기 */
		$('.main-c-news li a').each(function(){
			var eachText = cutStr($(this).text(),40);
			$(this).html(eachText);
		});
	
		$('.footer-banner-ul').bxSlider({
			auto:true,
			pager:false,
			minSlides: 3,
			moveSlides: 1,
			maxSlides: 5,
			slideWidth: 178,
			slideMargin: 10,
			nextSelector: '#slider-next',
			prevSelector: '#slider-prev'
		});
		
		//알림판
		var slider2 = $('.noticeImg').bxSlider({
			  mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
			  speed: 1000, //default:500 이미지변환 속도
			  auto: true, //default:false 자동 시작
			  captions: true, // 이미지의 title 속성이 노출된다.
			  autoControls: true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
			  pager: true ,
			  controls : false,
			  pagerCustom: '.noticePager',
			  startText : "",
			  autoControlsCombine : true,
			  stopText : "",
			  autoDelay : 300,
			  onSlideAfter : function($slideElement, oldIndex, newIndex){
				  $('.noticePager li').removeClass('on');
				  $('.noticePager li').eq(newIndex).addClass('on');
				  slider2.startAuto(); 
			  }
			});	
		
		$('.noticePager li').on('click',function(){
			slider2.goToSlide($(this).index());	
		});
		
		$('#palyerBtn').on('click',function(){
			var index = 0;
			$('.noticePager li').each(function(i){
				if($(this).hasClass('on')){
					index = i;
				}
				
			});
			slider2.stopAuto();
		});
		
		$('#palyerBtn2').on('click',function(){
			var index = 0;
			$('.noticePager li').each(function(i){			
				if($(this).hasClass('on')){
					//alert("index : "+i);				
					index = (i+1);
				}
				
			});
			slider2.goToSlide(index);	
		});
		
	});
	
	function imgError(image){
		$(image).attr('src','/assets/kor/images/bbs/img_thum01.gif');
	}
</script>
<script type="text/javascript" src="/js/menu.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<style type="text/css">
.bx-wrapper .bx-viewport {
	-moz-box-shadow: 0px;
	-webkit-box-shadow: 0px;
	box-shadow: 0px;
	border: 0px;
	left: 0px;
}
.footer-banner-ul li {z-index:9999;}
</style>
<!--[if lte IE 8]>
<script src="/js/selectivizr-min.js"></script>
<![endif]-->
<!--[if lte IE 7]>
<script src="/js/jquery.pseudo.js"></script>
<link rel="stylesheet" type="text/css" href="/css/ie7.css" media="screen" />
<![endif]-->
</head>

<body class="main">
<div class="skip-nav"><a href="#content">Skip to Content</a></div>
<!-- wrap -->
<div id="wrap">
	<!-- header -->
	<c:import url="/sym/mnu/mpm/EgovNoLoginMainMenuHead.do?vSiteType=ENG"/> 
	<!-- //header -->
<!-- container -->
	<div id="container">
		<!-- content -->
		<div id="content">
			<div class="contWrap">
            	<div class="mBox">
                	<h2>News &amp; Events </h2>
                    <span class="mMore"><a href="/cop/bbs/selectNoLoginBoardList.do?bbsId=BBSMSTR_000000000124&menuNo=74002"><img src="/images/cms/eng/btn_more.gif" alt="more" /></a></span>
                    <ul class="mList">
 						<c:forEach var="result" items="${noticeList0}" varStatus="status">      
 						<c:set var="bbsTitle" value="${result.nttSj}" />
 						<c:if test="${fn:length(bbsTitle)> 40}">
							<c:set var="bbsTitle"><c:out value="${fn:substring(bbsTitle,0, 40)}"/>...</c:set>
						</c:if>
                    	<li>
                        	<a href="/cop/bbs/selectNoLoginBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=74002">
                        	<p class="tit"><c:out value="${bbsTitle}" escapeXml="false" /></p>
                            <p class="txt"><c:out value="${bbsTitle}" escapeXml="false"/></p>
                            <p class="date"><c:out value="${result.ntceDate}"/></p>
                            </a>
                        </li>
                        </c:forEach>
                    </ul>
                </div><!--//mBox-->
                <div class="mBox">
                	<h2>International Cooperation</h2>
                    <span class="mMore"><a href="/cop/bbs/selectNoLoginBoardList.do?bbsId=BBSMSTR_000000000125&menuNo=73001"><img src="/images/cms/eng/btn_more.gif" alt="more" /></a></span>
                    <ul class="mList">
 						<c:forEach var="result" items="${noticeList1}" varStatus="status">      
 						<c:set var="bbsTitle" value="${result.nttSj}" />
 						<c:if test="${fn:length(bbsTitle)> 40}">
							<c:set var="bbsTitle"><c:out value="${fn:substring(bbsTitle,0, 40)}"/>...</c:set>
						</c:if>
                    	<li>
                        	<a href="/cop/bbs/selectNoLoginBoardArticle.do?nttId=<c:out value='${result.nttId}'/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;menuNo=73001">
                        	<p class="tit"><c:out value="${bbsTitle}" escapeXml="false" /></p>
                            <p class="txt"><c:out value="${bbsTitle}" escapeXml="false"/></p>
                            <p class="date"><c:out value="${result.ntceDate}"/></p>
                            </a>
                        </li>
                        </c:forEach>
                    </ul>
                </div><!--//mBox-->
                <div class="mRight">
                    <div class="mainBnrWrap mphoto">
	                	<div class="maintit">
	                    	<h2>Photo</h2>
	                        <ul class="mainpaging noticePager">
	                        	<c:forEach var="fileVO" items="${fileList}" varStatus="status">
	                        	<c:if test="${status.count < 7 }">
	                        		<li <c:if test="${status.count == 1 }">class="on"</c:if>><a href="" data-slide-index="<c:out value='${status.count}'/>">페이지</a></li>
	                        	</c:if>
	                        	</c:forEach>
	                           
	                        </ul>
	                        <ul class="mainpaging">
	                        	<li class="stop" id="palyerBtn"><a href="#none" >멈춤</a></li>
	                            <li class="play on" id="palyerBtn2"><a href="#none" >재생</a></li>
	                        </ul>
	                    </div>
	                    <div class="noticeImg">
	                    <!-- <p class="img"><a href=""><img src="/assets/kor/images/main/mainbnr01.gif" alt="" /></a></p> -->
						<c:forEach var="fileVO" items="${fileList}" varStatus="status">
							 <c:if test="${status.count < 7 }">
							 <p class="img">
							 	<a href="<c:out value="${fileVO.linkUrl}"/>" <c:choose><c:when test="${fileVO.targetAt == '0' }">target="_blank"</c:when><c:otherwise>target="_top"</c:otherwise></c:choose> title="새 창으로 이동">
							 		<img alt="<c:out value='${fileVO.bannerDc }'/>" onerror="imgError(this);" src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${fileVO.bannerImageFile}"/>" />
							 	</a>
							 </p>
					         </c:if>
					    </c:forEach>                    
	                    </div>
	                </div><!--//mainBnrWrap-->
                        
                    <ul class="mQuick">
                    	<li class="mQuick01"><a href="/EgovMovePage.do?menuNo=71003">Vision</a></li>
                        <li class="mQuick02"><a href="/EgovMovePage.do?menuNo=71005">Organization</a></li>
                        <li class="mQuick03"><a href="/EgovMovePage.do?menuNo=71001">President's<br />Message</a></li>
                    </ul>
                </div>
                <ul class="mBnr">
               		<li><a href="http://www.temm.org" target="_blank"><img src="/images/cms/eng/bnr_sample01.png" alt="" /></a></li>
                    <li><a href="http://www.mercury2015.com" target="_blank"><img src="/images/cms/eng/bnr_sample02.png" alt="" /></a></li>
                    <li class="last"><a href="/cop/bbs/selectNoLoginBoardArticle.do?bbsId=BBSMSTR_000000000122&nttId=18616&bbsTyCode=BBST03&bbsAttrbCode=BBSA02&authFlag=Y&pageIndex=1&menuNo=75002&searchCnd=0&searchWrd="><img src="/images/cms/eng/bnr_sample03.png" alt="" /></a></li>

                </ul>
            </div><!--//contWrap-->
            <div class="footer-banner">
                <span id="slider-prev"></span>
                <span id="slider-next"></span>
                <ul class="footer-banner-ul">
                  	<c:forEach var="result" items="${bnrList}" varStatus="status">
						<li><a href="<c:out value="${result.linkUrl}"/>" <c:choose><c:when test="${result.targetAt == '0' }">target="_blank"</c:when><c:otherwise>target="_top"</c:otherwise></c:choose>><img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${result.bannerImageFile}"/>" alt="<c:out value='${result.bannerDc }'/>" style="width:176px;height:39px"/></a></li>
                  	</c:forEach>
<!--                    	<li><a href="http://eng.me.go.kr/eng/web/main.do" target="_blank" title="new window"><img alt="eng.me.go.kr" src="/images/cms/eng/banner1.gif" /></a></li> -->
<!--                     <li><a href="http://ecosystem.nier.go.kr/tropicalplant" target="_blank" title="new window"><img alt="eng.me.go.kr" src="/images/cms/eng/banner2.gif" /></a></li> -->
<!--                     <li><a href="http://ecosystem.nier.go.kr:8282/eng/e0000m01.asp" target="_blank" title="new window"><img alt="eng.me.go.kr" src="/images/cms/eng/banner3.gif" /></a></li> -->
<!--                     <li><a href="http://neaspec.org" target="_blank" title="new window"><img alt="eng.me.go.kr" src="/images/cms/eng/banner4.gif" /></a></li> -->
<!--                     <li><a href="http://temm.org" target="_blank" title="new window"><img alt="eng.me.go.kr" src="/images/cms/eng/banner5.gif" /></a></li> -->

                </ul>
            </div><!-- //footer-banner -->
		</div><!-- //content -->
	</div><!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/eng/eng_bottom.jsp" %> 
	<!-- //footer -->
</div><!-- //wrap -->
</body>
</html>