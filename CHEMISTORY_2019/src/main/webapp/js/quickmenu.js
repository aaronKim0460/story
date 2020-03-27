(function(){
    "use strict";
    
    /* QuickMenu Postion */
    var initTop = 130; //공통 탑메뉴 높이
    var screenWidth = 0;  
    var screenHeight = 0;
    var initLeft = 0;    
    var maxTop = 0;
    
    $("#m_quickmenu").css("top",initTop);
    
    $(window).resize(function(){
        screenWidth = document.body.offsetWidth;
        screenHeight = document.body.offsetHeight;
        
        maxTop = parseInt(screenHeight)-520; // 520 = footer높이(180) + 퀵메뉴높이(332) + 여백
        initLeft = Math.ceil(parseInt(screenWidth) / 2) + 510; //510 = 콘텐츠영역/2 + 여백 10px

        /* Display Quick Menu */
        $("#m_quickmenu").css("left",initLeft+"px").css("display","block");  
    }).resize();  
    
    $(window).scroll(function(event){
        var scrollpx = $(window).scrollTop();
        if(scrollpx > maxTop){
            scrollpx = maxTop;
        }
        $("#m_quickmenu").stop().animate({"top":scrollpx+initTop+"px"},500); //500ms속도의 애니메이션 효과 jquery의 장점이용
    });
})();