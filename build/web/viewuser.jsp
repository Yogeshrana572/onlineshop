
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="profileimplements.profile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="profileimplements.profiledao"%>
<%@page import="profileimplements.profiledaoimpl"%>
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
        List<profile> list=new ArrayList<profile>();
        
        list=pdao.getProfile();
        request.setAttribute("users", list);
        
    %>
    <body class="bg">
        <c:import url="header.jsp"></c:import>
        <table class="table table-stripped" style="margin: auto; padding: auto; width: 90%;">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Role</th>
                    <th>first Name</th>
                    <th>Last Name</th>
                    <th>Email_id</th>
                    <th>Mobile no</th>
                    <th>Gender</th>
                    <th>Country</th>
                    <th>Address</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="u">
                    <tr>
                        <td>${u.getId()}</td>
                        <th>${u.getRole()}</th>
                        <td>${u.getFirst_name()}</td>
                        <td>${u.getLast_name()}</td>
                        <td>${u.getEmail_id()}</td>
                        <td>${u.getMobile_no()}</td>
                        <td>${u.getGender()}</td>
                        <td>${u.getCountry()}</td>
                        <td>${u.getAddress()}</td>
                        <td><a href="deletefromdb?id=${u.getId()}" class="btn btn-danger">Delete</a></td>
                    <td><a href="updateprofile.jsp?id=${u.getId()}" class="btn btn-success">Update</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
