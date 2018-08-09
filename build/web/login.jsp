
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> L O G I N &bullet;</h1>
    <br>
    <form style="margin: auto; padding: auto; text-align: center; width:30%;" action="loginin" method="post">
            <input type="email" name="user" placeholder="Email Id" class="form-control">
            <br>
            <input type="password" name="pass" placeholder="Password" class="form-control">
            <br>
            <button class="btn btn-success">LogIn</button>
    </form>
    </body>
</html>
