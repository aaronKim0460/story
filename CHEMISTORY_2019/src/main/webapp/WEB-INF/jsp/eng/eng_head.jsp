<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- AceCounter Log Gathering Script V.7.5.2013010701 -->
<script language='javascript'>
	var _AceGID=(function(){var Inf=['gtp4.acecounter.com','8080','AM1A37961553563','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
	var _AceCounter=(function(){var G=_AceGID;if(G.o!=0){var _A=G.val[G.o-1];var _G=( _A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];	var _U=( _A[5]).replace(/\,/g,'_');var _S=((['<scr','ipt','type="text/javascr','ipt"></scr','ipt>']).join('')).replace('tt','t src="'+location.protocol+ '//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime())+'" t');document.writeln(_S); return _S;} })();
</script>
<noscript><img src='http://gtp4.acecounter.com:8080/?uid=AM1A37961553563&je=n&' border=0 width=0 height=0 alt="Ace Counter" /></noscript>	
<!-- AceCounter Log Gathering Script End --> 

<div id="header">
<div class="gnb-area">
	<div class="top_section">

		<h1 class="logo"><a href="/eng/index.do"><img src="/images/cms/eng/logo_nier.gif" alt="Natlonal institute of environmental research" /></a></h1>

		<div class="language">
			<a href="/eng/index.do" class="eng">ENG</a>
			<a href="/kor/index.do" target="_blank" title="새창" class="kor">KOR</a>
			
		</div>
		
		<div class="top-right">
			<a href="/eng/index.do" class="home">HOME</a>
            <a href="/eng/et/nren-et-0101.do?menuNo=76001" class="sitemap">SITEMAP</a>
		</div>
	</div>

	<div id="gnb">
		<ul class="gnb">
			<c:set var="topMenuCnt" value="0"/> <!--  최상위 메뉴의 Count ETC는 탑메뉴에서 제외하기 위해서 변수 선언-->
			
			<c:forEach var="result1" items="${list_headmenu}" varStatus="status" >
			<c:if test="${result1.menuOrdr == 1 && topMenuCnt < 5}"><!--  최상위 메뉴의 Count ETC(6번)는 탑메뉴에서 제외하기 위해서 -->
			<c:set var="topMenuCnt" value="${topMenuCnt+1 }"/> <!--  최상위 메뉴의 Count ETC는 탑메뉴에서 제외하기 위해서 변수 선언 후 +1  -->
				<li class="menu<c:out value='${topMenuCnt }'/>">
					<a href="<c:url value="/EgovMovePage.do" />?menuNo=<c:out value='${result1.menuNo}'/>"><c:out value='${result1.menuNm }'/></a>
					<ul>	
						<c:forEach var="result" items="${list_headmenu}" varStatus="status">
							<c:if test="${result.upperMenuId == result1.menuNo}">
							<li><a href="javascript:movePage('<c:url value="/EgovMovePage.do" />?menuNo=<c:out value='${result.menuNo}'/>');" target="_self"><c:out value="${result.menuNm}"/></a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</c:if>
			</c:forEach>
			
		</ul> 
	</div>
</div>
<div class="bg_subnav"></div>
</div>

