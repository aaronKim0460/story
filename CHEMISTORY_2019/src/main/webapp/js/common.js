/*-----------------------------------------------------------------------------------*/
/*  Document Ready
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function($){
'use strict';

	//resizeInit(); // 해상도 변화에 따른 각종 설정

	// .scrollTo - Plugin
	// -------------------------------------------------------
	$.fn.scrollTo = function( target, options, callback ){
	  if(typeof options == 'function' && arguments.length == 2){ callback = options; options = target; }
	  var settings = $.extend({
		scrollTarget  : target,
		offsetTop     : 50,
		duration      : 500,
		easing        : 'swing'
	  }, options);
	  return this.each(function(){
		var scrollPane = $(this);
		var scrollTarget = (typeof settings.scrollTarget == "number") ? settings.scrollTarget : $(settings.scrollTarget);
		var scrollY = (typeof scrollTarget == "number") ? scrollTarget : scrollTarget.offset().top + scrollPane.scrollTop() - settings.offsetTop;
		scrollPane.animate({scrollTop : scrollY }, settings.duration, settings.easing, function(){
		  if (typeof callback == 'function') { callback.call(this); }
		});
	  });
	}
	
	// -------------------------------------------------------    
	//$('.tab-list').tabListUI();
	//$('.tab-menu').tabMenuUI();    

	var ua = navigator.userAgent;
	if (ua.match(/Mobile/) != null || ua.match(/iPhone/) != null || ua.match(/iPod/) != null || ua.match(/Android/) != null || ua.match(/Phone/) != null) {
		$('body').addClass('ui-mobile');
	}
	
	//** ckeditor 붙여넣기시 html tag  삭제 
	//**복사+붙여넣기 방지 기능 때문에 취소
    /*CKEDITOR.on('instanceReady', function(ev) {
    var edits=ev.editor;
    edits.on( 'paste', function(event) {
        var content =  event.data['html'];
        content = $('<div />').html(content).text();
        var $temp=$(content).find('br,p').contents().unwrap().end().end();
        var newtext = $temp.text();
        edits.setData(newtext);
    });
    });*/

}); 


