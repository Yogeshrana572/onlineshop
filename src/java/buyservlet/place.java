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

@WebServlet("/placeorder")
public class place extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Orderdao odao=new Orderdaoimpl();
        Order o=new Order();
        o.setId(Integer.parseInt(req.getParameter("id")));
        o.setStatus("Dispatch");
        odao.update(o);
        resp.sendRedirect("vieworders.jsp");
    }
    
}
