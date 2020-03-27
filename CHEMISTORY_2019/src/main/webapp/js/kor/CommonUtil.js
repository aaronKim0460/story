/** CommonUtil.js
*
* 
*/

var STR_ROOT_PASS = "";

/** String.trim()  : 앞,뒷자리 공백제거
*
*/
   String.prototype.trim = function() {
       return this.replace(/(^\s*)|(\s*$)/g,"");
   }

/** String.ltrim() : 앞자리 공백제거
*
*/
   String.prototype.ltrim = function() {
       return this.replace(/(^\s*)/g, "");
   }

/** String.rtrim() : 뒷자리 공백제거
*
*/
   String.prototype.rtrim = function() {
       return this.replace(/(\s*$)/g, "");
   }

/**
* 하이픈('-') 제거
* <blockquote>
* strValue = "2005-09-04"
* strValue.fHipenDel()  --> "20050904"
* </blockquote>
* @param  : 없음
* @return : 하이픈('-')를 제거한 문자열
*/
String.prototype.fHipenDel = function() {
  var hipen = /-/gi;
  if ( this.length == 0 ) {
     return "";
  }
  return this.replace(hipen,'');
}

String.prototype.fCommaDel = function() {
  var comma = /,/gi;
  if ( this.length == 0 ) {
     return "";
  }
  return this.replace(comma,'');
}

/** String.lpad(padLength, padChar)  : 앞자리부터 임의문자 채우기
*
*/
   String.prototype.lpad = function(padLength, padChar) {
       padChar = padChar == null ? " " : padChar;
       var result = "";
       for (var i = 0, n = padLength - this.byteLength(); i < n; i++) {
           result += padChar;
       }

       return result + this;
   }

/** String.rpad(padLength, padChar)  : 뒤자리부터 임의문자 채우기
*
*/
   String.prototype.rpad = function(padLength, padChar) {
       padChar = padChar == null ? " " : padChar;
       var result = this;
       for (var i = 0, n = padLength - this.byteLength(); i < n; i++) {
           result += padChar;
       }

       return result;
   }

/** String.replaceAll(befStr, aftStr) : 특정문자(열) 모두 변환
*
*/
   String.prototype.replaceAll = function(from, to) {
       return this.replace(new RegExp(from, "g"), to);
   }

/** String.removeAll(Str) : 특정문자(열) 모두 삭제
*
*/
   String.prototype.removeAll = function(ch) {
       return this.replace(new RegExp(ch, "g"), "");
   }

/** String.reverse() : 문자열 거꾸로 배열
*
*/
   String.prototype.reverse = function() {
       var result = "";
       var i = this.length;

       while (i > 0) {
           result += this.charAt(--i);
       }

       return result;
   }

/** String.substringByte(startIndex, endIndex) : 문자열 잘라내기(Byte 기준)
*
*/
   String.prototype.substringByte = function (start, end) {
       var result = "";

       var preByte = 0;
       var curByte = 0;
       var len     = this.length;

       for (var i = 0; i < len; i++) {
           var chr = this.charAt(i);

           preByte = curByte;
           curByte += chr.byteLength();

           if (preByte >= start && curByte <= end) {
               result += chr;
           } else if (curByte > end) {
               break;
           }
       }

       return result;
   }

/** String.defaultString() : String 값이 "" 이면 def를 반환
*
* description :
*/
   String.prototype.defaultString = function(def) {
       return this.trim() == "" ? def : this;
   }

/** String.maskJumin() : 주민등록번호 "XXXXXX-XXXXXXX" 형태로 변환
*
*/
   String.prototype.maskJumin = function() {
       var juminNo = this.removeAll("-");

       if (juminNo.length <= 6) {
           return juminNo;
       } else {
           return juminNo.substr(0, 6) + "-" + juminNo.substr(6);
       }
   }

/** String.maskSaup() : 사업자번호 "XXX-XX-XXXXX" 형태로 변환
*
*/
   String.prototype.maskSaup = function() {
       var saupNo = this.removeAll("-");

       if (saupNo.length <= 3) {
           return saupNo;
       } else if (saupNo.length <= 5) {
           return saupNo.substr(0, 3) + "-" + saupNo.substr(3)
       } else {
           return saupNo.substr(0, 3) + "-" + saupNo.substr(3, 2) + "-" + saupNo.substr(5);
       }
   }

/** String.maskSaup() : 우편번호 "XXX-XXX" 형태로 변환
*
*/
   String.prototype.maskPostNo = function() {
       var postNo = this.removeAll("-");

       if (postNo.length <= 3) {
           return postNo;
       } else {
           return postNo.substr(0, 3) + "-" + postNo.substr(3);
       }
   }

/** String.maskYm() : 년월 "XXXX-XX" 형태로 변환
*
*/
   String.prototype.maskYm = function() {
       var masYm = this.removeAll("-");

       if (masYm.length <= 4) {
           return masYm;
       } else {
           return masYm.substr(0, 4) + "-" + masYm.substr(4);
       }
   }

/** String.maskYmd() : 년월일 "XXXX-XX-XX" 형태로 변환
*
*/
   String.prototype.maskYmd = function() {
       var maskYmd = this.removeAll("-");

       if (maskYmd.length <= 4) {
           return maskYmd;
       } else if (maskYmd.length <= 6) {
           return maskYmd.substr(0, 4) + "-" + maskYmd.substr(4, 2);
       } else {
           return maskYmd.substr(0, 4) + "-" + maskYmd.substr(4, 2) + "-" + maskYmd.substr(6);
       }
   }

/** String.maskComma() : 콤마삽입 "xxx,xxx,xxx.000" --> 반올림
*
*/
   String.prototype.maskComma = function(arg) {
       var retVal = fMaskCommaFloor(this.fCommaDel(),arg);
       return retVal;
   }

/** String.maskCommaFix() : 콤마삽입 "xxx,xxx,xxx.000" --> 반올림
*
*/
   String.prototype.maskCommaFix = function(arg) {
       var retVal = fMaskCommaFloor(this.fCommaDel(),arg);
       if (isNaN(arg)) return retVal;
       if (arg <= 0)   return retVal;

       var strDot = "00000000000000000";
       var idxDot = retVal.indexOf(".");
       if (idxDot == -1)
       {
           return retVal + "." + strDot.substring(0,arg);
       }

       var dotLen = retVal.length - (idxDot + 1);
       if ( arg > dotLen)
       {
           return retVal + strDot.substring(0,(arg-dotLen));
       }
       else
       {
           return retVal;
       }
   }

//prototype : return Number

/** String.byteLength() : Byte 길이 반환
*
*/
   String.prototype.byteLength = function() {
       return fGetLength(this);
   }

/** String.byteIndexOf(chr) : 특정문자의 Byte Index 값 반환
*
*/
   String.prototype.byteIndexOf = function(chr) {
       var idx = this.indexOf(chr);
       if (idx == -1) {
           return idx;
       } else {
           return this.substring(0, idx).byteLength();
       }
   }

/** String.lParseInt() : 숫자형 문자의 앞자리 '0'을 뺀후 int형으로 반환
*
*/
   String.prototype.lParseInt = function() {
       var idx = 0;
       var rtn = 0;
       var len = this.length;

       if (len == 0) rtn = 0;

       for (var ix=0; ix<len-1;ix++ )
       {
           if (this.charAt(ix) == '0') idx++;
           else break;
       }

       try
       {
           rtn = parseInt(this.substring(idx));
       }
       catch (ex)
       {
           rtn = 0;
       }

       if (isNaN(rtn)) rtn = 0;

       return rtn;
   }

/** String.lParseFloat() : 숫자형 문자의 앞자리 '0'을 뺀후 int형으로 반환
*
*/
   String.prototype.lParseFloat = function() {
       var idx = 0;
       var rtn = 0.0;
       var len = this.length;
       var dotLen = this.indexOf(".");
       if (dotLen < 0) dotLen = len;


       for (var ix=0; ix<len-1;ix++ )
       {
           if (this.charAt(ix) == '0' && ix < dotLen-1) idx++;
           else break;
       }

       try
       {
           rtn = parseFloat(this.substring(idx));
       }
       catch (ex)
       {
           rtn = 0;
       }

       if (isNaN(rtn)) rtn = 0;

       return rtn;
   }

//prototype : return boolean

/** String.isEmpty() : 빈값 여부 반환
*
* @return : 문자열 길이가 0 이면 true, 아니면 false
*/
   String.prototype.isEmpty = function() {
       return this.trim().length == 0;
   }

/** String.isNumber() : 숫자 여부 반환
*
* @return : 숫자이면 true, 아니면 false
*/
   String.prototype.isNumber = function() {
       return fChkNumber(this);
   }

/** String.isYm() : 년월 여부 반환
*
* @return : 년월이면 true, 아니면 false
*/
   String.prototype.isYm = function() {
       return fYmChk(this);
   }

/** String.isYmd() : 년월일 여부 반환
*
* <blockquote>
* strValue = "20050101"
* strValue.isYmd()  --> true
* </blockquote>
* @param  : 없음
* @return : 년월이면 true, 아니면 false
*/
   String.prototype.isYmd = function() {
       return fYmdChk(this);
   }

//prototype : return Etc

/** String.toInt() : int 로 반환
*
*/
   String.prototype.toInt = function() {
       return this.trim() == "" ? 0 : parseInt(this.trim(), 10);
   }

/** String.toHex() : Hexa 로 반환
*
*/
   String.prototype.toHex = function() {
       return this.toRadix(16);
   }

