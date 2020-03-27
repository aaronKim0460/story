<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/tiles/taglib.jsp"%>
<%@ include file="/WEB-INF/jsp/kor/common/KorIncludeUser.jsp"%>
<script type="text/javascript">
	
	// enter로 검색하기
	function press(event) {
		if (event.keyCode==13) {
			if($('#searchCondition').val().length == 0){
				alert("검색 조건을 선택하세요.");
				event.preventDefault();
				return false;
			} else {
				fn_move_select_List(0);
			}
		}
	}

	// 검색하기
	function fn_move_select_List(pageNo) {
		var condition = $('#searchCondition').val();
		//페이지값 0 = 검색하기
		if(pageNo == 0){
			//검색조건 있음
			if(condition.length > 0){
				pageNo = 1;//페이지값 1 재설정
			//검색조건 없음
			}else if(condition.length == 0){
				alert("검색 조건을 선택하세요.");
				return false;
			}
		}
		
		var fAChar = $('#firstAlphabet').val();
		var fHChar = $('#firstChar').val();
		
		
		//검색조건이 영문명일 땐 fAChar, 국문명일 땐 fHChar에 값을 담기 / 검색조건이 아닌 값은 '' 상태
		if(condition == 'engNm')		fAChar = $('#' + condition + 'Char li.on').length > 0 ? $('#' + condition + 'Char li.on').attr('data-set') : ''; 		//기본값은 ''
		else if(condition == 'wordNm')	fHChar = $('#' + condition + 'Char li.on').length > 0 ? $('#' + condition + 'Char li.on').attr('data-set') : '0'; 		//기본값은 1(ㄱ)
		
		
		$('#formFirst').find("#firstAlphabet").val(fAChar);
		$('#formFirst').find("#firstChar").val(fHChar);
		$('#pageIndex').val(pageNo);
		$('#formFirst').attr("action","<c:url value='/user/com/kids/word/userSelectWordDicaryList.do?menuNo=15005'/>");
		$('#formFirst').submit();
	}
	
	// 초성 검색하기
	function fn_move_select_list_first(fAlphabet, fChar) {
		//검색값 초기화
		$('#searchCondition').val('');
		$('#schTxt').val('');
		$('#pageIndex').val('1');

		$('#formFirst').find("#firstAlphabet").val(fAlphabet);
		$('#formFirst').find("#firstChar").val(fChar);
		
		$('#formFirst').attr("action","<c:url value='/user/com/kids/word/userSelectWordDicaryList.do?menuNo=15005'/>");
		$('#formFirst').submit();
	}
	
	$(document).ready(function(){
		$('#kTotal').text('(' + $('#ksum').val() + ')');
		$('#eTotal').text('(' + $('#esum').val() + ')');
		
		var condition = '<c:out value="${wordDicaryDefaultVO.searchCondition}" />';//검색값
		var fAChar = $('#firstAlphabet').val();
		var fHChar = $('#firstChar').val();
		
		if(condition == null || condition == ''){//검색값 없을 때
			fn_tabS(fAChar.length > 0 ? 'engNm' : 'wordNm', fAChar.length > 0 ? fAChar : fHChar);		
		}else{//검색값 있을 때 fn_tabS 함수 기본값 세팅으로 동작시키기
			fn_tabS(condition, condition == 'engNm' ? '' : '0');
		}
	});
	
	function fn_tabS(lang, code){
		console.log('lang=='+lang);
		console.log('code=='+code);
		$('.Tab01 .on').removeClass('on');//국문/영문 class="on" 삭제(초기화)
		$('#' + lang).addClass('on');//lang 값 따라 국문/영문 선택한 쪽 class="on" 주기
		
		$('.spell').hide();//한글모음/알파벳 란 전체 숨기기
		$('#' + lang + 'Char').show();//lang 값 따라 한글모음/알파벳 란 선택한 쪽 보이기
		
		if($('#' + lang + 'Char li').is('.on') == false){//한글모음/알파벳 란 선택된 글자 없을 때 = 상단 or 좌측 메뉴 이용 직접 접근했을 때 기본 상태값 class="on" 주기
			if(lang == 'wordNm')			$('#char_0').addClass('on');
			else if(lang == 'engNm')		$('#char_').addClass('on');
		}	
	}
</script>
</head>
<body>
<form name="formFirst" id="formFirst" method="post">
	<%-- <input type="hidden" name="menuNo" id="menuNo" value="<c:out value='${menuManageVO.menuNo}'/>" /> --%>
	<input type="hidden" name="firstAlphabet" id="firstAlphabet" value="<c:out value='${wordDicaryDefaultVO.firstAlphabet}'/>" />
	<input type="hidden" name="firstChar" id="firstChar" value="<c:out value='${wordDicaryDefaultVO.firstChar}'/>" />
	<input name="pageIndex" id="pageIndex" type="hidden" value="<c:out value='${wordDicaryDefaultVO.pageIndex}'/>"/>
	<input name="wordId" type="hidden" value="">

