
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="product.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.productdaoimple"%>
<%@page import="product.productdao"%>
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
    productdao pdao=new productdaoimple();
    List<Product> list=new ArrayList<Product>();
     list=pdao.getProduct();
     request.setAttribute("prod", list);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <br>
        <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> P R O D U C T S &bullet;</h1>
        <br>
        <table class="table table-stripped" style="text-align: center; margin: auto; width: 60%;">
            <thead>
                <% 
                    try{
                    if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin")){
                %>
            <th>ID</th>
            <% 
            }}
                catch(Exception e){
                                
                                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                    }   
            %>
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
            <% 
                try{
                    
                if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin"))
                {
            %>
            <th>UPDATE</th>
            <th>DELETE</th>
            <% 
                }}
                catch(Exception e)
{
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
}
            
            %>
            </thead>
            <tbody>
                
            <c:forEach items="${prod}" var="c" >
                <tr>
                  <% 
                    try{
                    if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin")){
                %>  
            <td>${c.getId()}</td>
            <% 
            }}
                catch(Exception e){
                                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                    }   
            %>
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
            <% 
            try{
            if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin")){    
            
            
            %>
            <td><a href="Update.jsp?id=${c.getId()}" class="btn btn-success">Update</a></td>
            <td><a href="deletedb?id=${c.getId()}" class="btn btn-danger">Delete</a></td>
            <% 
            }}
                catch(Exception e){
                    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
            }
            %>
            </tr>
            </c:forEach>
                
            </tbody>
        </table>
            <% 
            try{
                
            if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("customers")){
            %>
        <a href="product.jsp" style="margin: auto;"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOticxenKcHWzNFJ5r61jQ_Y2WUEK-5ktCZd9UeeeLLCs4kqMgyw"></a>
        <% 
            }}
                catch(Exception e){
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
}
        %>
    </body>
</html>
