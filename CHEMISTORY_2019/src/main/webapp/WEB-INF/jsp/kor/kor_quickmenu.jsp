<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--//quickmenu-->
<div class="quickmenu" id="m_quickmenu">
	<div class="tit">바로가기</div>
        <ul class="quickList">
            <li class="quick01"><a href="/EgovMovePage.do?menuNo=14001">민원신청</a></li>
            <li class="quick02"><a href="/EgovMovePage.do?menuNo=14007">법정민원</a></li>
            <li class="quick03"><a href="/cop/com/selectNierUserList.do?moveSite=KOR&menuNo=11009">직원검색</a></li>
            <li class="quick06"><a href="/EgovMovePage.do?menuNo=11008">찾아오시는길</a></li>
        </ul>
    <div class="goTop"><a href="javascript:qScrollTop();">TOP</a></div>
</div>
<!--//quickmenu-->
<script type="text/javascript">
    /* ScollTop Event Function */
    var qScrollTop = function(){
        $('html, body').animate({scrollTop:0}, 'fast');
    };
</script>
<script type="text/javascript" src="/js/quickmenu.js"></script>