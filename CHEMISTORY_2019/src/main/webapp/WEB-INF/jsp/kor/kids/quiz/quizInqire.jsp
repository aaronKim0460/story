<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
	var totalQuizPoint = 100;
	
	// 상세화면으로 이동
	function fn_move_list() {
		$('#frm').attr("action","<c:url value='/user/com/kids/quiz/userQuizMain.do'/>");
		$('#frm').submit();
	}
	
	// 새로 고침
	function fn_do_refresh() {
		$('#frmQuiz').attr("action","<c:url value='/user/com/kids/quiz/quizInqire.do'/>");
		$('#frmQuiz').submit();
	}
	
	// 정답 확인
	function fn_do_check_quiz(order, element) {
		var $element = jQuery(element);
		var checkedValue = $element.closest(".quizS1").find("input[name='ansewers']:checked").val();
		
		if (typeof checkedValue !== 'undefined') {
			$element.closest(".quizS1").hide();
			if (checkedValue == '1') {
				$(".quiz_o.QZ_" + order).show();
			} else {
				$(".quiz_x.QZ_" + order).show();
				var perQuizPoint = $("#perQuizPoint").val();
				totalQuizPoint = totalQuizPoint - parseInt(perQuizPoint, 10);
				
				console.log(perQuizPoint + " : " + totalQuizPoint);
				
				if (totalQuizPoint < 0) {
					totalQuizPoint = 0;
				}
			}
		} else {
			alert("답을 선택해 주시기 바랍니다.");
		}
	}
	
	//다음 문제 풀기
	function fn_move_next(order) {
		var totalQuizCount = $("#totalQuizCount").val();
		
		if (totalQuizCount != order) {
			$(".QZ_" + order).hide();
			$(".quizS1.QZ_" + (parseInt(order, 10) + 1)).show();
		} else {
			$(".QZ_" + order).hide();
			$("#lastPoint").text(totalQuizPoint);
			$(".quiz_end").show();
		}
		
	}
	
	$(document).ready(function(){
		
	});
</script>
</head>
<body>

<form name="frm" id="frm" method="post">
	<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo eq null ? param.menuNo : menuManageVO.menuNo}'/>" />	
</form>

