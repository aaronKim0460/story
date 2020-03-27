function setObjAbled(obj) {
	var strType = obj.type ;
	switch(strType) {
		case "text" :
			obj.value = "" ;
			obj.readOnly = false ;
			break ;
		case "radio" :
			obj.disabled = false ;
			break ;
		case "checkbox" :
			obj.disabled = false ;
			break ;
	}
}
function setObjDisabled(obj) {
	var strType = obj.type ;
	switch(strType) {
		case "text" :
			obj.value = "" ;
			obj.readOnly = true ;
			break ;
		case "radio" :
			obj.disabled = true ;
			break ;
		case "checkbox" :
			obj.disabled = true ;
			break ;
	}
}
function setCheckedTag(obj, val) {
	for(var i=0 ; i<obj.length; i++) {
		if(obj[i].value == val) {
			obj[i].checked = true ;
		}
	}
}

function chkByteCheck(obj, min, max, msg) {
	var len = length(obj.value) ;
	if(len < min || len > max) {
		alert(msg+" 최소 "+min+"Byte에서 최대 "+max+"Byte까지 입력가능합니다.");
		obj.focus();
		return false ;
	}
	return true ;
}

function chkEngNum(obj, msg) {
	var str = obj.value ;
	if(str == null || str == "" ) {
		return true
	}
	if( str.match(/[^a-zA-Z0-9]/) != null ) {
		alert(msg+" 숫자와 영문만 입력할 수 있습니다.");
		obj.focus();
		return false;
	}
	return true ;
}

function chkNumber(obj, msg) {
	var str = obj.value ;
	if(str == null || str == "" ) {
		return true
	}
	if( str.match(/[^0-9]/) != null ) {
		alert(msg+" 숫자만 입력할 수 있습니다.");
		obj.focus();
		return false;
	}
	return true ;
}

function length(str, len, tail) {
	if(!tail) {
		tail="";
	}
	var l=0, c=0, l2=0, u="", s="";
	if(len>0) {
		l2=len;
	}
	for(var i=0;u=str.charCodeAt(i);i++) {
		if (u>127) l+=2;
		else l++;
		if(l2) {
			s+=str.charAt(i); 
			if(l>=l2)
			{
				if(l>l2) s=s.substring(0,l2-1);
				return s+tail;
			}
		}
	}
	return l2 ? s:l;
}


function isCheckBox(obj) {
	var len = obj.length ;
	var result = false ;
	if(len == undefined) {
		if(obj.checked) {
			result = true ;
		}
	}else{
		for(var i=0; i<len; i++) {
			if(obj[i].checked) {
				result = true ;
				break ;
			}
		}
	}
	if(!result) {
		alert("선택된 체크박스가 없습니다.");
	}
	return result ;
}

function setCheckBoxAll(obj, checkObjName) {
	//getElementById는 쓰지 않는다, id는 unique 해야한다, HTML 표준검사 ID중복안됨
	var checkObj = document.getElementsByName(checkObjName);
	var check = obj.checked ;
	var len = checkObj.length ;
	if(len == undefined) {
		checkObj.checked = check ;
	}else{
		for(var i=0; i<len; i++) {
			checkObj[i].checked = check ;
		}
	}

}

function setAllSelect(obj, arg) {
	if(obj == null) {
		return false ;
	}
	var cnt  = obj.length ;
	if(cnt ==0) {
		return false ;
	}
	for (var i = 0; i <cnt ; i++) {
		obj.options[i].selected = arg;
	}
	return true ;

}

function chkDateBetweenCheck(argFrom,argTo,argSign){	
	var intFrom = parseInt(setReplace(argFrom,argSign,""));
	var intTo = parseInt(setReplace(argTo,argSign,""));
	if((intFrom-intTo)>0) {
		return false;
	}
	return true;
}

