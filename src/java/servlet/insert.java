package servlet;

import database.Mail;
import database.SMTPsend;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import profileimplements.profile;
import profileimplements.profiledao;
import profileimplements.profiledaoimpl;

@WebServlet("/dosignup")
public class insert extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Mission successful");
        //String data[]=req.getParameterValues("signup");
//        try {
//           
//            Connection conn=database.Database.getInstance().getConnection();
//            System.out.println("chal hat");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        
        profile p=new profile();
        profiledao pdao=new profiledaoimpl();
        
        p.setFirst_name(req.getParameter("fname"));
        p.setLast_name(req.getParameter("lname"));
        p.setEmail_id(req.getParameter("mail"));
        p.setPassword(req.getParameter("pass"));
        p.setMobile_no(req.getParameter("numb"));
        p.setGender(req.getParameter("gen"));
        p.setCountry(req.getParameter("con"));
        p.setAddress(req.getParameter("adress"));
        p.setRole(req.getParameter("role"));
        pdao.insert(p);
        Mail mail=new Mail();
        mail.sentMail(p.getEmail_id(), "Registered Success ", p.getFirst_name().toUpperCase()+" "+p.getLast_name().toUpperCase()+ 
          " You are signed up as '"+p.getEmail_id()+"',Your Role in this is "+p.getRole().toUpperCase() +" ");
        
//        SMTPsend sms=new SMTPsend();
//        sms.sentmsg(p.getMobile_no(), p.getAddress(),p.getEmail_id());
        resp.sendRedirect("viewuser.jsp");
    }
    
}
