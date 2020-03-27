<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
</script>

<div id="contents">
	<table class="bbs_default list">
		<colgroup>
			<col style="width:30%" />
	    	<col style="width:70%" />			
		</colgroup>
		<tbody id="body_list" class="t_center list">			
			<tr>
				<th class="board-write-th">시설명</th>
				<td class="board-write-td"><c:out value="${detail.fcltyNm}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">주소</th>
				<td class="board-write-td"><c:out value="${detail.locplc}"/></td>
			</tr>			
			<tr>
				<th class="board-write-th">설치일자</th>
				<td class="board-write-td"><c:out value="${detail.instlDt}"/></td>
			</tr>
			<tr>
				<th class="board-write-th">시설유형</th>
				<td class="board-write-td">					
					<c:choose>
						<c:when test="${detail.fcltyTy eq 'FTC001'}">어린이놀이시설</c:when>
						<c:when test="${detail.fcltyTy eq 'FTC002'}">어린이집</c:when>
						<c:when test="${detail.fcltyTy eq 'FTC003'}">유치원</c:when>
						<c:when test="${detail.fcltyTy eq 'FTC004'}">특수학교</c:when>
						<c:when test="${detail.fcltyTy eq 'FTC005'}">초등학교</c:when>
						<c:when test="${detail.fcltyTy eq 'FTC006'}">초등학교 도서관</c:when>
					</c:choose>
				</td>
			</tr>
			
			<tr>
				<td class="board-write-td" colspan="2">
					<span style="font-weight: bold;">어린이 활동공간 환경안심인증</span><br/>
					● 인증번호 &nbsp; : &nbsp; <c:out value="${detail.crtfcNo}"/> <br/>
					● 인증기간 &nbsp; : &nbsp; <c:out value="${detail.crtfcBgnde}"/> ~ <c:out value="${detail.crtfcEndde}"/>
				</td>
				
			</tr>			
		</tbody>
	</table>
</div>
