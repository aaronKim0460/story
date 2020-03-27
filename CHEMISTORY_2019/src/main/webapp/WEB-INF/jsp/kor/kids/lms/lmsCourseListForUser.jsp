<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
	//enter로 검색하기
	function press(event) {
		if (event.keyCode==13) {
			fn_do_login();
		}
	}
	
	// 로그인 처리
	function fn_do_login() {
		var form = $("#formLogin");
		var emailString = form.find("#memEmail").val();
		
		if (!checkType(emailString)) {
			alert("이메일 형식이 정확하지 않습니다.");
			form.find("#memEmail").focus();
			return false;
		}
		if (form.find("#memberPw").val() == null || form.find("#memberPw").val() == '') {
			alert("비밀번호를 입력해 주시기 바랍니다.");
			form.find("#memberPw").focus();
			return false;
		}
		if(emailString.length > 0){
			var targetUrl = //"<c:url value='/user/com/kids/lms/memberInformationProcess.do'/>";
			//"<c:url value='https://chemistory.go.kr:8443/user/com/kids/lms/memberInformationProcess.do'/>";
			"<c:url value='/user/com/kids/lms/memberInformationProcess.do'/>";
			
			$('#formLogin')
			.attr('method', 'post')
			.attr('action', targetUrl)
			.submit();
			
		}else{
			alert("이메일을 입력해 주시기 바랍니다.");
			form.find("#email").focus();
			return false;
		}
	}
	
	
	// 로그아웃
	function fn_do_logout() {
		var form = $("#formRefresh");
		var targetUrl = "<c:url value='/user/com/kids/lms/memberLogout.do '/>";
			$('#formRefresh')
			.attr('method', 'post')
			.attr('action', targetUrl)
			.submit();
	}	
	
	// 이메일 형식 확인
	function checkType(str) {
        var pattern = /\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/;
        return pattern.test(str) ? true : false;
	}
	
	// 차시 목록 열기 닫기
	function fn_eduView(type, n){
		var disN = null;
		if(type == 'list')		disN = $(n).parent().parent().parent().find(".eduListWrap");
		else					disN = $('.sub_contents:eq(' + n + ') button').parent().parent().parent().find(".eduListWrap");
		 
		if (disN.css("display") == "none")		disN.slideDown();
		else									disN.slideUp();
		
		disN.focus();
	}
	
	// 차시 창 띄우기
	function fn_move_study_popup(sugangId, courseId, chasiId, screenWidth, screenHeight) {
		$("#formRefresh").find("#courseId").val(courseId);
		
		var windowWidth = screenWidth;
		var windowHeight = screenHeight;
		
		var url = '<c:url value="/user/com/kids/lms/studyPopup.do" />' +'?sugangId=' + sugangId + '&courseId=' + courseId + '&chasiId=' + chasiId;
		var openParam = 'left=0,top=0,width='+windowWidth+',height='+windowHeight+',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no';
		window.open(url, "study", openParam);
	}
	
	// 평가 창 띄우기
	function fn_move_question(courseId, sugangId) {
		$("#formRefresh").find("#courseId").val(courseId);
		
		var windowWidth = 705;
		var windowHeight = 600;
		
		var url = '<c:url value="/user/com/kids/lms/questionListPopup.do" />' +'?courseId=' + courseId + "&sugangId=" + sugangId;
		var openParam = 'left=0,top=0,width='+windowWidth+',height='+windowHeight+',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no';
		
		window.open(url, "question", openParam);
	}
	
	// 평가 결과 창 띄우기
	function fn_move_question_result(courseId, sugangId) {
		$("#formRefresh").find("#courseId").val(courseId);
		
		var windowWidth = 705;
		var windowHeight = 600;
		
		var url = '<c:url value="/user/com/kids/lms/questionResultListPopup.do" />' +'?courseId=' + courseId + "&sugangId=" + sugangId;
		var openParam = 'left=0,top=0,width='+windowWidth+',height='+windowHeight+',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no';
		
		window.open(url, "questionResult", openParam);
	}
	
	// 수료 창 띄우기
	function fn_move_suryo(courseId, sugangId, memEmail) {
		$("#formRefresh").find("#courseId").val(courseId);
		
		var windowWidth = 780;
		var windowHeight = 900;
		
		var url = '<c:url value="/user/com/kids/lms/lmsCourseSuryoPopup.do" />' +'?courseId=' + courseId + "&sugangId=" + sugangId + "&userEmail=" + memEmail;
		var openParam = 'left=0,top=0,width='+windowWidth+',height='+windowHeight+',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no';
		
		window.open(url, "suryo", openParam);
	}
	
	function fn_do_next() {
		//뉴스레터 신청
		$.ajax({
			type : "post"
			, url : "/user/com/newsletterSubscriptionChk.do"
			, data : $("#nlFrm").serialize()
			, success : function(result){
				var rsCode = result.split('_')[1];
				
				if(rsCode == "00"){
					alert("이미 뉴스레터 등록이 되어 있는 이메일 입니다.");
				}else if(rsCode == "01"){
					//다음을 부정하면 진행 중지
					if(!confirm("뉴스레터 등록이 가능한 이메일 입니다.\n등록하시겠습니까?"))	return false;
					else													fn_do_refresh();
				}else{
					alert("오류가 발생했습니다. 관리자에게 문의해 주세요."); 			
				}
	 		}
			, error : function(){
				alert("오류가 발생했습니다. 관리자에게 문의해 주세요.");
				return false;
			}
		});		
	}
	
	// 페이지 새로 고침
	function fn_do_refresh() {
		
		location.reload();
		fn_eduView("list", 1);
		fn_eduView("list", 2);
		fn_eduView("list", 3);
/* tyjun 주석 처리 2010.2.7 		
 
 		$.ajax({
			type : "post"
			, url : "/user/com/newsletterSubscription.do"
			, data : $("#nlFrm").serialize()
			, success : function(result){
				if(result == "Y"){
					alert("신청이 완료되었습니다.");
				}else{
					alert("신청이 정상적으로 진행되지 않았습니다. 관리자에게 문의해 주세요.");
				}
				urlChanger();
			}
			, error : function(){
				alert("신청이 정상적으로 진행되지 않았습니다. 관리자에게 문의해 주세요.");
				return false;
			}
		});
*/	
	}
	
	$(document).ready(function(){

		var result = "${param.finalResult}";
/* 		var newsletterYn = "${param.newsletterYn}";
		var emailString = "${param.memEmail}".replace("%40", "@");
 */		
		if("correct" == result || "dataInsert" == result){
			$("#nlFrm").find("#nlEmail").val(emailString);
/* 			if(newsletterYn == "Y")		fn_do_next();
			else						urlChanger();
 */
 		}else if("incorrect" == result){
			alert("회원정보를 정확하게 입력해주시기 바랍니다.");
			urlChanger();
		}
		
		var idx = "${param.streamIdx}";
		
		if(idx.length > 0){
			fn_eduView('func', idx);
		}
		
		<c:if test="${!empty lmsCourseVO.courseId}">
			$("." + <c:out value="${lmsCourseVO.courseId}" />).slideDown();
		</c:if>
		
		var resultList = "${fn:length(resultList)}";
		
		for(var i = 0; i < resultList; i ++){
			$(".contentViewArea" + i).html($(".contentViewArea" + i).closest("div").find("input[name='courseContent" + i + "']").val());
		}
	});
	
	//page reload 없이 url 강제변경
	function urlChanger(){
		var nowUrl = location.href;
		nowUrl = nowUrl.split('?');
		var newUrl = nowUrl[0]+'?menuNo=15001';
		history.pushState('', '', newUrl);
	}
	

	// 차시 결과 저장하기
	function completeChasi(){
		var form  = $("#formAjax");
		$.ajax({
            url: "<c:url value='/user/com/kids/lms/lmsSugangCharsiResultSave.do'/>",
            data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
            type: 'POST',     
            success: function(finalResult){
            	if("insertData" == finalResult){
            		window.close();
	         	}else if("already" == finalResult){
            		opener.fn_do_refresh();
	         		window.close();
	         	}
	         	else{
        			alert("ERROR :"+ finalResult);
        			window.close();
	         	}
            },
            error : function( )
   			{
   				alert( "페이지 초기화에 실패했습니다. 조차장 증명." );
   			}
 		});

	}
		
