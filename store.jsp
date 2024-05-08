<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>Cart</title>
        <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="storestyle.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    </head>
    <body style="font-size: 15px;">        
        <%@include file = "heading.jsp" %>
        <section class="container content-section">
       <h1 class="heading" style="text-align: center; padding: 2.5rem, 0; margin-bottom: 5vh; margin-top: 5vh;">
      <span style="font-size: 3.5rem; background: rgba(255, 165, 0, .2); color: var(--orange); border-radius: .5rem; padding: .2rem 1rem;">C</span>
      <span style="font-size: 3.5rem; background: rgba(255, 165, 0, .2); color: var(--orange); border-radius: .5rem; padding: .2rem 1rem;">A</span>
      <span style="font-size: 3.5rem; background: rgba(255, 165, 0, .2); color: var(--orange); border-radius: .5rem; padding: .2rem 1rem;">R</span>
      <span style="font-size: 3.5rem; background: rgba(255, 165, 0, .2); color: var(--orange); border-radius: .5rem; padding: .2rem 1rem;">T</span>
  </h1>
            <div class="cart-row">
                <span class="cart-item cart-header cart-column">ITEM</span>
                <span class="cart-item cart-header cart-column">PRICE</span>
                <span class="cart-item cart-header cart-column">QUANTITY</span>
                <span class="cart-item cart-header cart-column">OPTIONS</span>
                
            </div>
            <%
                if(session == null || session.getAttribute("user_id") == null)
                {
                    response.sendRedirect("signup.jsp");
                }
                else
                {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
                PreparedStatement st = con.prepareStatement("select * from cart where userid=?");
                st.setInt(1,(int)session.getAttribute("user_id"));
                ArrayList<String> list1 = new ArrayList<>();
                ArrayList<Integer> list2 = new ArrayList<>();
                ArrayList<Integer> list3 = new ArrayList<>();
                ResultSet rs = st.executeQuery();
                int total=0;
                int discount=0;
                int delivery=50;
                while(rs.next())
                {
                    list1.add(rs.getString(2));
                    list2.add(rs.getInt(3));
                    list3.add(rs.getInt(4));
                    total += rs.getInt(3)*rs.getInt(4);
                }
                if(total>=500)
                {
                    discount=50;
                }
                int i=0;
                while(i<list1.size())
                {
            %>
            <div class="cart-row">
                <span class="cart-item cart-header cart-column"><%=list1.get(i)%></span>
                <span class="cart-item cart-header cart-column"><%=list2.get(i)%></span>
                <span class="cart-item cart-header cart-column"><%=list3.get(i)%></span>
                
                <span><button class="cart-item cart-header cart-column btn btn-primary btn-purchase" type="button" style="padding-right: 30px;" onclick="removeOne(this)" ptitle="<%=list1.get(i)%>" pprice="<%=list2.get(i)%>" pquantity="<%=list3.get(i)%>" user_id="<%=session.getAttribute("user_id")%>">-1</button></span>
            <span><button class="cart-item cart-header cart-column btn btn-primary btn-purchase" type="button" style="padding-right: 30px;" onclick="addOne(this)" ptitle="<%=list1.get(i)%>" pprice="<%=list2.get(i)%>" pquantity="<%=list3.get(i)%>" user_id="<%=session.getAttribute("user_id")%>">+1</button></span>
            <span><button class="cart-item cart-header cart-column btn btn-primary btn-purchase" type="button" style="background-color: red; padding-right: 20px;" onclick="removeAll(this)" ptitle="<%=list1.get(i)%>" pprice="<%=list2.get(i)%>" user_id="<%=session.getAttribute("user_id")%>">X</button></span>
            
            </div>
                <%
                    i++;
                    if(i>=list1.size())
                    {
                        break;
                    }
                }

                    %>
                    <br><br>
            <div class="cart-total">
                <strong class="cart-total-title">Total: </strong>
                <span class="cart-total-price">+ Rs. <%=total%></span>
            </div>
            <div class="cart-total">
                <strong class="cart-total-title">Discount: </strong>
                <span class="cart-total-price">- Rs. <%=discount%></span>
            </div>
            <div class="cart-total">
                <strong class="cart-total-title">Delivery Charges: </strong>
                <span class="cart-total-price">+ Rs. <%=delivery%></span>
            </div>
            <hr>
            <div class="cart-total">
                <strong class="cart-total-title">Grand Total: </strong>
                <span class="cart-total-price">Rs. <%=total-discount+delivery%></span>
            </div>
            <footer>
                <div>
<a href="address.jsp"><button style="margin-left:10px;" class="btn btn-primary btn-purchase" type="button">Proceed to Payment</button></a>
          </div>
            </footer>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script> 
            </section>
        <% } %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script> 
<script>
      
      function removeAll(button)
      {
          var ptitle = button.getAttribute("ptitle");
          var pprice = button.getAttribute("pprice");
          var user_id = button.getAttribute("user_id");
          
          var requestData = {
              ptitle: ptitle,
              pprice: pprice,
              user_id: user_id,
          };
          
      $.ajax({
      type: "POST", 
      url: "remove_from_cart.jsp",
      data: requestData,
      success: function(response) {
          window.location.href = "store.jsp";
        },
      error: function(xhr, status, error) {
        alert("Something went wrong!");
       }
    });
      }
      
      function removeOne(button)
      {
          var ptitle = button.getAttribute("ptitle");
          var pprice = button.getAttribute("pprice");
          var pquantity = button.getAttribute("pquantity");
          var user_id = button.getAttribute("user_id");
          
          var requestData = {
              ptitle: ptitle,
              pprice: pprice,
              pquantity: pquantity,
              user_id: user_id,
          };
          
      $.ajax({
      type: "POST", 
      url: "remove_one_from_cart.jsp",
      data: requestData,
      success: function(response) {
          window.location.href = "store.jsp";
        },
      error: function(xhr, status, error) {
        alert("Something went wrong!");
       }
    });
      }
      
      function addOne(button)
      {
          var ptitle = button.getAttribute("ptitle");
          var pprice = button.getAttribute("pprice");
          var pquantity = button.getAttribute("pquantity");
          var user_id = button.getAttribute("user_id");
          
          var requestData = {
              ptitle: ptitle,
              pprice: pprice,
              pquantity: pquantity,
              user_id: user_id,
          };
          
      $.ajax({
      type: "POST", 
      url: "add_one_to_cart.jsp",
      data: requestData,
      success: function(response) {
          window.location.href = "store.jsp";
        },
      error: function(xhr, status, error) {
        alert("Something went wrong!");
       }
    });
      }
</script>
    </body>
</html>
