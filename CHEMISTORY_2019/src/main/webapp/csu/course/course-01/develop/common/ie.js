document.writeln('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
document.writeln('codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="'+swfWidth+'" height="'+swfHeight+'" id='+swfID+'>');
document.writeln('	<param name="movie" value='+swfName+'>');
document.writeln('	<param name="quality" value="high">');
document.writeln('	<param name="menu" value="false">');
document.writeln('	<param name="wmode" value="window">');
document.writeln('	<param name="allowScriptAccess" value="always" />');
document.writeln('	<embed src='+swfName+' quality="high" menu="false" pluginspage="http://www.macromedia.com/go/getflashplayer" ');
document.writeln('	type="application/x-shockwave-flash" width="'+swfWidth+'" height="'+swfHeight+'"></embed></object>');
document.writeln('<iframe name="hidden_frame" src="" frameborder="0" width="0" height="0" marginwidth="0" marginheight="0" scrolling="no" style="border:0"></iframe>');