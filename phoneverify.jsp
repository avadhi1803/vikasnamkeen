<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone verification</title>
        <script>
            function validate()
            {
                var otp = document.getElementById("otpid").value;
                
                if(otp==="")
                {
                    document.getElementById("otpError").innerHTML=("Please enter OTP");
                    return false;
                }
                else
                {
                    document.getElementById("otpError").innerHTML=("");
                }
                if(isNaN(otp))
                {
                    document.getElementById("otpError").innerHTML=("Please enter numeric value");
                    return false;
                }
                else
                {
                    document.getElementById("otpError").innerHTML=("");
                }
                return true;
            }
            </script>
    </head>
    <body>
        <div align="center">
            <h1>Phone Verification</h1>
            <h3 style="color:red">We have sent you OTP on your mobile</h3>
            <form onsubmit="return validate()" action="signupServlet" method="post">
                <input type="hidden" name="action" value="contact">
                <p>Enter OTP: </p>
                <input type="text" id="otpid" name="otp" placeholder="Enter otp" size="40">
                <span id="otpError" style="color: red">*</span>
                <br><br>
                <input type="submit" value="verify">
            </form>
        </div>
    </body>
</html>
