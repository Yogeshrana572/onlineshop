package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import profileimplements.profile;
import profileimplements.profiledao;
import profileimplements.profiledaoimpl;

@WebServlet("/loginin")
public class login  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       boolean log=false;
        profiledao pdao=new profiledaoimpl();
        List<profile> list=pdao.getProfile();
        
        for(profile pro: list){
            if(pro.getEmail_id().equalsIgnoreCase(req.getParameter("user")) && pro.getPassword().equalsIgnoreCase(req.getParameter("pass"))){
                log=true;
                req.getSession().setAttribute("luser",req.getParameter("user"));
                req.getSession().setAttribute("lpass", req.getParameter("pass"));
                req.getSession().setAttribute("role", pro.getRole());
                req.getSession().setAttribute("name", pro.getFirst_name());
                break;
            }
        }
        if(log){
            System.out.println("login Grantred");
            resp.sendRedirect("index.jsp");
        }
        else{
            System.out.println("login denied");
            resp.sendRedirect("denied.jsp");
        }
    }
    
}
