<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>

<input type="hidden" name="questionId" id="questionId" value="<c:out value="${result.questionId}" />">
<input type="hidden" name="courseId" id="courseId" value="<c:out value="${result.courseId}" />"/>
<table class="bbs_default write" border="1">
	<caption>문제 등록</caption>
	<colgroup>
		<col width="20%" />
		<col width="*" />
	</colgroup>
	<tbody>
		<tr>
			<th scope="row"><label for="">문항유형</label><span title="필수입력">*</span></th>
			<td>
				<input name="questionType" type="radio" value="select4" <c:if test="${result.questionType eq 'select4'}"> checked="checked"</c:if> onclick="fn_change_view(this.value)" title="문항유형"> 4지선택 &nbsp;
				<input name="questionType" type="radio" value="ox" <c:if test="${result.questionType eq 'ox'}"> checked="checked"</c:if> onclick="fn_change_view(this.value)" title="문항유형"> O X
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="">문제번호</label><span title="필수입력">*</span></th>
			<td>
				<input name="questionNum" id="questionNum" type="text" value="<c:out value="${result.questionNum}"/>" class="input-text" title="문제번호 입력" onkeydown="return showKeyCode(event)">
				<br>
				<font color="red"><strong>※숫자로 입력해 주세요.</strong></font>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="">문제제목</label><span title="필수입력">*</span></th>
			<td>
				<input name="questionTitle" id="questionTitle" type="text" value="<c:out value="${result.questionTitle}"/>" class="input-text full" title="문제제목 입력">
			</td>
		</tr>
		
		<tr class="choice" <c:if test="${result.questionType ne 'select4'}"> style="display: none;"</c:if>>
			<th scope="row" rowspan="4"><label for="">보기</label><span title="필수입력">*</span></th>
			<td>
				<input name="item1" id="item1" type="text" value="<c:out value="${result.item1}"/>" class="input-text full" title="보기1 입력">
			</td>
		</tr>
		<tr class="choice" <c:if test="${result.questionType ne 'select4'}"> style="display: none;"</c:if>>
			<td>
				<input name="item2" id="item2" type="text" value="<c:out value="${result.item2}"/>" class="input-text full" title="보기2 입력">
			</td>
		</tr>
		<tr class="choice" <c:if test="${result.questionType ne 'select4'}"> style="display: none;"</c:if>>
			<td>
				<input name="item3" id="item3" type="text" value="<c:out value="${result.item3}"/>" class="input-text full" title="보기3 입력">
			</td>
		</tr>
		<tr class="choice" <c:if test="${result.questionType ne 'select4'}"> style="display: none;"</c:if>>
			<td>
				<input name="item4" id="item4" type="text" value="<c:out value="${result.item4}"/>" class="input-text full" title="보기4 입력">
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="">문항정답</label><span title="필수입력">*</span></th>
			<td>
				
				<select id="rightAnswer" name="rightAnswer">
					<c:choose>
						<c:when test="${result.questionType eq 'select4'}">
							<option value="1" <c:if test="${result.rightAnswer eq '1'}"> selected="selected"</c:if>>1번</option>
							<option value="2" <c:if test="${result.rightAnswer eq '2'}"> selected="selected"</c:if>>2번</option>
							<option value="3" <c:if test="${result.rightAnswer eq '3'}"> selected="selected"</c:if>>3번</option>
							<option value="4" <c:if test="${result.rightAnswer eq '4'}"> selected="selected"</c:if>>4번</option>
						</c:when>
						<c:otherwise>
							<option value="1" <c:if test="${result.rightAnswer eq '1'}"> selected="selected"</c:if>>O</option>
							<option value="2" <c:if test="${result.rightAnswer eq '2'}"> selected="selected"</c:if>>X</option>
						</c:otherwise>
					</c:choose>
				</select>
			</td>
		</tr>
	</tbody>
</table>