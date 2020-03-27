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
	$('.plan .select ul li:nth-child(1) a').click(function() {
		$('.plan .select ul li').show();
	});
	
});


//주요업무계획
function plan(year) {
	var year=year;
	//event.preventDefault ();
	$('.plan .explan').hide();
	$('.plan #' + year).show();
	$('.plan .select ul li').hide();
	$('.plan .select ul li:nth-child(1)').show();
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
	$('#route .time.r'+e).show();
	$('#route .section li a').removeClass('on');
	$('#route .section li:nth-child('+e+') a').addClass('on');
	return false;
}
function route2(e) {
	var e=e;
	$('#route .time2').hide();
	$('#route .time2.r'+e).show();
	$('#route .section2 li a').removeClass('on');
	$('#route .section2 li:nth-child('+e+') a').addClass('on');
	return false;

}
