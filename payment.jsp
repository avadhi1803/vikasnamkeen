<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.DriverManager,java.sql.ResultSet,java.sql.PreparedStatement,java.sql.Connection,java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%
    int orderId = 0;
    int user_id = 0;
    String orderIdargu = request.getParameter("orderId");
    String user_idargu = request.getParameter("user_id");
    String houseNo = request.getParameter("houseNo");
    String areaLandmark = request.getParameter("areaLandmark");
    String city = request.getParameter("city");
    String pincode = request.getParameter("pincode");
    if (orderIdargu != null && !orderIdargu.isEmpty()) 
    {
        orderId = Integer.parseInt(orderIdargu);
    }
    if (user_idargu != null && !user_idargu.isEmpty()) 
    {
        user_id = Integer.parseInt(user_idargu);
    }
    try
    {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
            
//            int randomNum = (int) (Math.random() * 1000);
//            int orderId = (int)randomNum;

            String sql = "select * from cart where userid=?";
            PreparedStatement stmt2 = con.prepareStatement(sql);
            stmt2.setInt(1, user_id);
            ResultSet rs = stmt2.executeQuery();
            ArrayList<String> title = new ArrayList<>();
            ArrayList<Integer> price = new ArrayList<>();
            ArrayList<Integer> quantity = new ArrayList<>();
            while(rs.next())
            {
                title.add(rs.getString(2));
                price.add(rs.getInt(3));
                quantity.add(rs.getInt(4));
            }
            int i=0;
            while(i<title.size())
            {
            PreparedStatement stmt = con.prepareStatement("insert into ordertable(userid,date,title,quantity,price,orderId) values(?,CURRENT_TIMESTAMP,?,?,?,?)");
            stmt.setInt(1, user_id);
            stmt.setString(2, title.get(i));
            stmt.setInt(3, quantity.get(i));
            stmt.setInt(4, price.get(i));
            stmt.setInt(5, orderId);
            stmt.executeUpdate();
            i++;
            if(i>=title.size())
            {
               break;
            }
            }
            
            PreparedStatement ps = con.prepareStatement("insert into address values(?,?,?,?,?,?)");
            ps.setInt(1,user_id);
            ps.setInt(2,orderId);
            ps.setString(3,houseNo);
            ps.setString(4,areaLandmark);
            ps.setString(5,city);
            ps.setString(6,pincode);
            ps.executeUpdate();
            
            PreparedStatement stm = con.prepareStatement("delete from cart where userid=?");
            stm.setInt(1,user_id);
            stm.executeUpdate();
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("Order details saved successfully!");
    }
    catch(Exception e)
    {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write("Error occurred while ordering!");    
    }
%>
