<%
    int adminLogin = (session != null && session.getAttribute("adminLogin") != null) ? (int) session.getAttribute("adminLogin") : 0;
    if (adminLogin> 0) {
%>
  <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="addProduct.css">
</head>
<body style="font-size: 15px;">
    <%@include file = "adminheading.jsp" %>
    
    <div class="container" style="margin-top: 3%;">
        <h1 style="text-align: center;"><b>Add Product</b></h1>
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <div class="row">
          <div class="col-25">
            <label for="title" style="font-size: 15px; font-weight: bold;">Product Title</label>
          </div>
          <div class="col-75">
            <input type="text" id="title" name="ProductTitle" placeholder="Product Title...">
          </div>
        </div>
        <div class="row">
          <div class="col-25">
            <label for="category" style="font-size: 15px; font-weight: bold;">Category</label>
          </div>
          <div class="col-75">
            <input type="text" id="category" name="ProductCategory" placeholder="Product Category....">
          </div>
        </div>
        <div class="row">
            <div class="col-25">
              <label for="weight" style="font-size: 15px; font-weight: bold;">Weight</label>
            </div>
            <div class="col-75">
              <input type="text" id="weight" name="ProductWeight" placeholder="In grams...">
            </div>
          </div>
          <div class="row">
            <div class="col-25">
              <label for="price" style="font-size: 15px; font-weight: bold;">Price</label>
            </div>
            <div class="col-75">
              <input type="text" id="price" name="ProductPrice" placeholder="In Rupees..">
            </div>
          </div>
        <div class="row">
            <div class="col-25">
              <label for="image" style="font-size: 15px; font-weight: bold;">Image</label>
            </div>
            <div class="col-75">
              <input type="file" id="image" name="ProductImage" placeholder="Product Image...">
            </div>
          </div>
        <div class="row">
            <input type="submit" value="Add Product" style="font-size: 15px;">
        </div>
      </form>
    </div>
    
</body>
</html>
<%
    }
else
{
response.sendRedirect("adminLogin.jsp");
}
%>