$.fn.tabListUI = function() {
	// 브라우저 해상도에 따라 너비 설정
	tablistResizeHandler();
	$(window).on('resize',function(){
		tablistResizeHandler();
	});
	function tablistResizeHandler() {
		var iWidth = $(window).innerWidth();
		if (iWidth < 768) {
			$('.tab-list').each(function(){
				$(this).find('> ul > li').width(($(this).innerWidth()));
			});
		}
		else {
			$('.tab-list ul').removeClass('tab-mobile-open');
			$('.tab-list ul').css({'display':'block !important'})
			$('.tab-list ul').each(function(){
				var length = $(this).find('>li').size();
				var gutter = 5; //탭리스트 사이의 간격. css로 설정해 주어야 함     
				$(this).find('>li').width(($(this).innerWidth()-(length-1)*gutter) / length);
			});
		}
	}
	$(this).each(function() {
		var $tabmenu = $(this);
		var $tabmenu_ul = $tabmenu.find('>ul:eq(0)');
		var $tabmenu_li = $tabmenu_ul.find('>li');
		var $tabmenu_link = $tabmenu_li.find('>a');
		var $tabmenu_cont = $tabmenu.next().find('.tab-content');
		
		$tabmenu_cont.hide().eq(0).show();
		$tabmenu_link.eq(0).parent('li').addClass('active');
		
		$tabmenu.each(function() {
			var tabmenu_li = $(this).find('>li');
			var tabmenu_li_txt = $(this).find('a:eq(0)').text();
			var tabmenu_li_href = $(this).find('a:eq(0)').attr('href');
			if ( $tabmenu_li.hasClass('active') ) {
				$tabmenu_ul.before('<div class="tab-mobile"><a href="'+tabmenu_li_href+'">'+tabmenu_li_txt+'</a></div>');
			}
		});
	});
	$(this).find('>ul:eq(0) > li > a').on('click', function(e) {
		e.preventDefault();
		$(this).parent().parent().children('li').removeClass("active");
		$(this).parent().parent().parent().next().children('div').hide();
		$($(this).attr('href')).show();
		$(this).parent('li').addClass("active");
		
		$(this).parent('li').parent('ul').parent('div').children('div.tab-mobile').children('a').attr('href', $(this).attr('href'));
		$(this).parent('li').parent('ul').parent('div').children('div.tab-mobile').children('a').text($(this).text());

		if ($(this).parent().parent('ul').hasClass('tab-mobile-open')) {
			$(this).parent().parent('ul').removeClass('tab-mobile-open').hide();
			$(this).parent('li').parent('ul').parent('div').children('div.tab-mobile').children('a').removeClass('caret-up');
		}
	});
	$(this).children('.tab-mobile').children('a').on('click', function(e){
		e.preventDefault();
		if ($(this).parent().next('ul').hasClass('tab-mobile-open')) {
			$(this).removeClass('caret-up');
			$(this).parent().next('ul').removeClass('tab-mobile-open').hide();
		}
		else {
			$(this).addClass('caret-up');
			$(this).parent().next('ul').addClass('tab-mobile-open').show();
		}
	});
}
$.fn.tabMenuUI = function() {
	// 브라우저 해상도에 따라 너비 설정
	tabMenuResizeHandler();
	$(window).on('resize',function(){
		tabMenuResizeHandler();
	});
	function tabMenuResizeHandler() {
		var iWidth = $(window).innerWidth();
		if (iWidth < 768) {
			$('.tab-menu').each(function(){
				$(this).find('> ul > li').width(($(this).innerWidth()));
			});
		}
		else {
			$('.tab-menu ul').removeClass('tab-mobile-open');
			
			$('.tab-menu ul').css({'display':'block !important'})
			$('.tab-menu ul').each(function(){
				var length = $(this).find('>li').size();
				var gutter = 9; //탭메뉴 사이의 간격. css로 설정해 주어야 함     
				$(this).find('>li').width(($(this).innerWidth()-(length-1)*gutter) / length);
			});
			
		}
	}
	$(this).each(function() {
		var $tabmenu = $(this);
		var $tabmenu_ul = $tabmenu.find('>ul:eq(0)');
		var $tabmenu_li = $tabmenu_ul.find('>li');
		
		$tabmenu_li.each(function() {
			var tabmenu_li_txt = $(this).find('a:eq(0)').text();
			var tabmenu_li_href = $(this).find('a:eq(0)').attr('href');
			if ($(this).hasClass('active') ) {
				$tabmenu_ul.before('<div class="tab-mobile"><a href="'+tabmenu_li_href+'">'+tabmenu_li_txt+'</a></div>');
			}
		});
	});
	$(this).children('.tab-mobile').children('a').on('click', function(e){
		e.preventDefault();
		if ($(this).parent().next('ul').hasClass('tab-mobile-open')) {
			$(this).removeClass('caret-up');
			$(this).parent().next('ul').removeClass('tab-mobile-open').hide();
		}
		else {
			$(this).addClass('caret-up');
			$(this).parent().next('ul').addClass('tab-mobile-open').show();
		}
	});
}

/* 글자수 ... 처리 함수  */
function fn_egov_trim(str) {
    if (str == null) {
        return '';
    }
    var count = str.length;
    var len = count;
    var st = 0;

    while ((st < len) && (str.charAt(st) <= ' ')) {
        st++;
    }
    
    while ((st < len) && (str.charAt(len - 1) <= ' ')) {
        len--;
    }
    
    return ((st > 0) || (len < count)) ? str.substring(st, len) : str;
}

function cutStr(str,limit){
   var tmpStr = str;
   var byte_count = 0;
   var len = str.length;
   var dot = "";
   for(i=0; i<len; i++){
      byte_count += chr_byte(str.charAt(i));
      if(byte_count == limit-1){
         if(chr_byte(str.charAt(i+1)) == 2){
            tmpStr = str.substring(0,i+1);
            dot = "...";
         } else {
            if(i+2 != len) dot = "...";
            tmpStr = str.substring(0,i+2);
         }
         break;
      } else if(byte_count == limit){
         if(i+1 != len) dot = "...";
         tmpStr = str.substring(0,i+1);
         break;
      }
   }
   return tmpStr+dot;
}

