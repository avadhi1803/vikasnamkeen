<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Orders</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@include file = "heading.jsp" %>
    <div>
<div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Product Title</th>
                        <th>Date of Booking</th>
                        <th>Product Quantity</th>
                        <th>Product Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
<%
                if(session == null || session.getAttribute("user_id") == null)
                {
                    response.sendRedirect("signup.jsp");      
                }
                else
                {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
                PreparedStatement st = con.prepareStatement("select * from ordertable where userid=? order by date desc");
                st.setInt(1,(int)session.getAttribute("user_id"));
                ResultSet rs = st.executeQuery();
                        String currentDate = ""; // Initialize to an empty string

                        while (rs.next()) {
                            String productTitle = rs.getString(3);
                            String dateOfBooking = rs.getString(2);
                            int productQuantity = rs.getInt(4);
                            int productPrice = rs.getInt(5);
                            String status = rs.getString(6);
                            
                            if (!dateOfBooking.equals(currentDate)) {
                                // Start a new table row for the new customer or date
%>
                     <!-- Close the previous row if it exists -->
                    <tr>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        <td colspan="4"><b>Date: <%=dateOfBooking%> | Status: <%=status%></b></td>
                        <td>
                        <!-- Add a button to generate the bill if the order is delivered -->
                        <% if (status.equals("Delivered")) { %>
                            <form action="bill2.jsp" method="post">
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
                            currentDate = dateOfBooking;
                        }
                    %>
                    <tr>
                        <td><%=productTitle%></td>
                        <td><%=dateOfBooking%></td>
                        <td><%=productQuantity%></td>
                        <td><%=productPrice%></td>
                        <td></td>
                    </tr>
                    <% }
}%>
                    </tbody>
            </table>
        </div>
    </div>
</body>
</html>