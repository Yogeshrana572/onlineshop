package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {

    public static Database obj=new Database();
    private Connection conn;
    
    private Database(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Connecting...");
            conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","shopping","shop");
            System.out.println("Connected");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    public static Database getInstance(){
        return obj;
    }
    public Connection getConnection(){
        return conn;
    }
}
