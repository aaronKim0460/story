<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<%-- <%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp" %> --%>

<script type="text/javascript">	
	function fn_change(type){			
		//이메일 체크
		if (!checkType($("#" + type).val())) {
			alert("이메일 형식이 정확하지 않습니다.");
			form.find("#apply").focus();			
			return false;
		}else if(checkType($("#" + type).val())){
			var $subScript = $('#frm #subscriptionYn');
			var str = "";
			var rsMsg = "";
			var rsStatus = "";
			
			$subScript.val(type);
			$('#frm #email').val($('#frm #' + type).val());
			
			if($subScript.val().length > 0){
				$.ajax({
					type : "post"
					, url : "/user/com/newsletterSubscriptionChk.do"
					, data : $('#frm').serialize()
					, success : function(result){
						var rsType = result.split('_')[0];
						var rsCode = result.split('_')[1];
						if(rsType == "apply"){
							if(rsCode == "00")			alert("이미 등록되어 있는 이메일 입니다.");
							else if(rsCode == "01")		rsMsg = "등록이 가능한 이메일 입니다.\n등록하시겠습니까?";
							else 						alert("오류가 발생했습니다. 관리자에게 문의해 주세요.");
						}else if(rsType == "drop"){
							if(rsCode == "02")			alert("등록된 이메일 정보가 아닙니다.");
							else if(rsCode == "03")		rsMsg = "등록된 이메일 정보를\n삭제하시겠습니까?";
							else 						alert("오류가 발생했습니다. 관리자에게 문의해 주세요.");
						}
						if(rsMsg.length > 0){
						 	if(confirm(rsMsg)){
						 		$.ajax({
					 			type : "post"
					 				, url : "/user/com/newsletterSubscription.do"
					 				, data : $('#frm').serialize()
					 				, success : function(result){
					 					if($subScript.val() == "apply")			str = "신청이";
					 					else if($subScript.val() == "drop")		str = "취소가";
					 					if(result == "Y")						alert(str + " 완료되었습니다.");
					 					else									alert(str + " 정상적으로 진행되지 않았습니다. 관리자에게 문의해 주세요.");
					 				}
					 				, error : function(){
					 					alert(str + " 정상적으로 진행되지 않았습니다. 관리자에게 문의해 주세요.");
					 				}
						 		});
						 	}					 		
						}
	 					$('#frm #' + $subScript.val()).val('');
					}
					, error : function(){
	 					alert("오류가 발생했습니다. 관리자에게 문의해 주세요.");
	 				}
				});
			}
			
		}else{
			alert("이메일 주소를 입력해 주세요.");
			return false;
		}
	}
	
	//이메일 형식 확인
	function checkType(str) {
	    var pattern = /\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/;
	    return pattern.test(str) ? true : false;
	}
</script>

<form name="frm" id="frm" method="post">
	<div id="contents">	
		<input type="hidden" name="subscriptionYn" id="subscriptionYn"/>
		<input type="hidden" name="email" id="email"/>
	 
		<div class="newsLetterW">
			<div class="newsWrap">
				<div class="imgWrap">
					<p><img src="/assets/kor/images/newMain/newsLetterImg.gif" alt="뉴스레터 이미지"/></p>
				</div>
				<div class="contents">
					<div class="formWrap01">
						<h3><span>뉴스레터</span> 신청</h3>
						<input type="text" id="apply" />
						<button type="button" onclick="fn_change('apply');">등록</button>
						<p class="listStyle">케미스토리에서 진행되는 뉴스레터를 구독하고 싶으시다면 이메일을 등록해주세요.</p>
					</div>
						<div class="formWrap02">
						<h3><span>뉴스레터</span> 신청 취소</h3>
						<input type="text" id="drop" />
						<button type="button" onclick="fn_change('drop');">삭제</button>
						<p class="listStyle">뉴스레터 이메일을 삭제하고 싶으시면 등록된 이메일 정보를 입력해주세요.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>