function chr_byte(chr){
   if(escape(chr).length > 4)
      return 2;
   else
      return 1;
}

/* 페이지 이동 함수 */
function movePage(objStr){
	location.href = objStr;
}

/* 페이지 이동 함수 */
function forward(obj){
	if(obj.site.value == "") return false;
	return true;
}

/* 설  명 : showModalDialog 기능을 대체하는 JavaScript */
//fix for deprecated method in Chrome 37

this.otherParameters = new Array();
this.showModalDialogSupported = true;

this.callbackMethod = null;

if (!window.showModalDialog) {
	
	showModalDialogSupported = false;

	window.showModalDialog = function(arg1, arg2, arg3, callback) {

		var w;
		var h;
		var resizable = "no";
		var scroll = "no";
		var status = "no";

		// get the modal specs
		var mdattrs = arg3.split(";");
		for (i = 0; i < mdattrs.length; i++) {
			var mdattr = mdattrs[i].split(":");

			var n = mdattr[0];
			var v = mdattr[1];
			if (n) {
				n = n.trim().toLowerCase();
			}
			if (v) {
				v = v.trim().toLowerCase();
			}

			if (n == "dialogheight") {
				h = v.replace("px", "");
			} else if (n == "dialogwidth") {
				w = v.replace("px", "");
			} else if (n == "resizable") {
				resizable = v;
			} else if (n == "scroll") {
				scroll = v;
			} else if (n == "status") {
				status = v;
			} else {
				// no-op
			}
		}

		var left = window.screenX + (window.outerWidth / 2) - (w / 2);
		var top = window.screenY + (window.outerHeight / 2) - (h / 2);
		var targetWin = window.open(arg1, "ShowModalDialog" + arg1, 'toolbar=no, location=no, directories=no, status=' + status + ', menubar=no, scrollbars=' + scroll + ', resizable=' + resizable + ', copyhistory=no, width=' + w	+ ', height=' + h + ', top=' + top + ', left=' + left);

		dialogArguments = arg2;
		
		if (callback != null) {
			callbackMethod = callback;
		} else {
			callbackMethod = null;
		}

		targetWin.focus();
	};

	window.getDialogArgumentsInner = function() {
		return dialogArguments;
	}; 
	
	window.getCallbackMethodName = function() {
		return callbackMethod;
	}
}


/* 설  명 : showModalDialog 기능을 대체하는 JavaScript */
//----------------------
//popped up page
//----------------------
function getDialogArguments() {
	if (!window.showModalDialog) {
		if (opener != null && !opener.closed) {
			try {
				window.dialogArguments = opener.getDialogArgumentsInner();
			} catch (err) {
				alert('팝업 처리 시 오류가 발생하였습니다. \n오류내용 : ' + err);
			}
		} else if (parent.opener != null && !parent.opener.closed) {
			try {
				window.dialogArguments = parent.opener.getDialogArgumentsInner();
				parent.window.dialogArguments = window.dialogArguments;
			} catch (err) {
				alert('팝업 처리 시 오류가 발생하였습니다. \n오류내용 : ' + err);
			}
		} else {
			alert('업무 화면에 대한 변동이 있습니다. 다시 시도해 주십시오.');
		}
	}
}

function setReturnValue(obj) {
	if (!window.showModalDialog) {
		if (opener != null && !opener.closed) {
			
			var callbackMethod = opener.getCallbackMethodName();
			
			try {
				if (callbackMethod != null) {
					opener[callbackMethod](obj);
				} else {
					opener.showModalDialogCallback(obj);
				}
			} catch (err) {
				alert('팝업 처리 시 오류가 발생하였습니다. \n오류내용 : ' + err);
			}
		} else if (parent.opener != null && !parent.opener.closed) {
			
			var callbackMethod = parent.opener.getCallbackMethodName();
			
			try {
				if (callbackMethod != null) {
					parent.opener[callbackMethod](obj);
				} else {
					parent.opener.showModalDialogCallback(obj);
				}
			} catch (err) {
				alert('팝업 처리 시 오류가 발생하였습니다. \n오류내용 : ' + err);
			}
		} else {
			alert('업무 화면에 대한 변동이 있습니다. 다시 시도해 주십시오.');
		}
	}
}

