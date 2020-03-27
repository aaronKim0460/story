<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/old/center.css" media="screen" />
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
            url: "<c:url value='/user/com/kids/quiz/quizInqireWord2Check.do'/>",
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
					img = document.getElementById("pz2_0"+(i+1));						
					img.src = resultArray[i];
				}
				document.frm.answer[1].focus();
			} else if (answerNum == 1) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					img = document.getElementById("pz2_1"+(i+2));
					img.src = resultArray[i];
				}
				document.frm.answer[2].focus();
			} else if (answerNum == 2) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz2_2"+(i+4));
					img.src = resultArray[i];
				}
				document.frm.answer[3].focus();
			} else if (answerNum == 3) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz2_3"+(i+2));
					img.src = resultArray[i];
				}
				document.frm.answer[4].focus();
			} else if (answerNum == 4) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz2_4"+(i+3));
					img.src = resultArray[i];
				}
				document.frm.answer[5].focus();
			} else if (answerNum == 5) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz2_5"+(i+1));
					img.src = resultArray[i];
				}
				document.frm.answer[6].focus();
			} else if (answerNum == 6) {
				alert("정답입니다.\n다음 문제를 풀어주세요.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz2_6"+(i+4));
					img.src = resultArray[i];
				}
				document.frm.answer[7].focus();
			} else if (answerNum == 7) {
				alert("정답입니다.");
				for(i = 0 ; i < resultArray.length ; i++){
					
					img = document.getElementById("pz2_7"+(i+2));
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
							<li><img src="/images/old/puzzle/pz2_01.jpg" alt="" title="" name="pz2_01" id="pz2_01"/></li>
							<li><img src="/images/old/puzzle/pz2_02.jpg" alt="" title="" name="pz2_02" id="pz2_02"/></li>
							<li><img src="/images/old/puzzle/pz2_03.jpg" alt="" title="" name="pz2_03" id="pz2_03"/></li>
							<li><img src="/images/old/puzzle/pz2_04.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_05.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_06.jpg" alt="" title="" /></li>												
							<li><img src="/images/old/puzzle/pz2_11.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_12.jpg" alt="" title="" name="pz2_12" id="pz2_12"/></li>
							<li><img src="/images/old/puzzle/pz2_13.jpg" alt="" title="" name="pz2_13" id="pz2_13"/></li>
							<li><img src="/images/old/puzzle/pz2_14.jpg" alt="" title="" name="pz2_14" id="pz2_14"/></li>
							<li><img src="/images/old/puzzle/pz2_15.jpg" alt="" title="" name="pz2_15" id="pz2_15"/></li>
							<li><img src="/images/old/puzzle/pz2_16.jpg" alt="" title="" name="pz2_16" id="pz2_16"/></li>
							<li><img src="/images/old/puzzle/pz2_21.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_22.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_23.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_24.jpg" alt="" title="" name="pz2_24" id="pz2_24"/></li>
							<li><img src="/images/old/puzzle/pz2_25.jpg" alt="" title="" name="pz2_25" id="pz2_25"/></li>
							<li><img src="/images/old/puzzle/pz2_26.jpg" alt="" title="" /></li>												
							<li><img src="/images/old/puzzle/pz2_31.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_32.jpg" alt="" title="" name="pz2_32" id="pz2_32"/></li>
							<li><img src="/images/old/puzzle/pz2_33.jpg" alt="" title="" name="pz2_33" id="pz2_33"/></li>
							<li><img src="/images/old/puzzle/pz2_34.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_35.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_36.jpg" alt="" title="" /></li>												
							<li><img src="/images/old/puzzle/pz2_41.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_42.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_43.jpg" alt="" title="" name="pz2_43" id="pz2_43"/></li>
							<li><img src="/images/old/puzzle/pz2_44.jpg" alt="" title="" name="pz2_44" id="pz2_44"/></li>
							<li><img src="/images/old/puzzle/pz2_45.jpg" alt="" title="" name="pz2_45" id="pz2_45"/></li>
							<li><img src="/images/old/puzzle/pz2_46.jpg" alt="" title="" /></li>												
							<li><img src="/images/old/puzzle/pz2_51.jpg" alt="" title="" name="pz2_51" id="pz2_51"/></li>
							<li><img src="/images/old/puzzle/pz2_52.jpg" alt="" title="" name="pz2_52" id="pz2_52"/></li>
							<li><img src="/images/old/puzzle/pz2_53.jpg" alt="" title="" name="pz2_53" id="pz2_53"/></li>
							<li><img src="/images/old/puzzle/pz2_54.jpg" alt="" title="" name="pz2_54" id="pz2_54"/></li>
							<li><img src="/images/old/puzzle/pz2_55.jpg" alt="" title="" name="pz2_55" id="pz2_55"/></li>
							<li><img src="/images/old/puzzle/pz2_56.jpg" alt="" title="" /></li>												
							<li><img src="/images/old/puzzle/pz2_61.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_62.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_63.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_64.jpg" alt="" title="" name="pz2_64" id="pz2_64"/></li>
							<li><img src="/images/old/puzzle/pz2_65.jpg" alt="" title="" name="pz2_65" id="pz2_65"/></li>
							<li><img src="/images/old/puzzle/pz2_66.jpg" alt="" title="" name="pz2_66" id="pz2_66"/></li>
							<li><img src="/images/old/puzzle/pz2_71.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_72.jpg" alt="" title="" name="pz2_72" id="pz2_72"/></li>
							<li><img src="/images/old/puzzle/pz2_73.jpg" alt="" title="" name="pz2_73" id="pz2_73"/></li>
							<li><img src="/images/old/puzzle/pz2_74.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_75.jpg" alt="" title="" /></li>
							<li><img src="/images/old/puzzle/pz2_76.jpg" alt="" title="" /></li>												
						</ul>
						<div class="quiz_list">
							<h4>아래의 질문을 보고 단어를 맞춰주세요.</h4>
							<ul>
								<li>
											<p class="question">① 음식을 썩지 않게 하기 위해 넣는 것은 무엇일까요?</p>
											<p class="descript"><a href="/csu/kid/quiz/popup/pz2_popup01.html" onclick="window.open(this.href, '', 'width=482, height=338, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=338, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p>
											<p class="answer">	
														<img src="/images/old/text.gif" alt="정답" />
														<input type="text" name="answer" id="answer" value="" />
														<img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(0);" style="cursor:hand;" alt="입력" />
											</p>
								</li>
								<li>
											<p class="question">② 새로 지어진 집이나 건물에서 나오는 몸에 좋지 않은 화학물질로 두통, 기침, 가려움증이 생기는 것을 무엇이라고 할까요?</p>
											<p class="descript"><a href="/csu/kid/quiz/popup/pz2_popup02.html" onclick="window.open(this.href, '', 'width=482, height=342, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=342, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p>
											<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /> </label><img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(1);" style="cursor:hand;" alt="입력" /> 											</p>
								</li>
								<li>
											<p class="question">③ 빨래를 할 때 사용하지만 물을 오염시킬 수 있는 것은 무엇일까요? </p>
											<p class="descript"><a href="/csu/kid/quiz/popup/pz2_popup03.html" onclick="window.open(this.href, '', 'width=482, height=359, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=359, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p>
											<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /> </label><img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(2);" style="cursor:hand;" alt="입력" /> </p>
								</li>
								<li>
											<p class="question">④ 형광등에 들어 있는 성분 중 하나로 이 것때문에 형광등은 사용한 뒤 깨뜨리지 말고 버려야 합니다. 어떤 물질일까요? </p>
											<p class="descript"><a href="/csu/kid/quiz/popup/pz2_popup04.html" onclick="window.open(this.href, '', 'width=482, height=261, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=261, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p>
											<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /> </label><img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(3);" style="cursor:hand;" alt="입력" /> 											</p>
								</li>
								<li>
											<p class="question">⑤ 공기 중에 여러 오염 물질들이 모여있어 안개처럼 보이는 것을 무엇이라고 할까요? </p>
											<p class="descript"><a href="/csu/kid/quiz/popup/pz2_popup05.html" onclick="window.open(this.href, '', 'width=482, height=339, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=339, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p>
											<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /> </label><img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(4);" style="cursor:hand;" alt="입력" /> 											</p>
								</li>
								<li>
											<p class="question">⑥ 몸 속에서 몸에 좋은 호르몬을 없애고 안 좋은 영향을 끼치는 나쁜 호르몬을 무엇이라고 할까요? </p>
											<p class="descript"><a href="/csu/kid/quiz/popup/pz2_popup06.html" onclick="window.open(this.href, '', 'width=482, height=358, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=358, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p>
											<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /> </label><img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(5);" style="cursor:hand;" alt="입력" /> 											</p>
								</li>
								<li>
											<p class="question">⑦ 농약이나 비료 등 화학물질을 사용하지 않고 몸에 좋은 친환경적인 방법으로 만들어진 농산물을 무슨 농산물이라고 할까요?  </p>
											<p class="descript"><a href="/csu/kid/quiz/popup/pz2_popup07.html" onclick="window.open(this.href, '', 'width=482, height=358, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=358, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p>
											<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /> </label><img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(6);" style="cursor:hand;" alt="입력" /> 											</p>
								</li>
								<li>
											<p class="question">⑧ 표백제에 들어있는 물질 중 하나로 눈에 들어가면 위험한 것은 무엇일까요? </p>
											<p class="descript"><a href="/csu/kid/quiz/popup/pz2_popup08.html" onclick="window.open(this.href, '', 'width=482, height=358, scrollbars=yes'); return false;" onkeypress="window.open(this.href, '', 'width=482, height=358, scrollbars=yes'); return false;"><img src="/images/old/quiz_bt.gif" alt="설명문보기" /></a></p>
											<p class="answer"><label for="answer"><img src="/images/old/text.gif" alt="정답" /><input type="text" name="answer" id="answer" value="" /> </label><img src="/images/old/quiz_bt01.gif" onclick="javascript:answerCheck(7);" style="cursor:hand;" alt="입력" /> 											</p>
									</li>
								</ul>
							<%/* %><p class="complete"><input type="button" value="완료" name="submitBtn" id="submitBtn" style="cursor:hand;" onclick="javascript:puzzleSubmit();" /></p><% */ %>
						</div><!-- end quiz_list -->
					</div><!-- end box_quiz -->
					</form>
				</div><!-- end chemiquiz3 -->
			</div><!-- end word_quiz -->
		</div><!-- end chemi_quiz_area -->
	</div><!-- end chemibox -->
</div><!-- end content -->
<div class="buttonBox ac">
	<a href="javascript:fn_move_list()" class="btn gray">목록</a>
</div>
</body>
</html>