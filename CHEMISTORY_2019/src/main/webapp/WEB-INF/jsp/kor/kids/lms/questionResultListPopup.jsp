<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/old/center.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/old/default.css" media="screen" />
<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
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
					<p class="tx"><span><c:out value="${courseResult.courseNm}" /> 과정 학습평가 결과 입니다.</span><br />모든 차시를 들은 후 수료증을 출력하실 수 있습니다.</p>
					<form method="post" name="frm" id="frm">
					<c:forEach var="row" items="${resultList}" varStatus="i">
						<c:choose>
							<c:when test="${row.questionType eq 'select4'}">
								<div class="quize_check">
									<ul>
										<li class="quustion"><span><c:out value="${row.questionNum}" />.</span><c:out value="${row.questionTitle}" /></li>
										<li class="quustion_answer">
											<dl>
												<dd><img src="<c:choose><c:when test="${row.rightAnswer eq 1}">/images/old/img_check.gif</c:when><c:otherwise>/images/old/img_nocheck.gif</c:otherwise></c:choose>" style="cursor:pointer;" />1. <c:out value="${row.item1}" /></dd>
												<dd><img src="<c:choose><c:when test="${row.rightAnswer eq 2}">/images/old/img_check.gif</c:when><c:otherwise>/images/old/img_nocheck.gif</c:otherwise></c:choose>" style="cursor:pointer;" />2. <c:out value="${row.item2}" /></dd>
												<dd><img src="<c:choose><c:when test="${row.rightAnswer eq 3}">/images/old/img_check.gif</c:when><c:otherwise>/images/old/img_nocheck.gif</c:otherwise></c:choose>" style="cursor:pointer;" />3. <c:out value="${row.item3}" /></dd>
												<dd><img src="<c:choose><c:when test="${row.rightAnswer eq 4}">/images/old/img_check.gif</c:when><c:otherwise>/images/old/img_nocheck.gif</c:otherwise></c:choose>" style="cursor:pointer;" />4. <c:out value="${row.item4}" /></dd>
											</dl>
										</li>
									</ul>
									<c:choose>
										<c:when test="${row.rightAnswer eq row.choiceQuestion}">
											<p class="an"><img src="/images/old/btn_O.png" alt="정답" /></p>
										</c:when>
										<c:otherwise>
											<p class="an"><img src="/images/old/btn_X.png" alt="오답" /></p>
										</c:otherwise>
									</c:choose>
								</div>
							</c:when>
							<c:otherwise>
								<div class="quize_ox">
									<ul>
										<li class="quustion"><span><c:out value="${row.questionNum}" />.</span><c:out value="${row.questionTitle}" /></li>
										<li class="quustion_answer">
											<dl>
												<dd><img src="<c:choose><c:when test="${row.rightAnswer eq 1}">/images/old/img_O.gif</c:when><c:otherwise>/images/old/noimg_O.gif</c:otherwise></c:choose>"  style="cursor:pointer;" /></dd>
		                      					<dd><img src="<c:choose><c:when test="${row.rightAnswer eq 1}">/images/old/img_X.gif</c:when><c:otherwise>/images/old/noimg_X.gif</c:otherwise></c:choose>"  style="cursor:pointer;" /></dd>
											</dl>
										</li>
									</ul>
									<c:choose>
										<c:when test="${row.rightAnswer eq row.choiceQuestion}">
											<p class="an"><img src="/images/old/btn_O.png" alt="정답" /></p>
										</c:when>
										<c:otherwise>
											<p class="an"><img src="/images/old/btn_X.png" alt="오답" /></p>
										</c:otherwise>
									</c:choose>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<div class="btn_qu">
						<p><a href="javascript:self.close();" title="닫기"><img src="/images/old/btn_close.gif" alt="닫기" /></a></p>
					</div>
				</div>
			</li>
			<li class="bottom"><img src="/images/old/img_bottom.png" alt="" /></li>
		</ul>
	</div>
</div>
</body>
</html>