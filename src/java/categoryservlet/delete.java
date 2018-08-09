package categoryservlet;

import category.Category;
import category.categorydao;
import category.categorydaoimpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletecategory")
public class delete extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        
        Category c=new Category();
        categorydao cdao=new categorydaoimpl();
        
        cdao.delete(id);
        System.out.println("Deleted complete");
        resp.sendRedirect("viewcategory.jsp");
    }
    
    
}
