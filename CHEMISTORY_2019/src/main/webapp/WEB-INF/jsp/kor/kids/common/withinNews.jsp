<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp" %>

<script type="text/javascript">

$(document).ready(function(){
});
</script>

<form name="frm" id="frm" method="post">
<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />

<div id="contents">		
	<iframe src="http://www.konetic.or.kr/main/etc/weweb/20080121/list2.asp" name="news_frame" id="news_frame" width="100%" height="660" 
					frameborder="0" allowtransparency="true" title="환경뉴스 목록" scrolling="yes" /></iframe>
</div><!-- //contents -->
</form>