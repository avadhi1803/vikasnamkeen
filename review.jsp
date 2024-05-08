<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link rel="stylesheet" href="style.css">
    <style>
        .stars i{
   font-size: 1.4rem;
   color: var(--orange);
 }
    </style>
</head>
<body>
    <header>
        <div id="menu-bar" class="fas fa-bars"></div>

        <a href="#" class="logo"><span>VIKAS</span>NAMKEEN</a>

        <nav class="navbar">
            <a href="index.jsp#home">Home</a>
            <a href="index.jsp#gallery">Products</a>
            <a href="index.jsp#features">Features</a>
            <a href="index.jsp#aboutUs">About Us</a>
            <a href="review.jsp">review</a>
            <a href="index.jsp#contact">Reach Us</a>
        </nav>
        <div class="icons">
            <a href="store.jsp"><i class="fas fa-shopping-cart" id="cart-btn"></i></a>
            <a href="signup.jsp"><i class="fas fa-user" id="login-btn"></i></a>
        </div>

    </header>

    <section class="review">
        <h1 class="heading">
            <span>r</span>
            <span>e</span>
            <span>v</span>
            <span>i</span>
            <span>e</span>
            <span>w</span>
        </h1>
        <%
            int count=0;
            if(session == null || session.getAttribute("user_id") == null)
                {
                    response.sendRedirect("signup.jsp");      
                }
                else
                {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
                Integer user_id=(Integer)session.getAttribute("user_id");
                String button = request.getParameter("btn");
                if(button!=null && button.equals("Submit Review"))
                {       
                String review = request.getParameter("review");
                int rating = Integer.parseInt(request.getParameter("rating"));
                if(review.length()!=0)
                {
                PreparedStatement st2 = con.prepareStatement("insert into review(review,userid,rating) values(?,?,?)");
                st2.setString(1,review);
                st2.setInt(2,user_id);
                st2.setInt(3,rating);
                st2.executeUpdate();
                count=1;
                }
                }
            
                PreparedStatement st = con.prepareStatement("select * from review order by reviewid desc");
                ArrayList<String> list1 = new ArrayList<>();
                ArrayList<Integer> list2 = new ArrayList<>();
                ArrayList<String> list3 = new ArrayList<>();
                ResultSet rs = st.executeQuery();
                while(rs.next())
                {
                    list1.add(rs.getString(2));
                    list2.add(rs.getInt(4));
                    list3.add(rs.getString(5));
                }
        %>
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <%
                    int i=0;
                    while(i<list1.size())
                    {
                %>
              <div class="carousel-item <%= i == 0 ? "active" : "" %>">
                <h2>Customer <%=i+1%></h2>
                <p><%=list1.get(i)%></p>
                
                <div class="stars" style="text-align: center;">
                    <%
                    int j=0;
                    int n = 5;
                    while(j<list2.get(i))
                    {
                %>
                  <i class="fas fa-star"></i>
                  <% 
                    j++;
                    } 
                    while(j<5)
                    {
                %>
                <i class="far fa-star"></i>
                <% 
                    j++;
                    } 
                %>
                </div> 
                <br><br>
                <%
                    if(list3.get(i).length()>0)
                    {
                %>
                <div class="carousel-inner">
                <h2><b>Owner's Reply: </b><%= list3.get(i) %></h2>
                </div>
                <% } %>
              </div>
              <% 
                 i++;
                 }
              %>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
            
            <section class="contact" id="contact" style="margin-top: 2%;">
   
         <div class="row">
          
                <form action="">
                   
                    <textarea placeholder="Enter your review here.." name="review" id="review" cols="30" rows="10"></textarea>
                    <br>
                    <h3>Give rating out of 5</h3>
                    <select id="rating" name="rating" style="font-size: 15px;">
                        <option>5</option>
                        <option>4</option>
                        <option>3</option>
                        <option>2</option>
                        <option>1</option>
                    </select>
                    <br>
                    <input type="submit" class="btn" value="Submit Review" name="btn">
                </form>
             
            </div>
          
          </section>
          
        </section>
            <% if(button!=null && button.equals("Submit Review") && count==1)
        {
            %>
            <p style="color:purple; font-size: 20px; font-family: serif; display: flex; justify-content: center; margin-top: 5px;">Thank you for your review!</p>
            <%}%>
            <% } %>
            

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    
</body>
</html>