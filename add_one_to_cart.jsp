<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.DriverManager,java.sql.ResultSet,java.sql.PreparedStatement,java.sql.Connection,java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%
    String ptitle = "";
    int pprice = 0;
    int pquantity = 0;
    int user_id = 0;
    ptitle = request.getParameter("ptitle");
    String ppriceargu = request.getParameter("pprice");
    String pquantityargu = request.getParameter("pquantity");
    String user_idargu = request.getParameter("user_id");
    if (ppriceargu != null && !ppriceargu.isEmpty()) 
    {
        pprice = Integer.parseInt(ppriceargu);
    }
    if (pquantityargu != null && !pquantityargu.isEmpty()) 
    {
        pquantity = Integer.parseInt(pquantityargu);
        pquantity++;
    }
    if (user_idargu != null && !user_idargu.isEmpty()) 
    {
        user_id = Integer.parseInt(user_idargu);
    }
    try
    {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen", "root", "root");
            PreparedStatement stm = con.prepareStatement("update cart set quantity=? where userid=? and title=? and price=?");
            stm.setInt(1, pquantity);
            stm.setInt(2,user_id);
            stm.setString(3, ptitle);
            stm.setInt(4, pprice);
            stm.executeUpdate();
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("Item added to cart!");
    }
    catch(Exception e)
    {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write("Error occurred while adding item to cart!");    
    }
%>
