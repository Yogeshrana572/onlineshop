
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="category.categorydaoimpl"%>
<%@page import="category.categorydao"%>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js" ></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">
<style>
.mySlides {display:none;}
</style>
       
    </head>
    <%
    categorydao cdao=new categorydaoimpl();
    List<Category> list=cdao.getCategory();
    request.setAttribute("slid", list);
    %>
    <body>
    <c:import url="header.jsp"></c:import>
    
    <div class="w3-content w3-section" style="width:500%; border:2px solid;">
    <img class="mySlides" src="http://shop.endscuoio.it/WebRoot/StoreIT/Shops/67625/573C/649F/B74F/20F4/4B29/3E95/9310/0C45/H-D_Dyna_Small_Tango_Bag_handle_grips_Combo_orange_thread_EndsCuoio.jpg" style="width:100%; height: 450px;">        
    <img class="mySlides" src="https://orig00.deviantart.net/0225/f/2017/033/a/f/fischer_workshops_tire_messenger_bag_w__gazelle_by_fischerworkshops-daxl821.jpg" style="width:100%; height: 450px;">        
    <img class="mySlides" src="http://fresnocoin.com/wp-content/uploads/2013/05/LV-Chanel-Group.jpg" style="width:100%; height: 450px;">        
    <img class="mySlides" src="https://cdn.raffaello-network.com/english/fashion-images/designer-mens-bags-briefcases/gucci-bags.jpg?v=1" style="width:100%; height: 450px;">        
    
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
<br>
<h1 style="text-align: center; background-color: white;"><span class="bdots">&bullet;</span>  C A T E G O R Y &bullet;</h1>
<br>
<div id="cat" class="w3-row-padding w3-theme" style="width:65%; margin: auto;">
    <c:forEach items="${slid}" var="c">
           <div class="w3-third w3-section">
<div class="w3-card-4">
    <a href="CategoryBags.jsp?cat=${c.getCategory_name()}" style="text-decoration: none;">
<img src="${c.getPic()}" style="width:100%; height:200px;">
<div class="w3-container w3-white">
<h4>${c.getCategory_name()}</h4>
<p>${c.getCategory_desc()}</p>
</div>
    </a>
</div>
</div>
    </c:forEach>
</div>
 
 <%
     try{
      request.getSession().getAttribute("role").toString(); 
     
  %>
            <script>    
          sweetAlert({
                title:'Login Successfull',
                text: 'You can Now survive Our Site',
                type:'success'
          },function(isConfirm){
                
          });
          $('.swal2-confirm').click(function(){
                window.location.href = 'index.jsp';
          });
</script>
<% 
}
catch(Exception e){
    e.printStackTrace();

}
%>

               
<br>
<c:import url="footer.jsp"></c:import>
    </body>
</html>
