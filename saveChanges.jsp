<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*"%>"
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.servlet.annotation.*"%>
<%@page import="javax.servlet.ServletException"%>

<%
    // Retrieve the updated product details from the form
    int pId = Integer.parseInt(request.getParameter("pId"));
    String newTitle = request.getParameter("title");
    int newWeight = Integer.parseInt(request.getParameter("weight"));
    int newPrice = Integer.parseInt(request.getParameter("price"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
    PreparedStatement st = con.prepareStatement("update products set title=?, weight=?, price=? where pid=?");
    st.setString(1,newTitle);
    st.setInt(2,newWeight);
    st.setInt(3,newPrice);
    st.setInt(4,pId); 
    st.executeUpdate();
    response.sendRedirect("updateProduct.jsp");
%>
