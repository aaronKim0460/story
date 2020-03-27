// Top Menu (LNB)
/*
function initNavigation(seq) {
	nav = document.getElementById("lnb");
	nav.menu = new Array();
	nav.current = null;
	nav.menuseq = 0;
	navLen = nav.childNodes.length;
	
	allA = nav.getElementsByTagName("a")

	for(k = 0; k < allA.length; k++) {
		allA.item(k).onmouseover = allA.item(k).onfocus = function () {
			nav.isOver = true;
		}
		allA.item(k).onmouseout = allA.item(k).onblur = function () {
			nav.isOver = false;
			setTimeout(function () {
				if (nav.isOver == false) {
					if (nav.menu[seq])
						nav.menu[seq].onmouseover();
					else if(nav.current) {
						menuImg = nav.current.childNodes.item(0);
						menuImg.src = menuImg.src.replace("_on.html", ".gif");
						//menuImg.src = menuImg.outImg;
						if (nav.current.submenu)
							nav.current.submenu.style.display = "none";
						nav.current = null;
						try { document.getElementById("welcome_msg").style.display = "block"; } catch (e) {}
					}
				}
			}, 500);
		}
	}

	for (i = 0; i < navLen; i++) {
		navItem = nav.childNodes.item(i);
		if (navItem.tagName != "LI")
			continue;

		navAnchor = navItem.getElementsByTagName("a").item(0);
		navAnchor.submenu = navItem.getElementsByTagName("ul").item(0);
		
		navAnchor.onmouseover = navAnchor.onfocus = function () {
			if (nav.current) {
				menuImg = nav.current.childNodes.item(0);
				menuImg.src = menuImg.src.replace("_on.html", ".gif");
				//menuImg.src = menuImg.outImg;
				if (nav.current.submenu)
					nav.current.submenu.style.display = "none";
				nav.current = null;
			}
			if (nav.current != this) {
				menuImg = this.childNodes.item(0);
				//menuImg.src = menuImg.src.replace(".gif", "_on.html");
				//menuImg.src = menuImg.overImg;
				if (this.submenu)
					this.submenu.style.display = "block";
				nav.current = this;
				try { document.getElementById("welcome_msg").style.display = "none"; } catch (e) {}
			}
			nav.isOver = true;
		}
		nav.menuseq++;
		nav.menu[nav.menuseq] = navAnchor;
	}
	if (nav.menu[seq])
		nav.menu[seq].onmouseover();
}
// 
*/
function initNavigation(seq) {
	return true;
}

function initNavigation(seq) {
return true;
}
function imgMenuOver(containderID) {
	var objwrap = document.getElementById(containderID);
	var imgMenu = objwrap.getElementsByTagName("a");

	for (i=0; i<imgMenu.length; i++) {
		if(imgMenu[i].getElementsByTagName("img").length == 0) continue;

		if (imgMenu[i].getElementsByTagName("img")[0].src.indexOf("_on.html") != -1 ) {
			continue;
		}
		imgMenu[i].onmouseover = function() {
			subImage = this.getElementsByTagName("img")[0];
			if (subImage.src.indexOf("_on.html") != -1) return false;
			subImage.src = subImage.src.replace(".gif","_on.html");
		}
		imgMenu[i].onfocus = function() {
			subImage = this.getElementsByTagName("img")[0];
			if (subImage.src.indexOf("_on.html") != -1) return false;
			subImage.src = subImage.src.replace(".gif","_on.html");
		}
		imgMenu[i].onmouseout = function() {
			subImage = this.getElementsByTagName("img")[0];
			subImage.src = subImage.src.replace("_on.html", ".gif");
		}
		imgMenu[i].onblur = function() {
			subImage = this.getElementsByTagName("img")[0];
			subImage.src = subImage.src.replace("_on.html", ".gif");
		}
	}
}


function initTabMenu(tabContainerID) {
	var tabContainer = document.getElementById(tabContainerID);
	var tabAnchor = tabContainer.getElementsByTagName("a");
	var i = 0;

	for(i=0; i<tabAnchor.length; i++) {
		if (tabAnchor.item(i).className == "tabbtn")
			thismenu = tabAnchor.item(i);
		else
			continue;

		thismenu.container = tabContainer;
		thismenu.targetEl = document.getElementById(tabAnchor.item(i).href.split("#")[1]);
		thismenu.targetEl.style.display = "none";
		thismenu.imgEl = thismenu.getElementsByTagName("img").item(0);
		thismenu.onclick = function tabMenuClick() {
			currentmenu = this.container.current;
			if (currentmenu == this)
				return false;

			if (currentmenu) {
				currentmenu.targetEl.style.display = "none";
				if (currentmenu.imgEl) {
					currentmenu.imgEl.src = currentmenu.imgEl.src.replace("_on.gif", ".gif");
				} else {
					currentmenu.className = currentmenu.className.replace(" on", "");
				}
			}
			this.targetEl.style.display = "";
			if (this.imgEl) {
				this.imgEl.src = this.imgEl.src.replace(".gif", "_on.gif");
			} else {
				this.className += " on";
			}
			this.container.current = this;

			return false;
		};

		if (!thismenu.container.first)
			thismenu.container.first = thismenu;
	}
	if (tabContainer.first)
		tabContainer.first.onclick();
}



function menuOn(imgEl)
{
  imgEl.src = imgEl.src.replace(".gif", "_on.html");
}

function menuOut(imgEl)
{
  imgEl.src = imgEl.src.replace("_on.html", ".gif");
}


function showLayer(id) {
    document.getElementById(id).style.visibility="visible";
}
function hideLayer(id) {
    document.getElementById(id).style.visibility="hidden";
}


