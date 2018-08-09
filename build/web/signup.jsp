
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
        <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> R E G I S T E R &bullet;</h1>
        <br>
        <form action="dosignup" method="post" style="margin: auto; width:50%; padding: auto; text-align:center">
            <select class="form-control" id="gen" name="role">
                <option>--Choose Role--</option>
                <option>Admin</option>
                <option>Employees</option>
                <option>Customers</option>
            </select>
            <br>
            <input type="text" placeholder="First Name" name="fname" class="form-control">
            <br>
            <input type="text" placeholder="Last Name" name="lname" class="form-control">
            <br>
            <input type="email" placeholder="Email" name="mail" class="form-control">
            <br>
            <input type="password" placeholder="Password" name="pass" class="form-control">
            <br>
            <input type="number" placeholder="Mobile no" name="numb" class="form-control">
            <br>
            <select class="form-control" id="gen" name="gen">
                <option>--Gender--</option>
                <option>Male</option>
                <option>Female</option>
            </select>
            <br>
            <select class="form-control" id="con" name="con">
                <option>--Country--</option>
                <option>Australia</option>
                <option>India</option>
                <option>USA</option>
            </select>
            <br>
            <textarea class="form-control" name="adress" placeholder="Address"></textarea>
            <br>
            <button class="btn btn-success">Sign up</button>
        </form>
    </body>
</html>
