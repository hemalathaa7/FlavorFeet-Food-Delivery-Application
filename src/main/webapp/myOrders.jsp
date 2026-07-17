<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%@page import="java.util.List"%>
<%@page import="com.tap.Model.Orders"%>
<%@page import="com.tap.Model.user"%>


 <jsp:include page="navbar.jsp" />
     
     
<%
user customer=(user)session.getAttribute("user");

if(customer==null){
    response.sendRedirect("login.html");
    return;
}

List<Orders> orderList=(List<Orders>)request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>FlavorFeet | My Orders</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" href="home.css">


<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
 background:#f5f6fa;}

/* ================= NAVBAR ================= */


/* =========================
        NAVBAR
========================= */

.navbar{
    background:#fff;
    color:black;
    padding:15px 50px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.flavor{

    color:#FF6B35;

    font-weight:800;

}

.feet{

    color:#C1121F;

    font-weight:800;

}

.cart-link {
    
    
     padding:9px 20px;

    border:2px solid #FF6B35;

    border-radius:30px;

    color:#FF6B35;

    text-decoration:none;

    font-weight:600;

    transition:.3s;
}

.cart-link:hover {
    background: #e65c00;
}

/* Logo */

.logo a{

    text-decoration:none;

    display:flex;

    align-items:center;

    font-size:36px;

    font-weight:800;

}
/* Right Side */

.nav-right{

    display:flex;

    align-items:center;

    gap:35px;

}

/* Navigation */

.nav-links{

    display:flex;

    list-style:none;

    gap:35px;

    margin:0;

    padding:0;

}


.nav-links a{

    text-decoration:none;

    color:#333;

    font-size:18px;

    font-weight:600;

    transition:.3s;

}

.nav-links a:hover{

    color:#FF6B35;

}

/* Buttons */

.nav-buttons{

    display:flex;

    gap:15px;

}

.login-btn{

        padding:7px 18px;

    border:2px solid #FF6B35;

    border-radius:30px;

    color:#FF6B35;

    text-decoration:none;

    font-weight:600;

    transition:.3s;

}

.login-btn:hover{

    background:#FF6B35;

    color:#fff;

}

.signup-btn{

        padding:7px 18px;

    border:2px solid #FF6B35;

    border-radius:30px;

    color:#FF6B35;

    text-decoration:none;

    font-weight:600;

    transition:.3s;
   

}

.signup-btn:hover{

 background:#FF6B35;

    color:#fff;
}

/* ================= HERO ================= */

.hero{

width:92%;


background:linear-gradient(135deg,#ff7b00,#ff4b2b);

border-radius:30px;

margin:25px auto;
    padding:28px 40px;
display:flex;

justify-content:space-between;

align-items:center;

color:white;

box-shadow:0 18px 45px rgba(255,107,0,.28);

}

.hero-left h1{

font-size:48px;

margin-bottom:12px;

}

.hero-left p{

font-size:19px;

opacity:.95;

line-height:1.7;

}

.hero-right{

display:flex;

gap:18px;

}

/* SUMMARY BOXES */

.summary-card{

background:rgba(255,255,255,.18);

backdrop-filter:blur(10px);

padding:20px 28px;

border-radius:20px;

text-align:center;

min-width:145px;

}

.summary-card h2{

font-size:34px;

margin-bottom:6px;

}

.summary-card span{

font-size:15px;

letter-spacing:.8px;

}

/* ================= PAGE TITLE ================= */

.section-title{

text-align:center;

font-size:42px;

font-weight:700;

margin:50px 0 35px;

color:#222;

}



/* ================= ORDER CARD ================= */

.order-card{
    width:92%;
    margin:15px auto;
    background:white;
    border-radius:18px;
    padding:18px 22px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
  

    min-height:140px;
} 	

.order-card:hover{

transform:translateY(-8px);

box-shadow:0 18px 40px rgba(0,0,0,.15);

}

.order-left{
    display:flex;
    align-items:center;
    gap:15px;
}

.restaurant-icon{

    width:60px;

    height:60px;

    border-radius:50%;

    background:linear-gradient(135deg,#ff7b00,#ff4b2b);

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:28px;

    color:white;

}
.restaurant-name{

font-size:24px;

font-weight:bold;

color:#ff6b35;

}
.info-box{

background:#fff7f2;

border-radius:14px;

padding:18px;

border:1px solid #ffe1d3;

}

.order-info h2{
    font-size:20px;
    margin-bottom:5px;
}

.order-info p{
    font-size:15px;
    margin:4px 0;
}

.order-right{

text-align:right;

}

.amount{
    font-size:24px;
    font-weight:700;
    color:#ff6b00;
    margin:12px 0;
}
.status{
    display:inline-block;
    padding:7px 18px;
    border-radius:30px;
    font-size:13px;
    font-weight:600;
    color:white;
    margin-bottom:15px;
}

.delivered{
    background:#28a745;
}

.preparing{
    background:#ffc107;
    color:#222;
}

.cancelled{
    background:#dc3545;
}

.outfordelivery,
.placed{
    background:#17a2b8;
}

.btn-group{
    display:flex;
    gap:10px;
    margin-top:12px;
}

.details-btn{

    padding:10px 18px;

    border:2px solid #ff6b00;

    color:#ff6b00;

    border-radius:8px;

    text-decoration:none;

    font-size:15px;

    font-weight:600;

    transition:.3s;
}

.details-btn:hover{

    background:#ff6b00;

    color:white;

}

.again-btn{

    padding:10px 18px;

    background:#ff6b00;

    color:white;

    border-radius:8px;

    text-decoration:none;

    font-size:15px;

    font-weight:600;

    transition:.3s;
}

.again-btn:hover{

    background:#e85d00;

}



.back-btn{

display:inline-block;

margin-top:35px;

padding:16px 34px;

background:linear-gradient(135deg,#ff7b00,#ff4b2b);

border-radius:35px;

color:white;

font-weight:600;

text-decoration:none;

transition:.3s;

}

.back-btn:hover{

transform:translateY(-3px);

box-shadow:0 12px 25px rgba(255,107,0,.25);

}


/* ================= EMPTY ORDERS ================= */

.empty-orders{

width:90%;

margin:80px auto;

padding:70px;

background:white;

border-radius:25px;

text-align:center;

box-shadow:0 15px 40px rgba(0,0,0,.08);

}

.empty-icon{

font-size:90px;

margin-bottom:20px;

}

.empty-orders h2{

font-size:38px;

margin-bottom:18px;

color:#333;

}

.empty-orders p{

font-size:19px;

color:#666;

margin-bottom:35px;

line-height:1.8;

}

.browse-btn{

display:inline-block;

padding:16px 36px;

background:linear-gradient(135deg,#ff7b00,#ff4b2b);

color:white;

text-decoration:none;

border-radius:35px;

font-size:18px;

font-weight:600;

transition:.3s;

}

.browse-btn:hover{

transform:translateY(-3px);

box-shadow:0 10px 25px rgba(255,107,0,.3);

}

/* ================= FOOTER ================= */

.footer{

margin-top:80px;

background:#1f2937;

color:white;

padding:60px 80px 20px;

}

.footer-container{

display:flex;

justify-content:space-between;

flex-wrap:wrap;

gap:60px;

}

.footer-brand{

max-width:350px;

}

.footer-brand h2{

font-size:38px;

margin-bottom:18px;

background:linear-gradient(to right,#ff7b00,#ff4b2b);

-webkit-background-clip:text;

-webkit-text-fill-color:transparent;

}

.footer-brand p{

color:#d1d5db;

line-height:1.8;

}

.footer-links{

display:flex;

flex-direction:column;

gap:14px;

}

.footer-links h3{

margin-bottom:15px;

font-size:22px;

}

.footer-links a{

color:#d1d5db;

text-decoration:none;

transition:.3s;

}

.footer-links a:hover{

color:#ff7b00;

padding-left:8px;

}

.footer hr{

margin:45px 0 20px;

border:.5px solid rgba(255,255,255,.15);

}

.copyright{

text-align:center;

color:#bbb;

font-size:16px;

}

/* ================= RESPONSIVE ================= */

@media(max-width:992px){

.hero{

flex-direction:column;

text-align:center;

gap:30px;

}

.order-card{

flex-direction:column;

text-align:center;

gap:30px;

}

.order-right{

text-align:center;

}

.btn-group{

justify-content:center;

}

.footer-container{

flex-direction:column;

text-align:center;

}

}

@media(max-width:768px){

.navbar{

flex-direction:column;

height:auto;

padding:20px;

gap:20px;

}

.nav-links{

flex-wrap:wrap;

justify-content:center;

}

.hero-left h1{

font-size:36px;

}

.summary-card{

min-width:120px;

}

}
.flavor{

    color:#FF6B35;

    font-weight:800;

}

.feet{

    color:#C1121F;

    font-weight:800;
}
.logo{

    font-size:42px;
    font-weight:800;
    letter-spacing:1px;
    cursor:pointer;
    transition:.4s ease;

}

.flavor{

    color:#FF6B35;

    font-weight:800;

}

.feet{

    color:#C1121F;

    font-weight:800;

}ver{

    transform:scale(1.05);

}

.logo:hover .flavor{

    color:#ffb347;

}

.logo:hover .feet{

    color:#ff6b35;

}
</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

 

<!-- ================= HERO ================= -->


<div class="hero">

<h1>📦 My Orders</h1>



</div>



<div class="container">

<%
if(orderList == null || orderList.isEmpty()){
%>

<div class="empty-orders">
<div style="font-size:80px;">🍽</div>

<h2>No Orders Yet</h2>

<p>Start exploring delicious restaurants near you.</p>

<a href="callRestaurantServlet" class="browse-btn">
Browse Restaurants

</a>

</div>


<%
} else {

    for(Orders order : orderList){
%>

	



<div class="order-card">

    <div class="order-left">
       <div class="restaurant-icon">
            🍽
        </div>

        <div class="order-info">

            <h2><%=order.getRestaurantName()%></h2>

            <p>
                <strong>Order ID :</strong>
                #<%=order.getOrderId()%>
            </p>

            <p>
                <strong>Order Date :</strong>
                <%=order.getOrderDate()%>
            </p>

            <p>
                <strong>Payment :</strong>
                <%=order.getPaymentMode()%>
            </p>

        </div>
       
    </div>

    <div class="order-right">

        <div class="status <%=order.getStatus().equalsIgnoreCase("Delivered") ? "delivered" :
order.getStatus().equalsIgnoreCase("Preparing") ? "preparing" :
order.getStatus().equalsIgnoreCase("Cancelled") ? "cancelled" :
"outfordelivery"%>">

    <%=order.getStatus()%>

</div>

        <h2 class="amount">
            ₹ <%=order.getAmount()%>
        </h2>

        <div class="btn-group">

            <a href="ViewOrderServlet?orderId=<%=order.getOrderId()%>" class="details-btn">
                View Details
            </a>

            <form action="OrderAgainServlet" method="post">

    <input type="hidden"
           name="orderId"
           value="<%=order.getOrderId()%>">

    <button type="submit" class="again-btn">

        🔄 Order Again

    </button>

</form>

        </div>

    </div>

</div>

 <%
    }   // end for
}       // end else
%>



   
</body>

</html>













