function showMenu(id) {
	var dip = document.getElementById(id).style.display;
		if (dip == "block") {
        document.getElementById(id).style.display="none";
		document.getElementById('menu_open').style.display="block";
		document.getElementById('menu_close').style.display="none";
    } else {
        document.getElementById(id).style.display="block";
		document.getElementById('menu_open').style.display="none";
		document.getElementById('menu_close').style.display="block";
    }
}

// 

function initToggle(tabContainer) {
	triggers = tabContainer.getElementsByTagName("a");

	for(i = 0; i < triggers.length; i++) {
		if (triggers.item(i).href.split("#")[1])
			triggers.item(i).targetEl = document.getElementById(triggers.item(i).href.split("#")[1]);

		if (!triggers.item(i).targetEl)
			continue;

		triggers.item(i).targetEl.style.visibility = "hidden";
		triggers.item(i).onclick = function () {
			if (tabContainer.current == this) {
				this.targetEl.style.visibility = "hidden";
				tabContainer.current = null;
			} else {
				if (tabContainer.current) {
					tabContainer.current.targetEl.style.visibility = "hidden";
					tabContainer.current.style.fontWeight = "normal";
				}
				this.targetEl.style.visibility = "visible";
				tabContainer.current = this;
			}
			return false;
		}
	}
}

// 濱
function initMoving(target, position, topLimit, btmLimit) {
	if (!target)
		return false;

	var obj = target;
	obj.initTop = position;
	obj.topLimit = topLimit;
	obj.bottomLimit = document.documentElement.scrollHeight - btmLimit;

	obj.style.position = "absolute";
	obj.top = obj.initTop;
	obj.left = obj.initLeft;

	if (typeof(window.pageYOffset) == "number") {
		obj.getTop = function() {
			return window.pageYOffset;
		}
	} else if (typeof(document.documentElement.scrollTop) == "number") {
		obj.getTop = function() {
			return document.documentElement.scrollTop;
		}
	} else {
		obj.getTop = function() {
			return 0;
		}
	}

	if (self.innerHeight) {
		obj.getHeight = function() {
			return self.innerHeight;
		}
	} else if(document.documentElement.clientHeight) {
		obj.getHeight = function() {
			return document.documentElement.clientHeight;
		}
	} else {
		obj.getHeight = function() {
			return 500;
		}
	}

	obj.move = setInterval(function() {
		if (obj.initTop > 0) {
			pos = obj.getTop() + obj.initTop;
		} else {
			pos = obj.getTop() + obj.getHeight() + obj.initTop;
			//pos = obj.getTop() + obj.getHeight() / 2 - 15;
		}

		if (pos > obj.bottomLimit)
			pos = obj.bottomLimit;
		if (pos < obj.topLimit)
			pos = obj.topLimit;

		interval = obj.top - pos;
		obj.top = obj.top - interval / 3;
		obj.style.top = obj.top + "px";
	}, 30)
}

// 투명 PNG (스크립트)
function setPng24(obj) {
    obj.width=obj.height=1;
    obj.className=obj.className.replace(/\bpng24\b/i,'');
    obj.style.filter =
    "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');"
    obj.src=''; 
    return '';
        }

/*
  $(function(){
	  // lnb
	 $("body").prepend('<div class="lnb_bg"></div>');
	$("#lnb li").not("li:last").mouseover(function(){
		$(this).find("ul").show();
		$(".lnb_bg").show();
	});
	$("#lnb").mouseout(function(){
		$(this).find("ul").hide();
		$(".lnb_bg").hide();
	});

	// sitemap
	$(".sitemap").click(function(){
		$("#sitemap_pop").show();
	});
	$("#sitemap_pop .close").click(function(){
		$("#sitemap_pop").hide();
	});

	// 愿�④린愿
	$("#research .btn").click(function(){
		$("#banner_pop").show();
	});
	$("#banner_pop .close").click(function(){
		$("#banner_pop").hide();
	});


  });
*/


/*//2013-12-24 수정
$(function(){
	//2014-05-07 
	$('.util dd a').focus(function(){
		allmenuClose();
	});

//	$('#lnb li a, #lnb li ul li a, ,#lnb li ul, .gnb_bank').mouseover(function(){
	$('#lnb li a, #lnb li ul li a, ,#lnb li ul').mouseover(function(){	
		$('.gnb_bank').css('height','356px');
		$('#lnb li ul').css('visibility','visible');
	});
//	$('#lnb li a, #lnb li ul li a, ,#lnb li ul, .gnb_bank').focus(function(){
	$('#lnb li a, #lnb li ul li a, #lnb li ul').focus(function(){
		$('.gnb_bank').css('height','356px');
		$('#lnb li ul').css('visibility','visible');
	});
	$('.new_zoom a').focus(function(){
		$('.gnb_bank').css('height','40px');
		$('#lnb li ul').css('visibility','hidden');
	})
	// 2014-05-12 추가
	$('.col_left .wrap_snb ul li a').focus(function(){
		$('.gnb_bank').css('height','40px');
		$('#lnb li ul').css('visibility','hidden');
	})
	$('.gnb_bank').mouseout(function(){
		$('.gnb_bank').css('height','40px');
		$('#lnb li ul').css('visibility','hidden');
	});
})*/

//2014-05-07
function allmenuClose(){
	$('.gnb_bank').css('height','40px');
	$('#lnb li ul').css('visibility','hidden');
}

// 퀵 스크립트 추가
$(document).ready(function () {
	var obj = $("#quick");
	var top = obj.position().top;
	obj.animate({ "top": $(document).scrollTop() + top + "px" }, 500);
	$(window).scroll(function () {
		obj.stop();
		obj.animate({ "top": $(document).scrollTop() + top + "px" }, 1000);
	});

});


function movePage(objStr){
	
	location.href = objStr;
}
