$(window).ready(function() {
	naviInit();
	
	/* 접근성 보장용 */
	$('.gnb li li a:last-child').on('blur', function(){
		$('.gnb > li > ul').css('display', 'none');
		TweenMax.to($('.bg_subnav'), 0.2, {
			height: 0,
			ease: Strong.easeInOutExpo
		});
		TweenMax.to($('#gnb'), 0.2, {
			height: 47,
			ease: Strong.easeInOutExpo
		});
	});
});

function naviInit() {
	var menuUrl = [];
	for (var i = 0; i < $('.gnb > li').length; i++) {
		menuUrl.push($('.gnb > li').eq(i).children('a').attr('href'));
	}

	var menuNum = 0;
	var subNum = 0;
	var device;
	if (typeof gnb_subbg_height == "undefined") {
		gnb_subbg_height = 210;
	}
	if (typeof gnb_height == "undefined") {
		gnb_height = 300;
	}


	removeEvent();
	navEvent_pc();
	$('#wrap').removeAttr('style');
	$('#gnb').removeAttr('style');
	$('#header').removeAttr('style');
	for (var i = 0; i < $('.gnb > li').length; i++) {
		$('.gnb > li').eq(i).children('a').attr('href', menuUrl[i]);
	}

	function navEvent_pc() {
		var prevMenu;
		var prevSub;
		var timer;
		var delay = 200;
		if (typeof now_menu == "undefined") {
			now_menu = -1;
		}
		var currentMenu = now_menu;

		$('.gnb > li > a').on('mouseover focus', function() {
			menuHandler(this);
			clearInterval(timer);
		}).on('mouseout', function() {
			timer = setInterval(timerHandler, delay);
		});

		$('.gnb > li ul li a').on('mouseover focus', function() {
			subHandler(this);
			clearInterval(timer);
		}).on('mouseout', function() {
			timer = setInterval(timerHandler, delay);
		});

		$('.gnb > li ul li').on('mouseover focus', function() {
			clearInterval(timer);
		});

		$('.bg_subnav').on('mouseover focus', function() {
			clearInterval(timer);
		}).on('mouseout', function() {
			timer = setInterval(timerHandler, delay);
		});

		function menuHandler(tg) {
			if (prevMenu) {
				if ($(prevMenu).parent().index() != currentMenu) {
					$(prevMenu).parent().removeClass('active');
				}
			}
			$('.gnb > li ul').css('display', 'block');
			$('.bg_subnav').css('display', 'block');
			TweenMax.to($('.bg_subnav'), 0.2, {
				height: gnb_subbg_height,
				ease: Strong.easeInOutExpo
			});
			TweenMax.to($('#gnb'), 0.2, {
				height: gnb_height,
				ease: Strong.easeInOutExpo
			});
			$(tg).parent().addClass('active');

			prevMenu = tg;
		}

		function subHandler(tg) {
			if (prevSub) {
				//$(prevSub).css('color','#ffffff');
			}
			//$(tg).css('color','#ffe401');
			menuHandler($('.gnb > li > a').eq($(tg).parent().parent().parent().index()));
			prevSub = tg;
		}

		function timerHandler() {
			if (currentMenu > -1) {
				if (currentMenu != "") {
					menuHandler($('.gnb > li > a').eq(currentMenu)[0]);
					$('.gnb > li').eq(currentMenu).addClass('active2');
				}
			} else {
				if (prevMenu) {
					if ($(prevMenu).parent().index() != currentMenu) {
						$(prevMenu).parent().removeClass('active');
						prevMenu = undefined;
					}
				}		
			}

			if (subNum > 0) {
				subHandler($('.gnb > li').eq(menuNum - 1).children('ul').children('li').eq(subNum - 1).children('a')[0]);
			} else {
				if (prevSub) {
					//$(prevSub).css('color','#ffffff');
				}
				prevSub = undefined;
			}

			$('.gnb > li > ul').css('display', 'none');

			TweenMax.to($('.bg_subnav'), 0.2, {
				height: 0,
				ease: Strong.easeInOutExpo
			});
			TweenMax.to($('#gnb'), 0.2, {
				height: 47,
				ease: Strong.easeInOutExpo
			});
			clearInterval(timer);
		}

		timerHandler();

	}

	function removeEvent() {
		$('.m-btn').off('click');
		$('.gnb > li > a').off('mouseover').off('mouseout').off('focus').off('blur').off('click');
		$('.gnb > li ul li a').off('mouseover').off('mouseout').off('focus').off('blur');
		$('.gnb > li ul li').off('mouseover');
		$('.bg_subnav').off('mouseover').off('mouseout');
	}
}
