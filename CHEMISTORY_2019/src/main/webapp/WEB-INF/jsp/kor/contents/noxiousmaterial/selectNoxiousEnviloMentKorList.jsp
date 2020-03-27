<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">	
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">

$(document).ready(function(){
	var mainIndex = "${param.envId}";
	var num = 0;
	
	if(mainIndex.length > 0){
		num = Number(mainIndex.substring(mainIndex.length - 2, mainIndex.length)) - 1;
		doListData(mainIndex, num, '${paginationInfo.currentPageNo}');
	}else{
		doListData('ENV_0000001','0', '${paginationInfo.currentPageNo}');
	}
});

doListData = function(envid, indexN, moveType){
	if(moveType == '1')	$('#frm #pageIndex').val('1');//새 탭 선택하면 page 초기화
	
	$("#envId").val(envid);
	
	urlChanger(envid);
	
	var marginN = [0,-40,-110,-193,-282,-370,-452,-498,-535,-624,-692]; 
	$(".imgList ul li").removeClass("on");
	$(".imgList ul li").eq(indexN).addClass("on");
	$(".textList ul li").removeClass("on");
	$(".textList ul li").eq(indexN).addClass("on");
	$(".imgList ul").animate({"margin-left":marginN[indexN]},600,"easeOutCirc");
	
	$.ajax({
		type: "POST"
		,data:$("#frm").serialize()
		,url: "<c:url value='/kor/contents/noxiousmaterial/selectNoxiousEnviloMentKorListData.do'/>"		
		,success: function(result){             
            $("#conData").html(result);
            $("#conData").show();          
            $('.left_wrap .img_wrap img').attr('src', '/assets/kor/images/newMain/che_'+envid.split('_')[1]+'.jpg');
        }
	});
};

doDetailPopUp = function(idx){	
	$("#idx").val(idx);
	
	var newPop = document.frm;
	var url = "<c:url value='/kor/contents/noxiousmaterial/detailNoxiousMaterialKor.do?idx='/>" + $("#idx").val();
	 
	var status = "width=600, height=650, top=30, left=60";
	window.open(url,"detailForm",status);
	
// 	newPop.action =url; 
// 	newPop.method="post";
// 	newPop.target="detailForm";
// 	newPop.submit();
};

doGobbs = function(bbsid,code,menuno,idx){
	$('#frm').append('<input type="hidden" name="menuNo" value="' + menuno + '" />');
	
	document.frm.bbsId.value = bbsid;
	document.frm.idx.value = idx;
	document.frm.searchCl1DetailCode.value = code;
	var nttId = "";
	
	$.ajax({
		type: "POST"
		,data:$("#frm").serialize()
		,url: "<c:url value='/kor/contents/noxiousmaterial/selectNttid.do'/>"		
		,success: function(result){			
			nttId =  result;
			
			if(nttId == "" || nttId == null){
				if(code == "BCC601"){
					alert("웹툰에 해당 유해인자가 없습니다");
				}else if(code == "BCC602"){
					alert("스토리북에 해당 유해인자가 없습니다");
				}else if(code == "BCC603"){
					alert("영상에 해당 유해인자가 없습니다");
				}
				
				return;
			}else{
				document.frm.nttId.value = nttId;
// 				document.frm.target = "_black";
				document.frm.action = "<c:url value='/user/cop/bbs/selectBoardArticle.do'/>";
				document.frm.submit();
			}
        }
	});
};

function linkPage(pageNo){
    $('#frm #pageIndex').val(pageNo);
    $('#frm').append('<input type="hidden" name="menuNo" value="12003" />');
    document.frm.action = "<c:url value='/kor/material/living.do'/>";
    document.frm.submit();
};

//page reload 없이 url 강제변경
function urlChanger(envid){
	var nowUrl = location.href;
	nowUrl = nowUrl.split('?');
	var newUrl = nowUrl[0]+'?menuNo=12003&envId='+envid;
	history.pushState('', '', newUrl);
}

</script>

<div id="contents">

<div class="health_event">
	<div class="imgList">
		<ul>
			<c:forEach var="list" items="${elist}" varStatus="i">
			<li><a href="javascript:doListData('${list.envId}','${i.index}', '1');"><img src="/assets/kor/images/newMain/che_${i.index}.jpg" alt="" /></a></li>
			</c:forEach>
		</ul>
	</div>
	<div class="textList">
		<ul>
			<c:forEach var="list" items="${elist}" varStatus="i">
			<li><a href="javascript:doListData('${list.envId}','${i.index}', '1');"><c:out value="${list.envName}"/></a></li>
			</c:forEach>
		</ul>
	</div>




<p style=" font-size:12px;text-align:right; margin-bottom:30px; line-height:160%;"><span style="font-size:12px; text-alilgn:right; padding-left:10px; color:#FE8636; font-weight:bold">· CAS 등록번호란?</span><strong>-C</strong>hemical <strong>A</strong>bstract <strong>S</strong>ervice는 현재까지 알려진 모든 화합물, 중합체 등을 기록하는 번호 <br/>예)비스페놀A : 1980-05-07
</p>	
	<form name="frm" id="frm" method="post">
		<input type="hidden" id="envId" name="envId" value=""/>
		<input  type="hidden" id="bbsId" name="bbsId"/>
		<input  type="hidden" id="searchCl1DetailCode" name="searchCl1DetailCode"/>
		<input  type="hidden" id="idx" name="idx"/>
		<input  type="hidden" id="nttId" name="nttId"/>	
		<input type="hidden" id="pageIndex" name="pageIndex" value="${empty evo.pageIndex ? '1' : evo.pageIndex}"/>
		<div class="btn_right">
			<div class="board_search ar">					
				<fieldset>
					<legend>게시물 검색</legend>						
					<span> <select name="searchCnd" class="select_list">
							<option value="0"
								<c:if test="${evo.searchCnd == '0'}">selected="selected"</c:if>>전체</option>
							<option value="1"
								<c:if test="${evo.searchCnd == '1'}">selected="selected"</c:if>>물질명</option>
							<option value="2"
								<c:if test="${evo.searchCnd == '2'}">selected="selected"</c:if>>CAS번호</option>
					</select>
					</span> <span> <label for="" class="skip">검색단어입력</label> <input
						name=searchKeyword type="text"
						value='<c:out value="${evo.searchKeyword}"/>' class="text"
						title="검색어 입력" onKeyPress="press(event);" />
					</span> <input type="image"
						src="/assets/kor/images/bbs/board_search_btn.png" alt="검색"
						onClick="fn_egov_select_noticeList('1'); return false;" />
					<!-- <a id="button" class="btn gray">전체보기</a> -->
				</fieldset>
			</div>
		</div>
	</form>
	<div id="conData">	
	</div>	
</div>
<!-- //contents -->
