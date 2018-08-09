
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="profileimplements.profiledaoimpl"%>
<%@page import="profileimplements.profiledao"%>
<%@page import="profileimplements.profile"%>
<%@page import="orders.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="orders.Orderdaoimpl"%>
<%@page import="orders.Orderdao"%>
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
        Orderdao odao=new Orderdaoimpl();
        List<Order> list=new ArrayList<Order>();
        List<Order> list1=new ArrayList<Order>();
        
            profile p=new profile();
            
            try {
                    profiledao pdao=new profiledaoimpl();
                    p=pdao.displayE(request.getSession().getAttribute("luser").toString());
                    list=odao.getOrder();
                    if(!p.getRole().equalsIgnoreCase("admin")){
                        for(Order ele:list){
                            if(ele.getBuyer()==p.getId()){
                                list1.add(ele);
                            }
                        }
                        request.setAttribute("ordr", list1);
                    }
                    else{
                        request.setAttribute("ordr", list);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <br>
        <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> O R D E R S &bullet;</h1>
        <br>
        
        <table class="table table-stripped" style="width: 50%; margin: auto;">
            <thead>
                <tr>
                    <th>Order id</th>
                    <th>Product id</th>
                    <th>Transaction id</th>
                    <th>Status</th>
                    <th>Buyer id</th>
                    <% 
                        if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("customers"))
                        {
                    %>
                    <th>Cancel</th>
                    <% 
                        }
                    else{
                    %>
                    <th>Place</th>
                    <th>Delete</th>
                    <%
                        }
                    %>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${ordr}" var="o">
                <tr>
                    <td>${o.getId()}</td>
                    <td>${o.getProduct_id()}</td>
                    <td>${o.getTrans_id()}</td>
                    <td>${o.getStatus()}</td>
                    <td>${o.getBuyer()}</td>
                    <% 
                        if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("customers"))
                        {
                            
                    %>
                    <td><a href="cancelorder?id=${o.getId()}" class="btn btn-warning">Cancel</a></td>
                    <% 
                        
                        }
                    else{
                    %>
                    <td><a href="placeorder?id=${o.getId()}" class="btn btn-primary">Place</a></td>
                    <td><a href="deleteorder?id=${o.getId()}" class="btn btn-danger">Delete</a></td>
                    <%
                        }
                    %>
                </tr>
            </c:forEach>
            </tbody>
            
        </table>
    </body>
</html>
    