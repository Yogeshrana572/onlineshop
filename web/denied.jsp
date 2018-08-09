
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js" ></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">
    </head>
    <body>
        <c:import url="header.jsp"></c:import>
        <br>
        <form style="text-align: center; margin: auto;">
        <h1 style="text-align: center; margin: auto; font-size: 13; font-family: helvetica; color: red;">INVALID LOGIN</h1>
        <br>
        <h3 style="text-align: center; margin: auto; font-size: 13; font-family: helvetica; color: red;">PLEASE CHECK YOUR CREDENTIALS</h3>
        <br>
        <h5  style="text-align: center; margin: auto; font-size: 13; font-family: helvetica; color: red;">RETRY AGAIN ON CLICK THIS BUTTON</h5>
        <br>
        <a href="login.jsp" class="btn btn-success">Login Again</a>
        </form>
        
        
    <script>    
          sweetAlert({
                title:'Unsuccessful ',
                text: 'Please Check Your credentials & Login Again',
                type:'error'
          },function(isConfirm){
                
          });
          $('.swal2-confirm').click(function(){
                window.location.href = 'denied.jsp';
          });
</script>
    </body>
</html>