<div id="contents">
	<form name="frmQuiz" id="frmQuiz" method="post">
		<table class="bbs_default view" summary="퀴즈 상세보기로, 퀴즈 풀기 정보 제공" border="0">
		<input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo eq null ? param.menuNo : menuManageVO.menuNo}'/>" />
			<caption>퀴즈 내용</caption>
			<colgroup>
				<col width="20%" />
				<col width="30%" />
				<col width="20%" />
				<col width="30%" />
			</colgroup>
			<tbody>
				<tr>
					<td colspan="4">
						<div class="quizBox">
							<div class="quizBoxTop">
								<img src="/assets/kor/images/newMain/quiz_top.png" alt="케미퀴즈" />
							</div>
							<div class="quizContentBox">
								<c:choose>
									<c:when test="${empty qzCategoryVO.categoryKey}">
										<div class="quizStart">
											<p>카테고리를 선택하여 원하는 퀴즈를 풀어보세요.</p>
											<select name="categoryKey">
												<c:forEach var="row" items="${categoryList}" varStatus="i">
													<c:if test="${row.categoryKey < 9}"><!-- 9, 10번 카테고리는 DB에 아직 문제가 없음 -->
														<option value="<c:out value="${row.categoryKey}" />" <c:if test="${i.count eq 1}"> selected="selected"</c:if>><c:out value="${row.name}" /></option>
													</c:if>
												</c:forEach>
											</select>
											<div class="quizButtonBox">
												<button type="button" class="quizButton01" onclick="fn_do_refresh()">선택</button>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${fn:length(resultList) gt 0}">
												<input type="hidden" id="totalQuizCount" value="<c:out value="${fn:length(resultList)}" />" />
												<fmt:formatNumber var="perPoint" value="${100/fn:length(resultList)}" pattern="##.#" />
												<input type="hidden" id="perQuizPoint" value="<c:out value="${perPoint}" />" />
												<c:forEach var="row" items="${resultList}" varStatus="i">
													<div class="quizS1 QZ_<c:out value="${i.count}" />" <c:if test="${i.count ne 1}"> style="display: none;"</c:if>>
														<p><c:out value="${i.count}" />. <c:out value="${row.question}" /></p>
														<ul>
															<c:forEach var="subRow" items="${row.itemList}" varStatus="j">
																<li>
																	<label>
																		<input type="checkbox" name="ansewers" value="<c:out value="${subRow.isAnswer}" />" />
																		<c:choose>
																			<c:when test="${j.count eq 1}">①</c:when>
																			<c:when test="${j.count eq 2}">②</c:when>
																			<c:when test="${j.count eq 3}">③</c:when>
																			<c:when test="${j.count eq 4}">④</c:when>
																		</c:choose>
																		<c:out value="${subRow.contents}" />
																	</label>
																</li>
															</c:forEach>
														</ul>
														<div class="quizButtonBox ac">
															<c:if test="${fn:length(row.comments) > 0}">   
																<c:choose>
																	<c:when test="${fn:startsWith(row.comments, '/common/edu') and fn:indexOf(row.comments, 'flash') >= 0}">
																		<a href="<c:url value="${row.comments}" />" class="quizButton02" onclick="window.open(this.href, '', 'width=567, height=460, scrollbars=no'); return false;" onkeypress="window.open(this.href, '', 'width=567, height=460, scrollbars=yes'); return false;"><img src="/assets/kor/images/newMain/icon_hint.png" alt="" style="width:20px;" /> 힌트</a>
																	</c:when>
																	<c:when test="${fn:startsWith(row.comments, '/common/edu') and fn:indexOf(row.comments, 'flash') < 0}">
																		<a href="<c:url value="${row.comments}" />" class="quizButton02" onclick="window.open(this.href, '', 'width=567, height=708, scrollbars=no'); return false;" onkeypress="window.open(this.href, '', 'width=567, height=708, scrollbars=yes'); return false;"><img src="/assets/kor/images/newMain/icon_hint.png" alt="" style="width:20px;" /> 힌트</a>
																	</c:when>
																	<c:when test="${fn:startsWith(row.comments, '/common/webtoon')}">
																		<a href="<c:url value="${row.comments}" />" class="quizButton02" onclick="window.open(this.href, '', 'width=510, height=768, scrollbars=no'); return false;" onkeypress="window.open(this.href, '', 'width=510, height=768, scrollbars=yes'); return false;"><img src="/assets/kor/images/newMain/icon_hint.png" alt="" style="width:20px;" /> 힌트</a>
																	</c:when>
																	<c:otherwise>
																		<button type="button" class="quizButton02"><img src="/assets/kor/images/newMain/icon_hint.png" alt="" style="width:20px;" /> 힌트</button>
																	</c:otherwise>
																</c:choose>
															</c:if>															
															<button type="button" class="quizButton01" onclick="fn_do_check_quiz('<c:out value="${i.count}" />', this)">다음</button>
														</div>
													</div>
													<div class="quiz_o QZ_<c:out value="${i.count}" />" style="display:none;">
														<p class="ac"><img src="/assets/kor/images/newMain/quiz_o.png" alt="정답입니다." /></p>
														<div class="quizButtonBox ac">
															<button type="button" class="quizButton01" onclick="fn_move_next('<c:out value="${i.count}" />')">다음</button>
														</div>
													</div>
													<div class="quiz_x QZ_<c:out value="${i.count}" />" style="display:none;">
														<p class="ac">
															<img src="/assets/kor/images/newMain/quiz_x.png" alt="X" />
															오답입니다. 정답은
														</p>
														<div class="quizText">
															<c:forEach var="subRow" items="${row.itemList}" varStatus="j">
																<c:if test="${subRow.isAnswer eq 1}">
																	<c:out value="${j.count}" />번 <c:out value="${subRow.contents}" />
																</c:if>
															</c:forEach>
														</div>
														<div class="quizButtonBox ac">
															<button type="button" class="quizButton01" onclick="fn_move_next('<c:out value="${i.count}" />')">다음</button>
														</div>
													</div>
												</c:forEach>
												<div class="quiz_end"  style="display:none;">
													<p class="ac">
														수고하셨습니다.<br/>총 점수는 <strong><span id="lastPoint"></span></strong>점 입니다.
													</p>
													<select name="categoryKey">
														<c:forEach var="row" items="${categoryList}" varStatus="i">
															<option value="<c:out value="${row.categoryKey}" />" <c:if test="${row.categoryKey eq qzCategoryVO.categoryKey}"> selected="selected"</c:if>><c:out value="${row.name}" /></option>
														</c:forEach>
													</select>
													<div class="quizButtonBox ac">
														<button type="button" class="quizButton01" onclick="fn_do_refresh()">선택</button>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="quiz_end">
													<p class="ac">
														준비된 문제가 없습니다. 다른 카테고리를 선택해 주세요.
													</p>
													<select name="categoryKey">
														<c:forEach var="row" items="${categoryList}" varStatus="i">
															<option value="<c:out value="${row.categoryKey}" />" <c:if test="${row.categoryKey eq qzCategoryVO.categoryKey}"> selected="selected"</c:if>><c:out value="${row.name}" /></option>
														</c:forEach>
													</select>
													<div class="quizButtonBox ac">
														<button type="button" class="quizButton01" onclick="fn_do_refresh()">선택</button>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="quizBoxBottom">
								<img src="/assets/kor/images/newMain/quiz_bottom.png" alt="케미퀴즈" />
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<div class="buttonBox ac">
	<a href="javascript:fn_move_list()" class="btn gray">목록</a>
</div>
</body>
</html>