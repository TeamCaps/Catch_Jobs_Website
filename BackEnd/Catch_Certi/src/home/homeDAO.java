package home;
import java.sql.*;

import java.sql.*;
public class homeDAO {
    private String jdbcUrl = "jdbc:mysql://15.164.192.100:52817/caps";
    private String dbId = "caps";
    private String dbPass = "1234";
    public homeDAO(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public String getSkill(){
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String name = null;
        try{
            conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
            pstmt=conn.prepareStatement("select skill from jobs where work_name=?");
            pstmt.setString(1,"");
            rs.next();
            name= rs.getString("skill");
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try{
                if(rs!=null) rs.close();
                if(pstmt!=null) pstmt.close();
                if(conn!=null) conn.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return name;
    }
}
