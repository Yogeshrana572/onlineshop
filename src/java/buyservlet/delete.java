package buyservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import orders.Order;
import orders.Orderdao;
import orders.Orderdaoimpl;

@WebServlet("/deleteorder")
public class delete extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        Orderdao oda=new Orderdaoimpl();
        Order o=new Order();
        o.setId(id);
        oda.delete(id);
        resp.sendRedirect("vieworders.jsp");
    }
    
}