/** String.toRadix() : Radix 로 변환
*
*/
   String.prototype.toRadix = function(radix) {
       return Number(this).toString(radix).toUpperCase();
   }

/** String.toNumber() : Number 객체로 반환
*
*/
   String.prototype.toNumber = function() {
       return Number(this.removeAll(",").trim());
   }

/** String.toDate() : Date 객체로 반환
*
*/
   String.prototype.toDate = function() {
       var sDate  = this.removeAll("-").trim();
       var iYear  = sDate.substr(0, 4).toNumber();
       var iMonth = sDate.substr(4, 2).defaultString("0").toNumber() - 1;
       var iDate  = sDate.substr(6, 2).defaultString("1").toNumber();

       return new Date(iYear, iMonth, iDate);
   }
	
/** fMaskCommaFloor() : 콤마삽입 "xxx,xxx,xxx.000" --> 절사
*
*/
   function fMaskCommaFloor(strData,dotLen)
   {
      if (isNaN(strData)) return "0";

	  if (dotLen == null || dotLen < 0 || isNaN(dotLen))
	  {
	      var comstr = strData.toString();
	  }
	  else
	  {
	      var comstr = (Math.floor(parseFloat(strData) * (Math.pow(10,dotLen)))/ Math.pow(10,dotLen)).toString();
	  }
	
	  var re = /([0-9]+)([0-9]{3})($|\.*)/;
	  myRe=/[0-9](\.)/;
	  myArray = myRe.exec(comstr);
	  if (myRe.lastIndex==0||myRe.lastIndex>4) {
	      return comstr.replace(re, function(str,p1,p2,p3) { return fMaskCommaFloor(p1) + "," + p2 + p3; });
	  }
	  else return comstr;
  }

  /** fMaskCommaRound() : 콤마삽입 "xxx,xxx,xxx.000" --> 반올림
   *
   */
       function fMaskCommaRound(strData,dotLen)
       {
          if (isNaN(strData)) return "0";
          //numObj = new Number(strData)

          if (dotLen == null || dotLen < 0 || isNaN(dotLen))
          {
              var comstr = strData.toString();
          }
          else
          {
              var comstr = (Math.round(parseFloat(strData) * (Math.pow(10,dotLen)))/Math.pow(10,dotLen)).toString();
          }

          var re = /([0-9]+)([0-9]{3})($|\.*)/;
          myRe=/[0-9](\.)/;
          myArray = myRe.exec(comstr);
          if (myRe.lastIndex==0||myRe.lastIndex>4) {
              return comstr.replace(re, function(str,p1,p2,p3) { return fMaskCommaRound(p1) + "," + p2 + p3; });
          }
          else return comstr;
          //return comstr;
      }

/** fAddFloat() : 더하기 연산(val1 + val2) --> 반올림
*
* @param  : val1,val2 : 연산할 값
*           len       : 연산시 반올림 기준자리수
*
*/
    function fAddFloat(val1,val2,len)
    {
      var valFloat1 = 0.0;
      var valFloat2 = 0.0;
      var rtnVal = 0.0;

      valFloat1 = parseFloat(val1.toString().fCommaDel());
      valFloat2 = parseFloat(val2.toString().fCommaDel());

      if (isNaN(valFloat1)) valFloat1 = 0.0;
      if (isNaN(valFloat2)) valFloat2 = 0.0;
      if (len == null) len = 3;
      if (isNaN(len) ) len = 3;

      rtnVal = (Math.round(valFloat1 * Math.pow(10,len)) + Math.round(valFloat2 * Math.pow(10,len))) / Math.pow(10,len);

      return rtnVal ;
    }

/** fAddFloat() : 더하기 연산(val1 - val2) --> 반올림
*
* @param  : val1,val2 : 연산할 값
*           len       : 연산시 반올림 기준자리수
*
*/
    function fSubFloat(val1,val2,len)
    {
      var valFloat1 = 0.0;
      var valFloat2 = 0.0;
      var rtnVal = 0.0;

      valFloat1 = parseFloat(val1.toString().fCommaDel());
      valFloat2 = parseFloat(val2.toString().fCommaDel());

      if (isNaN(valFloat1)) valFloat1 = 0.0;
      if (isNaN(valFloat2)) valFloat2 = 0.0;
      if (len == null) len = 3;
      if (isNaN(len) ) len = 3;

      rtnVal = (Math.round(valFloat1 * Math.pow(10,len)) - Math.round(valFloat2 * Math.pow(10,len))) / Math.pow(10,len);

      return rtnVal ;
    }

/** fMulFloat() : 곱하기 연산(val1 * val2) --> 반올림
*
* @param  : val1,val2 : 연산할 값
*           len       : 연산시 반올림 기준자리수
*
*/
    function fMulFloat(val1,val2,len)
    {
      var valFloat1 = 0.0;
      var valFloat2 = 0.0;
      var rtnVal = 0.0;

      valFloat1 = parseFloat(val1.toString().fCommaDel());
      valFloat2 = parseFloat(val2.toString().fCommaDel());

      if (isNaN(valFloat1)) valFloat1 = 0.0;
      if (isNaN(valFloat2)) valFloat2 = 0.0;
      if (len == null) len = 3;
      if (isNaN(len) ) len = 3;

      rtnVal = Math.round((valFloat1 * valFloat2) * Math.pow(10,len))/Math.pow(10,len);

      return rtnVal ;
    }

/** fDivFloat() : 나누기 연산(val1 / val2) --> 반올림
*
* @param  : val1,val2 : 연산할 값
*           len       : 연산시 반올림 기준자리수
*
*/
    function fDivFloat(val1,val2,len)
    {
      var valFloat1 = 0.0;
      var valFloat2 = 0.0;
      var rtnVal = 0.0;

      valFloat1 = parseFloat(val1.toString().fCommaDel());
      valFloat2 = parseFloat(val2.toString().fCommaDel());

      if (isNaN(valFloat1)) valFloat1 = 0.0;
      if (isNaN(valFloat2)) valFloat2 = 0.0;
      if (len == null) len = 3;
      if (isNaN(len) ) len = 3;

      if (valFloat2 == 0) return 0;

      rtnVal = Math.round((valFloat1 / valFloat2) * Math.pow(10,len))/Math.pow(10,len);

      return rtnVal ;
    }

    
/** fGetLength(val) : Byte 길이 반환
*
* @param   val  : 변수값
*
* @return  length
*/
   function fGetLength(val)
   {
       var str = val.toString();
       var totCount = 0;

       if (str == null || str == 'undefined')
       {
           return 0;
       }

       var str_len = str.length;

       for(k=0;k<str_len;k++)
       {
           temp = str.charAt(k);
           if( escape(temp).length > 4 )
           {
               totCount += 2;
           }
           else
           {
               totCount++;
           }
       }
       return totCount;
   }

/** fLeapYear(Year) : 윤년계산하기
*
* <blockquote>
* fLeapYear(2006)
* </blockquote>
* @param  : year : 년도
* @return : 윤년이면 2,아니면 1
*/
   function fLeapYear(year)
   {
       if (year % 4 == 0)
           if  (year % 100 == 0)
                if  (year % 400 == 0)
                     return 2;
                else return 1;
           else return 2;
       return 1;
   }

   /** fCalen(obj, strScript) : 달력윈도우를 열기 (윈도우가 닫히면 strScript 실행)
   *
   * <blockquote>
   * fCalen(obj)
   * </blockquote>
   * @param  : obj: 날짜를 보여줄 text tag(object)
   * @return : 성공(true),실패(false)
   */
   function fCalen(obj, obj2, strScript)
   {
	   var url = STR_ROOT_PASS+"/jsp/include/calendar.jsp";
	   var name = "달력";
	   var width = 248;
	   var height = 300;
	   var win;
	   
	   if (window.showModelessDialog) {
		   win = window.showModalDialog(url, obj.value,  'dialogWidth:'+width+'px;dialogHeight:'+height+'px'+';resizable:no;scroll:no');
	   } else {
		   win = window.open(url, name,  'height='+height+',width='+width+',toolbar=no,directories=no,status=no,linemenubar=no,scrollbars=no,resizable=no,modal=yes,dependent=yes');
	   }

	   if (win == null || win == 'closed') return;

       obj.value = win;
       if (obj2 != null && typeof obj2 == 'object' && obj2.tagName == 'INPUT' && obj2.type == 'text')
       {
           obj2.value = win;
       }
       if (strScript != null)
	   {
	       eval(strScript);
	   }
   }
   
   /** fCalenYm(obj, strScript) : 달력윈도우를 열기 (윈도우가 닫히면 strScript 실행)
   *
   * <blockquote>
   * fCalenYm(obj)
   * </blockquote>
   * @param  : obj: 날짜를 보여줄 text tag(object)
   * @return : 성공(true),실패(false)
   */
   function fCalenYm(obj, obj2, strScript)
   {
	   var url = STR_ROOT_PASS+"/jsp/include/calendarYm.jsp";
	   var name = "달력";
	   var width = 248;
	   var height = 225;
	   var win;
	   
	   if (window.showModelessDialog) {
		   win = window.showModalDialog(url, obj.value,  'dialogWidth:'+width+'px;dialogHeight:'+height+'px'+';resizable:no;scroll:no');
	   } else {
		   win = window.open(url, name,  'height='+height+',width='+width+',toolbar=no,directories=no,status=no,linemenubar=no,scrollbars=no,resizable=no,modal=yes,dependent=yes');
	   }

	   if (win == null || win == 'closed') return;

       obj.value = win;
       if (obj2 != null && typeof obj2 == 'object' && obj2.tagName == 'INPUT' && obj2.type == 'text')
       {
           obj2.value = win;
       }
       if (strScript != null)
	   {
	       eval(strScript);
	   }
   }

   /** 우편번호조회
   *
   * <blockquote>
   * fZipCode(obj,obj,obj)
   * </blockquote>
   * @param  : obj: 날짜를 보여줄 text tag(object)
   * @return : 성공(true),실패(false)
   */
   function fZipCode(post1, post2, addr, strScript)
   {
	   var url = STR_ROOT_PASS+"/jsp/include/zipcodeFrame.jsp";
	   var name = "우편번호찾기";
	   var width = 467;
	   var height = 400;
	   var win;
	   
	   if (window.showModelessDialog) {
		   win = window.showModalDialog(url, name,  'dialogWidth:'+width+'px;dialogHeight:'+height+'px'+';resizable:no;scroll:no');
	   } else {
		   win = window.open(url, name,  'height='+height+',width='+width+',toolbar=no,directories=no,status=no,linemenubar=no,scrollbars=no,resizable=no');
	   }

	   if (win == null) return;
	   else if(win.post1 == null) return;

	   post1.value = win.post1;
       post2.value = win.post2;
       addr.value = win.addr;
       
       if (strScript != null)
	   {
	       eval(strScript);
	   }
   }
   
