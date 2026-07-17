<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.Model.Orders"%>
<%@ page import="com.tap.DAOImpl.RestaurantDAOImp"%>



      <jsp:include page="navbar.jsp" />



<%

List<Orders> orderList =
(List<Orders>)request.getAttribute("orderList");

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Orders | FoodMingle</title>


<link rel="stylesheet" href="darkmode.css">
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

background:#f5f6fa;

}

/*================ NAVBAR ================*/

.navbar{
    background:#fff;
    color:black;
    padding:15px 50px;
    display:flex;
    justify-content:space-between;
    align-items:center;
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


/* Login */

.login-btn{

        padding:7px 18px;

    border:2px solid #FF6B35;

    border-radius:30px;

    color:#FF6B35;

    text-decoration:none;
}

.login-btn:hover{

    background:#FF6B35;

    color:white;
}

/* Signup */

.signup-btn{

        padding:7px 18px;

    border:2px solid #FF6B35;


    color:#FF6B35;

    border-radius:30px;

    text-decoration:none;
}
.signup-btn:hover{

   background:#FF6B35;

    color:white;
}

.flavor{

    color:#FF6B35;

    font-weight:800;

}

.feet{

    color:#C1121F;

    font-weight:800;

}

.cart-link{

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



.home-btn{

text-decoration:none;

background:#ff6b35;

color:white;

padding:12px 22px;

border-radius:8px;

font-weight:bold;

transition:.3s;

}

.home-btn:hover{

background:#e85b2b;

}

/*================ HEADING ================*/

.hero{

    width:92%;
    margin:25px auto;

    background:linear-gradient(135deg,#ff7b00,#ff4b2b);

    color:white;

    border-radius:22px;

    padding:28px 40px;

    display:flex;

    justify-content:space-between;

    align-items:center;

    box-shadow:0 15px 30px rgba(255,107,0,.25);

}

.hero h1{

    font-size:42px;

    margin-bottom:8px;

}

.hero p{

    font-size:17px;

    opacity:95;

}

.hero-icon{

    font-size:75px;

}

/*================ CONTAINER ================*/

.order-container{

width:92%;

max-width:1300px;

margin:auto;

}

/*================ ORDER CARD ================*/

.order-card{

background:white;

padding:25px;

border-radius:18px;

box-shadow:0 8px 25px rgba(0,0,0,.08);

margin-bottom:25px;

transition:.3s;

border-left:6px solid #ff6b35;

}

.order-card:hover{

transform:translateY(-4px);

}

.order-header{

display:flex;

justify-content:space-between;

align-items:center;

margin-bottom:20px;

}

.order-id{

font-size:24px;

font-weight:bold;

color:#ff6b35;

}

.status{

    padding:8px 18px;

    border-radius:30px;

    font-size:13px;

    font-weight:700;

    text-transform:uppercase;
}

.order-body{

display:grid;

grid-template-columns:1.2fr 1fr 1fr;

gap:18px;

margin-top:20px;

}
.info{

background:#fafafa;

padding:16px;

border-radius:10px;

}

.label{

font-size:13px;

color:#888;

margin-bottom:6px;

}

.value{

font-size:17px;

font-weight:600;

color:#222;

}

.amount{

font-size:28px;

color:#ff6b35;

font-weight:bold;

}

.empty{

background:white;

padding:60px;

border-radius:18px;

text-align:center;

box-shadow:0 8px 25px rgba(0,0,0,.08);

}

.empty h2{

color:#ff6b35;

margin-bottom:15px;

}

@media(max-width:900px){

.order-body{

grid-template-columns:1fr;

}

.navbar{

flex-direction:column;

gap:15px;

}
}


.action-buttons{

    display:flex;

    justify-content:flex-end;

    align-items:center;

    gap:18px;

    margin-top:18px;

}

.details-btn,
.again-btn{

text-decoration:none !important;
    font-size:16px;

    font-weight:600;

    transition:.3s;

}

.details-btn{

    color:#0077cc;

}

.details-btn:hover{

    color:#0056b3;

    text-decoration:underline;

}

.again-btn{

    color:#ff6b35;

}

.again-btn:hover{

    color:#e65100;

    text-decoration:underline;

}



.order-body{

    display:grid;

    grid-template-columns:repeat(3,1fr);

    gap:18px;

    margin-top:20px;

}

.info{

    background:#fff;

    padding:16px;

    border-radius:12px;

    border:1px solid #ffcfb3;

    box-shadow:0 3px 10px rgba(0,0,0,.05);

    transition:.3s;

}
.info:hover{

    transform:translateY(-3px);

    border-color:#ff6b35;

    box-shadow:0 10px 22px rgba(255,107,53,.18);

    background:#fffaf7;

}
.label{

    font-size:13px;

    color:#888;

    margin-bottom:8px;

    text-transform:uppercase;

    letter-spacing:.5px;

}

.value{

    font-size:17px;

    font-weight:600;

    color:#222;

}

.amount{

    font-size:28px;

    color:#ff6b35;

    font-weight:700;

}

.action-buttons{

    display:flex;

    justify-content:flex-end;

    gap:15px;

    margin-top:20px;

}

.status.placed{

    background:#dff6dd;

    color:#1b8f3d;

}
.status.preparing{

    background:#fff4d6;

    color:#d68910;

}

.status.delivered{

    background:#d4f8e8;

    color:#0f9d58;

}

.status.cancelled{

    background:#ffe3e3;

    color:#d63031;

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

}

.logo:hover{

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





<div class="hero">

    <div>

        <h1>📦 My Orders</h1>

        <p>
            View your order history, reorder your favourite meals and track every purchase.
        </p>

    </div>

    <div class="hero-icon">

        🍔

    </div>

</div>

<div class="order-container">
<%

if(orderList != null && !orderList.isEmpty()){

for(Orders order : orderList){

%>

<div class="order-card">

    <div class="order-header">

        <div class="order-id">

            Order <%=order.getOrderId()%>

        </div>

        <div class="status <%=order.getStatus().trim().toLowerCase()%>">

    <%=order.getStatus()%>

</div>

    </div>

   <div class="order-body">

<%
RestaurantDAOImp restaurantDAO = new RestaurantDAOImp();
String restaurantName =
restaurantDAO.getRestaurantNameById(order.getRestaurantId());
%>

<div class="info">
    <div class="label">🍽 Restaurant</div>
    <div class="value"><%=restaurantName%></div>
</div>

<div class="info">
    <div class="label">💳 Payment</div>
    <div class="value"><%=order.getPaymentMode()%></div>
</div>

<div class="info">
    <div class="label">💰 Amount</div>
    <div class="amount">₹ <%=order.getAmount()%></div>
</div>

<div class="info">
    <div class="label">📅 Order Date</div>
    <div class="value"><%=order.getOrderDate()%></div>
</div>

<div class="info">
    <div class="label">📍 Delivery Address</div>
    <div class="value"><%=order.getDeliveryAddress()%></div>
</div>



</div>

<div class="action-buttons">

    <a href="ViewOrderServlet?orderId=<%=order.getOrderId()%>" class="details-btn">
        👁 View Details
    </a>

    <a href="OrderAgainServlet?orderId=<%=order.getOrderId()%>" class="again-btn">
        🔄 Order Again
    </a>

</div>

    </div>
    
    
    
 



<%

}

}else{

%>

<div class="empty">

    <h1 style="font-size:70px;">📦</h1>

    <h2>No Orders Found</h2>

    <p style="margin:20px 0;color:#777;">

        You haven't placed any orders yet.

    </p>

    <a href="callRestaurantServlet"
       class="home-btn">

       🍔 Start Ordering

    </a>

</div>

<%

}

%>

</div>
<script src="theme.js"></script>
</body>

</html>