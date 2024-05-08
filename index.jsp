<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VIKAS NAMKEEN</title>
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
            <a href="#home">Home</a>
            <a href="#gallery">Products</a>
            <a href="#features">Features</a>
            <a href="#packages">Best Selling</a>
            <a href="customerOrder.jsp">Orders</a>
            <a href="review.jsp">Review</a>
            <a href="#contact">Reach Us</a>
        </nav>
        <div class="icons">
            <i class="fas fa-search" id="search-btn" style="display: none;"></i>
            <a href="store.jsp"><i class="fas fa-shopping-cart" id="cart-btn"></i></a>
            <i class="fas fa-user" id="login-btn"></i>
        </div>

        <form action="" class="search-bar-container">
            <input type="search" id="search-bar" placeholder="search-here...">
            <label for="search-bar" class="fas fa-search"></label>
        </form>

    </header>
    
    <!-- login form container -->
     <div class="login-form-container" id="login-form-container">
    <i class="fas fa-times" id="form-close"></i>

    <form  onsubmit="return validate()"  action="loginServlet" method="post">
        <h3>Login</h3>
        <input type="email" id="email"  name="emailid" class="box" placeholder="Enter your email">
        <input type="password" id="pass" name="password" class="box" placeholder="Enter your password">
        <input type="submit" value="Login Now" class="btn">
        <p>Forgot password? <a href="forgotPw.jsp">Click here</a></p>
        <p id="signupid">Don't have an account? <a href="signup.jsp">Register now</a></p>
    </form>
</div>
    
     <!-- home section starts -->

     <section class="home" id="home">
      <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="Images/VikasNamkeen.png" class="d-block w-100" height="500px" alt="...">
          </div>
          <div class="carousel-item">
            <img src="Images/tasteofratlam.png" class="d-block w-100" height="500px" alt="...">
          </div>
          <div class="carousel-item">
            <img src="Images/freedelivery.png" class="d-block w-100" height="500px" alt="...">
          </div>
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
        
  </section>


<!-- BestSelling section starts -->

