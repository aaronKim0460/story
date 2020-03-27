<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--footer -->
<div class="footLayout">
	<div class="footLayoutIn">
		<div class="logo"><a href="http://www.me.go.kr" target="_blank"><img alt="환경부" src="/assets/kor/images/newMain/logo_footer.png"></a></div>
        <ul>
<!--         	<li><a href="kor/guide/agreement.do?menuNo=18004">이용약관</a></li> -->
<!--             <li><a href="/kor/guide/privacy.do?menuNo=18005"><font color="blue">개인정보처리방침</font></a></li> -->
            <li><a href="/kor/guide/copyright.do?menuNo=18006">저작권 정책</a></li>
            <li><a href="/kor/guide/collection.do?menuNo=18007">이메일 무단수집거부</a></li>
        </ul>
        <div class="dropdownbox relsite_01">
			<a class="selected" hidefocus="" href="javascript:footerS()">환경부 소속산하기관</a>
			<p id="sitelayer">	
               	<span>어린이관련 사이트</span>
				<a hidefocus="" href="http://www.keep.go.kr/portal/index.act" target="_blank">눈높이 환경교실</a>
                   <a hidefocus="" href="http://healthychild.org/main/" target="_blank">Healthy Child Healthy World</a>
                   <span>화학물질정보 찾기</span>
                   <a hidefocus="" href="http://kreachportal.me.go.kr " target="_blank">환경부 화학물질정보처리시스템</a>
                   <a hidefocus="" href="http://ncis.nier.go.kr" target="_blank">화학물질정보시스템</a>
                   <span>환경보건센터</span>
                   <a hidefocus="" href="http://www.taean.go.kr/oil.do" target="_blank">태안환경보건센터</a>
                   <a hidefocus="" href="http://www.atopycenter.co.kr/" target="_blank">아토피 피부염: 서울삼성병원</a>
                   <a hidefocus="" href="http://www.atopyfree.org/" target="_blank">천식: 고려대 안암병원 환경보건센터</a>
                   <a hidefocus="" href="http://www.adhdcenter.go.kr/index.php" target="_blank">소아발달장애: 단국대학교 의료원</a>
                   <a hidefocus="" href="http://www.allergycenter.go.kr/" target="_blank">알레르기 질환: 인하대학교 부속병원</a>
                   <a hidefocus="" href="http://www.e-safejeju.or.kr/" target="_blank">아토피, 알레르기 비염:  제주대 의과학 연구소</a>
                   <a hidefocus="" href="http://www.krcard.org/index.php" target="_blank">부산대학교, 석면 중피종 환경보건센터</a>
                   <a hidefocus="" href="http://www.childcancer-environment.co.kr/" target="_blank">화순전남대병원 환경보건센터</a>
                   <a hidefocus="" href="http://www.ulsanatopy.org/" target="_blank">울산대병원 환경보건센터</a>
                   <a hidefocus="" href="http://www.radonkorea.com/radonkorea.asp" target="_blank">연세대학교 자연방사능 환경보건센터</a>
                   <span>건강, 질병관련 사이트</span>
                   <a hidefocus="" href="http://www.cdc.go.kr/CDC/main.jsp" target="_blank">질병관리본부</a>
                   <a hidefocus="" href="http://www.kaaf.org/" target="_blank">(사)한국천식알레르기협회</a>
                   <a hidefocus="" href="http://atopyinfocenter.co.kr/" target="_blank">서울시 아토피, 천식 교육정보센터</a>
                   <span>매체관련 사이트</span>
                   <a hidefocus="" href="http://water.nier.go.kr/" target="_blank">물환경정보시스템</a>
                   <a hidefocus="" href="http://airemiss.nier.go.kr/" target="_blank">대기오염물질 배출량</a>
                   <a hidefocus="" href="http://www.airkorea.or.kr/" target="_blank">대기오염도실시간공개</a>
                   <a hidefocus="" href="http://envhealth.nier.go.kr/" target="_blank">환경보건포털</a>
                   <a hidefocus="" href="http://iaqinfo.nier.go.kr/" target="_blank">생활환경정보센터</a>
			</p>
		</div><!--//dropdownbox-->
        <div class="address">
        	<p>(우)30103 세종특별자치시 도움6로 11 정부세종청사 6동 <br/>
        	홈페이지 총괄 안내 : <span>044-201-6758</span> / 시스템 운영 문의 : <span>02-2284-1173</span></p>
            <p>Copyright Ministry of Environment All Rights Reserved.</p>
            <span>* 본 홈페이지에 게시된 이메일주소를 자동으로 수집하는 것을 거부하며, 이를 위반시 관련법에 의거 처벌됨을 유념하시기 바랍니다.</span>
        </div>
	</div>
</div>
<script type="text/javascript">
	function footerS(){
		var footerH = $("#sitelayer").css("display");
		if(footerH == "none"){
			$("#sitelayer").show();
		}else{
			$("#sitelayer").hide();
		}
	}
</script>
<%
if(!"localhost".equals(request.getServerName())){
%>
<!-- AceCounter Log Gathering Script V.7.5.AMZ2017020801 -->
<script language='javascript'>
	var _AceGID=(function(){var Inf=['gtp12.acecounter.com','8080','AM1A38129554191','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
	var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src=(location.protocol.indexOf('http')==0?location.protocol:'http:')+'//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();
</script>
<noscript><img src='http://gtp12.acecounter.com:8080/?uid=AM1A38129554191&je=n&' border='0' width='0' height='0' alt=''></noscript>	
<!-- AceCounter Log Gathering Script End -->

<%
}
%>