package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import profileimplements.profile;
import profileimplements.profiledao;
import profileimplements.profiledaoimpl;

@WebServlet("/doupdate")
public class update extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id=Integer.parseInt(req.getParameter("id"));
        
                profile p=new profile();
        profiledao pdao=new profiledaoimpl();
        
        p.setId(id);
        p.setFirst_name(req.getParameter("fname"));
        p.setLast_name(req.getParameter("lname"));
        p.setEmail_id(req.getParameter("mail"));
        p.setPassword(req.getParameter("pass"));
        p.setMobile_no(req.getParameter("numb"));
        p.setGender(req.getParameter("gen"));
        p.setCountry(req.getParameter("con"));
        p.setAddress(req.getParameter("adress"));
        p.setRole(req.getParameter("role"));
        pdao.update(p);
        System.out.println("updated finish");
        resp.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
}
