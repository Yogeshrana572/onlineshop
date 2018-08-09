
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="orders.Order"%>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
 
    </head>
    <% 
        Orderdao odao=new Orderdaoimpl();
        Order o=odao.getOrders(Integer.parseInt(request.getParameter("id")));
        
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <br>
        <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> O R D E R   C O N F I R M &bullet;</h1>
        <br>
        <table class="table table-stripped" style="margin: auto; width: 50%;">
            <thead>
                <tr>
                    <th>Order id</th>
                    <th>Product id</th>
                    <th>Transaction id</th>
                    <th>Order Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=o.getId()%></td>
                    <td><%=o.getProduct_id()%></td>
                    <td><%=o.getTrans_id()%></td>
                    <td><%=o.getStatus()%></td>
                </tr>
            </tbody>
        </table>
                <br>
                
                <form style="text-align:center; margin: auto;">
                <a href="index.jsp" class="btn btn-success">Go To Home</a>
                </form>
            <script>    
          sweetAlert({
                title:'Order Confirm',
                text: 'Thanks, To Buy our Product',
                type:'success'
          },function(isConfirm){
                
          });
          $('.swal2-confirm').click(function(){
                window.location.href = 'index.jsp';
          });
</script>
    </body>
</html>
