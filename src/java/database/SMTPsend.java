package database;
import java.io.*;

import java.net.InetAddress;

import java.util.Properties;

import java.util.Date;

import javax.mail.*;

import javax.mail.internet.*;

import javax.activation.*;
import profileimplements.profile;
import profileimplements.profiledao;
import profileimplements.profiledaoimpl;

public class SMTPsend {  

     

    public void sentmsg(String to, String compression,String msg) {
        profiledao pdao=new profiledaoimpl();
        profile p;
        
        final String username="8800960698";
        final String password="Rana2598";
        
        Properties prop=new Properties();
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "way2sms.com");
        prop.put("mail.smtp.port", "587");
        
        Session session=Session.getInstance(prop,new javax.mail.Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(username, password);
            }
        });
        
        try {
            Message message=new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(compression);
            message.setContent("<h:body style=background-color:white;font-family:verdana;>\n"
                    + "Mr./Ms./Mrs. :"  +msg+"</body>","text/html; charset=utf-8");
            Transport.send(message);
   
    System.out.println("sms send");
} catch (Exception e) {

e.printStackTrace();

}
    }

}