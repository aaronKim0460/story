<%@ page contentType = "text/html; charset=euc-kr" %> 
<%@ page import="java.util.*,java.io.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %> 

<% 
 String subject = "konetic�����Դϴ�"; 
 String content = "�����Դϴ�."; 
 String from = "cass1422@ymail.com"; //������ ��� 
 String to = "cass1422@ymail.com"; //�޴� ��� 
  
 // ������Ƽ �� �ν��Ͻ� ������ �⺻����(SMTP ���� ȣ��Ʈ ����) 
 Properties props = new Properties(); 
 props.put("mail.smtp.host", "smtp.mail.yahoo.co.kr");  
 Session sess= Session.getInstance(props, null); 
 Message msg = new MimeMessage(sess); 
 msg.setFrom(new InternetAddress(from));//������ ��� ���� 
 InternetAddress address = new InternetAddress(to); 
 msg.setRecipient(Message.RecipientType.TO, address);//�޴� ������� 
 msg.setSubject(subject);//���� ���� 
 msg.setSentDate(new java.util.Date());//������ ��¥ ���� 
 msg.setContent(content,"text/html;charset=euc-kr"); // ���� ���� (HTML ����) 
 try{ 
 Transport.send(msg);//���� ������ 
    out.println ("OK"); 
 }catch (MessagingException e){ 
     out.println ("ERROR"); 
     out.println (e.getMessage()); 
 } 
%> 