/** fAssortString(obj,index) : 원하는 위치의 문자 삭제(주로 함수에서 호출하여 사용)
*
*  @ Example     : var chars = "1234567890-";
*                  for (var inx = 0; inx < source.value.length; inx++) {
*                     if (chars.indexOf(source.value.charAt(inx)) == -1)
*                         assortString(source, inx);
*                  }
*/
   function fAssortString(source,index){
       var len = source.value.length;
       var temp1 = source.value.substring(0,index);
       var temp2 = source.value.substring(index+1,len);
       source.value = temp1 + temp2;
   }

/** fChkNumInput(val) : 변수의 값의 숫자('0123456789') 여부 반환
*
* @param  : checkStr
* @return : 숫자이면 true 아니면 false
*/
   function fChkNumInput(checkStr)
   {
       cs_length=0;

       if (fGetLength(checkStr) == 0)
       {
           return false;
       }

       var TEXT = "0123456789";
           var checkStr_len = checkStr.length;
           var TEXT_len = TEXT.length;
           for (ni = 0;  ni < checkStr_len;  ni++)
           {
               ch = checkStr.charAt(ni);
               for (nj = 0;  nj < TEXT_len;  nj++)
               {
                   if (ch == TEXT.charAt(nj))
                   {
                       cs_length=cs_length+1;
                   }
               }
           }

           if (cs_length==checkStr.length)
           {
               return (true);
           }
           else
           {
               return (false);
           }
       }

/** fChkNumber(val) : 변수의 값의 숫자('0123456789.') 여부 반환
*
* @param  : checkStr
* @return : 숫자이면 true 아니면 false
*/
   function fChkNumber(checkStr)
   {
       var cs_length = 0;
       var nDot      = 0;
       var nDotAfter = 0;

       if (fGetLength(checkStr) == 0)
       {
           return false;
       }

       var TEXT = "0123456789.";
           var checkStr_len = checkStr.length;
           var TEXT_len = TEXT.length;

           for (ni = 0;  ni < checkStr_len;  ni++)
           {
               ch = checkStr.charAt(ni);
               for (nj = 0;  nj < TEXT_len;  nj++)
               {
                   if (ch == TEXT.charAt(nj))
                   {
                       if (nj == 10)      { nDot++;      }
                       else if (nDot > 0) { nDotAfter++; }
                       cs_length=cs_length+1;
                   }
               }
           }

           if (nDot > 1)
           {
               return (false);
           }

           if (nDot > 0 && nDotAfter == 0)
           {
               return (false);
           }

           if (cs_length==checkStr.length)
           {
               return (true);
           }
           else
           {
               return (false);
           }
       }

/** fYmChk(val) : 변수의 값의 년월 여부 반환
*
* @param  : val : 년월 입력값
* @return : 년월이면 true 아니면 false
*/
   function fYmChk(val) {
       if(val.length != 6) return false;

       if (!fChkNumInput(val)) return false;

       if (parseInt(val.substring(0,4)) < 1990 || parseInt(val.substring(0,4)) > 2030 ) return false;

       if ( val.substring(4,6) == "01" || val.substring(4,6) == "02" || val.substring(4,6) == "03" ||
		 val.substring(4,6) == "04" || val.substring(4,6) == "05" || val.substring(4,6) == "06" ||
		 val.substring(4,6) == "07" || val.substring(4,6) == "08" || val.substring(4,6) == "09" ||
		 val.substring(4,6) == "10" || val.substring(4,6) == "11" || val.substring(4,6) == "12" )
           {
   			return true;
           } else
   	    {
   			return false;
   		}
           return true;
       }

/** fYmdChk(val) : 변수의 값의 년월일 여부 반환
*
* @param  : val : 년월일 입력값
* @return : 년월일이면 true 아니면 false
*/
   function fYmdChk(val) {
       if(val.length != 8) return false;
       if (!fChkNumInput(val)) return false;
	
       if (parseInt(val.substring(0,4)) < 1900 || parseInt(val.substring(0,4)) > 2030 ) return false;
	
	var mon = "";
	if (val.substring(4,5) == '0')
	{
		mon = val.substring(5,6);
	}
	else
	{
		mon = val.substring(4,6);
	}

       if (parseInt(mon) < 1 || parseInt(mon) > 12) return false;
	
       var LastMon   = new Array("0131", "0229", "0331", "0430", "0531", "0630", "0731", "0831", "0930", "1031", "1130", "1231");
           var LastMonth ;
           for(var i=0; i<12; i++) {
               LastMonth = LastMon[i];
               if(val.substring(4,6) == LastMonth.substring(0,2)) {
                   if(val.substring(6,8) > LastMonth.substring(2,4)) {
                       return false;
                   }
                   break;
               }
           }

          return true;
       }

/** fHangulDel(val) : 한글삭제
*
* @param  : val : String
* @return : 한글이 삭제된 String
*/
   function fHangulDel(val)
   {
       var retVal = "";
       var k = 0;
       var val_len = val.length;
       for (var h=0;h< val_len;h++ )
       {
           if(    (val.charCodeAt(h) > 0x3130 && val.charCodeAt(h) < 0x318F   )
               || (val.charCodeAt(h) >= 0xAC00 && val.charCodeAt(h) <= 0xD7A3 ) )
           {
               k ++;
           }
           else
           {
               retVal += val.charAt(k);
               k ++;
           }
       }
       return retVal;
   }
       
/** fMoveFocus() : 다음 인덱스로 포커스 이동하기 (onkeydown(enter) event에서만 발생)
*
* @param  : focusYn : 포커스 여부
* @return : N/A
*/
	function fMoveFocus() {
	
	  if (event.keyCode != 13) return;
	
	  if (event.srcElement.tagName == "TEXTAREA" ) return;
	
	  var sidx = event.srcElement.sourceIndex;
	
	  fPageInit(false);
	
	  if (MIN == MAX) return;
	
	  if (sidx >= MAX)
	  {
	      event.returnValue = false;
	      event.cancelBubble = true;
	      event.keyCode = 0;
	      document.all(MIN).focus();
	  }
	  else
	  {
	       var dal = document.all;
	       for(var i = sidx+1 ; i <= MAX; i++ )
	       {
	    	   if ( ( (dal(i).type    == "text"  ) || (dal(i).type    == "checkbox") || (dal(i).type == "radio") || (dal(i).type == "password") || (dal(i).type == "submit") ||
	                  (dal(i).tagName == "SELECT") || (dal(i).tagName == "TEXTAREA")
	                ) && (dal(i).tabIndex != -1 ) && (dal(i).readOnly != true) && (dal(i).disabled != true)
	              )
	           {
	               document.all(i).focus();
	               break;
	           }
	       }
	  }
	}

/** fPageInit(focusYn) : document object index 초기화 , focusYn == true 이면 처음인덱스에 포커스 줌
*
* @param  : focusYn : 포커스 여부
* @return : N/A
*/
	function fPageInit(focusYn) {
	    MIN = 0;
	    MAX = 0;
	
	    if (focusYn == null) focusYn = true;
	
	    var dal = document.all;
	    for( var i=dal.length-1; i >= 0; i-- )
	    {
	        if ( ( (dal(i).type    == "text"  ) || (dal(i).type    == "checkbox") || (dal(i).type == "radio") ||  (dal(i).type == "password") || (dal(i).type == "submit") ||
	               (dal(i).tagName == "SELECT") || (dal(i).tagName == "TEXTAREA")
	             ) && (dal(i).tabIndex != -1 ) && (dal(i).readOnly != true) && (dal(i).disabled != true)
	           )
	        {
	            MIN = i;
	            if ( i > MAX ) MAX = i;
	        }
	    }
	    if (focusYn == true)
	    {
	        document.all(MIN).focus();
	    }
	}
	
