<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tap.Model.Orders"%>
<%@page import="com.tap.Model.Restaurant"%>
<%@page import="com.tap.Model.user"%>


 <jsp:include page="navbar.jsp" />
     
    

<%
user customer=(user)session.getAttribute("user");

if(customer==null){
    response.sendRedirect("login.html");
    return;
}

Orders order=(Orders)request.getAttribute("order");
Restaurant restaurant=(Restaurant)request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>FlavorFeet | Order Details</title>


 <link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" href="home.css">
      
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
background:#f7f8fc;
}

 .flavor{

    color:#FF6B35;

    font-weight:800;

}

.feet{

    color:#C1121F;

    font-weight:800;

}   
/* ================= NAVBAR ================= */

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


.hero{

    width:92%;

    margin:20px auto;

    padding:25px 40px;

    background:linear-gradient(135deg,#ff7b00,#ff4b2b);

    border-radius:22px;

    display:flex;

    justify-content:space-between;

    align-items:center;

    color:white;

    box-shadow:0 12px 25px rgba(255,107,0,.25);

}

.hero-left h1{

    font-size:38px;

    margin-bottom:8px;

}

.hero-left p{

    font-size:18px;

    opacity:.95;

    margin-bottom:15px;

}

.hero-info{

    display:flex;

    gap:30px;

    flex-wrap:wrap;

}

.hero-info span{

    background:rgba(255,255,255,.18);

    padding:8px 16px;

    border-radius:30px;

    font-size:15px;

    backdrop-filter:blur(8px);

}

.hero-right{

    font-size:75px;

    opacity:.95;

}
/* ================= CONTAINER ================= */

.container{

    width:92%;
    margin:25px auto;

    display:grid;

    grid-template-columns:2fr 1fr;

    gap:20px;

    align-items:stretch;
}

/* ================= RESTAURANT CARD ================= */

.restaurant-card{

    background:#fff;

    border-radius:20px;

padding:20px;

    min-height:260px;
    box-shadow:0 10px 25px rgba(0,0,0,.08);

    display:flex;

    flex-direction:column;

    justify-content:flex-start;

}


.restaurant-top{

display:flex;

gap:18px;

align-items:center;

margin-bottom:18px;

}

.restaurant-logo{

width:65px;

height:65px;

font-size:28px;

}

.restaurant-info h2{

font-size:22px;

margin-bottom:4px;

}

.info-row{

display:flex;

align-items:center;

margin:5px 0;

font-size:16px;

padding:8px 0;

border-bottom:1px solid #eee;

}

.info-row strong{

width:160px;

color:#222;

}

/* ================= ORDER SUMMARY ================= */

/*================ ORDER SUMMARY =================*/

.summary-card{

    background:#fff;

    border-radius:20px;

 min-height:260px;

    padding:18px;
    box-shadow:0 12px 30px rgba(0,0,0,.08);

    display:flex;

    flex-direction:column;


    justify-content:space-between;
}

.summary-card h2{

    font-size:34px;

    font-weight:700;

    color:#222;

    margin-bottom:25px;
}

.summary-details{

    flex:1;
}

.summary-item{

    display:flex;

    justify-content:space-between;

    align-items:center;


    border-bottom:1px solid #ececec;

 padding:8px 0;

    font-size:16px;
    }

.summary-item:last-child{

    border-bottom:none;
}

.summary-item span:first-child{

    color:#444;

    font-weight:500;
}

.summary-item span:last-child{

    color:#111;

    font-weight:600;
}

.total{

    text-align:center;


    font-weight:700;

    color:#ff6600;

 font-size:30px;

    margin:12px 0;
    }

.summary-buttons{

    display:flex;

    flex-direction:column;

    gap:15px;

    margin-top:20px;
}

.order-btn,
.back-btn{

    width:100%;

    text-align:center;

 padding:11px;

    font-size:16px;
    border-radius:12px;


    font-weight:600;

    text-decoration:none;

    transition:.3s;
}

.order-btn{

    background:linear-gradient(135deg,#ff7b00,#ff4b2b);

    color:#fff;
}

.order-btn:hover{

    transform:translateY(-3px);

    box-shadow:0 10px 25px rgba(255,107,0,.25);
}

.back-btn{

    background:#fff;

    border:2px solid #ff6b00;

    color:#ff6b00;
}

.back-btn:hover{

    background:#ff6b00;

    color:#fff;
}

.status{

display:inline-block;

padding:8px 20px;

border-radius:30px;

font-weight:600;

color:white;

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

.outfordelivery{

background:#17a2b8;

}

.total{

 font-size:28px;

    margin:15px 0;
font-weight:bold;

color:#ff6b00;

margin-top:20px;

text-align:center;

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

<!-- NAVBAR -->

 
 

<!-- HERO -->



<div class="container">

<!-- LEFT -->

<div class="restaurant-card">

<div class="restaurant-top">

<div class="restaurant-logo">
🍴
</div>

<div class="restaurant-info">

<h2><%=restaurant.getRestaurantName()%></h2>

</div>

</div>

<div class="info-row">

<strong>Order ID</strong>

<span>#<%=order.getOrderId()%></span>

</div>

<div class="info-row">

<strong>Order Date</strong>

<span><%=order.getOrderDate()%></span>

</div>

<div class="info-row">

<strong>Payment Mode</strong>

<span><%=order.getPaymentMode()%></span>

</div>

<div class="info-row">

<strong>Delivery Address</strong>

<span><%=order.getDeliveryAddress()%></span>

</div>

</div>

<!-- RIGHT -->

<div class="summary-card">

<h2>Order Summary</h2>

<div class="summary-item">

<span>Status</span>

<span class="status
<%=order.getStatus().equalsIgnoreCase("Delivered")?"delivered":
order.getStatus().equalsIgnoreCase("Preparing")?"preparing":
order.getStatus().equalsIgnoreCase("Cancelled")?"cancelled":
"outfordelivery"%>">

<%=order.getStatus()%>

</span>

</div>

<div class="summary-item">

<span>Total Amount</span>

<span>₹ <%=order.getAmount()%></span>

</div>

<div class="summary-item">

<span>Restaurant</span>

<span><%=restaurant.getRestaurantName()%></span>

</div>

<div class="summary-item">

<span>Payment Status</span>

<span style="color:#28a745;font-weight:600;">
Paid
</span>

</div>

<div class="summary-item">

<span>Delivery Status</span>

<span>
<%=order.getStatus()%>
</span>

</div>

<div class="total">

₹ <%=order.getAmount()%>

</div>

<div style="margin-top:35px;display:flex;flex-direction:column;gap:15px;">

<a href="OrderAgainServlet?orderId=<%=order.getOrderId()%>"
class="order-btn">

🔄 Order Again

</a>

<a href="MyOrdersServlet"
class="back-btn">

📦 Back To My Orders

</a>

</div>

</div>

</div>

<!-- ================= DELIVERY TIMELINE ================= -->

<section class="timeline-section">

<h2>Delivery Timeline</h2>

<div class="timeline">

<div class="timeline-item completed">

<div class="circle">✓</div>

<div>

<h3>Order Placed</h3>

<p>Your order has been placed successfully.</p>

</div>

</div>

<div class="timeline-item
<%=order.getStatus().equalsIgnoreCase("Preparing") ||
order.getStatus().equalsIgnoreCase("Out For Delivery") ||
order.getStatus().equalsIgnoreCase("Delivered")
? "completed" : ""%>">

<div class="circle">🍳</div>

<div>

<h3>Preparing Food</h3>

<p>The restaurant is preparing your delicious meal.</p>

</div>

</div>

<div class="timeline-item
<%=order.getStatus().equalsIgnoreCase("Out For Delivery") ||
order.getStatus().equalsIgnoreCase("Delivered")
? "completed" : ""%>">

<div class="circle">🛵</div>

<div>

<h3>Out For Delivery</h3>

<p>Your order is on the way.</p>

</div>

</div>

<div class="timeline-item
<%=order.getStatus().equalsIgnoreCase("Delivered")
? "completed" : ""%>">

<div class="circle">🏠</div>

<div>

<h3>Delivered</h3>

<p>Enjoy your meal ❤️</p>

</div>

</div>

</div>

</section>




<style>





.timeline-section{

    width:92%;
    margin:20px auto;
}

.timeline-section h2{

    font-weight:700;
    color:#222;
 font-size:24px;

    margin-bottom:10px;
    }

.timeline{

    background:#fff;
    border-radius:22px;
    padding:18px 25px;
    box-shadow:0 10px 30px rgba(0,0,0,.08);
}

.timeline-item{

    position:relative;

    display:flex;
    align-items:flex-start;

    gap:22px;

    padding:10px 0 10px 20px;
}

.timeline-item:not(:last-child)::before{

    content:"";

    position:absolute;

    left:18px;
    top:42px;

    width:3px;
    height:100%;

    background:#e6e6e6;
}

.timeline-item.completed:not(:last-child)::before{

    background:#ff6b00;
}

/* Circle */

.circle{

    width:38px;
    height:38px;

    border-radius:50%;

    display:flex;
    justify-content:center;
    align-items:center;

    font-size:18px;

    flex-shrink:0;

    background:#f2f2f2;

    color:#888;

    z-index:2;

    margin-left:-26px;
}

.timeline-item.completed .circle{

    background:#ff6b00;
    color:#fff;
}

/* Text */

.timeline-content{

    flex:1;
}

.timeline-content h3{

    font-size:22px;
    color:#222;
    margin-bottom:6px;
    font-weight:600;
}

.timeline-content p{

    font-size:16px;
    color:#777;
    line-height:1.5;
}



/* ================= MOBILE ================= */

@media(max-width:992px){

.container{

grid-template-columns:1fr;

}

.summary-card{

position:static;

}

.footer-container{

flex-direction:column;

}

}

@media(max-width:768px){

.navbar{

flex-direction:column;

height:auto;

padding:20px;

}

.nav-links{

flex-wrap:wrap;

justify-content:center;

}

.hero{

padding:35px;

text-align:center;

display:block;

}

.hero h1{

font-size:34px;

}

}

</style>

</body>

</html>