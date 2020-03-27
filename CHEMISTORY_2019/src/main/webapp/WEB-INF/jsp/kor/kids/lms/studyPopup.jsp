<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

	


	// 차시 결과 저장하기
	function completeChasi(){
		var form  = $("#formAjax");
		$.ajax({
            url: "<c:url value='/user/com/kids/lms/lmsSugangCharsiResultSave.do'/>",
            data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
            type: 'POST',     
/*             success: function(finalResult){
            	if("insertData" == finalResult){
					            		
	         	}else if("already" == finalResult){

	         	}
	         	else{
        			alert("ERROR :"+ finalResult);
	         	}
            },
 */
 			error : function( )
   			{
   				alert( "페이지 초기화에 실패했습니다. 조차장 증명." );
   			}
 		});

	}
	
	
	$(document).ready(function(){
	});
	
	
</script>
</head>
<body style="margin:0px;">
<form id="formAjax" name="formAjax" method="post">
	<input type="hidden" name="sugangId" value="<c:out value="${lmsCourseVO.sugangId}" />" />
	<input type="hidden" name="chasiId" value="<c:out value="${result.chasiId}" />" />
</form>
<video width="100%" height="600" id="videoMp4" controls autoplay>
      <source src="/assets/kor/images/contents/${result.startUrl}" type="video/mp4">
   </video>
   <script type="text/javascript">
      var videoToTabl,videoTime;
      var videoNum = 0;
      var timerVideo = setInterval(function(){
         videoToTabl = videoMp4.duration;
         videoTime = videoMp4.currentTime;
         if(videoTime/videoToTabl*100 > 70 && videoNum == 0){
            completeChasi();
            videoNum = 1;
         }
      },1000);
   </script>
<%-- <iframe src="${result.startUrl}" name="start_url" id="start_url" width="100%" height="${courseResult.screenHeight}"frameborder="0" title="컨텐츠" scrolling="no"/></iframe> --%>
</body>
</html>