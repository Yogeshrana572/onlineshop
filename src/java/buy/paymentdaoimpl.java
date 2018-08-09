package buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class paymentdaoimpl implements paymentdao{

    @Override
    public void insert(Payment p) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into payment(id, bank, cadr_no, expiry_date, cvv, holder) values(auto_increment.nextval,?,?,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(query);

            ps.setString(1, p.getBank());
            ps.setString(2, p.getCadr_no());
            ps.setString(3, p.getExpiry_date());
            ps.setString(4, p.getCvv());
            ps.setString(5, p.getHolder());
                        ps.executeUpdate();
                        System.out.println("complete payment");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Payment getPayment(int id) {
           Payment p=new Payment();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from payment where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
              
                p.setId(rs.getInt("id"));
                p.setBank(rs.getString("bank"));
                p.setExpiry_date(rs.getString("expiry_date"));
                p.setCvv(rs.getString("cvv"));
                p.setHolder(rs.getString("holder"));
                p.setCadr_no(rs.getString("cadr_no"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public List<Payment> getPayment() {
           List<Payment> list=new ArrayList<>();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from payment";
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            Payment p=new Payment();
            while(rs.next()){
              
                p.setId(rs.getInt("id"));
                p.setBank(rs.getString("bank"));
                p.setExpiry_date(rs.getString("expiry_date"));
                p.setCvv(rs.getString("cvv"));
                p.setHolder(rs.getString("holder"));
                p.setCadr_no(rs.getString("cadr_no"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Payment getPayments(String card) {
           Payment p=new Payment();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from payment where cadr_no like '"+card+"'";
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
              
                p.setId(rs.getInt("id"));
                p.setBank(rs.getString("bank"));
                p.setExpiry_date(rs.getString("expiry_date"));
                p.setCvv(rs.getString("cvv"));
                p.setHolder(rs.getString("holder"));
                p.setCadr_no(rs.getString("cadr_no"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    
}
