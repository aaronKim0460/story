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
	 tHead();//어린이 환경유해인자 정보맵 부분
	 menuSOver(); //메인 메뉴 script
	 leftMenuS();
});
function leftMenuS(){
	var leftN;
	$(".subMenuUl li").each(function(){
		leftN = $(this).find("a").html();
		if(leftN.indexOf("국내어린이용품 환경유해인자 기준초과제품") > -1){
			leftN = "국내어린이용품 <br/>환경유해인자 <br/>기준초과제품";
			$(this).find("a").html(leftN);
		}
		if(leftN.indexOf("해외어린이용품 리콜현황") > -1){
			leftN = "해외어린이용품 <br/>리콜현황";
			$(this).find("a").html(leftN);
		}
		if(leftN.indexOf("어린이 환경유해인자 정보맵") > -1){
			leftN = "어린이 환경유해인자 <br/>정보맵";
			$(this).find("a").html(leftN);
		}
		if(leftN.indexOf("어린이활동공간 현황/시설") > -1){
			leftN = "어린이활동공간 <br/>현황/시설";
			$(this).find("a").html(leftN);
		}
		if(leftN.indexOf("어린이활동공간 확인검사제도") > -1){
			leftN = "어린이활동공간 <br/>확인검사제도";
			$(this).find("a").html(leftN);
		}
		if(leftN.indexOf("어린이활동공간 환경안심인증현황") > -1){
			leftN = "어린이활동공간 <br/>환경안심인증현황";
			$(this).find("a").html(leftN);
		}
	});
}

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

function contentsPrint(title) {
	var wv = 850;
	
	var options = {
		popHt : 600,
		popWd : wv,
		mode : "popup",
		popClose : false,
		popTitle : title,
		extraHead : '<meta charset="utf-8" />,<meta http-equiv="X-UA-Compatible" content="IE=edge"/>'
	};
	/* 인쇄기능이 짤림 */
	//$("#colgroup").printArea(options);
	$("#contents").printArea(options);
}

function showHide(n,m){
	if(m == "show"){
		$(n).stop().show(300);
	}else{
		$(n).hide();
	}
	
}
function tabS(num,tab,tabBox,thisN){
	$(tab).find("a").removeClass("on");
	$(thisN).addClass("on");
	$(tabBox).hide();
	$(tabBox).eq(num-1).show();
}

function tHead(){
	$(".tHead").click(function(){
		$(".mapSubTr").hide();
		$(".head h3").removeClass("on");
		$(this).find("h3").addClass("on")
		$(this).next(".mapSubTr").show(300);
	});
	
}
function menuS(n){
	$(".inbox").hide();
	$(".gnbMenuBoxUL > li").eq(n).find(".inbox").show();
	$(".gnbMenuBox").stop().animate({"height":330},300);
	//$(".topLayout").stop().animate({"height":345},300);
	
}
function menuSOver(){
	$(".gnbMenuBox").mouseleave(function(){
		$(".gnbMenuBox").stop().animate({"height":70},300);
		$(".inbox").hide();
		//$(".topLayout").stop().animate({"height":105},300);
	});
	$(".c1Style").delay(300).animate({"top":45},1000,"easeOutBounce");
	$(".c2Style").delay(600).animate({"top":25},1000,"easeOutBounce");
}

//이미지 에러일 때 사용
//onerror="imgError(this)";
function imgError(image){
	$(image).attr('src','/assets/kor/images/newMain/noimgs.png');
}