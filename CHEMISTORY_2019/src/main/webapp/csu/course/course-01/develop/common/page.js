
dir=location.href;
dir=dir.split("/");
var pageInfor=dir[dir.length-1];
var chasiInfor=dir[dir.length-2];
//var chasiInfor=chasiInfor.split("_");
//var chasiInfor= chasiInfor[1];
//alert(chasiInfor);
pageInfor=pageInfor.split(".htm");
pageInfor=pageInfor[0];

var learnflag = true;

var swfName="../common/main.swf?thisUrl="+pageInfor+"&chasiInfor="+chasiInfor+"&learnflag="+learnflag;
var swfID="UI";

function page_load() {
	var cNUM = parseInt(chasiInfor,10);
	var pNUM = parseInt(pageInfor,10);
	var prog = parent.progPageArr[cNUM];
	if(prog == pNUM) {
		parent.progFunc();
	}
}

function progressInfoSet() {

}

function jumpPage(pName){
	var pNUM = parseInt(pName,10);
	document.location=itostr(pNUM)+".html";
}

function movePage(pName){
	var pNUM = parseInt(pName,10);
	document.location=itostr(pNUM)+".html";
}

function moveModule(val){
	if(val=="next"){
		alert("마지막 페이지 입니다. 닫기 버튼을 클릭하세요.");
	}else if(val=="prev"){
		alert("첫번째 페이지 입니다.");
	}
}

function on_alert(action){
	if(action=="last"){
		alert('마지막 페이지입니다. 닫기 버튼을 클릭하세요.');
	}else if(action=="first"){
		alert('첫번째 페이지입니다.');
	}else{
		alert(action);
	}
}


function gotopage(stage,sco,page){	// 페이지 이동
	moveName=pageInfor.slice(0,7)+itostr(page+1)+".html";
	document.location=moveName;
}

function gotopage1(stage,sco,page){		// 스코 이동..
	moveName="../s"+itostr(stage)+"_sco"+itostr(sco)+"/index.htm";
	parent.document.location=moveName;
}


function on_save(){
	var imgURL=location.href;
	imgURL=imgURL.split(pageInfor);
	imgURL=imgURL[0]+"swf/down.swf";
	hidden_frame.document.write("<html>");
	hidden_frame.document.write("<head>");
	hidden_frame.document.write("<meta http-equiv='content-type' content='text/html; charset=euc-kr'>");
	hidden_frame.document.write("</head>");
	hidden_frame.document.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>");
    hidden_frame.document.write("<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='700' height='700'>");
	hidden_frame.document.write(" <param name='movie' value='"+imgURL+"'>");
	hidden_frame.document.write("<param name='quality' value='high'>");
	hidden_frame.document.write("<embed src='"+imgURL+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='700' height='700'></embed></object>");
	hidden_frame.document.write("</body>");
	hidden_frame.document.write("</html>");
	hidden_frame.document.execCommand('SaveAs',false,'down.html');
}

function flv_path(){
	return "../flv/";
	/*if(parent.jindo){
		return "rtmp://flash.cybermba.com/cybermba_nfs/"+course_id+"/";
	}else{
		return "../flv/";
	}*/
}

function on_url(val){
	url = val;
	authwin = window.open(url, "help", "menubar=no,toolbar=no,location=no,status=no,scrollbars=yes,resizable=yes,left=0,top=0,width=792,height=557");
	authwin.focus();
}

function winPopup(url, x, y){
	htmlURL="../"+url;
	SubOnPop = window.open(htmlURL, "" ,"toolbar=no, menubar=no, scrollbars=no, resizable=no, width="+x+", height="+y+", status=no,top==100, left=100");
	SubOnPop.focus();
}


function on_down(val){
	downlink=val;	
	htmlURL="../down/download.html";
	downWin = window.open(htmlURL,"","menubar=no,toolbar=no,location=no,status=no,scrollbars=no,resizable=no,width=200,height=100");
}

function on_opion(intVal){
	cc=parent.location.href;
	cc=cc.indexOf("index.html");
	if(cc==-1){
		//alert("LMS에서 지원하는 기능입니다.");
		//alert("샘플 강좌에는 지원되지 않습니다");
		alert("이 메뉴는 온라인 상에서만 구동됩니다.");
	}else{
		//alert(intVal)
		parent.cyberMBALMS_classroom_func("O2", discuss_num[intVal]);
	}
}

function on_Other_opion(intVal){
	cc=parent.location.href;
	cc=cc.indexOf("index.html");
	if(cc==-1){
		//alert("LMS에서 지원하는 기능입니다.");
		//alert("샘플 강좌에는 지원되지 않습니다");
		alert("이 메뉴는 온라인 상에서만 구동됩니다.");
	}else{
		parent.cyberMBALMS_classroom_func("O1", discuss_num[intVal]);
	}
}

// 강의노트
function learningkit() {
	window.open("learningkit.html","learningkit","toolbar=no,scrollbars=no,location=no,status=no,menubar=no,resizable=no,width=580,height=740")
}

// 강의노트 다운로드
function learningkit_down(a) {
	var fileName = a+".zip";
	on_down(fileName);
}

function itostr(inum){
	return inum<10?"0"+inum:inum;
}

// 암기노트
function note() {
	window.open("note.html","popup","toolbar=no,scrollbars=no,location=no,status=no,menubar=no,resizable=no,width=480,height=350")
}

// 용어사전
function dic() {
	window.open("dic.html","popup","toolbar=no,scrollbars=no,location=no,status=no,menubar=no,resizable=no,width=750,height=500")
}