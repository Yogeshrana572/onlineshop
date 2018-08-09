
<%@page import="java.util.List"%>
<%@page import="product.productdaoimple"%>
<%@page import="product.productdao"%>
<%@page import="product.Product"%>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    </head>
    <%
        productdao pdao=new productdaoimple();
        List<Product> list=pdao.getProduct(request.getParameter("cat"));
        request.setAttribute("list", list);
        
        
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h2 style="text-align: center"><%=request.getParameter("cat")%></h2><br>
        
        <table class="table table-stripped" style="text-align: center; margin: auto; width: 60%;">
            <thead>
                <th>ID</th>
                <th>CATEGORY</th>
                <th>PRODUCT NAME</th>
                <th>TYPE</th>
                <th>IDEAL</th>
                <th>CAPACITY</th>
                <th>TROLLEY</th>
                <th>MATERIAL</th>
                <th>LAPTOP SLEEVE</th>
                <th>STYLE CODE</th>
                <th>COLOR CODE</th>
                <th>IMAGE</th>
                <th>PRICE</th>
                <th>BUY</th>
               
            </thead>
            <tbody>
                
            <c:forEach items="${list}" var="c" >
                <tr>
                    <td>${c.getId()}</td>
                    <td>${c.getCat_name()}</td>
                    <td>${c.getPro_name()}</td>
                    <td>${c.getPro_type()}</td>
                    <td>${c.getPro_ideal()}</td>
                    <td>${c.getPro_capacity()}</td>
                    <td>${c.getPro_trolley()}</td>
                    <td>${c.getPro_material()}</td>
                    <td>${c.getLaptop_sleece()}</td>
                    <td>${c.getStyle_code()}</td>
                    <td>${c.getColor_code()}</td>
                    <td><img src="${c.getPro_img()}" height=150 width=200/></td>
                    <td>"$"${c.getPro_price()}</td>
                    <th><a href="payment.jsp?id=${c.getId()}" class="btn btn-primary">Buy Now</a></th>
                    
                </tr>
            </c:forEach>            
            </tbody>
        </table>
        
    </body>
</html>
