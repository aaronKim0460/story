$(document).ready(function(){
	//상단메뉴
	var $dep1_length = $("#top1menu > li").size();
	var $depLast_length = $("#top1menu > li:nth-child("+$dep1_length+")  li").size();
	$("#top1menu > li:nth-child("+$dep1_length+")  li:nth-child("+$depLast_length+")").addClass('last');
	$("#top1menu > li > div").addClass('top2m');

	$('#top1menu .top2m').hide();
	$('#top1menu > li > a').off();
	
	var $dep2_h = 0;
	for (i=1;i<=$dep1_length;i++) {
		$top2m_h = $("#top1menu > li:nth-child("+i+") .top2m").height();
		if($dep2_h < $top2m_h){
			$dep2_h = $top2m_h;
		}
		$("#top1menu > li:nth-child("+i+") .top2m").addClass('m'+i);
	}
	$("#top1menu .top2m div").css("height",$dep2_h);
	$("#lnb .top2mbg").css("height",$dep2_h+3);
	$("#lnb .top2mbg>div").css("height",$dep2_h+3);

	$('#top1menu > li > a').on('mouseenter focusin',function(event){
		$('#top1menu .top2m').slideDown();
		$('#lnb .top2mbg').slideDown();
		$('#top1menu').addClass('on');
	});
	$('#top1menu').mouseleave(function(event){
		$('#top1menu .top2m').stop().slideUp();
		$('#lnb .top2mbg').stop().slideUp();
		$('#top1menu').removeClass('on');
	});

	$('#top1menu .last').focusout(function(event){
		$('#top1menu .top2m').stop().slideUp();
		$('#lnb .top2mbg').slideUp();
		$('#top1menu').removeClass('on');
	});

});


$(document).ready(function(){
	//이미지 롤오버 
	 $(".overimg").mouseover(function (){
		var file = $(this).attr('src').split('/');
		var filename = file[file.length-1];
		var path = '';
		for(i=0 ; i < file.length-1 ; i++){
		 path = ( i == 0 )?path + file[i]:path + '/' + file[i];
		}
		$(this).attr('src',path+'/'+filename.replace('_off.','_on.'));
		
	 }).mouseout(function(){
		var file = $(this).attr('src').split('/');
		var filename = file[file.length-1];
		var path = '';
		for(i=0 ; i < file.length-1 ; i++){
		 path = ( i == 0 )?path + file[i]:path + '/' + file[i];
		}
		$(this).attr('src',path+'/'+filename.replace('_on.','_off.'));
	 });

});


function tabOn(tabid,a,img) {
    var $tab,$tab_btn;
    var tabid=tabid, a=a-1, btn_img=img;

    $tab = $('#'+tabid+'> ul > li');
    $tab_btn = $('#'+tabid+'> ul > li > a');

    $tab_btn.siblings().hide();
    $tab.eq(a).addClass('active');
    $tab.eq(a).children('a').addClass('on').siblings().show();

    if(btn_img =='img'){  
         var btn = $tab.eq(a).children('a').find("img");
         btn.attr("src",btn.attr("src").replace("_off","_on"));
     }

    $tab_btn.bind("click",function(event){
        if(btn_img =='img'){  
            for(var i=0;i<$tab.size();i++){
                var btn = $tab.eq(i).children('a').find("img");
                btn.attr("src",btn.attr("src").replace("_on","_off"));
            };
            var active = $(this).parent().attr('class');
            if(active != 'active'){
                var btn_img_off = $(this).find('img')[0];
                btn_img_off.src =  btn_img_off.src.replace('_off','_on');  
            }        
        }
        
        $tab_btn.removeClass('on').siblings().hide();
        $tab_btn.parent().removeClass('active');
        
        $(this).addClass('on').siblings().show();
        $(this).parent().addClass('active');

        event.preventDefault ();
    });
} 

function tabOrg(tabid,a,img) {

    var $tab, $tab_btn,$obj,$obj_view;
    var tabid=tabid, num=a, btn_img=img;

    $tab = $('#'+tabid+' .tab_item  > li');
    $tab_btn = $('#'+tabid+' .tab_item > li > a');
    $obj = $('#'+tabid+' .tab_obj');
    $obj_view = $('#'+tabid+' .tab_obj.n'+num);

    $tab.eq(num-1).addClass('active');
    $obj_view.show();

    if(btn_img =='img'){  
        var btn = $tab.eq(num-1).children('a').find("img");
        btn.attr("src",btn.attr("src").replace("_off","_on"));
    }

    $tab.bind("click",function(event){
        if(btn_img =='img'){  
            for(var i=0;i<$tab.size();i++){
                var btn = $tab.eq(i).children('a').find("img");
                btn.attr("src",btn.attr("src").replace("_on","_off"));
            };
            var active = $(this).parent().attr('class');
            if(active != 'active'){
                var btn_img_off = $(this).find('img')[0];
                btn_img_off.src =  btn_img_off.src.replace('_off','_on');  
            }        
        }

        var this_eq = $tab.index( $(this) );
        $tab.removeClass('active');
        $tab.eq(this_eq).addClass('active');

        $obj.hide();
        $('#'+tabid+' .tab_obj.n'+(this_eq+1)).show();

        event.preventDefault ();
    });
} 


