String.prototype.trim = function() {
  return this.replace(/(^\s*)|(\s*$)/gi, "");
}

String.prototype.popupView = function() {
    var img_view = this;
    var x = x + 20 ;
    var y = y + 30 ;
    htmlz = "<html><head><title>이미지크게보기</title><style>body{margin:0;cursor:pointer;}</style></head><body scroll=auto onload='width1=document.getElementById(\"Timage\").width;if(width1>1024)width1=1024;height1=document.getElementById(\"Timage\").height;if(height1>768)height1=768;top.window.resizeTo(width1+30,height1+54);' onclick='top.window.close();'><img src='"+img_view+"' title='클릭하시면 닫힙니다.' name='Timage' id='Timage'></body></html>";
    imagez = window.open('', "image", "width="+ 100 +", height="+ 100 +", top=0,left=0,scrollbars=auto,resizable=1,toolbar=0,menubar=0,location=0,directories=0,status=1");
    imagez.document.open();
    imagez.document.write(htmlz);
    imagez.document.close();
}

var Alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
var Num   = '0123456789';
var NNum  = '123456789';
var AlphaNum = Alpha+Num;
var TableName = Alpha+Num+'_';

function chkSelect(objNm, initIndex, msg, isSet) {
	var obj = eval('document.'+objNm);
	var isselect = false;

	for (var i=initIndex; i<obj.options.length; i++) {
		if (obj.options[i].selected == true) {
			isselect = true;
			break;
		}
	}

	if (isselect) return true;
	else {
		//alert(msg + ' 선택해 주십시오');
		alert(msg+' '+lcBun.getMessage('js.info.common.select'));
		if (isSet == 'true') obj.focus();
		return false;	
	}
}

function getSelectedValue(objNm) {
	var obj = eval('document.'+objNm);

	for (var i=0; i<obj.options.length; i++) {
		if (obj.options[i].selected == true) {
			return obj.options[i].value;
		}
	}
}

function getSelectedText(objNm) {
	var obj = eval('document.'+objNm);

	for (var i=0; i<obj.options.length; i++) {
		if (obj.options[i].selected == true) {
			return obj.options[i].text;
		}
	}
}
function chkCheck(objNm, msg, isSet) {
	var obj = eval('document.'+objNm);
	var ischeck = false;

	// radio 나 checkbox가 한개만 있을 때에는 obj 에 property 'length'가 지원되지 않는다.
	// radio 나 checkbox가 여러개라고 해서 obj instanceof Array가 true 값을 리턴하지도 않는다.
	// 그래서 하는 수 없이 obj 가 length 객체를 갖는지 갖지 않는지에 따라 로직을 달리하기 위하여
	// 아래와 같은 삽질을...2010.08.03.KWShin.
	var isArray = true;
	if (""+obj.length == 'undefined') isArray = false;
	
	if (isArray) 
		for (var i=0; i<obj.length; i++) {
			if (obj[i].checked == true) {
				ischeck = true;
				break;
			}
		}
	else 
		if (obj.checked == true) ischeck = true;
	
	if (ischeck) return true;
	else {
		//alert(msg + ' 선택해 주십시오');
		alert(msg+' '+ lcBun.getMessage('js.info.common.select'));
		if (isSet == 'true') 
			if (isArray) obj[0].focus();
			else         obj.focus();
		return false;	
	}
}

function getCheckedValue(objNm) {
	var obj = eval('document.'+objNm);

	for (var i=0; i<obj.length; i++) {
		if (obj[i].checked == true) {
			return obj[i].value;
		}
	}
}

