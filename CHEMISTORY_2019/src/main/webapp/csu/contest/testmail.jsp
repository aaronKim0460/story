<%@ page contentType = "text/html; charset=euc-kr" %> 
<%@ page import="java.util.*,java.io.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %> 

<% 
 String subject = "konetic제목입니다"; 
 String content = "내용입니다."; 
 String from = "cass1422@ymail.com"; //보내는 사람 
 String to = "cass1422@ymail.com"; //받는 사람 
  
 // 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정) 
 Properties props = new Properties(); 
 props.put("mail.smtp.host", "smtp.mail.yahoo.co.kr");  
 Session sess= Session.getInstance(props, null); 
 Message msg = new MimeMessage(sess); 
 msg.setFrom(new InternetAddress(from));//보내는 사람 설정 
 InternetAddress address = new InternetAddress(to); 
 msg.setRecipient(Message.RecipientType.TO, address);//받는 사람설정 
 msg.setSubject(subject);//제목 설정 
 msg.setSentDate(new java.util.Date());//보내는 날짜 설정 
 msg.setContent(content,"text/html;charset=euc-kr"); // 내용 설정 (HTML 형식) 
 try{ 
 Transport.send(msg);//메일 보내기 
    out.println ("OK"); 
 }catch (MessagingException e){ 
     out.println ("ERROR"); 
     out.println (e.getMessage()); 
 } 
%> 
