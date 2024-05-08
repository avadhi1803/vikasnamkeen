<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.servlet.annotation.*"%>
<%@page import="javax.servlet.ServletException"%>

<%
    int orderId = Integer.parseInt(request.getParameter("orderId"));
    String newStatus = request.getParameter("status");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen", "root", "root");
        PreparedStatement st = con.prepareStatement("UPDATE ordertable SET status=? WHERE orderId=?");
        st.setString(1, newStatus);
        st.setInt(2, orderId);
        st.executeUpdate();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("viewOrder.jsp"); // Redirect back to the orders page
%>
