<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/old/center.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/old/default.css" media="screen" />
<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	// 4지선다형 선택
	function fn_select_check(element, num) {
		var $element = jQuery(element);
		$element.closest("dl").find("img").attr("src", "/images/old/img_nocheck.gif");
		$element.attr("src", "/images/old/img_check.gif");
		$element.closest("dl").find("input[name='choiceQuestions']").val(num);
	}
	
	// ox 선택
	function fn_ox_check(element, num) {
		var $element = jQuery(element);
		if (num == 1) {
			$element.closest("dl").find("#oImg").attr("src", "/images/old/img_O.gif");
			$element.closest("dl").find("#xImg").attr("src", "/images/old/noimg_X.gif");
		} else {
			$element.closest("dl").find("#oImg").attr("src", "/images/old/noimg_O.gif");
			$element.closest("dl").find("#xImg").attr("src", "/images/old/img_X.gif");
		}
		$element.closest("dl").find("input[name='choiceQuestions']").val(num);
	}
	
	// 제출하기
	function fn_finish_question() {
		var form = $("#frm");
		
		var checkBoolean = true;
		
		form.find("input[name='choiceQuestions']").each(function(index) {
			if (this.value == null || this.value == '') {
				var currentIndex = index + 1;
				alert(currentIndex + "번째 문제를 선택해 주세요.");
				checkBoolean = false;
				return false;
			}
		});
		if (checkBoolean) {
			if (confirm("제출하시겠습니까?")) {
				$.ajax({
		            url: "<c:url value='/user/com/kids/lms/questionResultSave.do'/>",
		            data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
		            type: 'POST',     
		            success: function(result){
		            	if("success" == result){
		   					alert("제출되었습니다.");
		   					location.href = '<c:url value="/user/com/kids/lms/questionResultListPopup.do" />' + '?courseId=${param.courseId}&sugangId=${param.sugangId}';
		            		window.opener.fn_do_refresh();
// 		            		self.close();
			         	}else if("failure" == result){
			         		alert("작업도중 오류가 발생하였습니다. 관리자에게 문의하시기 바랍니다.");
			         	}
		            }
		 		});
			}
		}
	}
	
	
	$(document).ready(function(){
	});
</script>
</head>
<body>
<div class="center_area">
	<div class="qu" style="display:;">
		<ul>
			<li class="top_title"><img src="/images/old/img_top.png" alt="학습평가" border="0" usemap="#Map001" />
			<map name="Map001" id="Map001"><area shape="rect" coords="643,8,682,45" href="javascript:self.close();"  title="닫기"/></map></li>
			<li class="quize">
				<div class="pd">
					<p class="tx"><span><c:out value="${courseResult.courseNm}" /> 과정 학습평가입니다.</span><br />학습평가 제출 후에 수료증을 출력하실 수 있습니다.</p>
					<form method="post" name="frm" id="frm">
					<input type="hidden" name="sugangId" value="${lmsCourseVO.sugangId}" />
					<input type="hidden" name="courseId" value="${courseResult.courseId}" />	        		        
					<c:forEach var="row" items="${resultList}" varStatus="i">
						<c:choose>
							<c:when test="${row.questionType eq 'select4'}">
								<div class="quize_check">
									<ul>
										<li class="quustion"><span><c:out value="${row.questionNum}" />.</span><c:out value="${row.questionTitle}" /></li>
										<li class="quustion_answer">
											<dl>
												<dd><img src="/images/old/img_nocheck.gif" onclick="fn_select_check(this, '1')" style="cursor:pointer;" />1. <c:out value="${row.item1}" /></dd>
												<dd><img src="/images/old/img_nocheck.gif" onclick="fn_select_check(this, '2')" style="cursor:pointer;" />2. <c:out value="${row.item2}" /></dd>
												<dd><img src="/images/old/img_nocheck.gif" onclick="fn_select_check(this, '3')" style="cursor:pointer;" />3. <c:out value="${row.item3}" /></dd>
												<dd><img src="/images/old/img_nocheck.gif" onclick="fn_select_check(this, '4')" style="cursor:pointer;" />4. <c:out value="${row.item4}" /></dd>
												<input type="hidden" name="questionIds" value="<c:out value="${row.questionId}" />" />
												<input type="hidden" name="choiceQuestions" value="" />
											</dl>
										</li>
									</ul>
								</div>
							</c:when>
							<c:otherwise>
								<div class="quize_ox">
									<ul>
										<li class="quustion"><span><c:out value="${row.questionNum}" />.</span><c:out value="${row.questionTitle}" /></li>
										<li class="quustion_answer">
											<dl>
												<dd><img src="/images/old/noimg_O.gif" id="oImg" onclick="fn_ox_check(this, '1')" style="cursor:pointer;" /></dd>
		                      					<dd><img src="/images/old/noimg_X.gif" id="xImg" onclick="fn_ox_check(this, '2')" style="cursor:pointer;" /></dd>
		                      					<input type="hidden" name="questionIds" value="<c:out value="${row.questionId}" />" />
		                      					<input type="hidden" name="choiceQuestions" value="" />
											</dl>
										</li>
									</ul>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<div class="btn_qu">
						<p><img src="/images/old/btn_submit.gif" id="submitBtn" style="cursor: pointer;" alt="제출하기" onclick="fn_finish_question();" /></p>
					</div>
				</div>
			</li>
			<li class="bottom"><img src="/images/old/img_bottom.png" alt="" /></li>
		</ul>
	</div>
</div>
</body>
</html>