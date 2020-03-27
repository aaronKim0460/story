
(function($) {
	$.fn.tabs = function(options) {
	    
	    var defaults = {			
            tab: '.tab1',
            ul: '#tab1_ ul',
            iframe: '#tab2_ iframe',
            img: ''
    	};
		
		var IMG_ROOT = "/kor/images/2011/images/main/tab_main";
	
	    var obj = $(this);
	    var o = $.extend(defaults,options);
		var tabSub = $(o.tab+' li ',obj);
		var img = $(o.tab+' img ',obj);
		var tabUl= $(o.ul);
		var tabIframe= $(o.iframe);
		var s = tabUl.size();
		var img_src = IMG_ROOT; //+o.img; 
		//var s = $(o.tab,obj).children().size();

        $(tabSub).mouseover(function(){
            for(var i=1; i< s; i++)
            {
				var idx = i;
				if(o.tab == '.tab2') idx += 4;
                $(img.get(i-1)).attr('src',img_src+idx+'.gif');
                $(tabUl.get(i)).hide();
                if(o.tab == '.tab2')
				    $(tabIframe.get(i-1)).hide();
			}
			
            if(this == tabSub.get(1))
            {
                var idx = 2;
				if(o.tab == '.tab2') idx += 4;
                $(img.get(1)).attr('src',img_src+idx+'_on.gif');
                $(tabUl.get(2)).show();
                if(o.tab == '.tab2')
				    $(tabIframe.get(1)).show();
            } else if(this == tabSub.get(2))
            {
                var idx = 3;
				if(o.tab == '.tab2') idx += 4;
                $(img.get(2)).attr('src',img_src+idx+'_on.gif');
                $(tabUl.get(3)).show();
                if(o.tab == '.tab2')
				    $(tabIframe.get(2)).show();
            } else if(this == tabSub.get(3))
            {
                var idx = 4;
				if(o.tab == '.tab2') idx += 4;
                $(img.get(3)).attr('src',img_src+idx+'_on.gif');
                $(tabUl.get(4)).show();
                if(o.tab == '.tab2')
				    $(tabIframe.get(3)).show();
            } else
            {
                var idx = 1;
				if(o.tab == '.tab2') idx += 4;
                $(img.get(0)).attr('src',img_src+idx+'_on.gif');
                $(tabUl.get(1)).show();
                if(o.tab == '.tab2')
				    $(tabIframe.get(0)).show();
            }
        });
        
        $(tabSub).click(function(){
            if(this == tabSub.get(1))
            {
                var idx = 2;
				if(o.tab == '.tab2') idx += 4;
                $(img.get(1)).attr('src',img_src+idx+'_on.gif');
            } else if(this == tabSub.get(2))
            {
                var idx = 3;
				if(o.tab == '.tab2') idx += 4;
                $(img.get(2)).attr('src',img_src+idx+'_on.gif');
            } else if(this == tabSub.get(3))
            {
                var idx = 4;
				if(o.tab == '.tab2') idx += 4;
                $(img.get(3)).attr('src',img_src+idx+'_on.gif');
            } else
            {
                var idx = 1;
				if(o.tab == '.tab2') idx += 4;
                $(img.get(0)).attr('src',img_src+idx+'_on.gif');
            }
        });
	};
})(jQuery);