<%@ page import="java.sql.DriverManager,java.sql.ResultSet,java.sql.PreparedStatement,java.sql.Connection,java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
    <%
    String ptitle = "";
    int pprice = 0;
    int pquantity = 0;
    ptitle = request.getParameter("ptitle");
    String ppriceargu = request.getParameter("pprice");
    String pquantityargu = request.getParameter("pquantity");
    if (ppriceargu != null && !ppriceargu.isEmpty()) 
    {
    pprice = Integer.parseInt(ppriceargu);
    }
    if (pquantityargu != null && !pquantityargu.isEmpty()) 
    {
    pquantity = Integer.parseInt(pquantityargu);
    }
    try
    {
    int user_id = (session != null && session.getAttribute("user_id") != null) ? (int) session.getAttribute("user_id") : 0;
    if (user_id > 0) {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen", "root", "root");
            PreparedStatement st = con.prepareStatement("select * from cart where userid=? and title=? and price=?");
            st.setInt(1,user_id);
            st.setString(2, ptitle);
            st.setInt(3, pprice);
            ResultSet rs = st.executeQuery();
            if(rs.next())
            {
                int quan = rs.getInt(4)+1;
                PreparedStatement st2 = con.prepareStatement("update cart set quantity=? where userid=? and title=? and price=?");
                st2.setInt(1,quan);
                st2.setInt(2,user_id);
                st2.setString(3,ptitle);
                st2.setInt(4,pprice);
                st2.executeUpdate();
            }
            else
            {
            String sql = "INSERT INTO cart(userid,title,price,quantity) VALUES (?,?,?,?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, user_id);
            stmt.setString(2, ptitle);
            stmt.setInt(3, pprice);
            stmt.setInt(4, pquantity);
            stmt.executeUpdate();
            }
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("Added to cart!");
} 
else {
        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        response.getWriter().write("Access denied. Please log in!");
    }
        }
        catch(Exception e)
        {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write("Error occurred while adding to cart!");
        }
    %>