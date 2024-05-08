<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        
<style>
  body {
    font-family: Arial, sans-serif;
/*    background-color: #F4CEA7;*/
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }

  div.container {
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    width: 400px;
    text-align: center;
  }

  fieldset {
    border: 2px solid #333;
    padding: 10px;
    border-radius: 5px;
  }

  legend {
    font-size: 24px;
    font-weight: bold;
    color: #333;
  }

  h1 {
    margin: 0;
    color: #333;
  }

  table {
    width: 100%;
    margin-top: 20px;
  }

  td {
    padding: 10px;
    text-align: left;
  }

  input[type="email"],
  input[type="number"],
  input[type="password"],
  input[type="text"]{
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f0f0f0;
  }

  input[type="submit"] {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  input[type="submit"]:hover {
    background-color: #555;
  }

  span.error {
    font-size: 14px;
    color: red;
  }

  a {
    text-decoration: none;
    color: #333;
  }

  a:hover {
    text-decoration: underline;
  }

  hr {
    margin: 20px 0;
    border: none;
    border-top: 1px solid #ccc;
  }
</style>


<script>

  function validate()

  {
	  var email=document.getElementById("email").value;
          
          var contact=document.getElementById("contact").value;
          
          var color=document.getElementById("color").value;

	  var pass=document.getElementById("pass").value;

	  var cpass=document.getElementById("cpass").value;

	  if(email==="")

		  {
		     document.getElementById("emailerror").innerHTML="Please enter Email...";
		     return false;
		  }

	  else

		  {

		     document.getElementById("emailerror").innerHTML="";

		  }
                  
          if(contact==="")

		  {
		     document.getElementById("contacterror").innerHTML="Please enter contact number...";
		     return false;
		  }

	  else

		  {

		     document.getElementById("contacterror").innerHTML="";

		  }
                  
                  if(color==="")

		  {
		     document.getElementById("colorerror").innerHTML="Please enter your favourite colour...";
		     return false;
		  }

	  else

		  {

		     document.getElementById("colorerror").innerHTML="";

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

	  

	  if(cpass==="")

	  {

		     document.getElementById("cpasserror").innerHTML="Please re-enter password...";

		     return false;

	 }

	  else

	 {

		     document.getElementById("passerror").innerHTML="";

	 } 

	  if(cpass !== pass)

	  {

		     document.getElementById("cpasserror").innerHTML="please enter same password";

		     return false;

	 }

	  else

	 {

		     document.getElementById("passerror").innerHTML="";

	 } 

	  return true;

  }

</script>

</head>
    <body>

<div style="display:flex; justify-content: space-between;">
    
    <img src="Images/signup.jpg" alt="" style="margin-right:20px; margin-left: -80px;">

     <fieldset>

      <%

         String status =(String)request.getAttribute("status");

         if(status != null)

         {

        	 out.println(status);

         }

     %>

        <legend><h1>Sign up</h1></legend>

        <form onsubmit="return validate()" action="signupServlet" method="post">
            <input type="hidden" name="action" value="signUp">
              <table>

                    <tr>

                        <td>Email : </td>

                        <td><input type="email" id="email" name="email"></td>

                        <td><span style="color:red" id="emailerror">*</span></td>

                    </tr>
                    
                    <tr>

                        <td>Contact : </td>

                        <td><input type="number" id="contact" name="contact"></td>

                        <td><span style="color:red" id="contacterror">*</span></td>

                    </tr>
                    
                    <tr>

                        <td>Favourite Colour : </td>

                        <td><input type="text" id="color" name="color"></td>

                        <td><span style="color:red" id="colorerror">*</span></td>

                    </tr>

                     <tr>

                        <td>Password : </td>

                        <td><input type="password" id="pass" name="pass"></td>

                        <td><span style="color:red" id="passerror">*</span></td>

                    </tr>  

                    <tr>

                        <td>Confirm Password : </td>

                        <td><input type="password" id="cpass" name="cpass"></td>

                        <td><span style="color:red" id="cpasserror">*</span></td>

                    </tr>

                    <tr>

                    <td><input type="submit" value="Register"></td>

                    </tr>

              </table>

        </form>

<!--        <br>

        <hr>-->

<!--        Already Registered? <a href="login.jsp" style="color: blue">Login</a>-->

      </fieldset>

 </div>

</body>
</html>