<div id="contents">
	<div class="tableBtn ">
<!-- 		<div class="btn_left"> -->
<%-- 			총 <span class="point"><c:out value='${paginationInfo.totalRecordCount }' /></span>건 --%>
<%-- 			, 현재페이지 <span class="point"><c:out value='${paginationInfo.currentPageNo }' /></span> --%>
<%-- 			/<c:out value='${paginationInfo.totalPageCount }' /> --%>
<!-- 		</div> -->
		<div class="btn_right">
			<div class="board_search">
				<fieldset>
					<legend>목록검색</legend>
					<span>
						<select name="searchCondition" id="searchCondition" class="board-search-select">
						   <option value=''>선택하세요</option>
						   <option value="wordNm"  <c:if test="${wordDicaryDefaultVO.searchCondition == 'wordNm'}">selected="selected"</c:if> >국문명</option>
						   <option value="engNm"   <c:if test="${wordDicaryDefaultVO.searchCondition == 'engNm'}">selected="selected"</c:if> >영문명</option>	
						</select>
					</span>
					<span>
						<label for="schTxt" class="skip">검색단어입력</label>
						<input id="schTxt" name="searchKeyword" type="text" value='<c:out value="${wordDicaryDefaultVO.searchKeyword ne '' ? wordDicaryDefaultVO.searchKeyword : param.searchKeyword}"/>' class="text" title="검색어 입력" onkeypress="press(event);"/>
					</span>
						<a href="javascript:void(0);" onclick="fn_move_select_List(0);"><img src="/assets/kor/images/bbs/board_search_btn.png" alt="검색" style="vertical-align:middle;"/></a>
				</fieldset>
			</div>
		</div>
	</div>
	
	<div class="dictionary">
		<div class="contentTab2">
			<ul class="Tab01">
				<li><a id="wordNm" onclick="fn_tabS('wordNm', '${wordDicaryDefaultVO.firstChar ne '' ? wordDicaryDefaultVO.firstChar : '1'}');" >국문</a></li>
				<li><a id="engNm" onclick="fn_tabS('engNm', '${wordDicaryDefaultVO.firstAlphabet ne '' ? wordDicaryDefaultVO.firstChar : 'A'}');">영문</a></li>
			</ul>
		</div>
		<c:set var="ksum" value="0"/>
		<ul class="spell" id="wordNmChar" style="display:block;">
			<li id="char_0" data-set="0" <c:if test="${fn:length(wordDicaryDefaultVO.firstChar) eq 0}">class="on"</c:if> onclick="fn_move_select_list_first('', '0')">
				<div style="font-family:arial; font-size:14px;">All</div>
				<p id="kTotal">(0)</p>
			</li>
			<c:forEach var="row" items="${koreaCountList}" varStatus="i">
				<li id="char_${i.count}" data-set="${i.count}" <c:if test="${wordDicaryDefaultVO.firstChar eq i.count}">class="on"</c:if> onclick="fn_move_select_list_first('', '<c:out value="${i.count}" />')">
					<div><c:out value="${row.firstChar}" /></div>
					<p>(<c:out value="${row.cnt}" />)</p>
					<c:set var="ksum" value="${ksum + row.cnt}"/>
				</li>
			</c:forEach>
		</ul>
		<input type="hidden" id="ksum" value="${ksum}" />
		<c:set var="esum" value="0"/>
		<ul class="spell" id="engNmChar">
			<li id="char_" data-set="" <c:if test="${fn:length(wordDicaryDefaultVO.firstAlphabet) eq 0}">class="on"</c:if> onclick="fn_move_select_list_first('ALL', '')">
				<div style="font-family:arial; font-size:14px;">All</div>
				<p id="eTotal">(0)</p>
			</li>
			<c:forEach var="row" items="${EnglishCountList}" varStatus="i">
			<li id="char_${row.firstChar}" data-set="${row.firstChar}" <c:if test="${wordDicaryDefaultVO.firstAlphabet eq row.firstChar}">class="on"</c:if> onclick="fn_move_select_list_first('<c:out value="${row.firstChar}" />', '')">
				<div><c:out value="${row.firstChar}" /></div>
				<p>(<c:out value="${row.cnt}" />)</p>
				<c:set var="esum" value="${esum + row.cnt}"/>
			</li>
			</c:forEach>
		</ul>
		<input type="hidden" id="esum" value="${esum}" />
		<ul class="dic_contents">
			<c:forEach var="row" items="${resultList}" varStatus="i">
				<li class="clearfix">
					<div class="dic_wrap">
						<div class="english">영문</div><p class="assess1"><c:out value="${row.engNm}" /></p>
						<div class="korean">국문</div><p class="assess2"><c:out value="${row.wordNm}" /></p>
						<p class="dic_explain"><c:out value="${row.wordDc}" escapeXml="false" /></p>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</form>
	<c:if test="${fn:length(resultList) gt 0}">
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_move_select_List" />
		</div>
	</c:if>
</div>
</body>
</html>