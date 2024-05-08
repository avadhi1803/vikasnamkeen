<%
    if(session == null || session.getAttribute("user_id") == null)
    {
        response.sendRedirect("signup.jsp");      
    }
    else
    {
    int randomNum = (int) (Math.random() * 1000);
    int orderId = (int)randomNum;
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <title>Add Address</title>
    <style>
        body
        {
    background-image: url(DeliveryBG.PNG);
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed; 
    margin: 0;
        }
        
        
        .box {
            margin-top: 20px;
            text-align: center;
        }

        .wrapper {
    margin: 80px 30px; /* Adjust the top and right margins as needed */
    padding: 20px;
    background: rgba(255, 255, 255, 0.8);
    border-radius: 5px;
    width: 30%;
    position: relative;
    margin-left: auto; /* Align the form to the right side */
    transition: all 5s ease-in-out;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        .wrapper h2 {
            margin-top: 0;
            color: #333;
        }

        .wrapper .close {
            position: absolute;
            top: 20px;
            right: 30px;
            transition: all 200ms;
            font-size: 30px;
            font-weight: bold;
            text-decoration: none;
            color: #333;
        }

        .wrapper .content {
            max-height: 30%;
            overflow: auto;
        }

        .container {
            border-radius: 5px;
            background-color: #e7e7e7;
            padding: 20px 10px;
        }

        form label {
            text-transform: uppercase;
            font-weight: 500;
            letter-spacing: 3px;
        }

        input[type=text] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #413b3b;
            color: #fff;
            padding: 15px 50px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 15px;
            text-transform: uppercase;
            letter-spacing: 3px;
        }
        
        .btn {
            background-color: #413b3b;
            color: #fff;
            padding: 15px 30px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 15px;
        }
        
        .button-container {
            display: flex;
            justify-content: space-between;
            margin: -10px 30px; 
            width: 30%;
            position: relative;
            margin-left: auto;
        }

    </style>
</head>

<body>
    <div class="wrapper">
        <h2>Please Enter Your Address details</h2>
        <div class="content">
            <div class="container">
            <form id="addressForm">
                <label for="houseNo">House no.</label>
                <input type="text" name="houseNo" id="houseNo">

                <label for="areaLandmark">Area/landmark</label>
                <input type="text" name="areaLandmark" id="areaLandmark">

                <label for="city">City</label>
                <input type="text" name="city" id="city">

                <label for="pincode">Pincode</label>
                <input type="text" name="pincode" id="pincode">

            </form>
            </div>
        </div>
    </div>

    <div class="button-container">
        <div>
            <button class="btn" type="button" onclick="redirectToPayment(this)" orderId="<%=orderId%>" user_id="<%=session.getAttribute("user_id")%>">Cash On Delivery</button>
        </div>
        <div>
            <form>
                <script src="https://checkout.razorpay.com/v1/payment-button.js" data-payment_button_id="pl_N2297lUudNqRip" async></script>
            </form>
        </div>
    </div>
        
        <script>
    function redirectToPayment(button) {
        // Get form data
        var houseNo = document.querySelector('#addressForm input[name="houseNo"]').value;
        var areaLandmark = document.querySelector('#addressForm input[name="areaLandmark"]').value;
        var city = document.querySelector('#addressForm input[name="city"]').value;
        var pincode = document.querySelector('#addressForm input[name="pincode"]').value;

        // Check if all form fields are filled
        if (houseNo && areaLandmark && city && pincode) {
            var orderId = button.getAttribute("orderId");
            var user_id = button.getAttribute("user_id");

            // Prepare form data
            var formData = {
                orderId: orderId,
                user_id: user_id,
                houseNo: houseNo,
                areaLandmark: areaLandmark,
                city: city,
                pincode: pincode
            };

            // Perform an AJAX request to send the data to the server
            $.ajax({
                type: "POST",
                url: "payment.jsp",
                data: formData,
                success: function (response) {
                    window.location.href = "index.jsp";
                    alert("Ordered Successfully!");
                },
                error: function (xhr, status, error) {
                    alert("Something went wrong!");
                }
            });
        } else {
            alert("Please fill in all address details before proceeding.");
        }
    }
</script>

</body>

</html>
<% } %>