<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ include file="/WEB-INF/jsp/common/ComInclude2.jsp" %>
<script type="text/javascript" src="/js/jquery.form.min.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
doUpload = function(){
	
	var fileName = $("#excelData").val();
	fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
	
	if(fileName != "xls" && fileName != "xlsx"){
		alert("엑셀 파일만 등록 가능합니다(xls, xlsx)");
		$("#imagefile").val("");
		return;
	}
	
	var form = $('#formExcel');
	
	form.ajaxSubmit({
        url: "<c:url value='/adm/contents/kidsGround/insertExcelFcltyData.do'/>",
        data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.
        type: 'POST',     
        success: function(result){
        	 //$('.file').val('');                     //file input에 들어가 있는 값을 비워줍니다.
        	if("success" == result){        		
        		alert("엑셀 업로드가 성공적으로 완료 되었습니다");
        		opener.doList();
        		window.close();
        	}else if("backupFail" == result){
        		alert("기존 데이터 백업에 문제가 생겼습니다. 관리자에게 확인해 주세요");
        	}else{
        		alert("엑셀 업로드에 문제가 있습니다. 관리자에게 확인해 주세요");
        	}
        }
		});
};
</script>
<body>
<form id="formExcel" name="formExcel" method="post" enctype="multipart/form-data">
<div class="board-list">
	<table class="board-write">
   	<caption>엑셀 파일 업로드</caption>
	<colgroup>
	    <col style="width:20%" />
	    <col style="width:80%" />
	</colgroup>
		<tbody>
			<tr>
				<th class="board-write-th">엑셀파일 첨부</th>
				<td class="board-write-td">
					<input type="file" name="excelData" id="excelData" />
				</td>
			</tr>
		</tbody>
	</table>
</div>
</form>
<div class="board-detail-foot">
	<div class="btns clear fr">		
		<input type="button" onclick="doUpload(); return false;" class="btn btn-primary" value="엑셀 업로드"/>
	</div>
</div>
</body>
</html>

