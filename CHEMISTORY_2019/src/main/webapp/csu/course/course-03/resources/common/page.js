/////////////////////////////////////////////////////////////////////////////////////////////////////
// @ type : ȯ��������� courseconfig.js ////////////////////////////////////////////////////
// @ date : 20120613 ////////////////////////////////////////////////////////////////////////////
// @ anthor : toryhyeon@cybermba.com //////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

dir=location.href;
dir=dir.split("/");
var pageInfor=dir[dir.length-1];
var chasiInfor=dir[dir.length-2];
pageInfor=pageInfor.split(".html")[0];


var swfName="../common/main.swf?thisPage="+pageInfor+"&thisChasi="+chasiInfor+"&course_code="+course_id;
var swfID="UI";

function page_load() {
	document.getElementById("UI").focus();
	var cNUM = parseInt(chasiInfor,10);
	var pNUM = parseInt(pageInfor,10);
	var prog = parent.progPageArr[cNUM];
	if(prog == pNUM) {
		//parent.progFunc();
	}
}
function jumpPage(pName){
	var pageNum = parseInt(pName,10);
	document.location=itostr(pageNum)+".html";
}

function movePage(pName){
	var pageNum = parseInt(pName,10);
	document.location=itostr(pageNum)+".html";
}

function moveModule(val){
	if(val=="next"){
		alert("������ ������ �Դϴ�. �ݱ� ��ư�� Ŭ���ϼ���.");
	}else if(val=="prev"){
		alert("ù��° ������ �Դϴ�.");
	}
}

function flv_path(){
	return "../flv/";
}


function on_down(val) {
	downlink=val;
	var htmlURL="../down/download.html";
	downWin = window.open(htmlURL,"","menubar=no,toolbar=no,location=no,status=no,scrollbars=no,resizable=no,width=250,height=100");
}

function itostr(inum){
	return inum<10?"0"+inum:inum;
}