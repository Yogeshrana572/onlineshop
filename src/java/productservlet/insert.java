package productservlet;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import product.Product;
import product.productdao;
import product.productdaoimple;

@WebServlet("/addproduct")
@MultipartConfig(maxFileSize = 10*1024*1024,maxRequestSize = 20*1024*1024,fileSizeThreshold = 5*1024*1024)
public class insert extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product p=new Product();
        productdao pdao=new productdaoimple();
        
       p.setCat_name(req.getParameter("cate")); 
        p.setPro_name(req.getParameter("naam"));
        p.setPro_type(req.getParameter("typ"));
        p.setPro_ideal(req.getParameter("ideal"));
        p.setPro_capacity(req.getParameter("cap"));
        p.setPro_trolley(req.getParameter("tro"));
        p.setPro_material(req.getParameter("mat"));
        p.setLaptop_sleece(req.getParameter("sle"));
        p.setStyle_code(req.getParameter("sty"));
        p.setColor_code(req.getParameter("col"));
        p.setPro_price(req.getParameter("pri"));
        
        Part pp=req.getPart("pic");
        byte b[]=new byte[pp.getInputStream().available()];
        pp.getInputStream().read(b);
        System.out.println(this.getServletContext().getRealPath("/"));
        
        File f=new File(this.getServletContext().getRealPath("/")+"/image.jpg");
        
        FileOutputStream fos=new FileOutputStream(f);
        fos.write(b);
        fos.close();
        
        Cloudinary cld=new Cloudinary(ObjectUtils.asMap(
                "cloud_name","yogesh","api_key","569193834155145","api_secret","dhWe7pSL0zMqviVaO0hy0nNWXPc"));
        Map uploadResult=cld.uploader().upload(f, ObjectUtils.emptyMap());
        System.out.println(uploadResult.get("secure_url"));
        p.setPro_img(String.valueOf(uploadResult.get("secure_url")));
        pdao.insert(p);
         
        System.out.println("insert complete");
            resp.sendRedirect("viewproduct.jsp");
            System.out.println(req.getParameter("pri"));
    }
 
    
}