</script>
</head>
<body>
<form id="nlFrm" name="nlFrm" method="post">
	<input type="hidden" name="subscriptionYn" value="apply"/>
	<input type="hidden" name="email" id="nlEmail"/>
</form>
<form id="formRefresh" name="formRefresh" method="post">
	<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
	<input type="hidden" name="memEmail" id="memEmail" value="<c:out value='${memEmail}'/>" />
	<input type="hidden" name="courseId" id="courseId" value="" />
</form>
<div class="conCBox" id="contents">
	<div class="health_education">
		<ul class="clearfix">
			
			<li class="firstLi">
				<h3>학습도우미</h3>
				<div class="edu_helper">
					<h4>1. 간편 인증은 어떤기능인가요?</h4>
					<p>인증을 통해 학습이력을 저장 및, 진도율, 학습평가, 수료증 출력이 가능합니다.</p>
					<h4>2. 인증을 하지 않으면 학습을 듣지 못하나요?</h4>
					<p>인증 없이도 교육을 들을 수 있습니다.<br/>다만, 인증 없이 듣게되는 학습은 <br/>진도율이 반영되지 않습니다.</p>
				</div>		
			</li>
			
			<li class="secondLi">
				<h3>학습신청 <span>간편 인증<span></h3>
				<c:choose>
					<c:when test="${empty memEmail}">
						<form id="formLogin" name="formLogin">
							<fieldset>
								<legend class="hide">로그인</legend>
								<label>이메일</label> <input type="text" id="memEmail" name="memEmail"/>
								<label>비밀번호</label> <input type="password" id="memberPw" name="memberPw" onKeyPress="press(event);" />
								<div style="font-size:11px; padding-left:84px; height:22px;"> 
									<input type="checkbox" name="newsletterYn" value="Y" style="width:auto; padding:0px; margin:0px; vertical-align:middle;" />
									뉴스레터 신청 (이메일로 받아 보실 수 있습니다.)
								</div>
								<button  type="button" onclick="fn_do_login()">인증</button>
			
								<p>이력관리를 위해서는 간편 로그인을 이용해 주세요.</p>
								<p>비밀번호 분실 시 담당자에게 문의하시기 바랍니다.</p>
							</fieldset>
							<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />
						</form>
					</c:when>
					<c:otherwise>
							<fieldset>
								<legend class="hide">로그인 인증완료</legend>
								<div class="greet">
									<strong><c:out value="${memEmail}" />님</strong> <br />안녕하세요!
									<br /><br />
									<button  type="button" onclick="fn_do_logout()">로그아웃</button>
