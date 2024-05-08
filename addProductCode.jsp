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
                String ptitle = request.getParameter("Producttitle");                
                String pbrand = request.getParameter("ProductCategory");
                Integer pweight = Integer.parseInt(request.getParameter("ProductWeight"));
                Integer pprice = Integer.parseInt(request.getParameter("ProductPrice"));                
                String pimg = request.getParameter("ProductImage");
                                out.println(pimg); 

//                Class.forName("com.mysql.jdbc.Driver");
//                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
//                PreparedStatement st = con.prepareStatement("insert into products(title, weight, price, brand, img) values(?,?,?,?,?)");
//                st.setString(1, ptitle);
//                st.setInt(2, pweight);
//                st.setInt(3, pprice);              
//                st.setString(4, pbrand);
//                FileInputStream fin = new FileInputStream("G:\\NetBeansProjects\\RajNamkeen\\web\\Images\\"+pimg);
//                st.setBinaryStream(5, fin);
//                st.executeUpdate();
//                con.close();
                out.println("Product inserted Successfully"); 
    %>