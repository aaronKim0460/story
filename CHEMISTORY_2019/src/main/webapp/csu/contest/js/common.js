function Flash(id,url,w,h,bg,t){
	document.writeln("<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width="+w+" height="+h+" id="+id+">");
	document.writeln("<param name='movie' value="+url+" />"); //�÷��� ���
	document.writeln("<param name='wmode' value="+t+" />");
	document.writeln("<param name='bgcolor' value="+bg+" />");
	document.writeln("<param name='allowScriptAccess' value='always' />");
	document.writeln("<param name='quality' value='high' />");
	document.writeln("<param name='menu' value='false' />");
	document.writeln("<embed src="+url+" wmode="+t+" width="+w+" height="+h+" name="+id+" bgcolor="+bg+" allowScriptAccess='always' quality='high' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />");
	document.writeln("</object>");
}

function ImageOver(imgEL){
 imgEL.src = imgEL.src.replace(".gif", "_on.gif");
}
function ImageOut(imgEL){
 imgEL.src = imgEL.src.replace("_on.gif", ".gif");
}

function characterCheck_board(str){
	var RegExp = /[\'\"\<\>\=]/gi;//정규식 구문
    var obj = document.getElementById(str);
    if (RegExp.test(obj.value)) {
        alert("특수문자는 입력하실 수 없습니다.");
        obj.value = obj.value.substring(0, obj.value.length - 1);//특수문자를 지우는 구문
    }
}