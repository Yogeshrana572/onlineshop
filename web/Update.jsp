
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="product.Product"%>
<%@page import="product.productdaoimple"%>
<%@page import="product.productdao"%>
<%@page import="category.Category"%>
<%@page import="java.util.List"%>
<%@page import="category.categorydaoimpl"%>
<%@page import="category.categorydao"%>
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
    
    productdao pdao=new productdaoimple();
    Product p=pdao.getProduct(Integer.parseInt(request.getParameter("id")));
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> UPDATE PRODUCT &bullet;</h1>
        <form style="text-align: center; margin: auto; padding: auto; width: 50%;"  action="updatepro?id=<%=p.getId()%>" method="post" enctype="multipart/form-data" >
            <input type="text" value="<%=p.getId()%>" name="id" class="form-control" disabled>
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica">Product Category:</h3>
            <select name="cate" class="form-control">
                <option selected><%=p.getCat_name()%></option>
                <c:forEach items="${cat}" var="c">
                    <option>${c.getCategory_name()}</option>
                </c:forEach>
            </select>
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica;">Product Name:</h3>
            <input type="text" value="<%=p.getPro_name()%>"  name="naam" class="form-control">
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica">Product Type:</h3>
            <input type="text" value="<%=p.getPro_type()%>" name="typ" class="form-control">
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica">Product Ideal:</h3>
            <input type="text" value="<%=p.getPro_ideal()%>" name="ideal" class="form-control">
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica">Product Capacity:</h3>
            <input type="text" value="<%=p.getPro_capacity()%>" name="cap" class="form-control">
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica">Product Trolley:</h3>
            <input type="text" value="<%=p.getPro_trolley()%>" name="tro" class="form-control">
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica">Product Material:</h3>
            <input type="text" value="<%=p.getPro_material()%>" name="mat" class="form-control"> 
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica">Laptop Sleeve:</h3>
            <input type="text" value="<%=p.getLaptop_sleece()%>" name="sle" class="form-control">
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica">Style Code:</h3>
            <input type="text" value="<%=p.getStyle_code()%>" name="sty" class="form-control">
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica">Color Code:</h3>
            <input type="text" value="<%=p.getColor_code()%>" name="col" class="form-control">
            <br>
             <h3 style="text-align: left; margin: auto; font-family: helevetica">Product Price:</h3>
            <input type="text" value="<%=p.getPro_price()%>" name="pri" class="form-control">
            <br>
            <input type="file" name="pic" class="form-control" id="img" onchange="readURL(this)">
            <br>
            <img id="blah" src="<%=p.getPro_img()%>" alt="image deploy" name="data" width="30%">
            <br>
            <button class="btn btn-primary">Update</button>
        </form>
    </body>
</html>
