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
int rId = Integer.parseInt(request.getParameter("rId"));
String ownerReply = request.getParameter("reply");

// Update the database with the owner's reply
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
PreparedStatement updateSt = con.prepareStatement("UPDATE review SET reply = ? WHERE reviewid = ?");
updateSt.setString(1, ownerReply);
updateSt.setInt(2, rId);
updateSt.executeUpdate();

// Redirect back to the page displaying reviews
response.sendRedirect("adminReview.jsp");

%>
