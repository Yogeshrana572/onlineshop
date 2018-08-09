package categoryservlet;

import category.Category;
import category.categorydao;
import category.categorydaoimpl;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import javax.mail.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatecat")
@MultipartConfig(maxFileSize = 10*1024*1024,maxRequestSize = 20*1024*1024,fileSizeThreshold = 5*1024*1024)
public class update extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Category c=new Category();
        
        categorydao cdao= new categorydaoimpl();
        int id=Integer.parseInt(req.getParameter("id"));
        c.setId(id);
        c.setCategory_name(req.getParameter("cat"));
        c.setCategory_desc(req.getParameter("desc"));
        
        if(req.getPart("img").getInputStream().available()==0){
            System.out.println("image not found");
            c.setPic("");
        }
        else{
            System.out.println("Uplaoding image");
            System.out.println("Finding image");
            javax.servlet.http.Part p = req.getPart("img");
            byte b[]= new byte[p.getInputStream().available()];  
            p.getInputStream().read(b);
            System.out.println(this.getServletContext().getRealPath("/"));
            File f=new File(this.getServletContext().getRealPath("/")+"/image.jpg");
            FileOutputStream fos= new FileOutputStream(f);
            fos.write(b);
            fos.close();
            
            Cloudinary cld=new Cloudinary(ObjectUtils.asMap(
                "cloud_name","yogesh","api_key","569193834155145","api_secret","dhWe7pSL0zMqviVaO0hy0nNWXPc"
                ));
                Map uploadResult=cld.uploader().upload(f,ObjectUtils.emptyMap());
                System.out.println(uploadResult.get("secure_url"));

                c.setPic(String.valueOf(uploadResult.get("secure_url")));
        }
        cdao.update(c);
        System.out.println("Update compelete");
        
        resp.sendRedirect("viewcategory.jsp");
    }
    
}
