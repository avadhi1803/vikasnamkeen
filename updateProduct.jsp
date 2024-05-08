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
    <title>View Orders - Admin Panel</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@include file = "adminheading.jsp" %>
    <div>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Title</th>
                        <th>Weight</th>
                        <th>Price</th>
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
                        PreparedStatement st = con.prepareStatement("select * from products");
                        ResultSet rs = st.executeQuery();

                        while (rs.next()) {
                            int pId = rs.getInt(5);
                            String title = rs.getString(1);
                            int weight = rs.getInt(2);
                            int price = rs.getInt(3);
                    %>
                    <tr>
                        <td colspan="6"></td>
                    </tr>
                    <tr>
                        <td><%=pId%></td>
                        <td><%=title%></td> 
                        <td><%=weight%></td>
                        <td><%=price%></td>
                        <td><a href="editProduct.jsp?pId=<%=pId%>"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                        <td><button onclick="deleteP(this)" pId="<%=pId%>"><i class="fa fa-trash" aria-hidden="true"></i></button></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
                <script>
  function deleteP(button) {
  // Get the product ID from the data attribute of the button
  var pId = button.getAttribute("pId");
  
  // Show a confirmation dialog
  if (window.confirm("Are you sure you want to delete this product?")) {
    // User confirmed the deletion
    // Redirect to the deleteProduct.jsp with the product ID as a query parameter
    window.location.href = "deleteProduct.jsp?pId=" + encodeURIComponent(pId);
  } else {
    // User canceled the deletion
    // You can provide feedback or do nothing
  }
}
</script>
</body>
</html>
<%
    }
else
{
response.sendRedirect("adminLogin.jsp");
}
%>