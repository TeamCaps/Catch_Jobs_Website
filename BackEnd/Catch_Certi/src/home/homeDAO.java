package home;
import java.sql.*;
import java.util.*;
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
    public String rankSkill(String workName)throws SQLException{
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs1=null;
        String skill_name=null;
        try {
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
            pstmt = conn.prepareStatement("select * from jobs where work_name=?");
            pstmt.setString(1, workName);
            rs1= pstmt.executeQuery();
            Map<String, Integer> ranking = new HashMap<>();

            String tok;
            while (rs1.next()) {
                StringTokenizer tok1 = new StringTokenizer(rs1.getString("skill"), "\n");
                while (tok1.hasMoreTokens()) {
                    tok = tok1.nextToken();
                    ranking.put(tok, ranking.containsKey(tok) ? ranking.get(tok) + 1 : 1);
                }
            }
            List<Map.Entry<String, Integer>> rank = new ArrayList<>(ranking.entrySet());
            Collections.sort(rank, new Comparator<Map.Entry<String, Integer>>() {
                @Override
                public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                    return o2.getValue().compareTo(o1.getValue());
                }

            });
            skill_name=rank.get(0).getKey()+", "+rank.get(1).getKey()+", "+rank.get(2).getKey();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try{
                if(rs1!=null) rs1.close();
                if(pstmt!=null) pstmt.close();
                if(conn!=null) conn.close();
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        return skill_name;
    }}

