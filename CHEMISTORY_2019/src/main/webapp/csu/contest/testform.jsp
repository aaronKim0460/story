<%@ page contentType="text/html; charset=euc-kr" language="java" import="java.sql.*" errorPage="" %>
<html>
 <head><title>Sending a Custom Email - HTML Form</title></head>
 <body>
  <p align="center"><b>A custom email utility.</b></p>
  <form name="form" action="/contest/testmail.jsp" method="post"> 
   <table align="center">
<tr><td>From</td><td><input name="from" size="50" value="cass24@nate.com"></td></tr>
     <tr><td>To</td><td><input name="to" size="50"  value="cass1422@naver.com"></td></tr>
     <tr><td>Subject</td><td>
      <input name="subject" size="50" value="테스트 test">
     </td></tr>
     <tr><td colspan="2">
      <textarea name="text" cols="50" rows="20">테스트 test</textarea>
     </td></tr>
     <tr><td colspan="2" align="center"><input type="submit" value="Send Email"></td></tr>
   </table>
  </form>
 </body>
</html>
