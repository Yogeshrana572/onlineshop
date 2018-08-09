
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
    <c:import url="header.jsp"></c:import>
    <br>
    <form style="text-align: center; margin: auto; color: red;">
    <h1>YOU HAVE TO LOGIN FIRST </h1>
    <h1>WITHOUT LOGIN YOU NOT GO TO THE NEXT STEP</h1>
    <a href="login.jsp" class="btn btn-success">Log In</a>
    </form>
    </body>
</html>