//** ---------------------------------------------------------------------------
//함 수 명 : fnGetSyncAjaxData
//인    자 : 
//		  1. pUrl          : json 호출 url
//		  2. pData         : 파라메터 데이터 Form 명 또는 Array
//		  3. pCallBackFn   : 정상 처리 완료 후 호출 Function 명
//		  4. pBlockUI      : true - blockUI 함수를 호출 한다., false - blockUI 호출 하지 않는다.
//		  5. pBlockMessage : BlockUI에 설정 할 메시지
//		  6. pObj		 		:pCallBackFn에 붙일 object 
//목    적 : 
//플 로 우 : 
//검    수 :
//예   제  : 	fnGetAjaxData('/sm/so/cm/pop/selectSmso3011.json', 'frm', 'callbackTblListClick', true, '조회 중 입니다.' );
//			fnGetAjaxData('/sm/so/cm/pop/selectSmso3011.json', {codeId:$(obj).data("data").codeId}, 'callbackTblListClick', true, '조회 중 입니다.' );
//생 성 일 : 
//수    정 :
//** ---------------------------------------------------------------------------
function fnGetSyncAjaxData(/* String */ pUrl, /* String or Array */ pData, /* String */ pCallBackFn, /* Bool */ pBlockUI, /* Bool */ pBlockMessage, pObj)
{
	try {
		var sData = null;
		if(typeof(pData) == "object" ) {
			sData = pData;
		}
		else {
			sData = $('#'+pData).serialize();
		}
		$.ajax({
			/*dataType:"text",*/
			dataType:"json",
			type: "POST",
			url: pUrl,
			data:sData,
			async: false,
			cache: false, 
			beforeSend : function(){
				
		 	},
			success : function(data, status, request) {
				pCallBackFn(data, pObj);
			},
			complete: function(){
				
			},
		    error: function(data, status, error) {
				window.error = error;
				
				alert(error);
			}
		});	
	} catch(e) {
		alert(e.message);
	}

}


//** ---------------------------------------------------------------------------
//함 수 명 : fnGetAjaxData
//인    자 : 
//		  1. pUrl          : json 호출 url
//		  2. pData         : 파라메터 데이터 Form 명 또는 Array
//		  3. pCallBackFn   : 정상 처리 완료 후 호출 Function 명
//		  4. pBlockUI      : true - blockUI 함수를 호출 한다., false - blockUI 호출 하지 않는다.
//		  5. pBlockMessage : BlockUI에 설정 할 메시지
//		  6. pObj		 		:pCallBackFn에 붙일 object
//목    적 : 
//플 로 우 : 
//검    수 :
//예   제  : 	fnGetAjaxData('/sm/so/cm/pop/selectSmso3011.json', 'frm', 'callbackTblListClick', true, '조회 중 입니다.' );
//			fnGetAjaxData('/sm/so/cm/pop/selectSmso3011.json', {codeId:$(obj).data("data").codeId}, 'callbackTblListClick', true, '조회 중 입니다.' );
//생 성 일 : 
//수    정 :
//** ---------------------------------------------------------------------------
function fnGetAjaxData(/* String */ pUrl, /* String or Array */ pData, /* String */ pCallBackFn, /* Bool */ pBlockUI, /* Bool */ pBlockMessage, pObj )
{
	try {
		var sData = null;
		if(typeof(pData) == "object" ) {
			sData = pData;
		}
		else {
			sData = $('#'+pData).serialize();
		}
		$.ajax({
			/*dataType:"text",*/
			dataType:"json",
			type: "POST",
			url: pUrl,
			data:sData,
			async: true,
			cache: false, 
			beforeSend : function(){
				
		 	},
			success : function(data, status, request) {
				pCallBackFn(data, pObj);
			},
			complete: function(){
				
			},
		    error: function(data, status, error) {
				window.error = error;
				
		    	alert(error);
			}
		});	
	} catch(e) {
		alert(e.message);
	}

}

