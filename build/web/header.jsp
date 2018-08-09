
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title><meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse" style="width:70%; margin: auto;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" href="index.jsp"><img src="https://pbs.twimg.com/profile_images/938343145825189888/TJor_jA8_400x400.jpg" style="width: 116px; height: 56px;"></a>
    </div><br>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a href="viewcategory.jsp">Category</a></li>
        <li><a href="viewproduct.jsp">Product</a></li>
      </ul>
        <%
        if(request.getSession().getAttribute("luser")==null)    {
            
        %>
      <ul class="nav navbar-nav navbar-right" onload="log()">
          <li><a href="signup.jsp" title="Sign Up"><span class="glyphicon glyphicon-user"></span></a></li>
          <li><a href="login.jsp" title="log in"><span class="glyphicon glyphicon-log-in"></span></a></li>
      </ul>
      <% 
      }
else{
      %>
       <ul class="nav navbar-nav navbar-right" onload="log()">
          <li><a href="updateprofile.jsp"> welcome ${name}</a></li>
           <li><a href="vieworders.jsp"><img src="https://cdn.iconscout.com/public/images/icon/premium/png-512/shopping-cart-add-ecommerce-shop-399fe6eae4fd56c5-512x512.png" style="width:25px"></a></li>
        <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Log out</a></li>
      </ul>
        <% 
        }
        %>
    </div>
  </div>
</nav>
</body>
</html>
