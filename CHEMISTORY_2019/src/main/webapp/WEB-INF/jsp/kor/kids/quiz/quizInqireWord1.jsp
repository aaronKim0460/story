<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/old/center.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/old/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/old/default_event.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/old/kid.css" media="screen" />
<script type="text/javascript">
	var answerNum;
	// 목록화면으로 이동
	function fn_move_list() {
		$('#frmList').attr("action","<c:url value='/user/com/kids/quiz/userQuizMain.do'/>");
		$('#frmList').submit();
	}

	// 정답 확인
	function answerCheck(val){
		var form = $("#frmCheck");
		var answer = $("#frm").find("input[name=answer]:eq(" + val + ")").val();
		
		form.find("input[name='answerChoice']").val(val);
		form.find("input[name='answer']").val(answer);
		answerNum = val;
		
		$.ajax({
            url: "<c:url value='/user/com/kids/quiz/quizInqireWord1Check.do'/>",
            data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
            type: 'POST',     
            success: function(result){
            	if("failure" == result){
	         		alert("작업도중 오류가 발생하였습니다. 관리자에게 문의하시기 바랍니다.");
	         	} else {
	         		answerResponse(result);
	         	}
            }
 		});
	}
	
	// 정답 확인 결과 보기
	function answerResponse(result) {
		var resultArray = result.split("^||^");
		
		if (resultArray.length > 0 && resultArray[0] != '') {
			if(answerNum == 0) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					img = document.getElementById("pz1_0"+(i+1));						
					img.src = resultArray[i];
				}
				document.frm.answer[1].focus();
			} else if (answerNum == 1) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					img = document.getElementById("pz1_1"+(i+1));
					img.src = resultArray[i];
				}
				document.frm.answer[2].focus();
			} else if (answerNum == 2) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz1_2"+(i+2));
					img.src = resultArray[i];
				}
				document.frm.answer[3].focus();
			} else if (answerNum == 3) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz1_3"+(i+4));
					img.src = resultArray[i];
				}
				document.frm.answer[4].focus();
			} else if (answerNum == 4) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz1_4"+(i+2));
					img.src = resultArray[i];
				}
				document.frm.answer[5].focus();
			} else if (answerNum == 5) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz1_5"+(i+3));
					img.src = resultArray[i];
				}
				document.frm.answer[6].focus();
			} else if (answerNum == 6) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz1_6"+(i+2));
					img.src = resultArray[i];
				}
				document.frm.answer[7].focus();
			} else if (answerNum == 7) {
				alert("정답입니다.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz1_7"+(i+1));
					img.src = resultArray[i];
				}
			}
		} else {
			alert("정답이 아닙니다. 다시 풀어주세요.");
			document.frm.answer[answerNum].value="";
			document.frm.answer[answerNum].focus();
		}
	}

	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<form name="frmList" id="frmList" method="post">
	<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" />	
</form>

<form name="frmCheck" id="frmCheck" method="post">
	<input type="hidden" name="answerChoice" id="answerChoice" value="" />	
	<input type="hidden" name="answer" id="answer" value="" />	
</form>

