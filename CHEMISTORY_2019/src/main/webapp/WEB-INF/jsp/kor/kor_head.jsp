<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<ul class="skip">
	<li><a href="#header">상단메뉴바로가기</a></li>
    <li><a href="#side">왼족메뉴바로가기</a></li>
    <li><a href="#colgroup">컨텐츠바로가기</a></li>
    <li><a href="#footer_kor">풋터바로가기</a></li>    
</ul>
<div class="topLayout">
	<div class="topMenuBox">
		<div class="topMenuBoxIn">
			<ul>
				<li><a href="/EgovMovePage.do?menuNo=18000">홈페이지 이용안내</a></li>
				<li><a href="http://www.facebook.com/chemi" target="_blank"><img src="/assets/kor/images/newMain/bu_face.png" alt="facebook" /></a></li>
				<li><a href="https://twitter.com/chemistorys" target="_blank"><img src="/assets/kor/images/newMain/bu_twi.png" alt="twitter" /></a></li>
				<li><a href="http://chemistory.tistory.com/" target="_blank"><img src="/assets/kor/images/newMain/bu_t.png" alt="tstory" /></a></li>
			</ul>
		</div>
	</div>
	<div class="gnbMenuBox">
		<h1><a href="/kor/index.do"><img src="/assets/kor/images/newMain/logo.png" alt="케미스토리 어린이 환경과 건강포털" /></a></h1>
		<ul class="gnbMenuBoxUL">
			<c:set var="topMenuCnt" value="0"/> <!--  최상위 메뉴의 Count 그외 메뉴는 탑메뉴에서 제외하기 위해서 변수 선언-->
			<c:forEach var="result1" items="${list_headmenu}" varStatus="status" >
			<c:if test="${result1.menuOrdr == 1 && topMenuCnt < 8 && result1.menuNo ne 18000 && result1.menuNo ne 19000 }"> 
			<c:set var="topMenuCnt" value="${topMenuCnt+1 }"/> <!--  최상위 메뉴의 Count 그외 메뉴는 탑메뉴에서 제외하기 위해서 변수 선언 후 +1  -->
			
			<li onmouseover="menuS(${status.index})"><a href="<c:url value="/EgovMovePage.do" />?menuNo=<c:out value='${result1.menuNo}'/>" <%-- <c:if test="${topMenuCnt == 6 }">target="_top"</c:if> --%>><c:out value='${result1.menuNm }'/></a>
				<c:if test="${status.index == 0}">
				<div class="inbox smenu01" style="display: block;">
					<div class="title">
						이슈 &amp; 뉴스
					</div>
					<div class="spczone">
						<p class="tit al">핫이슈<span><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000580&menuNo=11001"><img src="/assets/kor/images/newMain/smenu_morebtn.gif" alt="더보기" /></a></span></p>
						<ul class="issueList">
							<c:forEach var="issueVO" items="${issueList}">
								<li>
									<p class="img"><a href="/user/cop/bbs/selectBoardArticle.do?nttId=${issueVO.nttId}&bbsId=BBSMSTR_000000000580&menuNo=11001&nttSj=${issueVO.nttSj}"><img src="/cmm/fms/getImage.do?atchFileId=${issueVO.thumbFileId}" alt="${issueVO.nttSj}" /></a></p>
									<p class="txt"><a href="/user/cop/bbs/selectBoardArticle.do?nttId=${issueVO.nttId}&bbsId=BBSMSTR_000000000580&menuNo=11001&nttSj=${issueVO.nttSj}">${issueVO.nttSj}</a></p>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="menuzone">
						<ul class="menuList">
							<li><a href="/user/com/kids/common/withinNews.do?menuNo=1100201">환경뉴스</a></li>
							<li><a href="/user/com/kids/calender/calenderView.do?menuNo=11005">환경보건행사</a></li>
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000570&menuNo=11004">국내환경보건동향</a></li>
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000591&menuNo=11003">해외환경보건동향</a></li>	
							<li><a href="/user/com/kids/recall/selectRecallBBSList.do?domesticYn=Y&menuNo=1100701" class="addPadding">국내어린이용품 환경유해인자<br/>기준초과제품</a></li>
							<li><a href="/user/com/kids/recall/selectRecallBBSList.do?domesticYn=N&menuNo=11008">해외어린이용품 리콜현황</a></li>
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000600&menuNo=11006">뉴스레터</a></li>
						</ul>
					</div>
				</div>	
				</c:if>
				<c:if test="${status.index == 1}">
				<div class="inbox smenu02">
					<div class="title">
						생활 속 유해물질
					</div>
					<div class="spczone">
						<ul class="mediaList">
							<li>
								<p class="img"><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000660&searchCl1DetailCode=BCC601&menuNo=12004"><img src="/assets/kor/images/newMain/smenu02_01.gif" alt="" /></a></p>
								<p class="txt"><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000660&searchCl1DetailCode=BCC601&menuNo=12004">웹툰</a></p>
							</li>
							<li>
								<p class="img"><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000660&searchCl1DetailCode=BCC602&menuNo=12004"><img src="/assets/kor/images/newMain/smenu02_02.gif" alt="" /></a></p>
								<p class="txt"><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000660&searchCl1DetailCode=BCC602&menuNo=12004">스토리북</a></p>
							</li>
							<li>
								<p class="img"><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000660&searchCl1DetailCode=BCC603&menuNo=12004"><img src="/assets/kor/images/newMain/smenu02_03.gif" alt="" /></a></p>
								<p class="txt"><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000660&searchCl1DetailCode=BCC603&menuNo=12004">플래쉬북</a></p>
							</li>
						</ul>
					</div>
					<div class="menuzone">
						<ul class="menuList">
							<li><a href="/kor/material/map.do?menuNo=12001">어린이환경유해인자정보맵</a></li>
							<li><a href="/kor/material/db.do?menuNo=12002">어린이환경유해인자DB</a></li>
							<li><a href="/kor/material/living.do?menuNo=12003">생활 속 유해인자</a></li>
							<li><a href="/kor/material/chemistry.do?menuNo=12006">유해물질자료</a></li>
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000660&searchCl1DetailCode=BCC601&menuNo=12004">멀티미디어자료</a></li>
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000640&menuNo=12005">화학상식</a></li>
						</ul>
					</div>
				</div>
				</c:if>
				<c:if test="${status.index == 2}">
				<div class="inbox smenu03">
					<div class="title">
						어린이활동공간
					</div>
					<div class="spczone">
						<ul class="issueList">
							<li>
								<p class="img"><a href="/kor/space/condition.do?menuNo=13002"><img src="/assets/kor/images/newMain/smenu03_01.gif" alt="" /></a></p>
								<p class="txt"><a href="/kor/space/condition.do?menuNo=13002">어린이활동공간현황/시설</a></p>
							</li>
							<li>
								<p class="img"><a href="/kor/space/conditionRelief.do?menuNo=13007"><img src="/assets/kor/images/newMain/smenu03_02.gif" alt="" /></a></p>
								<p class="txt"><a href="/kor/space/conditionRelief.do?menuNo=13007">어린이활동공간 <br/>환경안심 인증현황</a></p>
							</li>
						</ul>
					</div>
					<div class="menuzone">
						<ul class="menuList">
							<li><a href="/kor/material/chemistry.do?menuNo=1300101" class="forPadding">어린이활동공간이란</a></li>
							<li><a href="/kor/space/condition.do?menuNo=13002" class="forPadding">환경안심인증제도</a></li>
							<li><a href="/kor/space/system.do?menuNo=13004" class="forPadding">어린이활동공간확인검사제도</a></li>
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000641&menuNo=13005" class="forPadding">어린이활동공간자료실</a></li>
<!-- 							<li><a href="alert('메뉴추가 필요')">어린이활동공간시설행정처분현황</a></li> -->
						</ul>
					</div>
				</div>
				</c:if>
				<c:if test="${status.index == 3}">
				<div class="inbox smenu04">
					<div class="title al">
						예방 &amp; 건강
					</div>
					<div class="spczone">
						<p class="tit tit01 al">환경보건지식<span><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000610&menuNo=14001"><img src="/assets/kor/images/newMain/smenu_morebtn.gif" alt="더보기" /></a></span></p>
						<ul class="newsList al">
							<c:if test="${fn:length(knowList) gt 0}">
								<c:forEach var="knowVO" items="${knowList}">
									<li><a href="/user/cop/bbs/selectBoardArticle.do?nttId=${knowVO.nttId}&bbsId=BBSMSTR_000000000610&menuNo=14001">${knowVO.nttSj}</a></li>
								</c:forEach>
								<c:forEach var="i" begin="1" end="${5 - fn:length(knowList)}" step="1">
									<li><a>작성된 게시물이 없습니다.</a></li>
								</c:forEach>		
							</c:if>
						</ul>
					</div>
					<div class="menuzone">
						<ul class="menuList">
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000620&menuNo=14002">환경성질환정보</a></li>
							<li><a href="/user/com/certificationList.do?menuNo=14003">환경표지인증제품</a></li>
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000621&menuNo=14004">어린이환경안전</a></li>
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000622&menuNo=14005">전문가컬럼</a></li>
						</ul>
					</div>
				</div>
				</c:if>
				<c:if test="${status.index == 4}">
				<div class="inbox smenu05">
					<div class="title">
						교육 &amp; 홍보
					</div>
					<div class="spczone">
						<ul class="issueList">
							<li>
								<p class="img"><a href="/user/com/kids/lms/lmsCourseListForUser.do?menuNo=15001"><img src="/assets/kor/images/newMain/smenu05_01.gif" alt="" /></a></p>
								<p class="txt"><a href="/user/com/kids/lms/lmsCourseListForUser.do?menuNo=15001">환경보건교육</a></p>
							</li>
							<li>
								<p class="img"><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000670&menuNo=15002"><img src="/assets/kor/images/newMain/smenu05_02.gif" alt="" /></a></p>
								<p class="txt"><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000670&menuNo=15002">환경보건 교육자료</a></p>
							</li>
						</ul>
					</div>
					<div class="menuzone">
						<ul class="menuList">
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000650&menuNo=15003">케미게임</a></li>
							<li><a href="/user/com/kids/quiz/userQuizMain.do?menuNo=15004">케미퀴즈</a></li>
							<li><a href="/user/com/kids/word/userSelectWordDicaryList.do?menuNo=15005">환경용어사전</a></li>
							<li><a href="/user/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000630&searchCl1DetailCode=BCC401&menuNo=15006">홍보자료</a></li>
						</ul>
					</div>
				</div>
				</c:if>
			</li>
			</c:if>
			</c:forEach>
		</ul>
		<div class="mainSearch">
		<!-- <form name="potalsearch" id="potalsearch" action="/kor/cm/nier-cm-1101.do" onsubmit="return goSearchData();" method="get"> -->
		<form name="searchFrm" id="searchFrm" action="/kor/guide/search.do" onsubmit="return goSearchData();" method="post">
    		<input type="hidden" name="menuNo" id="menuNo" value="18001" />
    		<label for="query" class="hidden">검색어입력</label>
        	<input type="text" name="searchWrd" id="searchWrd" placeholder="검색어를 입력해 주세요." />
        	<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />
        	<button type="submit"><img src="/assets/kor/images/bbs/bg_search.gif" alt="검색"/></button>
        </form>
        </div>
	</div>
</div>

<script type="text/javascript">
	// 검색화면으로 이동 
	function goSearchData() {
		if($('#searchWrd').val() == ''){
			alert('검색어를 입력해주세요.');
			$('#searchWrd').focus();
			return false;
		}else{
			$('input[name="searchKeyword"]').val($('#searchWrd').val());
			$('#searchFrm').attr("action","<c:url value='/kor/guide/search.do'/>");
			$('#searchFrm').submit();
			return true;
		}
	}
</script>