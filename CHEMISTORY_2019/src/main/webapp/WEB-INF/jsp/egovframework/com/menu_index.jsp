<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
 /**
  * @Class Name : EgovMainMenuIndex.jsp
  * @Description : MainMenuIndex Page
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *  ?vStartP=<c:out value="${result.menuNo}"/> <c:out value="${result.chkURL}"/>
  */

%>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Menu Index frame</title>
<script type="text/javascript">
// 세션 삭제 후 로그인 페이지로 이동
function fn_move_login() {
	location.href = "/systemAdmin.jsp";
};
</script>
</head>

<frameset rows="101,*" frameborder="0" >
	<frame src="<c:url value='/sym/mnu/mpm/EgovMainMenuHead.do' />" scrolling="no" name="main_top" marginwidth="0" marginheight="0">
	<frameset cols="229,*" frameborder="0">
		<frame src="<c:url value='/sym/mnu/mpm/EgovMainMenuLeft.do' />?vStartP=<c:out value="${resultVO.menuNo}" />" scrolling="no" name="main_left" marginwidth="0" marginheight="0">
		<frame src="<c:url value='/sym/mnu/mpm/EgovMainMenuRight.do' />?vStartP=<c:out value="${resultVO.menuNo}" />" name="main_right" style="padding: 30px 40px 30px 40px; border-top:1px solid #ddd;">
	</frameset>
</frameset>
</html>