function chkDateCheck(str) {
	var flag = true ;
	var len = length(str) ;
	if(len != 10) {
		alert("날짜형식은 YYYY.MM.DD 입니다.");
		return false ;
	}
	var strDay = null ;
	try {
		strDay = str.split(".");
	}catch (e) {
		alert("날짜형식은 YYYY.MM.DD 입니다.");
		return false ;
	}
	if(strDay.length != 3) {
		alert("날짜형식은 YYYY.MM.DD 입니다.");
		return false ;
	}
	var strYear = strDay[0] ;
	var strMonth = strDay[1]-1 ;
	var strDate = strDay[2] ;
	var resultDate = new Date(strYear, strMonth, strDate);
	if (resultDate.getFullYear() != strYear || resultDate.getMonth() != strMonth 
		|| resultDate.getDate() != strDate) {
		alert("날짜형식은 YYYY.MM.DD 입니다.");
		return false ;
	}
	return true ;
}
function chkDate(obj) {
  var input = obj.value.replace(/-/g,"");
  var inputYear = input.substr(0,4);
  var inputMonth = input.substr(4,2) - 1;
  var inputDate = input.substr(6,2);
  var resultDate = new Date(inputYear, inputMonth, inputDate);
  if ( resultDate.getFullYear() != inputYear ||
       resultDate.getMonth() != inputMonth ||
       resultDate.getDate() != inputDate) {
    obj.value = "";
  } else {
    obj.value = inputYear + "-" + input.substr(4,2) + "-" + inputDate;
  }
}
/**
  *이름 : ncCom_Replace()
  *설명 : 한글문자열길이만큼 가져옴
  *인자 : originalString : 문자열
  *		  findText : 찾을 문자열
  *          replaceText : 바꿔야할 문자열
  *리턴 : 문자열
  *ex) ncCom_Replace('테스트다','스','타') = ' 테타트다'
 */
function setReplace(originalString, findText, replaceText){

	originalString = setTrim(originalString)

	var pos = 0
	var preStr = ""
	var postStr = ""

	pos = originalString.indexOf(findText)
	while (pos != -1) {
		preString = originalString.substr(0,pos)
		postString = originalString.substring(pos+findText.length)
		originalString = preString + replaceText + postString
		pos = originalString.indexOf(findText)
	}

	return originalString
}

/**
  *이름 : ncCom_Trim()
  *설명 : 문자열 공백제거
  *인자 : 문자열
  *리턴 : 문자열
  *ex) ncCom_Trim(' 테스트다 ') = '테스트다'
 */
function setTrim(argStr) {
	if(argStr == null)
		return "";

	argStr = argStr.toString();

	var pos1, pos2
	for(pos1=0; (argStr.charAt(pos1) == ' ' || argStr.charAt(pos1) == '　') && pos1 < argStr.length ; pos1++) ;
		for(pos2=argStr.length-1; (argStr.charAt(pos2) == ' ' || argStr.charAt(pos2) == '　') && pos2 >= 0 ; pos2--) ;
			if(pos1 > pos2) return ""
	return argStr.substr(0,pos2+1).substring(pos1)
}

function transData(obj){
	eval("var data="+toTrim(obj));
	return data;
}
function toTrim(val){
	return val?val.replace(/(^\s*)|(\s*$)/g, ""):val;
}

function removeObject(sourceObj) {
	var obj = sourceObj.firstChild;
	var nextObj = null;
	try {
		while(1) {
			if (obj == null) break;
			nextObj = obj.nextSibling;
			sourceObj.removeChild(obj);
			obj = nextObj;
		}
	}catch(e) {
		alert(e);
	}		
}

function chkNull(argStr) {
	if (!argStr) return true;
	argStr = toTrim(argStr);
	if (argStr.length == 0) return true;
	for (var i = 0; i<argStr.length; i++) {
 		if ( (" " == argStr.charAt(i)) || ("　" == argStr.charAt(i)) )  {	}
		else return false;
	}
	return true;
}

function checkValue(obj) {
	if (obj == undefined ) {
		return "";
	}
	var cnt = obj.length ;
	var result  =  "" ;

	if (cnt ==  undefined ) {
		if( obj.checked == true )  return obj.value ;

	} else {
		for ( var i = 0 ; i < cnt ; i++ ) {

			if ( obj[i].checked == true )  return obj[i].value ;
		}
	}
	return "" ;
}