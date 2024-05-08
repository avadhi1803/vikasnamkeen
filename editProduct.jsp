<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.servlet.annotation.*"%>
<%@page import="javax.servlet.ServletException"%>
<!doctype html>
<html>
<head>
    <style>
    body {
        display: flex;
        flex-direction: column; /* Stack content vertically */
        align-items: center; /* Center horizontally */
        min-height: 100vh; /* Ensure full page height is covered */
        margin: 0;
    }

    header {
        /* Heading styles, e.g., background, text color, padding, etc. */
        background-color: #007BFF;
        color: #fff;
        padding: 10px;
        text-align: center;
        width: 100%;
    }

    form {
        max-width: 400px;
        padding: 20px;
        background-color: #f7f7f7;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        margin-top: 10%;
    }

    form input[type="text"] {
        width: 95%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-right: 20px; /* Add margin to create space on the right */
        margin: 5px 0;
    }

    button[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #007BFF;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }

    button[type="submit"]:hover {
        background-color: #0056b3;
    }
    </style>
</head>
<body>
    <header>
    <%@include file = "adminheading.jsp" %>
    </header>
<%
    // Retrieve the product details based on the pId query parameter
    int pId = Integer.parseInt(request.getParameter("pId"));
    
    // Use the details to pre-fill an edit form
    // Display an input form with the existing values for the user to edit
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
    PreparedStatement st = con.prepareStatement("select * from products where pid=?");
    st.setInt(1,pId); 
    ResultSet rs = st.executeQuery();
    String title="";
    int weight=0;
    int price=0;
    if(rs.next()) {
        title = rs.getString(1);
        weight = rs.getInt(2);
        price = rs.getInt(3);
    }
%>
<form action="saveChanges.jsp" method="POST">
    <input type="hidden" name="pId" value="<%=pId%>">
    <!-- Input fields for editing product details -->
    <input type="text" name="title" value="<%=title%>">
    <input type="text" name="weight" value="<%=weight%>">
    <input type="text" name="price" value="<%=price%>">
    <button type="submit">Save Changes</button>
</form>
</body>
</html>