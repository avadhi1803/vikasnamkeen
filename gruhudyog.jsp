<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.mysql.jdbc.Blob"%>

<%!
public String getImage(Object object){
 try{
            Blob b = (Blob)object;
            InputStream in = b.getBinaryStream();
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            byte[] bytes = new byte[4096];
            int rd = - 1;
            while((rd = in.read(bytes)) != -1){
              os.write(bytes , 0 , rd);
            }
            byte[] img = os.toByteArray();
            String image = Base64.getEncoder().encodeToString(img);
            in.close();
            os.close();
            String imageesss = "data:image/jpg;base64,"+image;
            return imageesss;
           }catch(Exception e){}
        return null;
        
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gruhudyog Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link rel="stylesheet" href="style.css">
    
</head>

<body>
    <header>
        <div id="menu-bar" class="fas fa-bars"></div>

        <a href="#" class="logo"><span>VIKAS</span>NAMKEEN</a>

        <nav class="navbar">
            <a href="index.jsp">Home</a>
            <a href="index.jsp#gallery">Products</a>
            <a href="index.jsp#features">Features</a>
            <a href="index.jsp#aboutUs">About Us</a>
            <a href="index.jsp#review">Review</a>
            <a href="index.jsp#contact">Reach Us</a>
        </nav>
        <div class="icons">
            <i class="fas fa-search" id="search-btn"></i>
            <a href="store.jsp"><i class="fas fa-shopping-cart" id="cart-btn"></i></a>
            <a href="signup.jsp"><i class="fas fa-user" id="login-btn"></i></a>
        </div>

        <form action="" class="search-bar-container">
            <input type="search" id="search-bar" name="search-bar" placeholder="Enter product name..." style="width: 90%;">
            <input type="submit" value="SEARCH" id="searchbtn" style="width: 100px; height: 50px; margin-left: 30px; border-radius: 10%; background-color: var(--orange); color: white; font-size: 15px;">
        </form>

    </header>


<section class="packages" id="packages">

  <h1 class="heading">
      <span>G</span>
      <span>R</span>
      <span>U</span>
      <span>H</span>
      <span>U</span>
      <span>D</span>
      <span>Y</span>
      <span>O</span>
      <span>G</span>
      <span class="space"></span>
      <span>P</span>
      <span>R</span>
      <span>O</span>
      <span>D</span>
      <span>U</span>
      <span>C</span>
      <span>T</span>
      <span>S</span>
  </h1>
  <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
        String searchTerm = request.getParameter("search-bar");
        PreparedStatement st;
        if (searchTerm != null && !searchTerm.isEmpty()) {
            st = con.prepareStatement("SELECT * FROM products WHERE brand = ? AND title LIKE ?");
            st.setString(1, "gruhudyog");
            st.setString(2, "%" + searchTerm + "%");
        } else {
            st = con.prepareStatement("SELECT * FROM products WHERE brand = ? order by title desc");
            st.setString(1, "gruhudyog");
        }
        ResultSet rs = st.executeQuery();
           ArrayList<String> list3 = new ArrayList();
            ArrayList<Integer> list4 = new ArrayList(); 
             ArrayList<Integer> list5 = new ArrayList();                    
              ArrayList list6 = new ArrayList();
              while(rs.next())
              {
                  list3.add(rs.getString(1));
                  list4.add(rs.getInt(2)); 
                  list5.add(rs.getInt(3));
                  list6.add(rs.getBlob(4));
              }
  %>
  <div class="box-container shop-items">
                    <%
                    int i=0;
                    while(i<list3.size())
                    {
                    %>
      <div class="box shop-item">
          <img src="<%=getImage(list6.get(i))%>" alt="" class="shop-item-image">
          <div class="content">
              <h3 class="shop-item-title"><%=list3.get(i)%></h3>
              <p><%=list4.get(i)%> gm</p>
              <div class="stars">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              </div>
              <div class="price shop-item-price">Rs.<%=list5.get(i)%>/-</div>
              <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="<%=list3.get(i)%>" pprice="<%=list5.get(i)%>" pquantity="1">ADD TO CART</button>
          </div>
      </div>
                        <%  
                            i++; 
                            if(i>=list3.size())
                            {
                                break;
                            }
                        %>
      <div class="box shop-item">
          <img src="<%=getImage(list6.get(i))%>" alt="" class="shop-item-image">
          <div class="content">
              <h3 class="shop-item-title"><%=list3.get(i)%></h3>
              <p><%=list4.get(i)%> gm</p>
              <div class="stars">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              </div>
              <div class="price shop-item-price">Rs.<%=list5.get(i)%>/-</div>
              <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="<%=list3.get(i)%>" pprice="<%=list5.get(i)%>" pquantity="1">ADD TO CART</button>
          </div>
      </div>
          
                        <%  
                            i++; 
                            if(i>=list3.size())
                            {
                                break;
                            }
                        %>

      <div class="box shop-item">
          <img src="<%=getImage(list6.get(i))%>" alt="" class="shop-item-image">
          <div class="content">
              <h3 class="shop-item-title"><%=list3.get(i)%></h3>
              <p><%=list4.get(i)%> gm</p>
              <div class="stars">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              </div>
              <div class="price shop-item-price">Rs.<%=list5.get(i)%>/-</div>
              <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="<%=list3.get(i)%>" pprice="<%=list5.get(i)%>" pquantity="1">ADD TO CART</button>
          </div>
      </div>

                        <%  
                            i++; 
                            if(i>=list3.size())
                            {
                                break;
                            }
                        %>
                        
      <div class="box shop-item">
          <img src="<%=getImage(list6.get(i))%>" alt="" class="shop-item-image">
          <div class="content">
              <h3 class="shop-item-title"><%=list3.get(i)%></h3>
              <p><%=list4.get(i)%> gm</p>
              <div class="stars">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              </div>
              <div class="price shop-item-price">Rs.<%=list5.get(i)%>/-</div>
              <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="<%=list3.get(i)%>" pprice="<%=list5.get(i)%>" pquantity="1">ADD TO CART</button>
          </div>
      </div>
              <%  
                            i++; 
                            if(i>=list3.size())
                            {
                                break;
                            }
                        %>
<% } %>
  </div>
</section>

 <section class="footer">
  <div class="box-container">
     
      <div class="box">
          <h3>quick links</h3>
          <a href="index.jsp">home</a>
          <a href="index.jsp#gallery">Products</a>
          <a href="index.jsp#packages">BestSelling</a>
          <a href="index.jsp#feature">Features</a>
          <a href="index.jsp#contact">Reach Us</a>
          <a href="index.jsp#review">review</a>
          
      </div>
      <div class="box">
        <h3>follow us</h3>
        <a href="#">facebook</a>
        <a href="#">twitter</a>
        <a href="#">instagram</a>
        <a href="#">linkedIn</a>
    </div>

      <div class="box">
        <h3>branch location</h3>
        <a href="#">Indore</a>
    </div>

      
  </div>

  <h1 class="credit">&copy; <span>Vikas Namkeen </span>| all right reserved!</h1>
</section>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script>
  function redirectToPayment(button) {
    var ptitle = button.getAttribute("ptitle");
    var pprice = button.getAttribute("pprice");
    var pquantity = button.getAttribute("pquantity");

    
    var requestData = {
      ptitle: ptitle,
      pprice: pprice,
      pquantity: pquantity
    };

    
    $.ajax({
      type: "POST", 
      url: "cart.jsp",
      data: requestData,
      success: function(response) {
        if (response === "Access denied. Please log in!") {
          alert("Please log in!");
//          window.location.href = "signup.jsp";
        } else {
          
          alert("Added to cart!");
        }
      },
      error: function(xhr, status, error) {
        
        alert("Please log in!");
      }
    });
  }
</script>
<script src="script.js"></script>
</body>

</html>