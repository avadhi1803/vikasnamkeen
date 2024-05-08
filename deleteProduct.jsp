<%@ page import="java.sql.DriverManager,java.sql.ResultSet,java.sql.PreparedStatement,java.sql.Connection,java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
    <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
    int pId = 0;
    String pIdargu = request.getParameter("pId");
    if (pIdargu != null && !pIdargu.isEmpty()) 
    {
        pId = Integer.parseInt(pIdargu);
    }
    PreparedStatement st = con.prepareStatement("delete from products where pid=?");
    st.setInt(1,pId);
    st.executeUpdate();
    %>
<script>
    window.top.location.href = 'updateProduct.jsp';
</script>