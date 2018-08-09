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

@WebServlet("/deletefromdb")
public class delete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        profile p=new profile();
        profiledao pdao=new profiledaoimpl();
        
        pdao.delete(id);
        System.out.println("Deleted");
        resp.sendRedirect("viewuser.jsp");
    }

    
}
