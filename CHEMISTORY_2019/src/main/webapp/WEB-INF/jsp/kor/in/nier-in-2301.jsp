<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
<!--
	function eventReset(doc){
		doc.oncontextmenu      = null;
		doc.onselectstart      = null;
		doc.ondragstart        = null;
		doc.onkeydown          = null;
		doc.onmousedown        = null;
		doc.body.oncontextmenu = null;
		doc.body.onselectstart = null;
		doc.body.ondragstart   = null;
		doc.body.onkeydown     = null; 
		doc.body.onmousedown   = null;
	}
	function adminEventFree(win) {
		if ('USER' == 'USER') return;
		eventReset (win.document);
		if (win.frames.length > 0 ) {
			for (var i=0; i<win.frames.length; i++) {
				try {
					adminEventFree (win.frames[i].window);
				} catch(e) {}
			}
		}
	}	
	function click() { 
		if ((event.ctrlKey) && (event.keyCode == 67 )) { 
			alert('복사 단축키는 사용하실 수 없습니다.'); 
		} 
	}
	// Exhibt the stroking the key sequence 'Ctrl+C';
	document.onkeydown=click; 
	// Exhibit the clicking right button of mouse.
	document.oncontextmenu = function anonymous() { alert('마우스 오른쪽 버튼 사용을 제한하고 있습니다!'); return false } ;
	document.onselectstart = function anonymous() { return false } ;
//-->
</script>
<div id = "contents">
	
  <div class="cts15301">
	
		<div class="t1">안녕하십니까?</div>
        <div class="t2">어린이 환경과 건강포털장 박진원입니다. <br /><span>어린이 환경과 건강포털 홈페이지를 찾아 주셔서 감사합니다.</span></div>
        <div class="t3">어린이 환경과 건강포털은 1978년 ‘국립환경연구소’로 출범한 이래<br />국내 유일의 종합환경연구기관으로서 <span>국민이 행복한 환경복지</span>를<br />구현하기 위해 <span>기후·대기, 물, 자원·에너지, 생활환경, 토양</span> 등<br />다양한 환경연구를 수행하고 있습니다.</div>
        <p>우리나라 환경제도와 정책 수립을 지원하고 환경현안 해결과 미래 환경연구를 선도하기 위해 많은 노력을 <br />
      기울여왔으며 앞으로도 다음과 같은 내용에 역점을 두어 추진하고자 합니다.</p>
        <ul class="t4">
			<li><span>첫째</span> 국민이 쾌적하고 안전한 환경에서 살 수 있고 국가환경정책을 효율적으로 지원할 수 있도록 선제적이고<br />사전예방적인 연구를 추진하는 데 온 힘을 기울여 나가겠습니다.</li>
            <li><span>둘째</span> 그동안 축적된 경험과 자료를 상호 공유하는 공동 연구와 매체간 통합연구의 활성화로 국민과 국가,<br />나아가 후대를 위한 실효성 있는 연구결과가 나올 수 있도록 더욱 노력하겠습니다.</li>
            <li><span>셋째</span> 세계 일류 환경연구기관으로 발돋움할 수 있도록 연구자 개개인의 전문성과 역량을 강화하고 조직을<br /> 혁신해 나갈 것입니다.</li>
		</ul>
		<p>앞으로도 어린이 환경과 건강포털은 국민행복을 완성하는 환경복지를 구현하기 위해 최선을 다하겠습니다.</p>
        <p>아낌없는 성원과 격려 부탁드립니다. <br />감사합니다.              </p>
        <p class="t_right"><img src="/assets/kor/images/contents/img_sign.gif" alt="어린이 환경과 건강포털장 박진원" /></p>
		
  </div>
</div>