/** fDateCourse(obj, nextPos) : OBJECT의 Value(문자열)값이 일자인지 확인, 확인 후 포커스이동 (onkeyup event)
 *
 * @param  : obj: 날짜를 보여줄 text tag(object)
 *
 * @return : 성공(true),실패(false)
 */
     function fDateCourse(source,source2,nextPos)
     {
        var days = new Array("31","0","31","30","31","30","31","31","30","31","30","31")
        var daytab1 = new Array("31","28","31","30","31","30","31","31","30","31","30","31")
        var daytab2 = new Array("31","29","31","30","31","30","31","31","30","31","30","31")

        if (window.event.keyCode == 8 || window.event.keyCode == 37 || window.event.keyCode == 39) // Backspace&방향키 skip
            return;

        if (source.value.length == 0 && window.event.keyCode == 13) {
            if (nextPos == null) return;

            if(nextPos != null) {
                if(typeof nextPos == 'object') {
                    if (nextPos.type == 'text') nextPos.select();
                }
            }
            if(nextPos != null && nextPos!=55555) nextPos.focus();
        }
        if (event.keyCode == 13 || event.keyCode == 9) return;


        var chars = "1234567890";
        var source_len = source.value.length;
        for (var inx = 0; inx < source_len; inx++) {
           if (chars.indexOf(source.value.charAt(inx)) == -1)
               fAssortString(source, inx);
        }

        if (source.value.length > 8)
            source.value = source.value.substring(0,8);
        if (source.maxLength > 7)
        {
            switch(source.value.length)
            {
                case 1: break;
                case 2: break;
                case 3: break;
                case 4: source.value = source.value + "-"; break;
                case 5: source.value = source.value.substring(0,4)+"-"+source.value.substring(4,5);break;
                case 6: source.value = source.value.substring(0,4)+"-"+source.value.substring(4,6)+"-";break;
                case 7: source.value = source.value.substring(0,4)+"-"+source.value.substring(4,6)+"-"+source.value.substring(6,7);break;
                case 8: source.value = source.value.substring(0,4)+"-"+source.value.substring(4,6)+"-"+source.value.substring(6,8);break;
            }
        }
        else
        {
            switch(source.value.length)
            {
                case 1: break;
                case 2: break;
                case 3: break;
                case 4: source.value = source.value + "-"; break;
                case 5: source.value = source.value.substring(0,4)+"-"+source.value.substring(4,5);break;
                case 6: source.value = source.value.substring(0,4)+"-"+source.value.substring(4,6);break;
            }
        }

        if (source.value.length == 0) return;

        var year  = -1;
        var month = -1;
        var day   = -1;


        if (source.value.length == 8 )
        {
            year    = source.value.substring(0,4);
            month   = source.value.substring(5,7);

            if (month < 1 || month > 12)
            {
                alert("(year-month) : [" + year + "-" + month + "]" + "\n\n일자(월) 입력 오류입니다. 다시입력하세요.  ");
                source.value = source.value.substring(0,5);
                return;
            }

        }
        else if (source.value.length == 10 )
        {
            year    = source.value.substring(0,4);
            month   = source.value.substring(5,7);
            day     = source.value.substring(8,10);

            if (month < 1 || month > 12)
            {
                alert("(year-month-day) : [" + year + "-" + month + "-" + day + "]" + "\n\n일자(월) 입력 오류입니다. 다시입력하세요.  ");
                source.value = source.value.substring(0,5);
                return;
            }

            if (fLeapYear(year) == 1)
            {
                if (daytab1[month-1] < day)
                {
                    alert("(year-month-day) : [" + year + "-" + month + "-" + day + "]" + "\n\n일자(일) 입력 오류입니다. 다시입력하세요.  ");
                    source.value = source.value.substring(0,8);
                    return;
                }
            }
            else
            {
                if (daytab2[month-1] < day)
                {
                    alert("(year-month-day) : [" + year + "-" + month + "-" + day + "]" + "\n\n일자(일) 입력 오류입니다. 다시입력하세요.  ");
                    source.value = source.value.substring(0,8);
                    return;
                }
            }
        } else {
            return;
        }

        if (source2 == null)
        {
        }
        else if (event.keyCode != 13 && event.keyCode != 9)
        {
            if (source.value.length == 10  ) {
                if (source2 != null && typeof source2 == 'object' && source2.tagName == 'INPUT' && source2.type == 'text')
                {
                    source2.value = source.value;
                }
            }
        }
     }

     /** fTimeCourse(obj) : OBJECT의 Value(문자열)값이 시간인지 확인 후 시간출력
     *
     * @param  : obj: 날짜를 보여줄 text tag(object)
     *
     * @return : 성공(true),실패(false)
     */
    function fTimeCourse(obj)
 	{
 		var input = obj.value.replace(/:/g,"");
 		if(input != "")
 		{
 			if(input.length == 4)
 			{			 
 				inputHours = input.substr(0,2);
 				inputMinutes = input.substr(2,2);
 	
 				var resultTime = new Date(0,0,0, inputHours, inputMinutes, 00);
 			 
 			    if ( resultTime.getHours() != inputHours ||
 			         resultTime.getMinutes() != inputMinutes) {
 			 	    obj.value = "";
 			 	} else {
 			  		obj.value = inputHours + ":" + padZero(inputMinutes);
 			 	}
 			}else{
 				 obj.value = "";
 			}
 		}
 	}
 	
 	function padZero(s) { 
 	  return (""+s).length<2 ? "0"+s:s; 
 	}