function chkEmail(objNm, limitByte, isSet) {
	var val = eval('document.'+objNm+'.value');

	//if (!chkLength(objNm, '이메일', limitByte, isSet)) return false;
	if (!chkLength(objNm, lcBun.getMessage('js.title.email'), limitByte, isSet)) return false;
	if (val.length > 0) {
		var arrMatch = val.match(/^(\".*\"|[A-Za-z0-9_-]([A-Za-z0-9_-]|[\+\.])*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z0-9][A-Za-z0-9_-]*(\.[A-Za-z0-9][A-Za-z0-9_-]*)+)$/);
    		if (arrMatch == null) {
			//alert('이메일주소가 올바르지 않습니다.\n다시 확인해주세요!');
			alert(lcBun.getMessage('js.info.check.email.addr.format'));
			if (isSet == 'true') eval('document.'+objNm+'.focus();');
        		return false;
	    	}
	}
	
	return true;
}

function chkChar(objNm, msg, isSet) {
	var val = eval('document.'+objNm+'.value');

	for (i=0; i<val.length; i++) {
		if(Alpha.indexOf(val.substring(i,i+1))<0) {
			//alert(msg+' 잘못된 문자가 있습니다\n특수문자는 입력할수 없습니다');
			alert(msg+' '+lcBun.getMessage('js.info.common.cant.special'));
			if (isSet == 'true') eval('document.'+objNm+'.focus();');
			return false;
		}
	}
	
	return true;
}

function chkCharNum(objNm, msg, isSet) {
	var val = eval('document.'+objNm+'.value');

	for (i=0; i<val.length; i++) {
		if(AlphaNum.indexOf(val.substring(i,i+1))<0) {
			//alert(msg+' 잘못된 문자가 있습니다\n특수문자는 입력할수 없습니다');
			alert(msg+' '+lcBun.getMessage('js.info.common.cant.special'));
			if (isSet == 'true') eval('document.'+objNm+'.focus();');
			return false;
		}
	}
	
	return true;
}

function chkTableName(objNm, msg, isSet) {
	var val = eval('document.'+objNm+'.value');

	for (i=0; i<val.length; i++) {
		if(TableName.indexOf(val.substring(i,i+1))<0) {
			//alert(msg+' 잘못된 문자가 있습니다\n특수문자는 입력할수 없습니다');
			alert(msg+' '+lcBun.getMessage('js.info.common.cant.special'));
			if (isSet == 'true') eval('document.'+objNm+'.focus();');
			return false;
		}
	}
	
	return true;
}

function chkNum(objNm, msg, isSet) {
	var val = eval('document.'+objNm+'.value');

	for (i=0; i<val.length; i++) {
		if(Num.indexOf(val.substring(i,i+1))<0) {
			//alert(msg+' 잘못된 숫자가 있습니다\n숫자 이외 문자는 입력할수 없습니다');
			alert(msg+' '+lcBun.getMessage('js.info.common.only.number'));
			if (isSet == 'true') eval('document.'+objNm+'.focus();');
			return false;
		}
	}
	
	return true;
}

function chkNNum(objNm, msg, isSet) {
	var val = eval('document.'+objNm+'.value');

	for (i=0; i<val.length; i++) {
		if(NNum.indexOf(val.substring(i,i+1))<0) {
			//alert(msg+' 잘못된 숫자가 있습니다\n자연수 이외 문자는 입력할수 없습니다');
			alert(msg+' '+lcBun.getMessage('js.info.common.only.nnumber'));
			if (isSet == 'true') eval('document.'+objNm+'.focus();');
			return false;
		}
	}
	
	return true;
}

function chkKor(objNm, msg, isSet) {
	var val = eval('document.'+objNm+'.value');
	var len = val.length;
	var codeLen = 0;
	for (i=0; i<len; i++) 
		(val.charCodeAt(i) > 255)? codeLen+=2:codeLen++;
	if (len != codeLen) {
		//alert(msg + ' 한글은 입력할 수 없습니다');
		alert(msg+' '+lcBun.getMessage('js.info.common.cant.hanguel'));
		if (isSet == 'true') eval('document.'+objNm+'.focus();');
		return false;
	}
	return true;
}

function chkBlank(objNm, msg, isSet) {

	var val = eval('document.'+objNm+'.value');
	if (val.indexOf(' ') >= 0) {
		//alert(msg+ ' 공백이 올수 없습니다');
		alert(msg+' '+lcBun.getMessage('js.info.common.cant.whitespace'));
		if (isSet == 'true') eval('document.'+objNm+'.focus();');
		return false;
	}
	return true;
}

function chkLength(objNm, msg, limitByte, isSet) {

	var b = 0;
	var val = eval('document.'+objNm+'.value');
	var len = eval('document.'+objNm+'.value.length');
    	for (i=0; i<len; i++) b = (val.charCodeAt(i) > 255) ? b+2:b+1;

	if (b > limitByte) {
		//alert(msg+' 입력은 '+limitByte+'byte 까지입니다');
		alert(msg+' '+lcBun.getMessage('js.info.common.limitByte', limitByte));
		if (isSet == 'true') eval('document.'+objNm+'.focus();');
		return false;
	}
	return true;
}

function chkValue(objNm, msg, isSet) {
	var val = eval('document.'+objNm+'.value');
	if (val.trim() == '') {
		//alert(msg+' 입력해 주십시오');
		alert(msg+' '+lcBun.getMessage('js.info.common.input'));
		if (isSet == 'true') eval('document.'+objNm+'.focus();');
		return false;
	}
	return true;
}

function chkBadCntt(objNm, msg, badWord, isSet) {
	if (badWord == 'null' || badWord == '')
		return true;
	var val = eval('document.'+objNm+'.value');	
	var bad = badWord.split(";");
	for (var i = 0; i < bad.length; i++) {
		
		if (bad[i].trim().length > 0 && val.indexOf(bad[i]) > -1) {
			//alert(msg+'에 '+bad[i]+'를 사용할 수 없습니다!');
			alert(msg+lcBun.getMessage('js.info.cant.bad', bad[i]));
			return false;
		}
	}
	return true;
}

function chkJumin(objNm1, objNm2) {
	var resiFirst = eval('document.'+objNm1+'.value');
	var resiLast = eval('document.'+objNm2+'.value');

	var chk = 0;
	var nYear   = resiFirst.substring(0,2);
	var nMondth = resiFirst.substring(2,4);
	var nDay    = resiFirst.substring(4,6);
	var nSex    = resiLast.charAt(0);

	for (i=0; i<resiFirst.length; i++) {
        	if(Num.indexOf(resiFirst.substring(i,i+1))<0) {
			//alert('주민등록번호 앞부분에 잘못된 문자가 있습니다');
			alert(lcBun.getMessage('js.info.jumin1.cant.char'));
			eval('document.'+objNm1+'.focus();');
			eval('document.'+objNm1+'.select();');
			return false;
		}
	}
	for (i=0; i<resiLast.length; i++) {
        	if(Num.indexOf(resiLast.substring(i,i+1))<0) {
			//alert('주민등록번호 뒷부분에 잘못된 문자가 있습니다');
			alert(lcBun.getMessage('js.info.jumin2.cant.char'));
			eval('document.'+objNm2+'.focus();');
			eval('document.'+objNm2+'.select();');
			return false;
		}
	}	
	
	if ( resiFirst.length!=6 ||  nMondth<1 || nMondth>12 || nDay<1 || nDay>31) {
		//alert('주민등록번호 앞부분이 잘못되었습니다');
		alert(lcBun.getMessage('js.info.jumin1.wrong'));
		eval('document.'+objNm1+'.focus();');
		eval('document.'+objNm1+'.select();');
		return false;
	}
	
	if ( resiLast.length!=7 || (nSex!=1 && nSex!=2 && nSex!=3 && nSex!=4) ) {
		//alert('유효하지않은 주민등록번호입니다!!');
		alert(lcBun.getMessage('js.info.jumin.invalid'));
		eval('document.'+objNm2+'.focus();');
		eval('document.'+objNm2+'.select();');
		return false;
	}
	
	var i;
	for (i=0; i<6; i++) {
		chk += ( (i+2) * parseInt( resiFirst.charAt(i) ));
	}
	
	for (i=6; i<12; i++) {
		chk += ( (i%8+2) * parseInt( resiLast.charAt(i-6) ));
	}
	
	chk = 11 - (chk%11);
	chk %= 10;
	
	if (chk != parseInt( resiLast.charAt(6))) {
		//alert('유효하지않은 주민등록번호입니다!!');
		alert(lcBun.getMessage('js.info.jumin.invalid'));
		eval('document.'+objNm1+'.focus();');		
		return false;
	}
	return true;
}

function link(addr) {
	if (addr == 'login.do') {
		loginPreprocess('LOGIN');
		return;
	} else if (addr == 'logout.do') {
		loginPreprocess('LOGOUT');
		return;
	}
	
	var val = Math.floor(Math.random() * 100000000);
	if (addr.indexOf('&') > -1 || addr.indexOf('?') > -1) {
		addr = addr + '&m=' + val;
	} else {
		addr = addr + '?m='+ val;
	}

	window.open(addr, '_self');
}

function viewMyMessage(addr) {
	window.open(addr, '_blank', 'width=450, height=500');
}

function back() {
	window.history.back();
}

function loginPreprocess(flag) {
	var current = getCurrentpage();
	var t = document.commandForm;
	
	var cmd = '';
	current = (t.boardId.value.trim().length > 0 && t.bltnNo.value.trim().length > 0 ? 'board-read.do' : current);
	if (current == 'board-read.do') cmd = 'READ';	
	else if (current == 'board-edit.do') {
		if (document.setTransfer) 
			cmd = document.setTransfer.command.value;
	}

	t.beforeCommand.value = cmd;
	t.rtnURI.value = current + getCurrentparameter();
	t.command.value = flag;
	t.action = flag.toLowerCase()+'.do';
	t.method = 'post';
	t.submit();
}

function getCurrentpage() {
	var temp = location.href;
	temp = temp.substring(temp.lastIndexOf('/')+1, temp.length);
	if (temp.lastIndexOf('?') > -1)
		temp = temp.substring(0, temp.lastIndexOf('?'));
		
	return temp;
}

function getCurrentparameter() {
	var temp = location.href;
	var current = getCurrentpage();
	if (temp.indexOf('?') > -1)
		temp = temp.substring(temp.lastIndexOf(current)+current.length, temp.length);
	else
		temp = '';
	return temp;
}

function imageResize() {
	var boardWidth = 650;
	if (document.setForm)
		boardWidth = document.setForm.boardWidth.value - 70;
	else if (document.setTransfer)
		boardWidth = document.setTransfer.boardWidth.value - 70;

	var obj = document.getElementsByName('ebImg');
	for (var i = 0; i < obj.length; i++) {
		if (obj[i].width > boardWidth)
			obj[i].width = boardWidth;
	}
}

/*******************************************************************************
 페이지의 URL parameter를 조작하는 유틸리티 함수.
 - parameter q: location.search
 - location.search 에 들어있는 패러미터들(&으로 분리된 key=value 쌍들로 이루어짐)
   을 &을 기준으로 분류하여 keyValuePairs에 할당하고,
   getValue(arg)를 호출하면 arg에 해당하는 패러미터의 값을 구해주고,
   getParameters()를 호출하면 전체 패러미터 목록을 구해준다. 
 *******************************************************************************/
function pageQuery(q) {
        if(q.length > 1) this.q = q.substring(1, q.length);
        else this.q = null;
        this.keyValuePairs = new Array();
        if(q) {
                for(var i=0; i < this.q.split("&").length; i++) {
                        this.keyValuePairs[i] = this.q.split("&")[i];
                }
        }
        this.getKeyValuePairs = function() { return this.keyValuePairs; }
        this.getValue = function(s) {
                for(var j=0; j < this.keyValuePairs.length; j++) {
                        if(this.keyValuePairs[j].split("=")[0] == s)
                                return this.keyValuePairs[j].split("=")[1];
                }
                return -1;
        }
        this.getParameters = function() {
                var a = new Array(this.getLength());
                for(var j=0; j < this.keyValuePairs.length; j++) {
                        a[j] = this.keyValuePairs[j].split("=")[0];
                }
                return a;
        }
        this.getLength = function() { return this.keyValuePairs.length; }        
}

/*******************************************************************
 설명 : parameter 값이 숫자,알파벳만 사용
        objValue   -> 체크 할 값
 *******************************************************************/
function isAlphaNumCheck(objValue)
{
	var ch = "\0";
	var a_flag = false;
	var n_flag = false;
	var flag = true;
	for(var i = 0, ch = objValue.charAt(i); (i<objValue.length) && (flag); ch = objValue.charAt(++i)) {
		if      ((ch >= '0') && (ch <= '9')) n_flag = true;
		else if ((ch >= 'a') && (ch <= 'z')) a_flag = true;
		else if ((ch >= 'A') && (ch <= 'Z')) a_flag = true;
		else {
			return false;
		}
	}
	return true;
}

/*******************************************************************
 설명 : parameter 값이 숫자만 사용
        objValue   -> 체크 할 값
 *******************************************************************/
function isNumCheck(objValue)
{
	var ch = "\0";
	var a_flag = false;
	var n_flag = false;
	var flag = true;
	for(var i = 0, ch = objValue.charAt(i); (i<objValue.length) && (flag); ch = objValue.charAt(++i)) {
		if ((ch >= '0') && (ch <= '9')) n_flag = true;
  		else {
  			return false;
  		}
  	}
	return true;
}

/*******************************************************************
 설명 : docmember_sno1 : 주민번호 앞자리 6자리
        docmember_sno2 : 주민번호 뒷자리 7자리
 *******************************************************************/
function checkJuminNum( docmember_sno1, docmember_sno2 ) {
	var sum;
	sum = 0;
	
	sum += docmember_sno1.charAt(0)*2;
	sum += docmember_sno1.charAt(1)*3;
	sum += docmember_sno1.charAt(2)*4;
	sum += docmember_sno1.charAt(3)*5;
	sum += docmember_sno1.charAt(4)*6;
	sum += docmember_sno1.charAt(5)*7;
	
	sum += docmember_sno2.charAt(0)*8;
	sum += docmember_sno2.charAt(1)*9;
	sum += docmember_sno2.charAt(2)*2;
	sum += docmember_sno2.charAt(3)*3;
	sum += docmember_sno2.charAt(4)*4;
	sum += docmember_sno2.charAt(5)*5;
	check = ( 11 - sum % 11 ) % 10;
	if(docmember_sno2.charAt(6) != check || (docmember_sno1.length != 6 && docmember_sno2.length != 7)) {
		return false;
	}
	if(!(docmember_sno2.charAt(0) == '1' || docmember_sno2.charAt(0) =='2' || docmember_sno2.charAt(0) == '3' || docmember_sno2.charAt(0) == '4')) {
		return false;
	}
	return true;
}


/*******************************************************************
 설명 : 윤년(큰2월달 로직 포함) 체크.
 *******************************************************************/
function checkDate( v_year,v_month,v_day ) {

	var err=0;
	if( v_year.length  != 4 ) err=1;
	if( v_month.length != 1 && v_month.length != 2 ) err = 1;
	if( v_day.length   != 1 && v_day.length   != 2 ) err = 1;

	r_year  = eval( v_year ); 
	r_month = eval( v_month ); 
	r_day   = eval( v_day ); 

	if( r_month < 1 || r_month > 12 ) err = 1;
	if( r_day   < 1 || r_day   > 31 ) err = 1;
	if( r_year  < 0 ) err = 1;


	if( r_month==4 || r_month==6 || r_month==9 || r_month==11 ) {
		if( r_day == 31 ) err=1;
	}

	// 2,윤년체크
	if( r_month == 2 ) {
		var g = parseInt( r_year / 4 );

		if( isNaN( g )) {
			err = 1;
		}
		if( r_day >  29 ) err=1;
		if( r_day == 29 && (( r_year / 4 ) != parseInt( r_year / 4 ))) err=1;
	}

	if( err == 1 ) {
		return false;
	} else {
		return true;
	}
}

/*******************************************************************
 설명 : 정해진 길이만큼 입력되면 다음 필드로 커서가 자동으로 움직인다.
 매개변수 : form명, 현재입력필드명, 현재입력필드길이, 커서가 가야할 필드명
 *******************************************************************/
function autoJump( curFrm, curFld, curLen, nextFld ) {
	if( eval('document.'+curFrm+'.'+curFld+'.value.length') == curLen ) {
		eval('document.'+curFrm+'.'+nextfield+'.focus()');
	}
}

/*******************************************************************
 설명 : 엔터키 처리
 *******************************************************************/
function isEnterKey( evt ) {
	evt = (evt) ? evt : (window.event) ? window.event : "";
	
	var theKey;
	if( evt ) theKey = ( evt.which ) ? evt.which : evt.keyCode;

	return ( theKey == 13 );
}

/*******************************************************************
 설명 : Map 객체 정의
 *******************************************************************/
function Map() {
    this.keySet = new Object();
    this.values = new Object();
    this.size   = 0;
}
Map.prototype.put = function(key,value) {
    if (!this.isValidKey(key)) {
        throw new Error('Map put method called without specifying a valid key');
    }
    var index;
    if (this.containsKey(key)) {
        for (var i=0; i<this.size; i++) {
            if (this.keySet[i] == key) {
                index = i;
                break;
            }
        }
    } else {
        index = this.size;
        this.keySet[index] = key;
        this.size++;
    }
    this.values[index] = value;
};
Map.prototype.getSize = function() {
	return this.size;
}
Map.prototype.remove = function(key) {
    if (!this.isValidKey(key)) {
        throw new Error('Map remove method used with invalid key: '+key);
    }
    if(!this.containsKey(key)) {
        return;
    }
    var index;
    for (var i=0; i<this.size; i++) {
        if(this.keySet[i] == key) {
            index = i;
            break;
        }
    }
    delete this.keySet[index];
    delete this.values[index];
    for(var i=index; i<this.size-1; i++) {
        this.keySet[i] = this.keySet[i+1];
        this.values[i] = this.values[i+1];
    }
    delete this.keySet[this.size-1];
    delete this.values[this.size-1];
    this.size--;
};
Map.prototype.removeAll = function() {
	this.keySet=new Object();
    this.values=new Object();
    this.size=0;
}
Map.prototype.containsKey = function(key) {
    if(this.get(key)!=null) {
        return true;
    }
    return false;
};
Map.prototype.getKeySet = function() {
    return this.keySet;
};
Map.prototype.get = function(key) {
    var value = null;
    if (!key) {
        return null;
    }
    for (var i=0; i<this.size; i++) {
        if (this.keySet[i] == key) {
            value = this.values[i];
            break;
        }
    }
    return value;
};
Map.prototype.isValidKey = function(key) {
    if (key == null) {
        return false;
    }
    return true;
};
