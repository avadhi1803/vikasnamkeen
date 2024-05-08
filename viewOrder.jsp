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
                        <th>Product Title</th>
                        <th>Product Quantity</th>
                        <th>Product Price</th>
                        <th>Customer ID</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
                        
                        PreparedStatement st = con.prepareStatement("select * from ordertable left join address on ordertable.orderId=address.orderid order by date desc");
                        ResultSet rs = st.executeQuery();
                        int currentCustomerID = -1; // Initialize to an invalid value
                        String currentDate = ""; // Initialize to an empty string
                        String address = "";
                        while (rs.next()) {
                        int customerID = rs.getInt(1);
                        String productTitle = rs.getString(3);
                        String dateOfBooking = rs.getString(2);
                        int productQuantity = rs.getInt(4);
                        int productPrice = rs.getInt(5);
                        String status = rs.getString("status"); // Assuming status is a column in your ordertable
                        address = rs.getString(10)+" "+rs.getString(11)+" "+rs.getString(12)+" "+rs.getString(13);
                        if (customerID != currentCustomerID || !dateOfBooking.equals(currentDate)) {
                            // Start a new table row for the new customer or date
                    %>
                    </tr> <!-- Close the previous row if it exists -->
                    <tr>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        <td colspan="3"><b>Customer ID: <%=customerID%> | Date: <%=dateOfBooking%> <br> Address: <%=address%></b></td>
                        <td>
                            <!-- Display the current status and provide an option to change it -->
                            <form action="updateStatus.jsp" method="post">
                                <input type="hidden" name="orderId" value="<%=rs.getInt("orderId")%>">
                                <select name="status">
                                    <option value="Not Delivered" <%=status.equals("Not Delivered") ? "selected" : ""%>>Not Delivered</option>
                                    <option value="Delivered" <%=status.equals("Delivered") ? "selected" : ""%>>Delivered</option>
                                </select>
                                <br><br>
                                <input type="submit" value="Update Status">
                            </form>
                        </td>
                        <td>
                        <!-- Add a button to generate the bill if the order is delivered -->
                        <% if (status.equals("Delivered")) { %>
                            <form action="bill.jsp" method="post">
                                <input type="hidden" name="orderId" value="<%=rs.getInt("orderId")%>">
                                <input type="submit" value="Generate Bill">
                            </form>
                        <% } else { %>
                            <!-- Display a message or an inactive button if the order is not delivered -->
                            Order Not Delivered
                        <% } %>
                    </td>
                    </tr>
                    <%
                            currentCustomerID = customerID;
                            currentDate = dateOfBooking;
                        }
                    %>
                    <tr>
                        <td><%=productTitle%></td>
                        <td><%=productQuantity%></td>
                        <td><%=productPrice%></td>
                        <td><%=customerID%></td>
                        <td></td>
           
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