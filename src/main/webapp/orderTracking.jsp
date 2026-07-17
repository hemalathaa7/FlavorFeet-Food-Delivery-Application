<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Integer orderId=(Integer)session.getAttribute("orderId");
Double amount=(Double)session.getAttribute("totalAmount");

if(orderId==null)
orderId=1001;

if(amount==null)
amount=445.0;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Track Order | FlavorFeet</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Poppins,sans-serif;
}

body{

background:#f4f4f4;

}

.container{

width:900px;
margin:40px auto;
background:#fff;
border-radius:20px;
padding:35px;
box-shadow:0 10px 30px rgba(0,0,0,.15);

}

.header{

display:flex;
justify-content:space-between;
align-items:center;

}

.header h1{

color:#27ae60;

}

.order{

margin-top:25px;

display:flex;
justify-content:space-between;

}

.box{

background:#fafafa;
padding:20px;
border-radius:12px;
width:48%;

}

.box h3{

margin-bottom:15px;
color:#fc8019;

}

.timeline{

margin-top:40px;
position:relative;

}

.timeline::before{

content:"";
position:absolute;
left:22px;
top:0;
width:4px;
height:100%;
background:#ddd;

}

.step{

display:flex;
align-items:center;
margin-bottom:40px;
position:relative;

}

.circle{

width:45px;
height:45px;
border-radius:50%;
background:#27ae60;
color:#fff;
display:flex;
justify-content:center;
align-items:center;
font-size:22px;
font-weight:bold;
z-index:2;

}

.text{

margin-left:20px;

}

.text h3{

margin-bottom:5px;

}

.pending .circle{

background:#bbb;

}

.delivery{

margin-top:40px;

display:flex;
justify-content:space-between;
align-items:center;

background:#fff7ec;

padding:20px;

border-radius:15px;

}

.driver{

display:flex;
align-items:center;

}

.avatar{

width:70px;
height:70px;
border-radius:50%;
background:#fc8019;
color:white;
display:flex;
justify-content:center;
align-items:center;
font-size:32px;
margin-right:20px;

}

.buttons{

margin-top:40px;

display:flex;
justify-content:center;
gap:20px;

}

.buttons button{

padding:15px 35px;
border:none;
border-radius:8px;
cursor:pointer;
font-size:17px;
font-weight:600;
transition:.3s;

}

.track{

background:#fc8019;
color:white;

}

.track:hover{

background:#ff6600;

}

.invoice{

background:#27ae60;
color:white;

}

.invoice:hover{

background:#1e8449;

}

</style>

</head>

<body>

<div class="container">

<div class="header">

<h1>🍔 FlavorFeet</h1>

<h2 style="color:#27ae60;">Order Confirmed</h2>

</div>

<div class="order">

<div class="box">

<h3>Order Details</h3>

<p><b>Order ID :</b> #<%=orderId%></p>

<p><b>Total Paid :</b> ₹<%=amount%></p>

<p><b>Payment :</b> UPI</p>

<p><b>Status :</b> Confirmed</p>

</div>

<div class="box">

<h3>Estimated Delivery</h3>

<h2 style="color:#fc8019;">30 Minutes</h2>

<p>Your delicious food is on the way 🚴</p>

</div>

</div>

<div class="timeline">

<div class="step">

<div class="circle">✓</div>

<div class="text">

<h3>Order Confirmed</h3>

<p>Your payment has been received.</p>

</div>

</div>

<div class="step">

<div class="circle">✓</div>

<div class="text">

<h3>Restaurant Accepted</h3>

<p>Restaurant accepted your order.</p>

</div>

</div>

<div class="step pending">

<div class="circle">3</div>

<div class="text">

<h3>Preparing Food</h3>

<p>Your order is being prepared.</p>

</div>

</div>

<div class="step pending">

<div class="circle">4</div>

<div class="text">

<h3>Out For Delivery</h3>

<p>Delivery partner will pick your order.</p>

</div>

</div>

<div class="step pending">

<div class="circle">5</div>

<div class="text">

<h3>Delivered</h3>

<p>Enjoy your meal ❤️</p>

</div>

</div>

</div>

<div class="delivery">

<div class="driver">

<div class="avatar">

👨

</div>

<div>

<h3>Rahul Kumar</h3>

<p>★★★★★ 4.9</p>

<p>Bike : AP39 AB 1234</p>

</div>

</div>

<div>

<h2>ETA</h2>

<h1 style="color:#fc8019;">30 Min</h1>

</div>

</div>

<div class="buttons">

<button class="track">

📍 Track Delivery

</button>

<button class="invoice"

onclick="window.location='invoice.jsp'">

🧾 Download Invoice

</button>

</div>

</div>

</body>

</html>