<section class="packages" id="packages">

  <h1 class="heading">
      <span>B</span>
      <span>E</span>
      <span>S</span>
      <span>T</span>
      <span class="space"></span>
      <span>S</span>
      <span>E</span>
      <span>L</span>
      <span>L</span>
      <span>I</span>
      <span>N</span>
      <span>G</span>
  </h1>

  <div class="box-container shop-items">
      <div class="box shop-item">
          <img src="Images/LongMediumSev.jpg" alt="" class="shop-item-image">
          <div class="content">
              <h3 class="shop-item-title">Long Medium Sev</h3>
              <p>500gm</p>
              <div class="stars">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              </div>
              <div class="price shop-item-price">Rs.140/-</div>
              <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="Long Medium Sev" pprice="140" pquantity="1">ADD TO CART</button>
          </div>
      </div>

      <div class="box shop-item">
          <img src="Images/LehsunSev.jpg" alt="" class="shop-item-image">
          <div class="content">
              <h3 class="shop-item-title">Lehsun sev</h3>
              <p>250gm</p>
              <div class="stars">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              </div>
              <div class="price shop-item-price">Rs.70/-</div>
              <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="Lehsun Sev" pprice="70" pquantity="1">ADD TO CART</button>
          
          </div>
      </div>

      <div class="box shop-item">
          <img src="Images/CharkhaBundi.jpg" alt="" class="shop-item-image">
          <div class="content">
              <h3 class="shop-item-title">Charkhi Bundi</h3>
              <p>250gm</p>
              <div class="stars">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              </div>
              <div class="price shop-item-price">Rs.70/-</div>
              <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="Charkhi Bundi" pprice="70" pquantity="1">ADD TO CART</button>
          
          </div>
      </div>

      <div class="box shop-item">
          <img src="Images/TikhiPapdi.jpg" alt="" class="shop-item-image">
          <div class="content">
              <h3 class="shop-item-title">Tikhi Papdi</h3>
              <p>250gm</p>
              <div class="stars">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              </div>
              <div class="price shop-item-price">Rs.70/-</div>
              <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="Tikhi Papdi" pprice="70" pquantity="1">ADD TO CART</button>
          
          </div>
      </div>

      <div class="box shop-item">
          <img src="Images/TikhaMithaMixture.avif" alt="" class="shop-item-image">
          <div class="content">
              <h3 class="shop-item-title">Tikha Mitha Mixture</h3>
              <p>500gm</p>
              <div class="stars">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              </div>
              <div class="price shop-item-price">Rs.140/-</div>
              <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="Tikha Mitha Mixture" pprice="140" pquantity="1">ADD TO CART</button>
          
          </div>
      </div>

      <div class="box shop-item">
          <img src="Images/KelaChips.jpg" alt="" class="shop-item-image">
          <div class="content">
              <h3 class="shop-item-title">Kela chips</h3>
              <p>250gm</p>
              <div class="stars">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              </div>
              <div class="price shop-item-price">Rs.70/-</div>
              <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="Kela Chips" pprice="70" pquantity="1">ADD TO CART</button>
          
          </div>
      </div>

      <div class="box shop-item">
        <img src="Images/SalWalaGathiya.jpg" alt="" class="shop-item-image">
        <div class="content">
            <h3 class="shop-item-title">Sal Wala Gathiya</h3>
            <p>250gm</p>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
            </div>
            <div class="price shop-item-price">Rs.70/-</div>
            <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="Sal wala gathiya" pprice="70" pquantity="1">ADD TO CART</button>
          
        </div>
    </div>

    <div class="box shop-item">
        <img src="Images/Mango Katli.jpeg" alt="" class="shop-item-image">
      <div class="content">
          <h3 class="shop-item-title">Mango Katli</h3>
          <p>250gm</p>
          <div class="stars">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="far fa-star"></i>
          </div>
          <div class="price shop-item-price">Rs.75/-</div>
          <button class="btn btn-primary shop-item-button" type="button" onclick="redirectToPayment(this)" ptitle="Mango Katli" pprice="75" pquantity="1">ADD TO CART</button>
          
      </div>
  </div>
  </div>
</section>


 <!--Features section starts-->

 <section class="service" id="features">
  <h1 class="heading">
      <span>F</span>
      <span>E</span>
      <span>A</span>
      <span>T</span>
      <span>U</span>
      <span>R</span>
      <span>E</span>
      <span>S</span>
  </h1>
  <div class="box-container">
      <div class="box">
          <i class="fas fa-heart"></i>
          <h3>Precise Quality</h3>
          <p>At Vikas Namkeen,we never compromise on quality! we take pride in serving you the finest Ratlam namkeens, made with authentic recipes and premium ingredients.
            Experience the true taste of Ratlam in every bite. Taste the difference for yourself!
          </p>
      </div>
      <div class="box">
          <i class="fas fa-credit-card-alt"></i>
          <h3>Easy Paymemt</h3>
          <p>You can conveniently pay for your namkeens with a few taps on your phone via UPI. It's quick, secure and super easy.
            We understand that some prefer the convenience of cash on delivery. That's why we also offer the option to pay to your namkeens
            when they're delivered right to your doorstep!
          </p>
      </div>
      <div class="box">
          <i class="fas fa-truck"></i>
          <h3>Fast Delivery</h3>
          <p>We've got your back when it comes to fast delivery. Your namkeens will reach you in no time. So you can satisfy those cravings without any delay.
            Sit back, relax, and get ready to enjoy your tasty treats in record time!
          </p>
      </div>
  </div>

</section>

 <!-- Products section starts  -->

 <section class="gallery" id="gallery">

  <h1 class="heading">
      <span>P</span>
      <span>R</span>
      <span>O</span>
      <span>D</span>
      <span>U</span>
      <span>C</span>
      <span>T</span>
  </h1>

  <div class="box-container">
      <div class="box">
          <img src="Photos/Ladhuram.jpg" alt="">
          <div class="content">
              <h3>Laduram</h3>
              <a href="laduram.jsp" class="btn">see more</a>
          </div>
      </div>
      <div class="box">
          <img src="Photos/JainSamta.jpg" alt="">
          <div class="content">
              <h3>Jain Samta</h3>
              <a href="jainsamta.jsp" class="btn">see more</a>
          </div>
      </div>
      <div class="box">
          <img src="Photos/GRUHUDYOG.jpg" alt="">
          <div class="content">
              <h3>Gruhudyog</h3>
              <a href="gruhudyog.jsp" class="btn">see more</a>
          </div>
      </div>
  </div>

