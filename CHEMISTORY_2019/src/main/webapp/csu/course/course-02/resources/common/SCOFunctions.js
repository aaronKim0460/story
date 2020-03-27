/*******************************************************************************
** 
** Filename: SCOFunctions.js
**
** File Description: This file contains several JavaScript functions that are 
**                   used by the Sample SCOs contained in the Sample Course.
**                   These functions encapsulate actions that are taken when the
**                   user navigates between SCOs, or exits the Lesson.
**
** Author: ADL Technical Team
**
** Contract Number:
** Company Name: CTC
**
** Design Issues:
**
** Implementation Issues:
** Known Problems:
** Side Effects:
**
** References: ADL SCORM
**
/*******************************************************************************
**
** Concurrent Technologies Corporation (CTC) grants you ("Licensee") a non-
** exclusive, royalty free, license to use, modify and redistribute this
** software in source and binary code form, provided that i) this copyright
** notice and license appear on all copies of the software; and ii) Licensee
** does not utilize the software in a manner which is disparaging to CTC.
**
** This software is provided "AS IS," without a warranty of any kind.  ALL
** EXPRESS OR IMPLIED CONDITIONS, REPRESENTATIONS AND WARRANTIES, INCLUDING ANY
** IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NON-
** INFRINGEMENT, ARE HEREBY EXCLUDED.  CTC AND ITS LICENSORS SHALL NOT BE LIABLE
** FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR
** DISTRIBUTING THE SOFTWARE OR ITS DERIVATIVES.  IN NO EVENT WILL CTC  OR ITS
** LICENSORS BE LIABLE FOR ANY LOST REVENUE, PROFIT OR DATA, OR FOR DIRECT,
** INDIRECT, SPECIAL, CONSEQUENTIAL, INCIDENTAL OR PUNITIVE DAMAGES, HOWEVER
** CAUSED AND REGARDLESS OF THE THEORY OF LIABILITY, ARISING OUT OF THE USE OF
** OR INABILITY TO USE SOFTWARE, EVEN IF CTC  HAS BEEN ADVISED OF THE
** POSSIBILITY OF SUCH DAMAGES.
**
*******************************************************************************/

/*******************************************************************************
**
** @ date : 2011.01.06
** @ modify : Janghee, Ryu	karma@cybermba.com 
**
*******************************************************************************/
var startDate;
var exitPageStatus;

function loadPage(page_count) {
	doInitialize();
	if( doGetValue("cmi.entry") == "ab-initio" || doGetValue("cmi.completion_status") == "unknown" || doGetValue("cmi.completion_status") == "not attempted" ) {
		doSetValue("cmi.completion_status","incomplete");
		doSetValue("cmi.suspend_data" , 0);
		doSetValue("cmi.location","");
	}
}

function PageLocation(page, count, tpage){
	var total_page = parseInt(tpage, 10);
	doSetValue("cmi.location",page);
	var oldProgPage = doGetValue("cmi.suspend_data"); // 이전 학습때 완료한 페이지 정보
	var oldProgress = doGetValue("cmi.progress_measure"); // 이전학습때 완료한 진도율
	var newProgress;
	//진도율 초기화 , 학습완료 페이지 초기화
	if( oldProgPage == "" || oldProgPage == null || oldProgPage == "undefined" ) {
		oldProgPage = 0;
	}
	if( oldProgress == "" || oldProgress == null || oldProgress == "undefined") {
		oldProgress = "0.0";
	}
	if(oldProgPage < count ) {
		doSetValue("cmi.suspend_data" , count);
		newProgress = (count / total_page).toFixed(2);
		doSetValue("cmi.progress_measure",newProgress);
		
		if( count == total_page && doGetValue("cmi.completion_status") != "completed") {
			doSetValue("cmi.completion_status","completed");
		}
		doCommit();
	}
	//alert("newProgress : "+newProgress+"\noldProgress : "+oldProgress+"\ncmi.completion_status : "+doGetValue("cmi.completion_status"));
}

function getLearnFlag(page) {
	var jindoPage = parseInt(doGetValue("cmi.suspend_data"), 10);
	if(doGetValue("cmi.completion_status") == "completed") {
		return true;
	}
	if(jindoPage >= page) {
		return true;
	} else if(jindoPage < page) {
		return false;
	}
}

