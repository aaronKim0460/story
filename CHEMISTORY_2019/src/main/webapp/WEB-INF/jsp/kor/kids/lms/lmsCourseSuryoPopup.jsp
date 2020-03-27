<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/assets/kor/css/common.css" />
<link rel="stylesheet" type="text/css" href="/assets/kor/css/board.css" />
<script type="text/javascript">
	
	// 이름 입력 하기
	function fn_get_member_name() {
		var form = $("#formName");
		
		if (form.find("input[name='memberName']").val() == null || form.find("input[name='memberName']").val() == '') {
			alert("이름을 입력해 주시기 바랍니다.");
			return;
		}
		
		$.ajax({
            url: "<c:url value='/user/com/kids/lms/lmsCourseSuryoUpdate.do'/>",
            data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
            type: 'POST',     
            success: function(result){
            	if("success" == result){
   					//alert("저장되었습니다.");
            		fn_do_refresh();
	         	}else if("failure" == result){
	         		alert("작업도중 오류가 발생하였습니다. 관리자에게 문의하시기 바랍니다.");
	         	}
            }
 		});
	}
	
	// 새로 고침
	function fn_do_refresh() {
		$('#formName').submit();
	}
	
	// 오늘 날짜 표시
	function fn_set_today() {
		var today = new Date();
		
		var currentYear = today.getFullYear();
		var currentMonth = today.getMonth() + 1;
		var currentDay = today.getDate();
		
		$("#currentYear").text(currentYear);
		$("#currentMonth").text(currentMonth);
		$("#currentDay").text(currentDay);
	}
	
	$(document).ready(function(){
		$('#formName').attr("action","<c:url value='/user/com/kids/lms/lmsCourseSuryoPopup.do'/>");
		
		goprint();
		
		<c:if test="${!empty sugangResult.memberName}">
			fn_set_today();
		</c:if>
	});
	
	function goprint(){
		factory.printing.Print(true);
	}
</script>
</head>
<body>
<c:choose>
	<c:when test="${empty memberName}">
		<form id="formName" name="formName" method="post">
			<input type="hidden" name="sugangId" value="<c:out value="${lmsCourseVO.sugangId}" />" />
			<input type="hidden" name="courseId" value="<c:out value="${lmsCourseVO.courseId}" />" />
			<input type="hidden" name="userEmail" value="<c:out value="${lmsCourseVO.userEmail}" />" />
			
			<div class="foreignRecall2" style="background:url('/assets/kor/images/newMain/bg_kid.gif') right bottom no-repeat;">
				<h3 style="font-size:28px; margin:40px 0 20px 45px; color:#4d4d4d"><span style="color:#94bb09">최초 수료증에 대한 '이름'</span>을 입력해주세요.</h3>
				<p style="font-size:16px; color:#4d4d4d; margin:0 0 45px 45px; width:445px;">입력되는 이름정보는 1회성으로 활용되며, <br/>
					저장되지 않습니다.<br/><br/>
					<input type="text" name="memberName" style="border:2px solid #ccc; line-height:18px; padding:3px 0px; font-size:18px; vertical-align:middle;"/>
					<button type="button" class="btn_m_orange" style="vertical-align:middle; margin:0px;" onclick="fn_get_member_name();">입력</button>
				</p>
			</div>
		</form>
	</c:when>
	<c:otherwise>
	
	<script language="javascript">
	document.write("<object id=\"factory\" viewastext  style=\"display:none\" classid=\"clsid:1663ed61-23eb-11d2-b92f-008048fdd814\" codebase=\"http://konetic.ecoedu.go.kr/activex/smsx.cab#Version=6,3,435,20\">");
	document.write("</object>");
	</script>
	<table style="width:783px; height:1107px;">
		<tr>
			<td background="/images/old/diploma_certi.gif" style="vertical-align:top">
				<table>
					<tr>
						<td style="padding:128px 0 0 220px">
							<table style="height:20px; width:138px;">
				            	<tr>
				                	<td class="al-center Gungsuh font14"><c:out value="${sugangResult.completenum}" /></td>
				                </tr>
				            </table>
						</td>
					</tr>
					<tr>
						<td valign="top" style="padding:243px 0 0 335px; height:189px">
							<table style="width:367px;">
								<tr>
									<th><img src="/images/old/txt_name.png" alt="이름" /></th>
									<td style="height:33px; line-height:21px;" class="font18 Gungsuh"><c:out value="${memberName}" /></td>
								</tr>
								<tr>
									<th><img src="/images/old/txt_email.png" alt="이메일" /></th>
									<td style="height:33px; line-height:21px;" class="font18 Gungsuh"><c:out value="${sugangResult.userEmail}" /></td>
								</tr>
								<tr>
					            	<th style="vertical-align:top"><img src="/images/old/txt_curri.png" alt="과정명" /></th>
					                <td style="height:33px; line-height:21px;" class="font16 Gungsuh"><c:out value="${courseResult.courseNm}" /></td>
					            </tr>
					            <tr>
					            	<th><img src="/images/old/txt_perid.png" alt="교육기간" /></th>
					            	<td>
					            		<c:choose>
					            			<c:when test="${courseResult.questionCount gt 0}">
					            				<c:out value="${sugangResult.sugangAppDt}" /> ~ <c:out value="${sugangResult.testDt}" />
					            			</c:when>
					            			<c:otherwise>
					            				<c:out value="${sugangResult.sugangAppDt}" /> ~ <c:out value="${sugangResult.endDate}" />
					            			</c:otherwise>
					            		</c:choose>
					            	</td>
					            </tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="padding:232px 0 0 306px;">
							<table style="width:177px;">
								<tr>
									<td style="width:65px; height:30px; line-height:30px;" class="font16 Gungsuh al-right"><span id="currentYear"></span></td>
					                <td style="width:57px; height:30px; line-height:30px;" class="font16 Gungsuh al-right"><span id="currentMonth"></span></td>
					                <td style="width:55px; height:30px; line-height:30px;" class="font16 Gungsuh al-right"><span id="currentDay"></span></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	</c:otherwise>
</c:choose>
</body>
</html>