<!-- 									<p>다른 메뉴로 이동하시면 로그인이 해제됩니다. <a href="/user/com/kids/lms/memberLogout.do">로그아웃</a></p> -->
								</div>
							</fieldset>
					</c:otherwise>
				</c:choose>
		
			</li>
	
			<c:forEach var="row" items="${resultList}" varStatus="i">
				<li class="thirdLi">
					
					<div class="sub_li">
						<div class="eduImg" id="cData${i.index}">
							<p><img src="/assets/kor/images/newMain/edu<c:out value="${row.questionCount}" />.jpg" alt="교육 화면 예시"/></p>
						</div>
						<div class="sub_contents">
								<h3><c:out value="${row.courseNm}" /></h3>
							 	<input type="hidden" name="courseContent${i.index}" value="<c:out value="${row.courseContent}" escapeXml="false" />" />
								<p class="education_contents"><span class="contentViewArea${i.index}"></span></p> 
							<c:if test="${fn:length(row.chasiList) > 0}">
								<button type="button" onclick="fn_eduView('list', this);">상세보기</button>
							</c:if>
						</div>
					</div>
					
					<c:if test="${fn:length(row.chasiList) > 0}">
						<div class="eduListWrap <c:out value="${row.courseId}"/>">
							<div class="eduListWrapDiv">
								<c:set var="totalCount" value="${fn:length(row.chasiList)}" />
								<c:set var="studyCount" value="0" />
								<c:set var="studyRate" value="0" />
								<c:choose>
									<c:when test="${!empty memEmail}">
										<c:forEach var="subRow" items="${row.chasiList}" varStatus="j">
											<c:if test="${subRow.sugangCount gt 0}">
												<c:set var="studyCount" value="${studyCount + 1}" />
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${totalCount ne 0 and studyCount ne 0}">
												<c:set var="studyRate"><fmt:formatNumber value="${(studyCount/totalCount)*100}" pattern="##.#" /></c:set>
											</c:when>
											<c:otherwise>
												<c:set var="studyRate">0</c:set>
											</c:otherwise>
										</c:choose>
										<div class="kidWrap">
											<c:choose>
												<c:when test="${studyRate ge 0 and studyRate le 25}">
													<img src="/assets/kor/images/newMain/level_01.gif" alt="진척율25%이하">
												</c:when>
												<c:when test="${studyRate gt 25 and studyRate le 50}">
													<img src="/assets/kor/images/newMain/level_02.gif" alt="진척율 25%~50%">
												</c:when>
												<c:when test="${studyRate gt 50 and studyRate le 75}">
													<img src="/assets/kor/images/newMain/level_03.gif" alt="진척율 50%~75%">
												</c:when>
												<c:when test="${studyRate gt 75}">
													<img src="/assets/kor/images/newMain/level_04.gif" alt="진척율 75%이상">
												</c:when>
											</c:choose>
										</div>
										<div class="learning_result">
											<p class="progressRate">진도율<br/><strong><c:out value="${studyRate}" /></strong>%</p>
										</div>
									</c:when>
									<c:otherwise>
										<div class="kidWrap"><img src="/assets/kor/images/newMain/level_0.gif" alt="로그인하시면 진도율이 체크됩니다."></div>
									</c:otherwise>
								</c:choose>
							</div>
							
							<table>
								<caption class="hide">학습리스트</caption>
								<thead>
									<tr>
										<th class="number">차시</th>
										<th>차시명</th>
										<c:if test="${!empty memEmail}">
											<th>최종학습일</th>
										</c:if>
										<th>학습하기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="subRow" items="${row.chasiList}" varStatus="j">
										<tr>
											<td class="number"><c:out value="${subRow.chasi}" />차시</td>
											<td class="P_left"><c:out value="${subRow.chasiNm}" /></td>
											<c:if test="${!empty memEmail}">
												<td class="ac">
													<c:choose>
														<c:when test="${empty subRow.chasiStudyDt}">-</c:when>
														<c:otherwise><c:out value="${subRow.chasiStudyDt}" /></c:otherwise>
													</c:choose>
												</td>
											</c:if>
											<td><a href="javascript:void(0);" onclick="fn_move_study_popup('<c:out value="${row.sugangId}" />', '<c:out value="${row.courseId}" />', '<c:out value="${subRow.chasiId}" />', '<c:out value="${row.screenWidth}" />', '<c:out value="${row.screenHeight}" />')">교육듣기</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<div class="evaBottomBox">
								<c:choose>
									<c:when test="${!empty memEmail}">
										<p class="eva_contents">
											<c:choose>
												<c:when test="${row.questionCount gt 0}">
													- 학습평가는 <strong>"진도율 70%이상"</strong>시 진행 가능합니다.
												</c:when>
												<c:otherwise>
													- 미취학아동은 학습평가를 하지 않습니다.
												</c:otherwise>
											</c:choose>
										</p>
										<div class="evaButtonBox">
											<c:if test="${studyRate ge 70 and row.testCount eq 0 and row.questionCount gt 0}">
												<button type="button" class="btn_evaluation" onclick="fn_move_question('<c:out value="${row.courseId}" />', '<c:out value="${row.sugangId}" />');">학습평가</button>
											</c:if>
											<c:if test="${row.testCount gt 0}">
											평가 점수 : <fmt:formatNumber value="${row.testPoint}" pattern="##.#" /> 점
												<button type="button" class="btn_evaluation" onclick="fn_move_question_result('<c:out value="${row.courseId}" />', '<c:out value="${row.sugangId}" />');">학습평가 결과보기</button>
											</c:if>
											<c:if test="${studyRate eq 100 and (row.testCount gt 0 or row.questionCount eq 0)}">
												<button type="button" class="btn_print" onclick="fn_move_suryo('<c:out value="${row.courseId}" />', '<c:out value="${row.sugangId}" />', '<c:out value="${memEmail}" />');">수료증 출력</button>
											</c:if>
										</div>
									</c:when>
									<c:otherwise>
										<p class="eva_contents">- 로그인을 하시고 학습을 하시면 수료증을 출력할 수 있습니다. </p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:if>
					
				</li>
			</c:forEach>
	
		</ul>
	</div>
</div>
</body>
</html>