function getLearnJumpFlag(page){
	var jindoPage = parseInt(doGetValue("cmi.suspend_data"),10);
	if(doGetValue("cmi.completion_status") == "completed") {
		return true;
	}
	if(jindoPage+1 >= page) {
		return true;
	} else {
		return false;
	}
}

function startTimer() {
   startDate = new Date().getTime();
}

function computeTime() {
   if( startDate != 0 ) {
      var currentDate = new Date().getTime();
      var elapsedSeconds = ( (currentDate - startDate) / 1000 );
      var formattedTime = convertTotalSeconds( elapsedSeconds );
   } else {
      formattedTime = "00:00:00.0";
   }
   doSetValue( "cmi.core.session_time", formattedTime );
}

function doBack() {
   doSetValue( "cmi.core.exit", "suspend" );

   computeTime();
   exitPageStatus = true;
   
   var result;
   result = doCommit();
	// NOTE: LMSFinish will unload the current SCO.  All processing
	//       relative to the current page must be performed prior
	//		 to calling LMSFinish.   
}

function doContinue( status ) {
   // Reinitialize Exit to blank
   doSetValue( "cmi.core.exit", "" );

   var mode = doGetValue( "cmi.core.lesson_mode" );

   if ( mode != "review"  &&  mode != "browse" ) {
      doSetValue( "cmi.completion_status", status );
   }
 
//   computeTime();
   exitPageStatus = true;
   
   var result;
   result = doCommit();
	// NOTE: LMSFinish will unload the current SCO.  All processing
	//       relative to the current page must be performed prior
	//		 to calling LMSFinish.   
}

function doQuit() {
   doSetValue( "cmi.exit", "logout" );

//   computeTime();
   exitPageStatus = true;
   
   var result;

//   result = doCommit();
   result = doTerminate();    
	// NOTE: LMSFinish will unload the current SCO.  All processing
	//       relative to the current page must be performed prior
	//		 to calling LMSFinish.   
  
}

/*******************************************************************************
** The purpose of this function is to handle cases where the current SCO may be 
** unloaded via some user action other than using the navigation controls 
** embedded in the content.   This function will be called every time an SCO
** is unloaded.  If the user has caused the page to be unloaded through the
** preferred SCO control mechanisms, the value of the "exitPageStatus" var
** will be true so we'll just allow the page to be unloaded.   If the value
** of "exitPageStatus" is false, we know the user caused to the page to be
** unloaded through use of some other mechanism... most likely the back
** button on the browser.  We'll handle this situation the same way we 
** would handle a "quit" - as in the user pressing the SCO's quit button.
*******************************************************************************/
function unloadPage() {

//	if (exitPageStatus != true)
//	{
		doQuit();
//	}

	// NOTE:  don't return anything that resembles a javascript
	//		  string from this function or IE will take the
	//		  liberty of displaying a confirm message box.

}

/*******************************************************************************
** this function will convert seconds into hours, minutes, and seconds in
** CMITimespan type format - HHHH:MM:SS.SS (Hours has a max of 4 digits &
** Min of 2 digits
*******************************************************************************/
function convertTotalSeconds(ts) {
   var sec = (ts % 60);

   ts -= sec;
   var tmp = (ts % 3600);  //# of seconds in the total # of minutes
   ts -= tmp;              //# of seconds in the total # of hours

   // convert seconds to conform to CMITimespan type (e.g. SS.00)
   sec = Math.round(sec*100)/100;
   
   var strSec = new String(sec);
   var strWholeSec = strSec;
   var strFractionSec = "";

   if (strSec.indexOf(".") != -1) {
      strWholeSec =  strSec.substring(0, strSec.indexOf("."));
      strFractionSec = strSec.substring(strSec.indexOf(".")+1, strSec.length);
   }
   
   if (strWholeSec.length < 2) {
      strWholeSec = "0" + strWholeSec;
   }
   strSec = strWholeSec;
   
   if (strFractionSec.length) {
      strSec = strSec+ "." + strFractionSec;
   }


   if ((ts % 3600) != 0 )
      var hour = 0;
   else var hour = (ts / 3600);
   if ( (tmp % 60) != 0 )
      var min = 0;
   else var min = (tmp / 60);

   if ((new String(hour)).length < 2)
      hour = "0"+hour;
   if ((new String(min)).length < 2)
      min = "0"+min;

   var rtnVal = hour+":"+min+":"+strSec;

   return rtnVal;
}

