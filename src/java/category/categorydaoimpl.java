package category;

import java.io.File;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class categorydaoimpl implements categorydao{
String aURL="";
    @Override
    public void insert(Category c) {
        InputStream inputstram=null;
        System.out.println("inserting....");
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into addcategory(id,category_name,category_desc,pic) values(auto_increment.nextval,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, c.getCategory_name());
            ps.setString(2, c.getCategory_desc());
            ps.setString(3, c.getPic());
            ps.executeUpdate();
            System.out.println("Inserted");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="delete from addcategory where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ps.executeUpdate();
            System.out.println("Deleted");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Category c) {
    
        try {
            Connection conn=database.Database.getInstance().getConnection();
            
            String query;
            if(c.getPic().equals("")){
                query="update addcategory set category_name=?, category_desc=? where id="+c.getId();
            }
            else{
                query="update addcategory set category_name=?, category_desc=?,pic='"+c.getPic()+"' where id="+c.getId();
            }
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, c.getCategory_name());
            ps.setString(2, c.getCategory_desc());
            
            ps.executeUpdate();
        } catch (Exception e) {
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
    public Category getCategory(int id) {
        Category c=new Category();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from addcategory where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                c.setId(rs.getInt("id"));
                c.setCategory_name(rs.getString("category_name"));
                c.setCategory_desc(rs.getString("category_desc"));
                c.setPic(rs.getString("pic"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    @Override
    public List<Category> getCategory() {
        List<Category> list=new ArrayList<>();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from addcategory";
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Category c=new Category();
                c.setId(rs.getInt("id"));
                c.setCategory_name(rs.getString("category_name"));
                c.setCategory_desc(rs.getString("category_desc"));
                c.setPic(rs.getString("pic"));
                list.add(c);
        }
        }
            catch (Exception e) {
                e.printStackTrace();
                }
        return list;
        }

    @Override
    public Category getCategory(String cate_name) {
        Category c=new Category();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from addcategory where category_name like '"+cate_name+"'";
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                c.setId(rs.getInt("id"));    
                c.setCategory_name(rs.getString("category_name"));
                c.setCategory_desc(rs.getString("category_desc"));
                c.setPic(rs.getString("pic"));  
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }
    }
    

