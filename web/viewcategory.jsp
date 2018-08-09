
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="category.categorydao"%>
<%@page import="category.categorydaoimpl"%>
<%@page import="category.Category"%>
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
    Category c=new Category();
    categorydao cda=new categorydaoimpl();
    List<Category> list=cda.getCategory();
    request.setAttribute("cate", list);
    
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <br>
        <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> C A T E G O R Y &bullet;</h1>
        <br>
        <table class="table table-stripped" style="margin: auto; width:60%;">
            <thead>
            <th>ID</th>
            <th>Category Name</th>
            <th>Description</th>
            <th>Photo</th>
            <th>view</th>
            <% 
                try{
                if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin"))
                {
            %>
            <th>Delete</th>
            <th>Update</th>
            <% 
            }}
            catch(Exception e){
                    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                }
            %>
            </thead>
            <c:forEach items="${cate}" var="c"> 
                <tbody>
                <td>${c.getId()}</td>
                <td>${c.getCategory_name()}</td>
                <td>${c.getCategory_desc()}</td>
                <td><img src="${c.getPic()}" height=150 width=200/></td>
                <td><a href="viewproduct.jsp" class="btn btn-primary">View Product</a></td>
                <% 
                try{
                    
                if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin"))
                {
                %>
                <td><a href="deletecategory?id=${c.getId()}" class="btn btn-danger">Delete</a></td>
                <td><a href="updatecategory.jsp?id=${c.getId()}" class="btn btn-success">Update</a></td>
                <% 
                }}
                    catch(Exception e){
                        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                    }
                %>
                </tbody>
            </c:forEach>
                
        </table>
            <% 
               try{ 
            if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("customers")){
            %>
        <a href="Category.jsp" style="margin: auto;"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOticxenKcHWzNFJ5r61jQ_Y2WUEK-5ktCZd9UeeeLLCs4kqMgyw"></a>
        <%
        }}    
        catch(Exception e){
                        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
            }
        %>
    </body>
</html>
