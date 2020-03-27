<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/jsp/eng/eng_include.jsp" %>

<script type="text/javascript">

	$(document).ready(function(){
		
		$(".eng_sitemap > ul > li").eq(1).addClass("mid");
		$(".eng_sitemap > ul > li").eq(3).addClass("line2");
		$(".eng_sitemap > ul > li").eq(4).addClass("line2");
		$(".eng_sitemap > ul > li").eq(4).addClass("mid");
		$(".eng_sitemap > ul > li").eq(5).addClass("line2");
		
	});
	
</script>
	<div class="sitemap clearfix">
    	<div class="depth">
            <h2 class="h0">About NIER</h2>
            <ul>
                <li><a href="/eng/in/nren-in-0101.do?menuNo=71001">Message from the President</a></li>
                <li><a href="/eng/in/nren-in-0201.do?menuNo=71002">History</a></li>
                <li><a href="/eng/in/nren-in-0301.do?menuNo=71003">Vision</a></li>
                <li><a href="/eng/in/nren-in-0401.do?menuNo=71004">Strategy</a></li>
                <li><a href="/eng/in/nren-in-0501.do?menuNo=71005">Organization</a></li>
                <li><a href="/eng/in/nren-in-0601.do?menuNo=71006">Manpower</a></li>
                <li><a href="/eng/in/nren-in-0701.do?menuNo=71007">Budget</a></li>
                <li><a href="/eng/in/nren-in-0801.do?menuNo=71008">Research Equipment</a></li>
                <li><a href="/cop/com/selectNierUserList.do?moveSite=ENG&menuNo=71009">STAFF SEARCH</a></li>
                <li><a href="/eng/in/nren-in-1001.do?menuNo=71010">Location</a></li>
            </ul>
        </div>
        <div class="depth">
            <h2 class="h0">Research Field</h2>
            <ul>
                <li><a href="/eng/rf/nren-rf-0101.do?menuNo=72000">Environmental Health</a></li>
                <li><a href="/eng/rf/nren-rf-0201.do?menuNo=72002">Climate & Air Quality</a></li>
                <li><a href="/eng/rf/nren-rf-0301.do?menuNo=72003">Water Environment</a></li>
                <li><a href="/eng/rf/nren-rf-0401.do?menuNo=72004">Environmental Resources</a></li>
                <li><a href="/eng/rf/nren-rf-0501.do?menuNo=72005">Environmental Infrastructure</a></li>
                <li><a href="/eng/rf/nren-rf-0801.do?menuNo=72008">Four Major River</a></li>
                <li><a href="/eng/rf/nren-rf-0601.do?menuNo=72006">Transportation Pollution</a></li>
                <li><a href="/eng/rf/nren-rf-0701.do?menuNo=72007">Wetland Environment</a></li>
            </ul>
        </div>
        <div class="depth">
            <h2 class="h0">International Cooperation</h2>
            <ul>
                <li><a href="/cop/bbs/selectNoLoginBoardList.do?bbsId=BBSMSTR_000000000125&menuNo=73000">International Cooperation</a></li>
            </ul>
        </div>
        <div class="depth">
            <h2 class="h0">Research Achievement</h2>
            <ul>
                <li><a href="/cop/bbs/selectNoLoginBoardList.do?bbsId=BBSMSTR_000000000123&menuNo=74000">Research Activities</a></li>
                <li><a href="/cop/bbs/selectNoLoginBoardList.do?bbsId=BBSMSTR_000000000124&menuNo=74002">News&amp;Events</a></li>
            </ul>
        </div>
        <div class="depth">
            <h2 class="h0">Publication</h2>
            <ul>
                <li><a href="/cop/bbs/selectNoLoginBoardList.do?bbsId=BBSMSTR_000000000121&menuNo=75000">Research Papers</a></li>
                <li><a href="/cop/bbs/selectNoLoginBoardList.do?bbsId=BBSMSTR_000000000122&menuNo=75002">Booklets</a></li>
            </ul>
        </div>
    </div>
	<!--div class="eng_sitemap">
		<ul>
			<c:forEach var="result1" items="${list_menulist}" varStatus="status">
			
			<c:if test="${result1.menuOrdr == 1 }">
			<li>
				<strong>${result1.menuNm}</strong>
				<ul>
					<c:forEach var="result2" items="${list_menulist}" varStatus="status2">
						<c:if test="${result1.menuNo == result2.upperMenuId }">
							<li><a href="<c:url value="/EgovMovePage.do" />?menuNo=${result2.menuNo}" target="_top"><c:out value='${result2.menuNm }'/></a></li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
			</c:if>
			</c:forEach>
		</ul>
	</div-->
