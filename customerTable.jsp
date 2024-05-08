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
    int adminLogin = (session != null && session.getAttribute("adminLogin") != null) ? (int) session.getAttribute("adminLogin") : 0;
    if (adminLogin> 0) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Customers - Admin Panel</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@include file = "adminheading.jsp" %>
    <div>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Email</th>
                        <th>Contact Number</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
                        PreparedStatement st = con.prepareStatement("select * from login");
                        ResultSet rs = st.executeQuery();

                        while (rs.next()) {
                            int uId = rs.getInt(4);
                            String email = rs.getString(1);
                            String contact = rs.getString(2);
                    %>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td><%=uId%></td>
                        <td><%=email%></td> 
                        <td><%=contact%></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
<%
    }
else
{
response.sendRedirect("adminLogin.jsp");
}
%>