<div id="content">
	<div class="chemibox">
		<div class="chemi_quiz_area">
			<div class="quiz_title">
				<h3><img src="/images/old/title_0103.gif" alt="케미퀴즈" /></h3>	
				<div class="location">
					<span class="home">Home</span> &gt; <span>어린이교실</span> &gt; <span class="current">케미퀴즈</span>
				</div><!-- end location -->
			</div><!-- end quiz_title -->
			<div class="word_quiz">
				<div class="chemiquiz2">
					<form name="frm" id="frm" method="post">
					<input type="hidden" name="puzzleNum" value="2" />
					<div class="box_quiz">
						<h4 style="line-height:20%;"><img src="/images/old/top.jpg" alt="네모 상자 뒤에는 어떤 그림이 숨어 있을까요?" title="네모 상자 뒤에는 어떤 그림이 숨어 있을까요?" /></h4>
						<ul class="picture">
							<li><img src="/images/old/puzzle/pz1_01.jpg" alt="" title="" name="pz1_01" id="pz1_01"/></li>
							<li><img src="/images/old/puzzle/pz1_02.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_03.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_04.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_05.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_06.jpg" alt="" title="" /></li>												
							<li><img src="/images/old/puzzle/pz1_11.jpg" alt="" title="" name="pz1_11" id="pz1_11"/></li>
							<li><img src="/images/old/puzzle/pz1_12.jpg" alt="" title="" name="pz1_12" id="pz1_12"/></li>
							<li><img src="/images/old/puzzle/pz1_13.jpg" alt="" title="" name="pz1_13" id="pz1_13"/></li>
							<li><img src="/images/old/puzzle/pz1_14.jpg" alt="" title="" name="pz1_14" id="pz1_14"/></li>
							<li><img src="/images/old/puzzle/pz1_15.jpg" alt="" title="" name="pz1_15" id="pz1_15"/></li>
							<li><img src="/images/old/puzzle/pz1_16.jpg" alt="" title="" /></li>												
							<li><img src="/images/old/puzzle/pz1_21.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_22.jpg" alt="" title="" name="pz1_22" id="pz1_22"/></li>
							<li><img src="/images/old/puzzle/pz1_23.jpg" alt="" title="" name="pz1_23" id="pz1_23"/></li>
							<li><img src="/images/old/puzzle/pz1_24.jpg" alt="" title="" name="pz1_24" id="pz1_24"/></li>
							<li><img src="/images/old/puzzle/pz1_25.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_26.jpg" alt="" title="" /></li>												
							<li><img src="/images/old/puzzle/pz1_31.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_32.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_33.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_34.jpg" alt="" title="" name="pz1_34" id="pz1_34"/></li>
							<li><img src="/images/old/puzzle/pz1_35.jpg" alt="" title="" name="pz1_35" id="pz1_35"/></li>
							<li><img src="/images/old/puzzle/pz1_36.jpg" alt="" title="" name="pz1_36" id="pz1_36"/></li>												
							<li><img src="/images/old/puzzle/pz1_41.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_42.jpg" alt="" title="" name="pz1_42" id="pz1_42"/></li>
							<li><img src="/images/old/puzzle/pz1_43.jpg" alt="" title="" name="pz1_43" id="pz1_43"/></li>
							<li><img src="/images/old/puzzle/pz1_44.jpg" alt="" title="" name="pz1_44" id="pz1_44"/></li>
							<li><img src="/images/old/puzzle/pz1_45.jpg" alt="" title="" name="pz1_45" id="pz1_45"/></li>
							<li><img src="/images/old/puzzle/pz1_46.jpg" alt="" title="" name="pz1_46" id="pz1_46"/></li>												
							<li><img src="/images/old/puzzle/pz1_51.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_52.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_53.jpg" alt="" title="" name="pz1_53" id="pz1_53"/></li>
							<li><img src="/images/old/puzzle/pz1_54.jpg" alt="" title="" name="pz1_54" id="pz1_54"/></li>
							<li><img src="/images/old/puzzle/pz1_55.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_56.jpg" alt="" title="" /></li>												
							<li><img src="/images/old/puzzle/pz1_61.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz1_62.jpg" alt="" title="" name="pz1_62" id="pz1_62"/></li>
							<li><img src="/images/old/puzzle/pz1_63.jpg" alt="" title="" name="pz1_63" id="pz1_63"/></li>
							<li><img src="/images/old/puzzle/pz1_64.jpg" alt="" title="" name="pz1_64" id="pz1_64"/></li>
							<li><img src="/images/old/puzzle/pz1_65.jpg" alt="" title="" name="pz1_65" id="pz1_65"/></li>
							<li><img src="/images/old/puzzle/pz1_66.jpg" alt="" title="" /></li>												
							<li><img src="/images/old/puzzle/pz1_71.jpg" alt="" title="" name="pz1_71" id="pz1_71"/></li>
							<li><img src="/images/old/puzzle/pz1_72.jpg" alt="" title="" name="pz1_72" id="pz1_72"/></li>
							<li><img src="/images/old/puzzle/pz1_73.jpg" alt="" title="" name="pz1_73" id="pz1_73"/></li>
							<li><img src="/images/old/puzzle/pz1_74.jpg" alt="" title="" name="pz1_74" id="pz1_74"/></li>
							<li><img src="/images/old/puzzle/pz1_75.jpg" alt="" title="" name="pz1_75" id="pz1_75"/></li>
							<li><img src="/images/old/puzzle/pz1_76.jpg" alt="" title="" name="pz1_76" id="pz1_76"/></li>	
						</ul>
						<div class="quiz_list">
							<h4>아래의 질문을 보고 단어를 맞춰주세요.</h4>
							<ul>
								<li>
									<p class="question">① 나무를 태워서 만드는 것으로 집안에 있는 안 좋은 물질을 없애는데 도움을 주는 이것은 무엇일까요?</p>
									<p class="descript"><a href="/csu/kid/quiz/popup/pz1_popup01.html" onclick="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p> 
									<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /></label> <img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(0);" style="cursor:hand;" alt="입력" /></p>
								</li>
								<li>
									<p class="question">② 과자나 음료수를 더 맛있게 보이도록 넣는 물질로 빨간색, 파란색 등의 색을 띠고 있는 것은 무엇일까요?</p>
									<p class="descript"><a href="/csu/kid/quiz/popup/pz1_popup02.html" onclick="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p> 
									<p class="answer"><label for="answer2"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /></label> <img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(1);" style="cursor:hand;" alt="입력" /></p>
								</li>
								<li>
									<p class="question">③ 페인트나 접착제를 오래 시간 사용하면 머리가 아프거나 어지러울 수 있는데 무엇 때문일까요?</p>
									<p class="descript"><a href="/csu/kid/quiz/popup/pz1_popup03.html" onclick="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p> 
									<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /></label> <img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(2);" style="cursor:hand;" alt="입력" /></p>
								</li>
								<li>
									<p class="question">④ 아토피를 생기게도 하며 집안 먼지, 이불, 쇼파 등에 사는 눈에 보이지 않는 아주 작은 이것은 무엇일까요?</p>
									<p class="descript"><a href="/csu/kid/quiz/popup/pz1_popup04.html" onclick="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p> 
									<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /></label> <img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(3);" style="cursor:hand;" alt="입력" /></p>
								</li>
								<li>
									<p class="question">⑤ 플라스틱을 부드럽게 하기 위해 넣지만 몸에는 좋지 않은 물질은 무엇일까요?</p>
									<p class="descript"><a href="/csu/kid/quiz/popup/pz1_popup05.html" onclick="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p> 
									<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /></label> <img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(4);" style="cursor:hand;" alt="입력" /></p>
								</li>
								<li>
									<p class="question">⑥ 벌레가 과일을 먹지 못하도록 뿌리지만 사람의 몸에도 좋지 않은 물질은 무엇일까요?</p>
									<p class="descript"><a href="/csu/kid/quiz/popup/pz1_popup06.html" onclick="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p> 
									<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /></label> <img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(5);" style="cursor:hand;" alt="입력" /></p>
								</li>
								<li>
									<p class="question">⑦ 불이 나지 않도록 도와주는 물질이지만 사람의 몸 속에 들어가면 좋지 않은 물질은 무엇일까요? </p>
									<p class="descript"><a href="/csu/kid/quiz/popup/pz1_popup07.html" onclick="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p> 
									<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /></label> <img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(6);" style="cursor:hand;" alt="입력" /></p>
								</li>
								<li>
									<p class="question">⑧ 모기나 벌레를 잡는데 도움을 주지만 너무 많이 사용하면 건강에 좋지 않은 물질은 무엇일까요?</p>
									<p class="descript"><a href="/csu/kid/quiz/popup/pz1_popup08.html" onclick="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=322, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p> 
									<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /></label> <img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(7);" style="cursor:hand;" alt="입력" /></p>
								</li>
							</ul>
						</div><!-- end quiz_list -->
					</div><!-- end box_quiz -->
					</form>
				</div><!-- end chemiquiz2 -->
			</div><!-- end word_quiz -->
		</div><!-- end chemi_quiz_area -->
	</div><!-- end chemibox -->
</div><!-- end content -->
<div class="buttonBox ac">
	<a href="javascript:fn_move_list()" class="btn gray">목록</a>
</div>
</body>
</html>