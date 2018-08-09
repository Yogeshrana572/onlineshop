
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
        <form style="text-align: center; margin: auto;">
        <h1 style="text-align: center; margin: auto; font-size: 13; font-family: helvetica; color: red;">LOGIN FIRST & ADMIN CAN LOGIN HERE</h1>
        <br>
        <h3 style="text-align: center; margin: auto; font-size: 13; font-family: helvetica; color: red;">PLEASE ENTER YOUR CREDENTIALS</h3>
        <br>
        <h5  style="text-align: center; margin: auto; font-size: 13; font-family: helvetica; color: red;">IN LOGIN PANEL CLICK THIS BUTTON</h5>
        <br>
        <a href="login.jsp" class="btn btn-success">Login Again</a>
        </form>
    </body>
</html>
