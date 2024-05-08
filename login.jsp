<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
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
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
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
</head>
    <body>
<div align="center">
     <fieldset>
     
     <%
         String status =(String)request.getAttribute("status");
         if(status != null)
         {
        	 out.println(status);
         }
     %>
        <legend><h1>Login</h1></legend>
        <form  onsubmit="return validate()"  action="loginServlet" method="post">
              <table>
                    <tr>
                        <td>Email : </td>
                        <td><input type="email" id="email"  name="emailid"></td>
                        <td><span style="color:red" id="emailerror" >*</span></td>
                    </tr>
                    
                     <tr>
                        <td>Password : </td>
                        <td><input type="password" id="pass" name="password"></td>
                        <td><span style="color:red" id="passerror">*</span></td>
                    </tr>
                    
                    <tr>
                    <td><input type="submit" value="Login"></td>
                    </tr>
              </table>
        </form>
        <br>
        <hr>
        <a href="signup.jsp" style="color: blue">Sign Up</a>
      </fieldset>
 </div>
    </body>
</html>
