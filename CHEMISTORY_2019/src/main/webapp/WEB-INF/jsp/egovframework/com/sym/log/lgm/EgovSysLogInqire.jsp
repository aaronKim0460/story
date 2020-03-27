<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovSysLogInqire.jsp
  * @Description : 시스템 로그 정보 상세조회 화면
  * @Modification Information
  * @
  * @  수정일      수정자          수정내용
  * @  -------    --------       ---------------------------
  * @ 2009.03.11   이삼섭          최초 생성
  * @ 2011.07.08   이기하          패키지 분리, 경로수정(sym.log -> sym.log.lgm)
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.11
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="/WEB-INF/jsp/common/ComInclude.jsp" %>

<title>시스템 로그 상세보기</title>
</head>
<body>
<div class="content-body">
<div class="board-list">
	<table width="700" border="0" cellpadding="0" cellspacing="1" class="board-write" summary="웹로그를 상세보는 화면이다">
	<caption>배너/알림 등록</caption>
		<colgroup>
		    <col style="width:20%" />
		    <col style="width:80%" />
		</colgroup>
		<tbody>
			<tr>
				<th colspan="2" class="board-write-th" style="text-align: left;">
					<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;상세보기
				</th>
			</tr>
			<tr>
			   <th class="board-write-th"><label>요청ID</label></th>
			   <td class="board-write-td">
			     <c:out value="${result.requstId}"/>
			   </td>
			</tr>
			<tr>
			   <th class="board-write-th"><label>발생일자</label></th>
			   <td class="board-write-td">
			     <c:out value="${result.occrrncDe}"/>
			   </td>
			</tr>
			<tr>
			   <th class="board-write-th"><label>서비스명</label></th>
			   <td class="board-write-td">
			     <c:out value="${result.srvcNm}"/>
			   </td>
			</tr>
			<tr>
			   <th class="board-write-th"><label>메소드명</label></th>
			   <td class="board-write-td">
			     <c:out value="${result.methodNm}"/>
			   </td>
			</tr>
			<tr>
			   <th class="board-write-th"><label>처리구분</label></th>
			   <td class="board-write-td">
			     <c:out value="${result.processSeCodeNm}"/>
			   </td>
			</tr>
			<tr>
			   <th class="board-write-th"><label>처리시간</label></th>
			   <td class="board-write-td">
			     <c:out value="${result.processTime}"/>
			   </td>
			</tr>
			<tr>
			   <th class="board-write-th"><label>요청자</label></th>
			   <td class="board-write-td">
			     <c:out value="${result.rqsterNm}"/>
			   </td>
			</tr>
			<tr>
			   <th class="board-write-th"><label>요청자IP</label></th>
			   <td class="board-write-td">
			     <c:out value="${result.rqesterIp}"/>
			   </td>
			</tr>
		</tbody>
	</table>
</div>
</div>
<div class="text-center">
	<a href="javascript:void(0);" onclick="window.close(); return false;" class="btn btn-primary">닫기</a>
</div>
</body>
</html>
