package profileimplements;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class profiledaoimpl implements profiledao {

    @Override
    public void insert(profile p) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into adduser(id,first_name,last_name,email_id,password,mobile_no,gender,country,address,role) "
                    + "values(auto_increment.nextval,?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, p.getFirst_name().toUpperCase());
            ps.setString(2, p.getLast_name().toUpperCase());
            ps.setString(3, p.getEmail_id());
            ps.setString(4, p.getPassword());
            ps.setString(5, p.getMobile_no());
            ps.setString(6, p.getGender());
            ps.setString(7, p.getCountry());
            ps.setString(8, p.getAddress());
            ps.setString(9, p.getRole());
            ps.executeUpdate();
            
            System.out.println("Sent successfully");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="delete from adduser where id="+id;
            
            PreparedStatement ps=conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(profile p) {
        System.out.println("updating....");
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="update adduser set first_name=?, last_name=?, email_id=?, password=?, mobile_no=?, gender=?, country=?, address=?"
                    + "where id ="+p.getId();
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, p.getFirst_name());
            ps.setString(2, p.getLast_name());
            ps.setString(3, p.getEmail_id());
            ps.setString(4, p.getPassword());
            ps.setString(5, p.getMobile_no());
            ps.setString(6, p.getGender());
            ps.setString(7, p.getCountry());
            ps.setString(8, p.getAddress());
            //ps.setString(9, p.getRole());
            ps.executeUpdate();
            
            System.out.println("Updated");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public profile getProfile(int id) {
        profile p=new profile();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from adduser where id="+id;
             PreparedStatement ps=conn.prepareStatement(query);
             
             ResultSet rs=ps.executeQuery();
             
             while(rs.next()){
                p.setId(rs.getInt("id"));
                p.setFirst_name(rs.getString("first_name"));
                p.setLast_name(rs.getString("last_name"));
                p.setEmail_id(rs.getString("email_id"));
                p.setPassword(rs.getString("password"));
                p.setMobile_no(rs.getString("mobile_no"));
                p.setGender(rs.getString("gender"));
                p.setCountry(rs.getString("country"));
                p.setAddress(rs.getString("address"));
                p.setRole(rs.getString("role"));

                
                 
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public List<profile> getProfile() {
        List<profile> list=new ArrayList<profile>();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from adduser";
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                profile p=new profile();
                p.setId(rs.getInt("id"));
                p.setFirst_name(rs.getString("first_name"));
                p.setLast_name(rs.getString("last_name"));
                p.setEmail_id(rs.getString("email_id"));
                p.setPassword(rs.getString("password"));
                p.setMobile_no(rs.getString("mobile_no"));
                p.setGender(rs.getString("gender"));
                p.setCountry(rs.getString("country"));
                p.setAddress(rs.getString("address"));
                p.setRole(rs.getString("role"));
                list.add(p);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public profile displayE(String email_id) {
        profile p=new profile();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from adduser where email_id like '"+email_id+"'";
             PreparedStatement ps=conn.prepareStatement(query);
             
             ResultSet rs=ps.executeQuery();
             
             while(rs.next()){
                p.setId(rs.getInt("id"));
                p.setFirst_name(rs.getString("first_name"));
                p.setLast_name(rs.getString("last_name"));
                p.setEmail_id(rs.getString("email_id"));
                p.setPassword(rs.getString("password"));
                p.setMobile_no(rs.getString("mobile_no"));
                p.setGender(rs.getString("gender"));
                p.setCountry(rs.getString("country"));
                p.setAddress(rs.getString("address"));
                p.setRole(rs.getString("role"));

                
                 
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    
}
