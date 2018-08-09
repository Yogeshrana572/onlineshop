package buyservlet;

import buy.Payment;
import buy.paymentdao;
import buy.paymentdaoimpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import orders.Order;
import orders.Orderdao;
import orders.Orderdaoimpl;
import product.Product;
import product.productdao;
import product.productdaoimple;
import profileimplements.profile;
import profileimplements.profiledao;
import profileimplements.profiledaoimpl;
import sun.java2d.cmm.Profile;

@WebServlet("/dopayment")
public class insert extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Payment p=new Payment();
        paymentdao pdao=new paymentdaoimpl();
        
        p.setBank(req.getParameter("bnk"));
        p.setCadr_no(req.getParameter("card"));
        p.setExpiry_date(req.getParameter("expire"));
        p.setCvv(req.getParameter("cvv"));
        p.setHolder(req.getParameter("hld"));
        pdao.insert(p);
        
        p=pdao.getPayments(req.getParameter("card"));
        
        Orderdao odao=new Orderdaoimpl();
        Order o=new Order();
        
        profiledao pda=new profiledaoimpl();
        profile pp=pda.displayE(req.getSession().getAttribute("luser").toString());
        
        productdao pd=new productdaoimple();
        Product pr=pd.getProduct(Integer.parseInt(req.getParameter("id")));
        
        o.setProduct_id(Integer.parseInt(req.getParameter("id")));
        o.setTrans_id(p.getId());
        o.setStatus("Order");
        o.setBuyer(pp.getId());
        odao.insert(o);
        
        
        resp.sendRedirect("orderdetail.jsp?id="+p.getId());
        
    }
    
}