/** fSpeChk(gbn) : 특수문자 입력 제거 (onkeyup event)
 *
 * @param  : gbn : "all" : [,.-/]를 제외한 모든 특수문자 제거
 *           그외: [<>()#&] 제거
 *
 */
    function fSpeChk(gbn) {
        if (event.keyCode == 13 || event.keyCode == 9) return;
        if (event.type != 'keyup' && event.type != 'mouseout') return;

        var obj = event.srcElement;

        if (obj == null) return;

        if (typeof obj != 'object') return;

        if (obj.type != "text" && obj.tagName != "TEXTAREA") return;

        if (obj.readOnly == true) return;

        if (obj.id == "nc") return;    /* input tag id=nc 이면 특수문자 허용하는 부분*/

        if (gbn == "all") {
            var excepChars = /[^a-zA-Z0-9ㄱ-ㅎ가-힝,.\-\/ ]/;   /* 인정하는 특수문자 범위 제한 지정 */
            var spe      = /[^a-zA-Z0-9ㄱ-ㅎ가-힝,.\-\/ ]/gi; /* 변환된 특수문자들 집합!!!!!!!!!!!!!!*/

        } else {
            var excepChars = /[<>()#&]/;
            var spe        = /[<>()#&]/g;
        }

        if(excepChars.test(obj.value) ) {
            obj.value = obj.value.replace(spe, "");
        }
    }

/** fChkNum() : 코드성 숫자("0123456789")입력 확인 (onkeydown event)
 *
 * @return : 코드이면 1 조작키이면 0  ======오류=====>>  한글및영문이면 -1
 */
    function fChkNum(dotLen) {
        var keyCd = event.keyCode;
        var rtn   = 0;
        var str   = "";

        /* 엔터이면 정상 */
        if ( keyCd == 13 ) {
            rtn = 1;
        }
        // TAB키 정상
        else if ( keyCd == 9 ) {
            rtn = 1;
        }

        // 한글
        else if (keyCd == 229)
        {
            if (event.type == 'keydown') rtn = -1;
            else                         rtn =  0;
        }

        //기능키 정상
        else if ( keyCd >= 112 && keyCd <= 123) {
            rtn = 0;
        }

        // 좌,우 화살표,DEL,BACKS,SHIFT,- 정상
        else if (( keyCd == 37)||( keyCd == 39 )||( keyCd == 46)||( keyCd == 8 )) {
            rtn = 0;
        }

        // 위,아래 화살표 정상
        else if ((keyCd == 40) || (keyCd == 38 )) {
            rtn = 0;
        }

        // 키패드 숫자 key 정상
        else if (( keyCd > 95) && ( keyCd < 106 )) {
            rtn = 1;
        }

        // 키보드 상단 숫자 key 정상
        else if (( keyCd > 47) && ( keyCd < 58 )) {
            rtn = 1;
        }

        //dot 혹인

        else if (dotLen > 0 && (keyCd == 190 || keyCd == 110)) {
            if      (event.type == "keydown" && event.srcElement.value.indexOf(".") > -1) rtn = -1;
            else if (event.type == "keyup"   && event.srcElement.value.indexOf(".",event.srcElement.value.indexOf(".")+1) > -1) rtn = -1
            else rtn = 2;

        }

        // 기타 오류처리
        else {
            rtn = -1;
        }

        dotCnt = 0;
        if (rtn == -1) {
            alert('숫자만 입력 가능합니다.');
            var eleVal = event.srcElement.value.replace(/,/g,"");
            var eleVal_len = eleVal.length;

            for (var i=0;i<eleVal_len;i++ )
            {
                if ( !(eleVal.charAt(i) >= 0 && eleVal.charAt(i) <= 9))
                {
                   if (dotLen > 0 && eleVal.charAt(i) == ".")
                   {
                        dotCnt++;
                        if (dotCnt == 1) continue;
                   }
                   str = eleVal.substr(0,i);
                   if (i < eleVal.length-1)
                   {
                        str += eleVal.substr(i+1);
                   }
                   event.srcElement.value = str;
                   break;
                }
            }
            if (str == "") event.srcElement.value = "";

            if (event.type == "keydown")
            {
                if (!(event.keyCode == 16 || event.keyCode == 17)) // shift ,control
                {
                    event.keyCode      = 0;
                    event.returnValue  = false;
                    event.cancelBubble = true;
                }

            }
            return false;
        }
        return true;
    }

/** fChkCode() : 숫자입력체크 (onkeydown event)
 *
 * @return : N/A
 */
    function fChkCode() {

        if (event.type == 'keydown') {

            if (event.keyCode == 229)
            {
                alert('숫자만 입력 가능합니다.');
                event.srcElement.value = fHangulDel(event.srcElement.value);
                return;
            }


            /* 엔터이면 정상 */
            if ( event.keyCode == 13 ) return;

            // TAB키 정상
            if ( event.keyCode == 9 ) return;

            //기능키 정상
            if ( event.keyCode >= 112 && event.keyCode <= 123) return;

            // 좌,우 화살표,DEL,BACKS,SHIFT,- 정상
            if (( event.keyCode == 37)||( event.keyCode == 39 )||( event.keyCode == 46)||( event.keyCode == 8 )) return;

            // 위,아래 화살표 정상
            if ((event.keyCode == 40) || (event.keyCode == 38 )) return;

            // 키패드 숫자 key 정상
            if (( event.keyCode > 95) && ( event.keyCode < 106 )) return;

            // 키보드 상단 숫자 key 정상
            if (( event.keyCode > 47) && ( event.keyCode < 58 )) return;


            // shift ,control
            if (!(event.keyCode == 16 || event.keyCode == 17))
            {
                event.keyCode       = 0;
                event.returnValue   = false;
                event.cancelBubble  = true;
            }

            // 숫자입력 오류
            alert('숫자만 입력 가능합니다.');
            /*
            var numEtc = /[^0-9]/gi;
            if (event.srcElement.value.length > 0)
            {
                event.srcElement.value = event.srcElement.value.replace(numEtc,"");
            }
            */
        } else {
            return;
        }

        //fChkNum();
    }

/** fChkTel() : 전화번호입력체크 (onkeydown event "숫자 및 '-'만 허용)
 *
 * @return : N/A
 */
    function fChkTel() {

        if (event.type == 'keydown') {

            if (event.keyCode == 229)
            {
                alert('숫자만 입력 가능합니다.');
                event.srcElement.value = fHangulDel(event.srcElement.value);
                return;
            }

            /* 엔터이면 정상 */
            if ( event.keyCode == 13 ) return;

            // TAB키 정상
            if ( event.keyCode == 9 ) return;

            //기능키 정상
            if ( event.keyCode >= 112 && event.keyCode <= 123) return;

            // 좌,우 화살표,DEL,BACKS,SHIFT,- 정상
            if (( event.keyCode == 37)||( event.keyCode == 39 )||( event.keyCode == 46)||( event.keyCode == 8 )||(event.keyCode == 189)) return;

            // 위,아래 화살표 정상
            if ((event.keyCode == 40) || (event.keyCode == 38 )) return;

            // 키패드 숫자 key 정상
            if (( event.keyCode > 95) && ( event.keyCode < 106 )) return;

            // 키보드 상단 숫자 key 정상
            if (( event.keyCode > 47) && ( event.keyCode < 58 )) return;

            // shift ,control
            if (!(event.keyCode == 16 || event.keyCode == 17))
            {
                event.keyCode       = 0;
                event.returnValue   = false;
                event.cancelBubble  = true;
            }

            // 숫자입력 오류
            alert('숫자 및 - 만 입력 가능합니다.');
            /*
            var numEtc = /[^0-9]/gi;
            if (event.srcElement.value.length > 0)
            {
                event.srcElement.value = event.srcElement.value.replace(numEtc,"");
            }
            */
        } else {
            return;
        }

        //fChkNum();
    }

/** fInsComma() : 숫자(소수점)입력체크 및 콤마삽입 (onkeydown,onkeyup event) , 음수 인정
 *
 * @return : N/A
 */
	function fInsComma2(dotLen)
	{
	    var dotKeyInputYn = false;
	
	    if (dotLen == null) dotLen = 0;
	
	    if (event.srcElement.value.length == 1 && event.srcElement.value.charAt(0) == "-") return;
	    if (event.type == 'keydown') {
	
	        /* 엔터이면 정상 */
	        if ( event.keyCode == 13 ) return;
	
	        // TAB키 정상
	        if ( event.keyCode == 9 ) return;
	
	        // 좌,우 화살표,DEL,BACKS,SHIFT,- 정상
	        if (( event.keyCode == 37)||( event.keyCode == 39 )||( event.keyCode == 46)||( event.keyCode == 8 )) return;
	
	        // 위,아래 화살표 정상
	        if ((event.keyCode == 40) || (event.keyCode == 38 )) return;
	
	        //기능키 정상
	        if ( event.keyCode >= 112 && event.keyCode <= 123) return;
	
	        // "." 두번이상 첫번째 입력 허용
	        if (dotLen > 0 && (event.keyCode == 190 || event.keyCode == 110)) {
	            if (event.srcElement.value.indexOf(".") == -1) return;
	            else dotKeyInputYn = true;
	        }
	
	        // 키패드 숫자 key 정상
	        if (( event.keyCode > 95) && ( event.keyCode < 106 )) return;
	
	        // 키보드 상단 숫자 key 정상
	        if (( event.keyCode > 47) && ( event.keyCode < 58 )) return;
	
	        // 숫자입력 오류
	        // shift ,control
	        if (!(event.keyCode == 16 || event.keyCode == 17))
	        {
	            event.keyCode       = 0;
	            event.returnValue   = false;
	            event.cancelBubble  = true;
	        }
	        alert('숫자만 입력 가능합니다.');
	        var numEtc = /[^0-9.]/gi;
	        if (event.srcElement.value.length > 0)
	        {
	            event.srcElement.value = event.srcElement.value.replace(numEtc,"");
	
	            if (dotKeyInputYn)
	            {
	                var dotIndex1 = event.srcElement.value.indexOf(".");
	                var dotIndex2 = event.srcElement.value.lastIndexOf(".");
	                var str = "";
	                if (dotIndex1 < dotIndex2) {
	                    str = event.srcElement.value.substring(0,dotIndex2);
	                    if (dotIndex2 < event.srcElement.value.length-1)
	                    {
	                        str += event.srcElement.value.substring(dotIndex2+1);
	                    }
	                    event.srcElement.value = str;
	                }
	            }
	
	        }
	    } else if (event.type == 'keyup') {
	
	        /* 엔터이면 정상 */
	        if ( event.keyCode == 13 ) return;
	
	        // TAB키 정상
	        if ( event.keyCode == 9 ) return;
	
	        // 좌,우 화살표,DEL,BACKS,SHIFT,- 정상
	        if (( event.keyCode == 37)||( event.keyCode == 39 )||( event.keyCode == 46)||( event.keyCode == 8 )) return;
	
	        // 위,아래 화살표 정상
	        if ((event.keyCode == 40) || (event.keyCode == 38 )) return;
	
	        //기능키 정상
	        if ( event.keyCode >= 112 && event.keyCode <= 123) return;
	
	
	
	        //콤마제거
	        event.srcElement.value = event.srcElement.value.replace(/,/g,"");
	
	    }
	    else
	    {
	        return;
	    }
	    var _sign = 1;
	    if (parseFloat(event.srcElement.value) < 0)
	    {
	        _sign = -1;
	        event.srcElement.value = parseFloat(event.srcElement.value.fCommaDel()) * parseFloat(_sign);
	    }
	    //숫자변환
	    var tmpIdx = event.srcElement.value.indexOf(".");
	    var tmpLen = event.srcElement.value.length;
	    var rndVal = 0;
	    if      (dotLen >= 1) rndVal = Math.pow(10,tmpLen-tmpIdx+1)  ;
	    else                  rndVal = 1;
	
	    var dblVal = parseFloat(event.srcElement.value);
	    if (isNaN(dblVal)) dblVal = 0;
	
	    var srcVal = (Math.round(dblVal*rndVal)/rndVal).toString().replace(/-/gi,"");
	
	    //숫자가 아니면 ""
	    if (isNaN(srcVal)) { event.srcElement.value = ""; return; }
	
	    //값이 없으면 ""
	    if (event.srcElement.value == "") { return; }
	
	    //소수점이하 자리수 확인
	    var dotIdx = event.srcElement.value.indexOf(".");
	
	    //콤마 삽입
	    var vlen = srcVal.indexOf(".");
	    if (vlen == -1) vlen = srcVal.length;
	    var c = -1;
	
	    var tmp = new Array();
	    for ( var ii = vlen-1 ; ii > -1; ii-- ) {
	        c++;
	        tmp[ii] = ( ( c%3 == 0 ) && ( ii != vlen - 1) )? srcVal.charAt(ii) + "," : srcVal.charAt(ii);
	    }
	
	    var afVal = "";
	    var tmp_len = tmp.length;
	    for ( var ii = 0 ; ii < tmp_len; ii++) {
	        afVal += tmp[ii];
	    }
	
	    if (dotIdx > -1 && dotLen > 0)
	    {
	        afVal += event.srcElement.value.substr(event.srcElement.value.indexOf("."),dotLen+1);
	    }
	    if (_sign < 0)
	    {
	        event.srcElement.value = Comma(parseFloat(afVal.fCommaDel())*parseFloat(_sign));
	    }
	    else
	    {
	        event.srcElement.value = afVal;
	    }
	}
/** fInsComma() : 숫자(소수점)입력체크 및 콤마삽입 (onkeydown,onkeyup event)
 *
 * @return : N/A
 */
    function fInsComma(dotLen) {
        var dotKeyInputYn = false;
        var minusCode = "";

        if (dotLen == null) dotLen = 0;

        if (event.type == 'keydown')
        {
            /* 엔터이면 정상 */
            if ( event.keyCode == 13 ) return;

            // TAB키 정상
            if ( event.keyCode == 9 ) return;

            // 좌,우 화살표,DEL,BACKS,SHIFT,- 정상
            if (( event.keyCode == 37)||( event.keyCode == 39 )||( event.keyCode == 46)||( event.keyCode == 8 )) return;

            // 위,아래 화살표 정상
            if ((event.keyCode == 40) || (event.keyCode == 38 )) return;

            //기능키 정상
            if ( event.keyCode >= 112 && event.keyCode <= 123) return;

            // "-" 첫자리만 입력 허용(2007.08.07)
            if (event.keyCode == 189 || event.keyCode == 109) {
                return;
            }

            // "." 두번이상 첫번째 입력 허용
            if (dotLen > 0 && (event.keyCode == 190 || event.keyCode == 110)) {
                if (event.srcElement.value.indexOf(".") == -1) return;
                else dotKeyInputYn = true;
            }

            // 키패드 숫자 key 정상
            if (( event.keyCode > 95) && ( event.keyCode < 106 )) return;

            // 키보드 상단 숫자 key 정상
            if (( event.keyCode > 47) && ( event.keyCode < 58 )) return;

            // 숫자입력 오류
            // shift ,control
            if (!(event.keyCode == 16 || event.keyCode == 17))
            {
                event.keyCode       = 0;
                event.returnValue   = false;
                event.cancelBubble  = true;
            }
            alert('숫자만 입력 가능합니다.');
            var numEtc = /[^0-9.]/gi;
            if (event.srcElement.value.length > 0)
            {
                event.srcElement.value = event.srcElement.value.replace(numEtc,"");

                if (dotKeyInputYn)
                {
                    var dotIndex1 = event.srcElement.value.indexOf(".");
                    var dotIndex2 = event.srcElement.value.lastIndexOf(".");
                    var str = "";
                    if (dotIndex1 < dotIndex2) {
                        str = event.srcElement.value.substring(0,dotIndex2);
                        if (dotIndex2 < event.srcElement.value.length-1)
                        {
                            str += event.srcElement.value.substring(dotIndex2+1);
                        }
                        event.srcElement.value = str;
                        
                    }
                }

            }
        } else if (event.type == 'keyup') {

            /* 엔터이면 정상 */
            if ( event.keyCode == 13 ) return;

            // TAB키 정상
            if ( event.keyCode == 9 ) return;

            // 좌,우 화살표,DEL,BACKS,SHIFT,- 정상
            if (( event.keyCode == 37)||( event.keyCode == 39 )||( event.keyCode == 46)||( event.keyCode == 8 )) return;

            // "-" 첫자리만 입력 허용(2007.08.07)
            if (event.keyCode == 189 || event.keyCode == 109)
            {
                var valLen = event.srcElement.value.length;
                if (valLen == 1)
                {
                    return;
                }
                else
                {
                    if (event.srcElement.value.lastIndexOf("-") > 0)
                    {
                        event.srcElement.value = ""; return;
                    }
                }
            }

            // 위,아래 화살표 정상
            if ((event.keyCode == 40) || (event.keyCode == 38 )) return;

            //기능키 정상
            if ( event.keyCode >= 112 && event.keyCode <= 123) return;

            //콤마제거
            event.srcElement.value = event.srcElement.value.replace(/,/g,"");

            //"-" 확인
            if (event.srcElement.value.lastIndexOf("-") > -1) minusCode = "-";
        }
        else
        {

            return;
        }

        //숫자변환
        var tmpIdx = event.srcElement.value.indexOf(".");
        var tmpLen = event.srcElement.value.length;

        var rndVal = 0;
        if      (dotLen >= 1) rndVal = Math.pow(10,tmpLen-tmpIdx+1)  ;
        else                  rndVal = 1;

        var dblVal = parseFloat(event.srcElement.value);
        if (isNaN(dblVal)) dblVal = 0;

        var srcVal = (Math.round(dblVal*rndVal)/rndVal).toString().replace(/-/gi,"");

        //숫자가 아니면 ""
        if (isNaN(srcVal)) { event.srcElement.value = ""; return; }

        //값이 없으면 ""
        if (event.srcElement.value == "") { return; }

        //소수점이하 자리수 확인
        var dotIdx = event.srcElement.value.indexOf(".");

        //콤마 삽입
        var vlen = srcVal.indexOf(".");
        if (vlen == -1) vlen = srcVal.length;
        var c = -1;

        var tmp = new Array();
        for ( var ii = vlen-1 ; ii > -1; ii-- ) {
            c++;
            tmp[ii] = ( ( c%3 == 0 ) && ( ii != vlen - 1) )? srcVal.charAt(ii) + "," : srcVal.charAt(ii);
        }

        var afVal = "";
        var tmp_len = tmp.length;
        for ( var ii = 0 ; ii < tmp_len; ii++) {
            afVal += tmp[ii];
        }

        if (dotIdx > -1 && dotLen > 0)
        {
            afVal += event.srcElement.value.substr(event.srcElement.value.indexOf("."),dotLen+1);
        }

        event.srcElement.value = minusCode + afVal;


    }

	/** fHipenJuminNo() : 주민등록번호 "XXXXXX-XXXXXXX" 형태로 변환(onkeyup event)
	 *
	 */
	    function fHipenJuminNo()
	    {
	        var juminNo = event.srcElement.value.removeAll("-");

	        if (juminNo.length < 13) {
	            return ;
	        } else {
	            event.srcElement.value = juminNo.substr(0, 6) + "-" + juminNo.substr(6);
	            return
	        }
	    }

	/** fHipenSaupNo() : 사업자번호 "XXX-XX-XXXXX" 형태로 변환(onkeyup event)
	 *
	 */
	    function fHipenSaupNo()
	    {
	        var saupNo = event.srcElement.value.removeAll("-");

	        if (saupNo.length < 10) {
	            return ;
	        } else {
	            event.srcElement.value = saupNo.substr(0, 3) + "-" + saupNo.substr(3, 2) + "-" + saupNo.substr(5);
	            return ;
	        }
	    }

	/*  +----------------------------------+ */
	/*  |  Radio Button 관련               | */
	/*  +----------------------------------+ */

	/**
	*  @ Description : 선택된 라디오버튼이 있는지 체크
	*  @ Function    : 있으면 true 없으면 false
	*  @ Author      : Ko, HanMoo
	*  @ Example     :
	*/
	function fChkRadio(input) {
	    var input_len = input.length;
	    if (input_len > 1) {
	        for (var idx = 0; idx < input_len; idx++) {
	            if (input[idx].checked) return true;
	        }
	    } else {
	        if (input.checked) return true;
	    }
	    return false;
	}

	/**
	*  @ Description : 선택된 라디오버튼의 값 반환
	*  @ Function    : 있으면 value값 없으면 null
	*  @ Author      : Ko, HanMoo
	*  @ Example     :
	*/
	function fGetChkRadioValue(input) {
	    var input_len = input.length;
	    if (input_len > 1) {
	        for (var idx = 0; idx < input_len; idx++) {
	            if (input[idx].checked) return input[idx].value;
	        }
	    } else {
	        if (input.checked) return input.value;
	    }
	    return null;
	}

	/**
	*  @ Description : 값이 같은 라이오 버튼 체크
	*  @ Function    :
	*  @ Author      : Ko, HanMoo
	*  @ Example     :
	*/
	function fChkRadioBtn(input, val)
	{
	    var input_len = input.length;
	    if (input_len > 1)
	    {
	        for (var idx=0; idx < input_len; idx++)
	        {
	            if (input[idx].value == val)
	            {
	                input[idx].checked = true;
	            }
	        }
	    }
	    else
	    {
	        if (input.value == val)
	        {
	            input.checked = true;
	        }
	    }
	    return true;
	}

	/**
	*  @ Description : 값이 같은 체크박스 버튼 체크
	*  @ Function    :
	*  @ Author      : Ko, HanMoo
	*  @ Example     :
	*/
	function fChkBoxBtn(input, val)
	{
	    var input_len = input.length;

	    if (input_len > 1)
	    {
	        for (var idx=0; idx < input_len; idx++)
	        {
	            if (input[idx].value == val)
	            {
	                input[idx].checked = true;
	            }
	        }
	    }
	    else
	    {
	        if (input.value == val)
	        {
	            input.checked = true;
	        }
	    }
	    return true;
	}
	
	/* 2007.04.05
     * 현재날자 설정
     * 예) 2007-01-01
     */
    function fGetDate(dt)
    {
        if (dt == null)
        {
            dt = new Date();
        }

        var yyyymmdd;

        var yyyy  = dt.getYear();
        var Month = dt.getMonth();
        var date  = dt.getDate();

        var mm    = Month+1;
        var dd    = date;

        if(mm.toString().length == 1)
        {
            mm ='0' + mm;

        }
        else
        {
            mm;
        }

        if(dd.toString().length == 1)
        {
            dd ='0' + dd;

        }
        else
        {
            dd;
        }

        yyyymmdd = yyyy + '-' + mm + '-' + dd;
        return yyyymmdd;

    }

    function fAddDate(gjDate,days)
    {
        var strDt = gjDate.fHipenDel();

        if (strDt.length != 8 )
        {
            return "0000-00-00";
        }

        if (days == null)
        {
            days = 0;
        }

        if (isNaN(days))
        {
            days = 0;
        }

        var yyyy  = parseInt(strDt.substring(0,4));
        var month = parseInt(strDt.substring(4,6)) -1;
        var dd    = parseInt(strDt.substring(6)) + days;

        var dt = new Date(yyyy,month,dd);

        return fGetDate(dt);
    }

    function fAddMonth(gjDate,months)
    {
        var strDt = gjDate.fHipenDel();

        if (strDt.length != 8 )
        {
            return "0000-00-00";
        }

        if (months == null)
        {
            months = 0;
        }

        if (isNaN(months))
        {
            months = 0;
        }

        var yyyy  = parseInt(strDt.substring(0,4));
        var month = parseInt(strDt.substring(4,6)) -1 + months;
        var dd    = parseInt(strDt.substring(6));

        var dt = new Date(yyyy,month,dd);

        return fGetDate(dt);
    }
    
/**
 * 특수문자 특수문자 입력불가 처리(모든개체에 적용)
 * @param  : 없음
 */
    function fSpeChk2() {
        if (event.keyCode == 13 || event.keyCode == 9) return;
        if (event.type != 'keyup' && event.type != 'mouseout') return;
        var obj = event.srcElement;
        if (obj == null) return;
        if (typeof obj != 'object') return;
        //if (obj.type != "text") return;
        //if (obj.id == "nc") return;
        if (obj.readOnly == true) return;

        fSpecialChk2(obj);
    }

/**
 * 특수문자 특수문자 입력불가 처리(모든개체에 적용)
 * @param  : 없음
 */
    function fSpecialChk2(obj) {
                var ret   = obj.value;
        var regMust1 = /[<>()#&]/;
        var spe   = /[<>()#&]/gi;
        if(regMust1.test(ret) ) {
            obj.value = ret.replace(spe, "");
        } else return;
    }
    
    function rmComma(input)
    {
        return removeComma(input.value);
    }
    
    function removeComma(input)
    {
        return input.replace(/,/gi,"");
    }

    function Comma(comstr)
    {
        var comstr = String(comstr);
        var re = /([0-9]+)([0-9]{3})($|\.*)/;
        myRe=/[0-9](\.)/;
        myArray = myRe.exec(comstr);
        if (myRe.lastIndex==0||myRe.lastIndex>4) {
            return comstr.replace(re, function(str,p1,p2,p3) { return Comma(p1) + "," + p2 + p3; });
        }
        else return comstr;
    }
    
/**
 *  윈도우팝업 크기 조절 
 * /
    function ufPopSize(dialogWidth,dialogHeight)
    {
        var dlgParam = "";
        var userAgent = window.navigator.userAgent;
        var isXPSP2below, isWindows2k;
        
        if ( userAgent.indexOf( "MSIE 7.0" ) != -1 )
        {
            var xpTitleBarHeight = 29; // XP 타이틀 바 = 29px
            var border = 2; // 가장 자리 = 2px
            var ifXPSP2_statusBarHeight = 25; // XPSP2 이하의 상태 표시줄 = 25px
            var ifW2k = 22; // Win2k 의 경우 부가적으로 축소되는 크기 = 22px
         
            dialogHeight = dialogHeight - xpTitleBarHeight- border;  
            if ( isXPSP2below == true ) {
                dialogHeight -= ifXPSP2_statusBarHeight;
            }
            if ( isWindows2k == true ) {
                dialogHeight -= ifW2k;
            }
        }
        
        dlgParam = "dialogWidth:" +dialogWidth + "px;dialogHeight:" + dialogHeight + "px;resizable:no;"
        return dlgParam;
    }

/*
* fncMaxLenChk
* userObject 에서 받은 자료가 지정된 iSize에 맞는지 확인하고 입력가능범위로 잘라서 셋팅해준다. 
* obj - 체크할 userObject 명
* strName - 한글명 (예-비고)
* iSize - maxlength 길이
*/
	function fncMaxLenChk(obj, strName, iSize)
	{
		var userVal = obj.value;
		var len = getByteLength(userVal);
		if ( len > iSize )
		{
			alert("'" + strName + "'의 입력하신 자료의 길이가 지정된 범위 " + iSize + "을(를) 초과합니다.   " +
			"\n\n 현재상태 가능범위는  '" + substringToSize(userVal, iSize) + "'   입니다.");
			obj.value = substringToSize(userVal, iSize);
			obj.focus();
			return false;
		}
		else return true;
	}

/**
* fncMaxLenChk2
* userObject 에서 받은 자료가 지정된 iSize(한글byte)에 맞는지 확인하고 해당 object로  focus를 옮긴다.
* obj - 체크할 userObject 명
* iSize - maxlength 길이
*/
	function fncMaxLenChk2(obj, iSize)
	{	
		var userVal = obj.value;
		iLen = getByteLength(userVal);
		if( iLen > iSize) {
			alert("내용이 너무 많습니다. - " + iSize + "자까지 입력 가능합니다.");
			obj.focus();
		}
	}

/**
 * 입력받은 String의 Byte Size를 구한다.
 */
    function getByteLength(str)
    {
        try {
        var len = 0;
            if( str == null ) return 0;
            for( var i = 0 ; i < str.length ; i++ ){
                var c = escape(str.charAt(i));
                if ( c.length == 1 ) len ++;
                else if( c.indexOf("%u") != -1 ) len += 2;
                else if( c.indexOf("%") != -1 ) len += c.length/3;
            }
            return len;
		} catch (errorObject) {
            return 0;
        }
    }

/**
 *  입력받은 String을 입력가능한 사이즈로 substring한다. 
 */
    function substringToSize( userVal, divide )
    {
        if ( userVal == null ) return "";
        else if ( divide <= 0 ) return "";
        var len = 0;
        for ( var i = 0; i <= userVal.length; i++ ){
            len = getByteLength(userVal.substring(0, i));
            if ( divide == len ) return userVal.substring(0, i);
            else if ( divide < len ) return userVal.substring(0, i-1);
        }
        return userVal;
    }
    
    
    /** 
	 * 값을 입력했는지의 여부를 검사
	 * 2010.08.17 추가
	 * @param {object} checkElement form의 필드 객체
	 * @param {string} errorMessage 에러메시지
	 * @param {boolean} focusFlag 포커스여부
	 */  
	function checkRequired(checkElement,errorMessage,focusFlag){	
	    if(!((checkElement.value).replace(/^\s*/, "").replace(/\s*$/, "") != "")){
		    alert(errorMessage);
		    if(focusFlag) checkElement.focus();
		    return false;
	    }
	    return true;
	}
	/**
	 * 값이 정규표현식에 해당하는 지 검사
	 * 2010.08.17 추가
	 * @param {object} checkElement form의 필드 객체
	 * @param {string} regex 정규표현식
	 * @param {boolean} includeFlag 정규표현식 해당여부 포함되어야할때 true	  
	 */
	function checkRegex(checkElement, regex, includeFlag) {	    
	    var str = checkElement.value;
	    if(str.length == 0) return true;
	    if(includeFlag) return str.search(regex) != -1;
	    else return str.search(regex) == -1;
	}
	/**
	 * 값이 0~9 사이의 문자만 포함하는 지 검사
	 * 2010.08.17 추가
	 * @param {object} checkElement form의 필드 객체
	 * @param {string} errorMessage 에러메시지
	 * @param {boolean} focusFlag 포커스여부
	 */
	function checkNumberOnly(checkElement, errorMessage, focusFlag) {
		if(!checkRegex(checkElement, /^[0-9]+$/, true)){
			alert(errorMessage);
			if(focusFlag) checkElement.focus();
			return false;
		}
		return true;
	}
		
	/**
	 * 값의 바이트 길이가 maxLength보다 작거나 같은지 검사
	 * 2010.08.17 추가
	 * @param {object} checkElement form의 필드 객체
	 * @param {int} maxLength 체크값
	 * @param {int} kbyte 한글바이트수
	 * @param {string} errorMessage 에러메시지
	 * @param {boolean} focusFlag 포커스여부
	 */
	function checkMaxLengthByte(checkElement, maxLength, kbyte, errorMessage, focusFlag) {
		var stringValue = checkElement.value;
		var nbytes = 0;
	
		for (i=0; i<stringValue.length; i++) {
			var ch = stringValue.charAt(i);
			if(escape(ch).length > 4) {
				nbytes += kbyte;
			} else if (ch == '\n') {
				if (stringValue.charAt(i-1) != '\r') {
					nbytes += 1;
				}
			} else if (ch == '<' || ch == '>') {
				nbytes += 4;
			} else {
				nbytes += 1;
			}
		}	
	
		if(!(nbytes <= maxLength)){
	    	alert(errorMessage);
	    	if(focusFlag) checkElement.focus();
	    	return false;
		}     
	
		return true;   	        
	}
	
	
	

	 /**
	  * 값의 바이트 길이가 minLength보다 작거나 같은지 검사
	  * 2010.08.17 추가
	  * @param {object} checkElement form의 필드 객체
	  * @param {int} minLength 체크값
	  * @param {int} kbyte 한글바이트수
	  * @param {string} errorMessage 에러메시지
	  * @param {boolean} focusFlag 포커스여부
	  */
	 function checkMinLengthByte (checkElement, minLength, kbyte, errorMessage, focusFlag) {
	     var stringValue = checkElement.value;
	     var nbytes = 0;
	    
	     for (i=0; i<stringValue.length; i++) {
	      var ch = stringValue.charAt(i);
	      if(escape(ch).length > 4) {
	       nbytes += kbyte;
	      } else if (ch == '\n') {
	       if (stringValue.charAt(i-1) != '\r') {
	        nbytes += 1;
	       }
	      } else if (ch == '<' || ch == '>') {
	       nbytes += 4;
	      } else {
	       nbytes += 1;
	      }
	     } 

	     if(!(nbytes >= minLength)){
	         alert(errorMessage);
	         if(focusFlag) checkElement.focus();
	         return false;
	     }     

	     return true;            
	 }
	 
	 
	 /**
	  * 체크박스 모두선택, 모두해제
	  *
	  * @param {element object} element 체크박스 엘리먼트 배열
	  * @param {boolean} checkFlag true(모두선택)/false(모두해제)
	  */
	 function checkAllCheckBox(objName, checkFlag) {
	     var objArray = document.getElementsByName(objName)
	     for(i=0; i<objArray.length; i++) {
	         objArray[i].checked = checkFlag;
	     }
	 }
	 
	 
	 /**
	  * 값이 선택되었는지 여부
	  * 
	  * @param {string} objName 엘리먼트 name 값 
	  * @return {boolean} 체크여부 
	  */
	 function isChecked(objName){
	     // getElementsByName 은 배열로 return 함 
	     var obj = document.getElementsByName(objName)
	     var flagChecked = false;
	     for(i=0; i<obj.length; i++) {
	         if (obj[i].checked) {
	             flagChecked = true;
	             break;
	         }
	     }
	     return flagChecked;
	 }
	  
	/**	  
	 *  대문자로 변환하여 해당 obj 의 value 에 display
	 * 
	 * @param 
	 * @return
	*/
   function toUpper( obj )
   {
   	   var getVal = obj.value
  	   
  	   if (getVal.length != 0)  	   
   	       obj.value = getVal.toUpperCase()
   	}
   
   /** fIpin(obj, strScript) : 실명인증윈도우를 열기 (윈도우가 닫히면 strScript 실행)
   *
   * @param  : obj: 리터값이 들어갈 text tag(object)
   * @return : 성공(true),실패(false)
   */
   function fIpin(obj,obj2, strScript)
   {
	//   var url = STR_ROOT_PASS+"/G-PIN/ipinchk.jsp";
     	 var url = STR_ROOT_PASS+"/EgovPageLink.do?link=/G-PIN/ipinchk";
     	 
	   var name = "공공I-PIN";
	   var width = 447;
	   var height = 260;
	   var win;
	   
	   if (window.showModelessDialog) {
		   win = window.showModalDialog(url, obj.value,  'dialogWidth:'+width+'px;dialogHeight:'+height+'px'+';resizable:no;scroll:no');
	   } else {
		   alert("공공 I-PIN인증은 인터넷 익스플로러에서만 사용가능합니다.");
		   return;
//		   win = window.open(url, name,  'height='+height+',width='+width+',toolbar=no,directories=no,status=no,linemenubar=no,scrollbars=no,resizable=no,modal=yes,dependent=yes');
	   }

	   if (win == null || win == 'closed') return;

	   var winArr = win.split('|')
	   obj.value = winArr[0];
	   
	   //alert("*****COMMON UTIL:"+obj.value);
	//   var ipinUrl = "/enboard/ipinresult.jsp?realName="+obj.value;
//  	  var ipinUrl = "/EgovPageLink.do?link=/G-PIN/ipinresult&realName="+obj.value;
    //    alert(ipinUrl);
//	   window.open(ipinUrl, "", "width=100px,height=10px");
	   //window.showModalDialog(ipinUrl, obj.value,'dialogWidth:100px;dialogHeight:10px'+';resizable:no;scroll:no');

	   
	   obj2.value = winArr[1];

//	alert(win);

//	   alert(obj2.value);
/*	   
       obj.value = win;
       if (obj2 != null && typeof obj2 == 'object' && obj2.tagName == 'INPUT' && obj2.type == 'text')
       {
           obj2.value = win;
       }
       if (strScript != null)
	   {
	       eval(strScript);
	   } 
*/
   }
   
   /** fPrint() : 출력윈도우
   *
   * @param  : 
   * @return : 
   */
   function fPrint(page,height)
   {
	   page = page.replace('timeset','times');
	   var url = STR_ROOT_PASS+page+"&prn=Y";
	   var name = "출력";
	   var width = 789;
	   //var height = 768;
	   var win;
	   
	   if (window.showModelessDialog) {
		   win = window.showModalDialog(url, name,  'dialogWidth:'+width+'px;dialogHeight:'+height+'px'+';resizable:no;scroll:yes');
	   } else {
		   win = window.open(url, name,  'height='+height+',width='+width+',toolbar=no,directories=no,status=no,linemenubar=no,scrollbars=yes,resizable=no,modal=yes,dependent=yes');
	   }

	   if (win == null || win == 'closed') return;
   }
   
   function initTabMenu_bf0301(tabContainerID) {
		var tabContainer = document.getElementById(tabContainerID);
		var tabAnchor = tabContainer.getElementsByTagName("a");
		var i = 0;

		for (i = 0; i < tabAnchor.length; i++) {
			if (tabAnchor.item(i).className == "tabbtn2")
				thismenu = tabAnchor.item(i);
			else
				continue;

			thismenu.container = tabContainer;
			thismenu.targetEl = document.getElementById(tabAnchor.item(i).href
					.split("#")[1]);
			thismenu.targetEl.style.display = "none";
			thismenu.targetStyle = document.getElementById((tabAnchor.item(i).href
					.split("#")[1])
					+ "_id");

			thismenu.onclick = function tabMenuClick() {
				currentmenu = this.container.current;
				if (currentmenu == this)
					return false;

				if (currentmenu) {
					currentmenu.targetEl.style.display = "none";
					if (currentmenu.targetStyle) {
						currentmenu.targetStyle.className = "";
					}
				}
				this.targetEl.style.display = "";
				if (this.targetStyle) {
					this.targetStyle.className = "on"
				}
				this.container.current = this;
				parent.iframe_autoresize2(document.body);
				return false;
			};

			if (!thismenu.container.first)
				thismenu.container.first = thismenu;
		}
		if (tabContainer.first){
			tabContainer.first.onclick();
		}
	}
   
   /** ufRollON()  : 리스트 클릭시 BACKGROUND COLOR 변경
	 * 
	 *  index  : tr 번호
	 * 
	 *  type   : 1 = onMouseover ,2 = onMouseout
	 */
	function rollOn(index, type, rowcolor)
	{
		var len = lstTbl.rows[index].getElementsByTagName("td").length;

		if (type == 1)
       {
       	for ( i = 0; i < len; i++ ) 
           {
       		lstTbl.rows[index].getElementsByTagName("td")[i].style.background='#e7e7e7';   
           }
       	
       }
       else
       {
	        if(rowcolor == 1)
	        {
	        	for ( i = 0; i < len; i++ ) 
	            {
	        		lstTbl.rows[index].getElementsByTagName("td")[i].style.background='#f3f3f3';
	            }
	        }else{
	        	for ( i = 0; i < len; i++ ) 
	            {
	        		lstTbl.rows[index].getElementsByTagName("td")[i].style.background='#ffffff';
	            }
	        }
       }
	}
	
	
	
	/** ufRollON()  : 리스트 클릭시 BACKGROUND COLOR 변경
	 * 
	 *  index  : tr 번호
	 * 
	 *  type   : 1 = onMouseover ,2 = onMouseout
	 */
	function rollOn2(index, type)
	{
		//var len = lstTbl.rows[index].cells.length;
		var len = lstTbl.rows[index].getElementsByTagName("td").length;
       if (type == 1)
       {
       	for ( i = 0; i < len; i++ ) 
           {
       		//lstTbl.rows[index].cells[i].style.background='<c:out value="${OVER_COLOR}"/>';   
       		lstTbl.rows[index].getElementsByTagName("td")[i].style.background='#e7e7e7';   
           }
       }
       else
       {
           if(index%2!=0){
        	   for ( i = 0; i < len; i++ ) 
	            {
	        		//lstTbl.rows[index].cells[i].style.background='#f3f3f3';    
	        		lstTbl.rows[index].getElementsByTagName("td")[i].style.background='#f3f3f3';
	            }
           }else{
        	   for ( i = 0; i < len; i++ ) 
	            {
	        		//lstTbl.rows[index].cells[i].style.background='#ffffff';  
	        		lstTbl.rows[index].getElementsByTagName("td")[i].style.background='#ffffff';
	            }
           }
       }
	}

	/**
	 * 값이 알파벳과 0~9사이의 숫자만 포함하는 지 검사
	 * 
	 * @param {string} identifier id 또는 name
	 * @param {string} errorMessage 에러메시지
	 * @param {boolean} focusFlag 포커스여부
	 */
	function checkAlphaNum (identifier, errorMessage, focusFlag) {
	    if(!checkRegex(identifier, /^[a-zA-Z0-9]+$/ , true)){
			alert(errorMessage);
			if(focusFlag) identifier.focus();
			return false;
		}
		return true;
	}
	
	
	/**
	 * 값이 올바른 이메일 주소인지 검사
	 * 
	 * @param {string} identifier id 또는 name
	 * @param {string} errorMessage 에러메시지
	 * @param {boolean} focusFlag 포커스여부 
	 */
	function checkEmail(identifier, errorMessage, focusFlag ) {
	    if(!checkRegex(identifier,  /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/, true)){
			alert(errorMessage);
			if(focusFlag) identifier.focus();
			return false;
		}
		return true;
	}
