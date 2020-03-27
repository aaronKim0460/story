//�レ옄, �뚰뙆踰노쭔 
function ChkAlNum(strValue) {
	for(var i=0; i<strValue.length;i ++) {
	var strCh = strValue.charAt(i).toUpperCase();
		if(strCh >="A" && strCh <="Z") {
			continue;
		}
		if(strCh >="0" && strCh <="9") {
			continue;
		}
		if(strCh =" ") {
			continue;
		}
		return false;
	} return true;
}

//怨듬갚泥댄겕
function ChkSpace(strValue) {
if (strValue.indexOf(" ")>=0) {
 return true; //怨듬갚�� �덈뒗寃쎌슦
}else {
 return false; // 怨듬갚�� �녿뒗 寃쎌슦
}
}

//�쒓�泥댄겕
function ChkHan(strValue) {
for(i=0;i<strValue.length;i++) {
 var a=strValue.charCodeAt(i);
 if (a > 128) {
 return true;
 }else{
 return false;
 }
}
}

//�レ옄泥댄겕
function ChkNum(x){ 
var x;
var anum=/(^\d+$)|(^\d+\.\d+$)/ 
if (anum.test(x)) 
 return true; //�レ옄留�
else{ 
 return false;	//�꾨땺寃쎌슱
} 
}


//二쇰��깅줉踰덊샇 泥댄겕
function ChkJumin(str_jumin1,str_jumin2) {
errfound = false;
var str_jumin1;
var str_jumin2;
var checkImg='';
var i3=0
for (var i=0;i<str_jumin1.length;i++) {
 var ch1 = str_jumin1.substring(i,i+1);
 if (ch1<'0' || ch1>'9') { i3=i3+1 }
}
if ((str_jumin1 == '') || ( i3 != 0 )) {
 return false;
}
var i4=0
for (var i=0;i<str_jumin2.length;i++) {
 var ch1 = str_jumin2.substring(i,i+1);
 if (ch1<'0' || ch1>'9') { i4=i4+1 }
}
if ((str_jumin2 == '') || ( i4 != 0 )) {
 return false;
}
if(str_jumin1.substring(0,1) < 4) {
 return false;
}
if(str_jumin2.substring(0,1) > 2) {
 return false;
}
if((str_jumin1.length > 7) || (str_jumin2.length > 8)) {
 return false;
}
if ((str_jumin1 == '72') || ( str_jumin2 == '18')) {
 return false;
}
var f1=str_jumin1.substring(0,1)
var f2=str_jumin1.substring(1,2)
var f3=str_jumin1.substring(2,3)
var f4=str_jumin1.substring(3,4)
var f5=str_jumin1.substring(4,5)
var f6=str_jumin1.substring(5,6)
var hap=f1*2+f2*3+f3*4+f4*5+f5*6+f6*7
var l1=str_jumin2.substring(0,1)
var l2=str_jumin2.substring(1,2)
var l3=str_jumin2.substring(2,3)
var l4=str_jumin2.substring(3,4)
var l5=str_jumin2.substring(4,5)
var l6=str_jumin2.substring(5,6)
var l7=str_jumin2.substring(6,7)
hap=hap+l1*8+l2*9+l3*2+l4*3+l5*4+l6*5
hap=hap%11
hap=11-hap
hap=hap%10
if (hap != l7) {
 return false;
}
var i9=0
if (!errfound)
return true;
}


//�대찓�� 泥댄겕
function ChkMail(strValue) {
if(ChkSpace(strValue)){
 //alert ("E硫붿씪 二쇱냼�먯꽌 怨듬��� 鍮쇱＜��떆��");
 return false;
}else if (strValue.indexOf("/")!=-1 || strValue.indexOf(";") !=-1 || ChkHan(strValue)) {
 //alert("E-Mail�뺤떇�� �섎せ�섏뿀�듬땲��.\n �ㅼ떆�쒕쾲 �뺤씤諛붾엻�덈떎.");
 return false;
}else if ((strValue.length != 0) && (strValue.search(/(\S+)@(\S+)\.(\S+)/) == -1)) {
 //alert("E-Mail�뺤떇�� �섎せ�섏뿀�듬땲��..\n �ㅼ떆�쒕쾲 �뺤씤諛붾엻�덈떎.");
 return false;
}else{
 return true;
}
}	

//�몃┝
function trim(ment){
var start;
var end;
for(i=0;i<ment.length;i++){
 mentcnt = ment.substring(i,i+1);
 if (mentcnt != ' '){
 start=i;
 break;
 }
}
for(i=ment.length - 1;i > -1; i--){
 mentcnt = ment.substring(i,i+1);
 if (mentcnt != ' ') {
 end=i;
 break
 }
}
str = ment.substring(start,end+1);
if (str == ' ') str = '';
return str;
}

//��젣, �섏젙
function check_pass(cmd,bltnNo){
	var x = screen.availWidth/2-450/2;
	var y = screen.availHeight/2-250/2;
	window.open("./passpop.jsp","","scrollbars=0,toolbar=0,location=no,resizable=yes,status=0,menubar=0,width=450px,height=250px,left="+x+",top="+y);
	
	document.setPass.cmd.value = cmd;
	document.setPass.bltnNo.value = bltnNo;

}
function check(cmd, bltnNo) {
	
	validatePassword();		
}

function quatCheck(str) {
	var chkstr = str.replace(/\'/gi, '\'\'');
	return chkstr;
}
//-->