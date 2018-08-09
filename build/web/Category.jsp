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
<script>
            function readURL(input) {
                var path;
                var reader = new FileReader();
    		reader.onload = function (e) {
                    path=e.target.result;
                    $('#blah').attr('src', path);
		};
                reader.readAsDataURL(input.files[0]);
            }   
        </script>
    </head>
    <% 
        try {
                if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin")){
                    response.sendRedirect("deniedadmin.jsp");
                }
            } catch (Exception e) {
                
             RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
            }
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <br>
        <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> A D D   C A T E G O R Y &bullet;</h1>
        <br>
        <form action="addcat" method="post" style="text-align: center; margin: auto; width: 50%;"  enctype="multipart/form-data">
            
            <input type="text" name="cat" placeholder="Category name" class="form-control">
            <br>
            <input type="text" name="desc" class="form-control" placeholder="Category Description">
            <br>
            <input type="file" class="form-control" name="img" id="img" onchange="readURL(this);">
            <br>
            <img id="blah" src="#" alt="image deploy" name="data" width="30%">
            <br>
            <button class="btn btn-primary"> Add </button>
        </form>
    </body>
</html>
