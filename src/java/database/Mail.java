package database;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import profileimplements.profile;
import profileimplements.profiledao;
import profileimplements.profiledaoimpl;

public class Mail{
    
    public void sentMail(String email,String subject,String msg){
        
        profiledao pdao=new profiledaoimpl();
        profile p;
        
        final String username="onlineshopfootwear94@gmail.com";
        final String password="Online_shop";
        
        Properties prop=new Properties();
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        
        Session session=Session.getInstance(prop,new javax.mail.Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(username, password);
            }
        });
        
        try {
            Message message=new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject(subject);
            message.setContent("<h:body style=background-color:white;font-family:verdana;>\n"
                    + "Mr./Ms./Mrs. :"  +msg+"</body>","text/html; charset=utf-8");
            Transport.send(message);
            System.out.println("mail sent");
            
        } catch (MessagingException e) {

            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    
}
