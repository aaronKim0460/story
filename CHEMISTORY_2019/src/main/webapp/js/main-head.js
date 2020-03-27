$(document).ready(function(){
	resizeContent();
});

$(window).resize(function() {
	resizeContent();
});

function resizeContent(){
	if($(window).width() > 1135){
		$('#main #header').css("width", "100%");  
		$('#main #container').css("width", "100%");  
		$('#main #footer').css("width", "100%");  

		$('#sub #colgroup').css("width", $(window).width()-235);
		$('#lnb').css("width", $(window).width()-300);

		$('#sub #container .wrap').css("width", "100%");
		$('#sub .wrap').css("width", "100%"); //1000
		$('#footer').css("width", "100%"); //1000

	}
	else{
		$('#main #header').css("width", "1280");  
		$('#main #container').css("width", "1280"); 
		$('#lnb').css("width", "1280"); 
		$('#main #footer').css("width", "1280");  

		$('#sub #colgroup').css("width", "870");  
		$('#sub .wrap').css("width", "1110"); //1000
		$('#footer').css("width", "1110"); //1000
	}
}


$(function(){
	var $dep1_length = $("#top1menu > li").size();
	var $depLast_length = $("#top1menu > li:nth-child("+$dep1_length+")  li").size();
	$("#top1menu > li > div").addClass('top2m');

	$('#top1menu > li > a').on('click mouseover',function(event){
		$("#top1menu > li").removeClass('on');
		$("#top1menu > li .top2m").hide();
		$(this).parent('li').addClass('on');
		$(this).next('.top2m').show();
	});


});	



function tabOn(tabid,a) {
	for (i=1;i<=10;i++) {
		if(i<10){inn="0"+i;} else {inn=""+i;}
		tabMenu = document.getElementById("tab"+tabid+"m"+i);
		tabContent = document.getElementById("tab"+tabid+"c"+i);
		tabMore = document.getElementById("tab"+tabid+"more"+i);
		if (tabMenu) { //객체가존재하면
			if (tabMenu.tagName=="IMG") { tabMenu.src = tabMenu.src.replace("_on.", "_off."); } //이미지일때
			if (tabMenu.tagName=="A") { tabMenu.className=""; } //앵커일때
		}
		if (tabContent) { tabContent.style.display="none"; }
		if (tabMore) { tabMore.style.display="none"; }

	}
	if(a<10){ann="0"+a;} else {ann=""+a;}
	tabMenu = document.getElementById("tab"+tabid+"m"+a);
	tabContent = document.getElementById("tab"+tabid+"c"+a);
	tabMore = document.getElementById("tab"+tabid+"more"+a);
//	alert(tabMenu.tagName);
	if (tabMenu) { //객체가존재하면
		if (tabMenu.tagName=="IMG") { tabMenu.src = tabMenu.src.replace("_off.", "_on."); } //이미지일때
		if (tabMenu.tagName=="A") { tabMenu.className="on"; } //앵커일때
	}
	if (tabContent) { tabContent.style.display="block"; }
	if (tabMore) { tabMore.style.display="block"; }
} 



$(function() {
	$('.doc_nav .list a').click(function() {
		$(".doc_nav .area").slideUp();
		$(this).parent().next(".area").slideDown();return false;
	});
/*
	$('.doc_nav .area .close a').click(function() {
		$(this).parent(".area").hide();return false;
	});
*/
	$('.doc_nav .doc_nav_btn a.open').click(function() {
		$('.doc_nav').animate(  { right : 0 },  500);
		$('.doc_area_pop').animate(  { width : 490 },  500);
		$('.doc_nav_btn  a.close').show();
		$('.doc_nav_btn  a.open').hide();

	});
	$('.doc_nav .doc_nav_btn a.close').click(function() {
		$('.doc_nav').animate(  { right : -419 },  500);
		$('.doc_area_pop').animate(  { width : 910 },  500);
		$('.doc_nav_btn  a.open').show();
		$('.doc_nav_btn  a.close').hide();

	});

	

});



