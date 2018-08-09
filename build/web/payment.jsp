
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
        try{
            request.getSession().getAttribute("role").toString();
        }
        catch(Exception e){
//            request.setAttribute("error", "<script>swal('Hi....', 'Login First, To enjoy our Products Sevices!', 'error');</script>");
//            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
//                rd.forward(request, response);
            response.sendRedirect("login.jsp");
        }
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <br>
        <h1 style="margin: auto; text-align: center;"><span class="bdots">&bullet;</span> P A Y M E N T &bullet;</h1>
        <br>
        <form action="dopayment?id=<%= request.getParameter("id")%>" method="post" style="margin: auto; width: 30%; text-align: center;">
            <h3 style="text-align: left; margin: auto;">Bank Name:</h3>
            <select name="bnk" class="form-control">
                <option value="">--Bank Name--</option>
                <option>STATE BANK OF INDIA</option>
                <option>PUNJAB NATIONAL BANK</option>
                <option>AXIS BANK</option>
                <option>ICICI BANK</option>
                <option>HDFC BANK</option>
                <option>YES BANK</option>
                <option>KOTAK BANK</option>
                <option>CORPORATION BANK</option>
                <option>CITIBANK</option>
                <option>CANARA BANK</option>
                <option>DBS BANK</option>
            </select> 
            <br>
            <h3 style="text-align: left; margin: auto;">Expire Date:</h3>
            <input type="text" placeholder="Card no(Debit Card/ Credit Card)" name="card" class="form-control">
            <br>
            <div class="form-group row">
                <div class="col-xs-6">
                    <h3 style="text-align: left; margin: auto;">Expire Date:</h3>
            <br>
            <input type="month" placeholder="Expire Date" name="expire" min="2017-01" max="2030-12"  class="form-control">
                </div>
                <div class="col-xs-4">
                    <h3 style="text-align: left; margin: auto;">CVV No:</h3>
                    <br>
                    <input type="password" placeholder="CVV no" name="cvv" pattern="[0-9]*" title="Enter in Valid  CVV in Numbers Only , Only in 0-9 "  class="form-control" minlength="3" onkeypress="if(this.value.length===3) {return false;}">
                </div>
                </div>
            <br>
            <h3 style="text-align: left; margin: auto;">Holder Name:</h3>
            <input type="text" placeholder="Card Holder name" name="hld" class="form-control">
            <br>
            <button class="btn btn-success" onclick="isConfirm()"> Pay </button>
        </form>
            
            <script>    
          sweetAlert({
                title:'Successful',
                text: 'Valid Username or Password',
                type:'success'
          },function(isConfirm){
                
          });
          $('.swal2-confirm').click(function(){
                window.location.href = 'index.jsp';
          });
</script>
    </body>
</html>
