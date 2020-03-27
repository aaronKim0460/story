<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
	
	// 상세화면으로 이동
	function fn_move_quiz_detail(seq) {
		if (seq == '1') {
			$('#frm').attr("action","<c:url value='/user/com/kids/quiz/quizInqire.do'/>");
		} else if (seq == '2') {
			$('#frm').attr("action","<c:url value='/user/com/kids/quiz/quizInqireWord1.do'/>");
		} else if (seq == '3') {
			$('#frm').attr("action","<c:url value='/user/com/kids/quiz/quizInqireWord2.do'/>");
		}
		$('#frm').submit();
	}
	
	$(document).ready(function(){
		
	});
</script>
</head>
<body>

<div id="contents">
	<div class="tableBtn clearfix margin_t_25">
		<form name="frm" id="frm" method="post">
			<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />	
		</form>
	</div>
	
	<div class="newsletter list">
		<ul>
			<li class="margin_left">
				<a href="javascript:void(0);" onclick="fn_move_quiz_detail('1')">
					<h3><strong>케미퀴즈</strong></h3>
					<div class="photo"><img src='<c:url value='/images/old/quiz01_list.gif' />'/></div>
					<div class="galleryBBox">
						<p style="font-size:13px; padding:14px 10px 20px; margin:0px;">환경물질에 대해서 퀴즈를 풀어보면서 재미있게 배워보자.</p>
					</div>
				</a>
			</li>
			<li class="margin_left">
				<a href="javascript:void(0);" onclick="fn_move_quiz_detail('2')">
					<h3><strong>단어찾기Ⅰ</strong></h3>
					<div class="photo"><img src='<c:url value='/images/old/quiz02_list.gif' />'/></div>
					<div class="galleryBBox">
						<p style="font-size:13px; padding:14px 10px 20px; margin:0px;">빈칸의 단어를 찾으면 가려져 있던 </br>그림조각들이 완성됩니다.</p>
					</div>
				</a>
			</li>
			<li class="margin_left">
				<a href="javascript:void(0);" onclick="fn_move_quiz_detail('3')">
					<h3><strong>단어찾기Ⅱ</strong></h3>
					<div class="photo"><img src='<c:url value='/images/old/quiz03_list.gif' />'/></div>
					<div class="galleryBBox">
						<p style="font-size:13px; padding:14px 10px 20px; margin:0px;">빈칸의 단어를 찾으면 가려져 있던 </br>그림조각들이 완성됩니다.</p>
					</div>
				</a>
			</li>
			<li class="margin_left">
				<a href="javascript:void(0);" onclick="window.open('/quiz/index.html','quiz','width=850, height=800, resizable=yes')">
					<h3><strong>가로세로 낱말맞추기Ⅰ</strong></h3>
					<div class="photo"><img src='<c:url value='/quiz/images/quiz04_list.png' />'/></div>
					<div class="galleryBBox">
						<p style="font-size:13px; padding:14px 10px 20px; margin:0px;">가로세로 낱말 조합을 환경퀴즈로  </br>풀어보세요.</p>
					</div>
				</a>
			</li>
			<li class="margin_left">
				<a href="javascript:void(0);" onclick="window.open('/quiz/index2.html','quiz','width=850, height=800, resizable=yes')">
					<h3><strong>가로세로 낱말맞추기Ⅱ</strong></h3>
					<div class="photo"><img src='<c:url value='/quiz/images/quiz05_list.png' />'/></div>
					<div class="galleryBBox">
						<p style="font-size:13px; padding:14px 10px 20px; margin:0px;">가로세로 낱말 조합을 환경퀴즈로  </br>풀어보세요.</p>
					</div>
				</a>
			</li>
		</ul>
	</div>
	
</div>
</body>
</html>