package productservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import product.Product;
import product.productdao;
import product.productdaoimple;

@WebServlet("/deletedb")
public class delete extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        Product p=new Product();
        productdao pdao=new productdaoimple();
        
        pdao.delete(id);
        resp.sendRedirect("viewproduct.jsp");
        System.out.println("Deleted");
    }
    
}
