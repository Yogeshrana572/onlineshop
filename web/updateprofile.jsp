
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="profileimplements.profile"%>
<%@page import="profileimplements.profiledaoimpl"%>
<%@page import="profileimplements.profiledao"%>
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
    <%
    profiledao pdao=new profiledaoimpl();
    profile p;
    try {
            p=pdao.getProfile(Integer.parseInt(request.getParameter("id")));
        } catch (Exception e) {
             p=pdao.displayE(request.getSession().getAttribute("luser").toString());
        }
    
    %>
    
    <body>
        <c:import url="header.jsp"></c:import>
        <br>
        <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> P R O F I L E &bullet;</h1>
        <br>
        <form action="doupdate?id=<%=p.getId()%>" method="post" style="margin: auto; width:50%; padding: auto; text-align:center">
            <input type="text"  value="<%=p.getId()%>" disabled class="form-control">
            <br>
            <select class="form-control" name="role" id="role" disabled>
                <option><%=p.getRole()%></option>
                <option>Admin</option>
                <option>Employees</option>
                <option>Customers</option>
            </select>
                <br>
            <input type="text"  value="<%=p.getFirst_name()%>" name="fname" class="form-control">
            <br>
            <input type="text"  value="<%=p.getLast_name()%>"  name="lname" class="form-control">
            <br>
            <input type="email"   value="<%=p.getEmail_id()%>" name="mail"  class="form-control">
            <br>
            <input type="password"  value="<%=p.getPassword()%>" name="pass" class="form-control">
            <br>
            <input type="number"  value="<%=p.getMobile_no()%>" name="numb" class="form-control">
            <br>
            <select class="form-control" id="gen" name="gen" >
                <option><%=p.getGender()%></option>
                <option>Male</option>
                <option>Female</option>
            </select>
            <br>
            <select class="form-control" id="con" name="con" >
                <option><%=p.getCountry()%></option>
                <option>Australia</option>
                <option>India</option>
                <option>USA</option>
            </select>
            <br>
            <textarea class="form-control" name="adress"><%=p.getAddress()%></textarea>
            <br>
            <button class="btn btn-success">Update</button>
        </form>
    </body>
</html>