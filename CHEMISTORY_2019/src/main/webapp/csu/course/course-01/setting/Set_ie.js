document.writeln('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
document.writeln('codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="'+setWidth+'" height="'+setHeight+'" id='+setID+'>');
document.writeln('	<param name="movie" value='+setName+'>');
document.writeln('	<param name="quality" value="high">');
document.writeln('	<param name="menu" value="false">');
document.writeln('	<param name="wmode" value="transparent">');
if(setInfo){
document.writeln('	<param name="flashVars" value="pages='+setInfo+'">');
}
document.writeln('	<param name="allowScriptAccess" value="always" />');
document.writeln('	<embed src='+setName+' quality="high" menu="false" pluginspage="http://www.macromedia.com/go/getflashplayer" ');
document.writeln('	type="application/x-shockwave-flash" width="'+setWidth+'" height="'+setHeight+'"></embed></object>');
	