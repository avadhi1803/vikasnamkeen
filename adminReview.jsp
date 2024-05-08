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
    <title>View Reviews - Admin Panel</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@include file = "adminheading.jsp" %>
    <div>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Review ID</th>
                        <th>Review</th>
                        <th>Rating</th>
                        <th>Customer ID</th>
                        <th>Reply</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
                        PreparedStatement st = con.prepareStatement("select * from review order by reviewid desc");
                        ResultSet rs = st.executeQuery();
                        int rId=0;

                        while (rs.next()) {
                            rId = rs.getInt(1);
                            String review = rs.getString(2);
                            int rating = rs.getInt(4);
                            int uId = rs.getInt(3);
                            String reply = rs.getString(5);

                    %>
                    <tr>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        <td><%=rId%></td>
                        <td><%=review%></td>
                        <td><%=rating%></td>
                        <td><%=uId%></td>
                        <td>
                            <form action="process_reply.jsp" method="post">
                            <label for="ownerReply">Reply: </label>
                            <textarea style="background-color: lightgray; text-align: center; padding: 2%;" name="reply" rows="1" required><%=reply%></textarea>
                            <br><br>
                            <input type="hidden" name="rId" value="<%=rId%>">
                            <button type="submit">Submit Reply</button>
                            </form>
                        </td>
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