String.prototype.replaceAll = function(regexp, replaceValue) {
	return this.split(regexp).join(replaceValue);
};

// 게시일 지정 공통
$(document).ready(function(){
	
	$(".board-default tbody tr").css("cursor", "pointer");
	
	// 마우스 오버
	$(".board-default tbody tr").mouseover(function(){
		$(this).css("background-color", "#A9E2F3");
	});
	
	// 마우스 아웃
	$(".board-default tbody tr").mouseout(function(){
		$(this).css("background-color", "");
	});
	
	if($("#ntceDateView").length < 1)return;

	$("#ntceDateView").datepicker();
	
	$("#ntceDateView").change(function(){
		
		var date = ($.trim($(this).val())).replaceAll("-","");
		$("#ntceDate").val(date);
	});
	
	if($("#ntceBgndeView")) {
		if($("#ntceBgndeView").length < 1)return;
	
		$("#ntceBgndeView").datepicker();
		
		$("#ntceBgndeView").change(function(){
			
			var date = ($.trim($(this).val())).replaceAll("-","");
			$("#ntceBgnde").val(date);
		});
	}
	
	if($("#ntceEnddeView")) {
		if($("#ntceEnddeView").length < 1)return;
	
		$("#ntceEnddeView").datepicker();
		
		$("#ntceEnddeView").change(function(){
			
			var date = ($.trim($(this).val())).replaceAll("-","");
			$("#ntceEndde").val(date);
		});
	}
	
	//관리자 게시판 등록시 개시일자 오늘 날짜로 세팅
	if($.trim($('#ntceDate').val()) == ''){
		var newDate = new Date();
		var yyyy = newDate.getFullYear();
		var mm = newDate.getMonth()+1;
		var dd = newDate.getDate();
		
        if (("" + mm).length == 1) { mm = "0" + mm; }
        if (("" + dd).length   == 1) { dd   = "0" + dd;   }
        
        var toDayHidden = yyyy +""+ mm +""+ dd;
		var toDay = yyyy + "-" + mm + "-" + dd;

		$('#ntceDate').val(toDayHidden);
		$('#ntceDateView').val(toDay);
	}
	
});

//메뉴 공공누리, 게시물 공공누리 구분
$('iframe').load(function(){
	
	var bbsNuriFlag = $('iframe').contents().find('#bbsNuri').length;
	
	if(bbsNuriFlag > 0){
		$('#menuNuri').hide();				
	}else{
		$('#menuNuri').show();
	}
});

//함 수 명 :	fn_spamCheck
//인    자 :	1. contentId        : 게시내용의 ID
//			2. callback         : 정상 처리 완료 후 호출 Function 명
function fn_spamCheck(contentId,callback){
//	게시판 스팸필터 사용여부 적용 후 주석해제 	
//	if('${bdMstr.bbs_spam_at}' =='Y'){
	    var contents = eval("CKEDITOR.instances."+contentId+".getData();")
	    
	    var  nttSj = $("input[name=nttSj]").val();
	    
	    if(nttSj == "" || nttSj == null){
	    	alert("제목을 입력해주세요.");
	    	$("input[name=nttSj]").focus();
	    	return false;
	    }
	    
	    if(contents == "" || contents == null){
	    	alert("내용을 입력해주세요.");
	    	eval("CKEDITOR.instances."+contentId+".focus();");
	    	return false;
	    }
		var sData = "message="+eval("CKEDITOR.instances."+contentId+".getData();");
		$.ajax({
			dataType:"json",
			type: "POST",
			url: "/cop/bbs/contentSpamCheck.do",
			data:sData,
			success : function(data) {
				data.result
				if(data.result=='Y' ){
					if(data.spamYn == 'N'){
						eval(callback);
					}else{
						alert("해당 게시글은 스팸글로 등록이 제한됩니다.\n스팸 예상확률이 "+ data.spamScore+"점으로 "+ data.spamType + " 스팸일 확률이 높습니다.");
					}
				}else{
					alert("실행중 오류가 발생했습니다.")
				}
			},
	        failure: function (response) {
					alert("실행중 오류가 발생했습니다.")
	        }
		});	
//	}else{		
//		eval(callback);
//	}
}