</section>

<!-- contact section starts here  -->


<section class="contact" id="contact">
  <h1 class="heading">
      <span>R</span>
      <span>E</span>
      <span>A</span>
      <span>C</span>
      <span>H</span>
      <span class="space"></span>
      <span>U</span>
      <span>S</span>
  </h1>

    <div class="row">
      <h3 class = "image" style="text-align: justify; margin-left: 10px;"><b>Our shop, Vikas Namkeen, has a complete range of Ratlam's most famous and oldest Namkeen brand of Laduram. 
              
          We also provide the products of Shree Ji Gruhudyod, special range of Jain Samta Ratlam and bakery products.
          
          All namkeen products are made from groundnut oil. 
          We provide a perfect balance of taste and purity.
          <br><br>
          You may react out to us on:
          <br><br>
          <div>
              <h3><b>Mobile: <a href="tel:9827563590">Call Vikas Namkeen</a></b></h3>
              <h3><b>Email: <a href = "mailto: rupeshpatni492@gmail.com">Vikas Namkeen</a></b></h3>
          </div>
          <br>
          
          </b></h3>

        <form action="mailto:avadhi.patni@aiesec.net" method="POST" enctype="multipart/form-data" name="EmailForm">
          <div class="inputBox">
            <input type="text" name="name" placeholder="Name">
            <input type="number" name="mobile" placeholder="Mobile number">
        </div>
        <div class="inputBox email">
            <input type="email" name="email" placeholder="Email">
            <input type="text" name="subject" placeholder="Subject">
        </div>
        <textarea name="message" placeholder="Message" cols="30" rows="10"></textarea>
        <button type="submit" class="btn" value="Submit">Send Message</button>
          
      </form>
  </div>

</section>

 <!-- footer section starts here -->

 <section class="footer">
  <div class="box-container">
     
      <div class="box">
          <h3>quick links</h3>
          <a href="#home">home</a>
          <a href="#gallery">Products</a>
          <a href="#packages">BestSelling</a>
          <a href="#feature">Features</a>
          <a href="#contact">Reach Us</a>
          <a href="review.jsp">review</a>
          
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
        <a href="https://www.google.com/maps/dir/22.7166232,75.9114825/raj+namkeen+indore/@22.7188414,75.8947795,15z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x3962e303f0829f97:0x35964472a4db1f7d!2m2!1d75.8997329!2d22.7166385?entry=ttu">Indore</a>
        <iframe width="420" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" id="gmap_canvas" src="https://maps.google.com/maps?width=520&amp;height=400&amp;hl=en&amp;q=107,%20Tilak%20Nagar%20Extension%20Indore+(Raj%20Namkeen)&amp;t=&amp;z=12&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe>

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
<script type="text/javascript">
  function validate()
  {
	  var email=document.getElementById("email").value;
	  var pass=document.getElementById("pass").value;
	  
	  if(email==="")
		  {
		     document.getElementById("emailerror").innerHTML="Please enter Email...";
		     return false;
		  }
	  else
		  {
		     document.getElementById("emailerror").innerHTML="";
		  }
	  
	  if(pass==="")
		  {
			     document.getElementById("passerror").innerHTML="Please enter password...";
			     return false;
			  }
		  else
			  {
			     document.getElementById("passerror").innerHTML="";
			  }
	  
	  if(pass.length<5 || pass.length>8)
		  {
		  document.getElementById("passerror").innerHTML="Password should be in betwwen 5  to 8 character..";
		  return false;
		  }
	  else
	  {
	     document.getElementById("passerror").innerHTML="";
	  }

	  return true;
  }

</script>

<script src="script.js"></script>
</body>

</html>