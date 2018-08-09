package orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Orderdaoimpl implements Orderdao{

    @Override
    public void insert(Order o) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into orders(id,product_id,trans_id,status,buyer) values(auto_increment.nextval,?,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setInt(1, o.getProduct_id());
            ps.setInt(2, o.getTrans_id());
            ps.setString(3, o.getStatus());
            ps.setInt(4, o.getBuyer());
            ps.executeUpdate();
            System.out.println("Inserted Order");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="delete from orders where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Order o) {
        
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="update orders set status=? where id="+o.getId();
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, o.getStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Order> getOrder() {
        List<Order> list=new ArrayList<>();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from orders";
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Order o=new Order();
                o.setId(rs.getInt("id"));
                o.setProduct_id(rs.getInt("product_id"));
                o.setTrans_id(rs.getInt("trans_id"));
                o.setStatus(rs.getString("status"));
                o.setBuyer(rs.getInt("buyer"));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Order getOrder(int id) {
        Order o=new Order();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from orders where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                o.setProduct_id(rs.getInt("product_id"));
                o.setTrans_id(rs.getInt("trans_id"));
                o.setStatus(rs.getString("status"));
                o.setBuyer(rs.getInt("buyer"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }

    @Override
    public Order getOrders(int id) {
        Order o=new Order();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from orders where trans_id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                o.setId(rs.getInt("id"));
                o.setProduct_id(rs.getInt("product_id"));
                o.setTrans_id(rs.getInt("trans_id"));
                o.setStatus(rs.getString("status"));
                o.setBuyer(rs.getInt("buyer"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }
   
}
