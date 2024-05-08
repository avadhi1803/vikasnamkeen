<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                int total=0;
                int discount=0;
                int delivery=50;
                Date date = new Date();
                String email="";
                Long contact=0l;
                ArrayList<String> list1 = new ArrayList<>();
                ArrayList<Integer> list2 = new ArrayList<>();
                ArrayList<Integer> list3 = new ArrayList<>();
                if(session == null || session.getAttribute("adminLogin") == null)
                {
                    response.sendRedirect("signup.jsp");      
                }
                else
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
                    PreparedStatement st2 = con.prepareStatement("select * from ordertable where orderId = ?");
                    st2.setInt(1,orderId);
                    int userId=0;
                    ResultSet rs2 = st2.executeQuery();
                    while(rs2.next())
                    {
                        userId = rs2.getInt(1);
                        list1.add(rs2.getString(3));
                        list2.add(rs2.getInt(4));
                        list3.add(rs2.getInt(5));
                        total += rs2.getInt(4)*rs2.getInt(5);
                    }
                    if(total>=500)
                    {
                        discount = 50;
                    }
                    PreparedStatement st = con.prepareStatement("select * from login where userid=?");
                    st.setInt(1,userId);
                    ResultSet rs = st.executeQuery();
                    while(rs.next())
                    {
                        email = rs.getString(1);
                        contact = rs.getLong(2);
                    }
                }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                function call()
                {
                    window.print();
                }
        </script>
        <style>
            .heading
            {
                text-align: center;
            }
            .initials
            {
                display: flex;
                justify-content: space-evenly;
            }
            .tabletheme
            {
                width: 100%;
            }
            .total
            {
                text-align: right;
                font-size: 17px;
                margin-right: 50px;
            }
        </style>
    </head>
    <body>
        <header class="heading">
            <h1>VIKAS NAMKEEN</h1>
            <p>107, Tilak Nagar Extension</p>
            <p>Indore (452018)</p>
            <p>Mobile No.: 9827563590</p>
        </header>
        <hr>
        <div class="initials">
            <p><b>Date:</b> <%=date%></p>
            <p><b>Email:</b> <%=email%></p>
            <p><b>Contact No.:</b> <%=contact%></p>
        </div>
        <hr>
        <div class="tabletheme">
            <table width='100%' align='center' cellpadding='7'cellspacing='5'>
                <tr align='center'>
                    <th>Title</th>
                    <th>Quantity</th>
                    <th>Price</th> 
                </tr>
                <%
                    for(int i=0;i<list1.size();i++)
                    {
                    %>
                    <tr align='center'>
                        <td><%=list1.get(i)%></td>
                        <td><%=list2.get(i)%></td>
                        <td>Rs. <%=list3.get(i)%></td>
                    </tr>
                    <%}%>
            </table>
            </div>
            <hr>
            <div class="total">
            <p><b>Total:</b> + Rs.<%=total%>.0</p>
            <p><b>Discount:</b> - Rs.<%=discount%>.0</p>
            <p><b>Delivery Charges:</b> + Rs.<%=delivery%>.0</p>
            </div>
            <br>
            <h2 style="text-align: right; margin-right: 50px;">Grand Total: Rs. <%=total-discount+delivery%>.0</h2>
            <hr>
            <footer>
                <h3 style="text-align: center">Have a nice day!</h3>
                <input style="position: absolute; right: 20px; padding: 5px;" type="submit" value="DOWNLOAD  BILL" onclick="call()">
            </footer>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script> 
            <script>
    function redirectToPayment(button) 
    {
    var total = button.getAttribute("total");
    var user_id = button.getAttribute("user_id");
    var requestData = {
      total: total,
      user_id: user_id,
    };

    $.ajax({
      type: "POST", 
      url: "payment.jsp",
      data: requestData,
      success: function(response) {
          window.location.href = "index.jsp";
          alert("Ordered Successfully!");
        },
      error: function(xhr, status, error) {
        alert("Something went wrong!");
       }
    });
      }
      </script>
    </body>
</html>
