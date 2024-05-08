<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.DriverManager,java.sql.ResultSet,java.sql.PreparedStatement,java.sql.Connection,java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%
    String ptitle = "";
    int pprice = 0;
    int user_id = 0;
    ptitle = request.getParameter("ptitle");
    String ppriceargu = request.getParameter("pprice");
    String user_idargu = request.getParameter("user_id");
    if (ppriceargu != null && !ppriceargu.isEmpty()) 
    {
        pprice = Integer.parseInt(ppriceargu);
    }
    if (user_idargu != null && !user_idargu.isEmpty()) 
    {
        user_id = Integer.parseInt(user_idargu);
    }
    try
    {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen", "root", "root");
            PreparedStatement stm = con.prepareStatement("delete from cart where userid=? and title=? and price=?");
            stm.setInt(1,user_id);
            stm.setString(2, ptitle);
            stm.setInt(3, pprice);
            stm.executeUpdate();
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("Item removed from cart!");
    }
    catch(Exception e)
    {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write("Error occurred while removing item from cart!");    
    }
%>
