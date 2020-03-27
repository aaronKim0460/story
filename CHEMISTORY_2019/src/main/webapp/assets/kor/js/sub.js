$(function() {
	//역대원장
	$('#director h2 a').click(function() {
		if (!$(this).parent().hasClass('active')){
			$('#director h2').removeClass('active');
			$('#director .obj').slideUp();
			$(this).parent().addClass('active');
			$(this).parent().next('active')
			$(this).parent().next('.obj').slideDown();
		}

	});

	//주요업무계획
	$('.plan .select ul li').click(function() {
		
		var index = $(this).index();
		var year = $(this).attr("refId");
		var reCk = 0;
		
		
		$('.plan .select ul li').each(function(i){
			var liSty = $(this).css("display"); //IE8이하 버전에서 style 값이 DISPLAY 대문자로 출력되어 호환이 되지 않음.
            
			if(liSty == "list-item"){
				reCk++;
			}
			
			if(index != i){			
				$(this).toggle();
				$(this).removeClass("on");
			}else{
				$(this).addClass("on");
			}
		});
		
		if(reCk < 2){
			$('.plan .select ul li').removeClass("on");
			$('.plan .select ul li').eq(0).addClass("on");
		}else{
			$('.plan .explan').hide();
			$('.plan #' + year).fadeIn('slow');
		}
		
	});
	
});


//주요업무계획
function plan(year) {
	var year=year;
	//event.preventDefault ();
	$('.plan .explan').hide();
	$('.plan #' + year).show();
	$('.plan .select ul li').removeClass("on");
	$('.plan .select ul li').eq(0).addClass("on");
	
	return false;
	
}


//연혁
function nier_history(year) {
	var year=year;
	$('.history_t1').hide();
	$('.y' + year).show();
	$('.tab_item2 li').removeClass('active');
	$('.t' + year).addClass('active');
	return false;
}

//주요시설
function sisul(num) {
	var num=num;
	$('.cts15104 .explan').hide();
	$('.cts15104 .explan.b'+num).show();
	return false;
}
function sisultab(num) {
	var num=num;
	$('.cts15104 .tabbox').hide();
	$('.cts15104 .tabbox.n'+num).show();
	$('.cts15104 .tabmenu li').removeClass('on');
	$('.cts15104 .tabmenu li:nth-child('+num+')').addClass('on');

	return false;

}

//통근버스
function route(e) {
	var e=e;
	$('#route .time').hide();
	
	var index = 0;
	$('#routeMenu1 li').each(function(i){		
		if($(this).children().hasClass('on')){			
			$(this).children().removeClass("on");
			index = i+1;
		}
	});
	
	if(index == e){
		//같은 노선 클릭 시
		$('#route .section li:nth-child('+e+') a').removeClass('on');
		$('#route .time.r'+e).hide();
	}else{
		$('#route .section li:nth-child('+e+') a').addClass('on');
		$('#route .time.r'+e).show();
	}
	return false;
}

function route2(e) {
	var e=e;
	$('#route .time2').hide();
	
	var index = 0;
	$('#routeMenu2 li').each(function(i){		
		if($(this).children().hasClass('on')){			
			$(this).children().removeClass("on");
			index = i+1;
		}
	});

	if(index == e){
		//같은 노선 클릭 시
		$('#route .section2 li:nth-child('+e+') a').removeClass('on');
		$('#route .time2.r'+e).hide();
	}else{
		$('#route .section2 li:nth-child('+e+') a').addClass('on');
		$('#route .time2.r'+e).show();
	}
	return false;
}
