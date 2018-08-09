
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="category.Category"%>
<%@page import="category.categorydaoimpl"%>
<%@page import="category.categorydao"%>
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
    categorydao cdao=new categorydaoimpl();
    List<Category> list=cdao.getCategory();
    request.setAttribute("cat", list);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <br>
   <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> P R O D U C T &bullet;</h1>
   <br>
        <form style="text-align: center; margin: auto; padding: auto; width: 50%;" action="addproduct" method="post" enctype="multipart/form-data" >
            <select name="cate" class="form-control">
                <option>---Category---</option>
                <c:forEach items="${cat}" var="c">
                    <option>${c.getCategory_name()}</option>
                </c:forEach>
            </select>
            <br>
            <input type="text" placeholder="Product name" name="naam" class="form-control">
            <br>
            <input type="text" placeholder="Product Type" name="typ" class="form-control">
            <br>
            <input type="text" placeholder="Product Ideal" name="ideal" class="form-control">
            <br>
            <input type="text" placeholder="Product Capacity" name="cap" class="form-control">
            <br>
            <input type="text" placeholder="Product Trolley" name="tro" class="form-control">
            <br>
            <input type="text" placeholder="Product Material" name="mat" class="form-control"> 
            <br>
            <input type="text" placeholder="Laptop Sleeve" name="sle" class="form-control">
            <br>
            <input type="text" placeholder="Style Code" name="sty" class="form-control">
            <br>
            <input type="text" placeholder="Color Code" name="col" class="form-control">
            <br>
            <input type="text" placeholder="Price" name="pri" class="form-control">
            <br>
            <input type="file" name="pic" class="form-control" id="img" onchange="readURL(this)">
            <br>
            <img id="blah" src="#" alt="image deploy" name="data" width="30%">
            <br>
            <button class="btn btn-primary">Add</button>
        </form>
    </body>
</html>
