package product;

import java.io.File;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class productdaoimple implements productdao{

    String aURL="";
    @Override
    public void insert(Product p) {
          InputStream inputstram=null;
          System.out.println("inserting......");
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into product(id, cat_name, pro_name, pro_type, pro_ideal, pro_capacity, pro_trolley, pro_material, laptop_sleece, style_code, color_code"
                    + ", pro_img,pro_price) values(auto_increment.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            System.out.println(p.getPro_price());
            ps.setString(1, p.getCat_name());
            ps.setString(2, p.getPro_name());
            ps.setString(3, p.getPro_type());
            ps.setString(4, p.getPro_ideal());
            ps.setString(5, p.getPro_capacity());
            ps.setString(6, p.getPro_trolley());
            ps.setString(7, p.getPro_material());
            ps.setString(8, p.getLaptop_sleece());
            ps.setString(9, p.getStyle_code());
            ps.setString(10, p.getColor_code());
            ps.setString(11, p.getPro_img());
            ps.setString(12, p.getPro_price());
            
            ps.executeUpdate();
            System.out.println("inserted");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="delete from product where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Product p) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query;
            if(p.getPro_img().equals("")){
                System.out.println("image not found");
             query="update product set cat_name=?, pro_name=?, pro_type=?, pro_ideal=?, pro_capacity=?, pro_trolley=?, pro_material=?, laptop_sleece=?,"
                    + "style_code=?, color_code=?, pro_price=? where id="+p.getId();    
            }
            else{
               query="update product set cat_name=?, pro_name=?, pro_type=?, pro_ideal=?, pro_capacity=?, pro_trolley=?, pro_material=?, laptop_sleece=?,"
                    + "style_code=?, color_code=?,pro_price=?, pro_img='"+p.getPro_img()+"'  where id="+p.getId();
            }
            PreparedStatement ps=conn.prepareStatement(query);
            
            ps.setString(1, p.getCat_name());
            ps.setString(2, p.getPro_name());
            ps.setString(3, p.getPro_type());
            ps.setString(4, p.getPro_ideal());
            ps.setString(5, p.getPro_capacity());
            ps.setString(6, p.getPro_trolley());
            ps.setString(7, p.getPro_material());
            ps.setString(8, p.getLaptop_sleece());
            ps.setString(9, p.getStyle_code());
            ps.setString(10, p.getColor_code());
            ps.setString(11, p.getPro_price());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String findimage(String name, File file) {
                File[] list=file.listFiles();
        if(list!=null)
            for(File fil:list){
                if(fil.isDirectory()){
                    findimage(name, file);
                }
                else if(name.equalsIgnoreCase(name)){
                    System.out.println("Full path of the image: "+fil.getParentFile()+"\\"+name);
                aURL=String.valueOf(fil.getParentFile()+"\\"+name);
                System.out.println(aURL);
                }
                 //System.out.println("Full path of the image: "+fil.getParentFile()+"\\"+name);
            }
        return aURL;

    }

    @Override
    public Product getProduct(int id) {
        Product p=new Product();
         try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from product where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
                ResultSet rs=ps.executeQuery();
            while(rs.next()){
          
                p.setId(rs.getInt("id"));
                p.setCat_name(rs.getString("cat_name"));
                p.setPro_name(rs.getString("pro_name"));
                p.setPro_type(rs.getString("pro_type"));
                p.setPro_ideal(rs.getString("pro_ideal"));
                p.setPro_capacity(rs.getString("pro_capacity"));
                p.setPro_trolley(rs.getString("pro_trolley"));
                p.setPro_material(rs.getString("pro_material"));
                p.setLaptop_sleece(rs.getString("laptop_sleece"));
                p.setStyle_code(rs.getString("style_code"));
                p.setColor_code(rs.getString("color_code"));
                p.setPro_price(rs.getString("pro_price"));
                p.setPro_img(rs.getString("pro_img"));
        } }
         catch (Exception e) {
             e.printStackTrace();
        }
        return p;
    }

    @Override
    public List<Product> getProduct() {
            List<Product> list=new ArrayList<>();
            try {
            Connection conn=database.Database.getInstance().getConnection();
            
            String query="select * from product";
            PreparedStatement ps=conn.prepareStatement(query);
                ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Product p=new Product();
                p.setId(rs.getInt("id"));
                p.setCat_name(rs.getString("cat_name"));
                p.setPro_name(rs.getString("pro_name"));
                p.setPro_type(rs.getString("pro_type"));
                p.setPro_ideal(rs.getString("pro_ideal"));
                p.setPro_capacity(rs.getString("pro_capacity"));
                p.setPro_trolley(rs.getString("pro_trolley"));
                p.setPro_material(rs.getString("pro_material"));
                p.setLaptop_sleece(rs.getString("laptop_sleece"));
                p.setStyle_code(rs.getString("style_code"));
                p.setColor_code(rs.getString("color_code"));
                p.setPro_price(rs.getString("pro_price"));
                p.setPro_img(rs.getString("pro_img"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
            return list;
            
    }

    @Override
    public List<Product> getProduct(String Cat) {
        List<Product> list=new ArrayList<>();
            try {
            Connection conn=database.Database.getInstance().getConnection();
            
            String query="select * from product where cat_name='"+Cat+"'";
            PreparedStatement ps=conn.prepareStatement(query);
                ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Product p=new Product();
                p.setId(rs.getInt("id"));
                p.setCat_name(rs.getString("cat_name"));
                p.setPro_name(rs.getString("pro_name"));
                p.setPro_type(rs.getString("pro_type"));
                p.setPro_ideal(rs.getString("pro_ideal"));
                p.setPro_capacity(rs.getString("pro_capacity"));
                p.setPro_trolley(rs.getString("pro_trolley"));
                p.setPro_material(rs.getString("pro_material"));
                p.setLaptop_sleece(rs.getString("laptop_sleece"));
                p.setStyle_code(rs.getString("style_code"));
                p.setColor_code(rs.getString("color_code"));
                p.setPro_price(rs.getString("pro_price"));
                p.setPro_img(rs.getString("pro_img"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
            return list;
    }
    
}
