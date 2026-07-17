<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tap.Model.Orders"%>

<%
Integer restaurantCount = (Integer)request.getAttribute("restaurantCount");
Integer customerCount = (Integer)request.getAttribute("customerCount");
Integer orderCount = (Integer)request.getAttribute("orderCount");

Double totalRevenue = (Double)request.getAttribute("totalRevenue");

Integer placedCount = (Integer)request.getAttribute("placedCount");
Integer preparingCount = (Integer)request.getAttribute("preparingCount");
Integer outForDeliveryCount = (Integer)request.getAttribute("outForDeliveryCount");
Integer deliveredCount = (Integer)request.getAttribute("deliveredCount");
Integer cancelledCount = (Integer)request.getAttribute("cancelledCount");

List<Orders> orderList =
(List<Orders>)request.getAttribute("orderList");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>FoodMingle Admin Dashboard</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{

background:#f4f6f9;

display:flex;

}

/*================ SIDEBAR =================*/

.sidebar{

width:260px;

height:100vh;

background:#1f2937;

position:fixed;

left:0;

top:0;

padding-top:20px;

color:white;

overflow:auto;

}

.logo{

text-align:center;

font-size:30px;

font-weight:bold;

margin-bottom:35px;

}



.sidebar ul{

list-style:none;

}

.sidebar ul li{

margin:8px 15px;

}

.sidebar ul li a{

display:block;

padding:15px;

border-radius:10px;

text-decoration:none;

color:white;

font-size:16px;

transition:.3s;

}

.sidebar ul li a:hover{

background:#ff6b35;

transform:translateX(6px);

}

.sidebar ul li a.active{

background:#ff6b35;

}

/*================ MAIN =================*/

.main{

margin-left:260px;

width:calc(100% - 260px);

}

/*================ HEADER =================*/

.header{

background:white;

padding:22px 35px;

display:flex;

justify-content:space-between;

align-items:center;

box-shadow:0 3px 12px rgba(0,0,0,.08);

}

.header h1{

font-size:30px;

color:#222;

}

.admin-box{

display:flex;

align-items:center;

gap:15px;

}



.admin-name{

font-weight:bold;

font-size:23px;

}

/*================ CONTENT =================*/

.content{

padding:35px;

}

.section-title{

font-size:28px;

margin-bottom:25px;

color:#333;

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

}

.logo:hover{

    transform:scale(1.05);

}


</style>

</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

<div class="logo">

<span class="flavor">Flavor</span><span class="feet">Feet</span>

</div>

<ul>

<li>
<a href="AdminDashboardServlet" class="active">
🏠 Dashboard
</a>
</li>




<li>
<a href="AdminRestaurantServlet">
🍽 Restaurants
</a>
</li>

<li>
<a href="AdminMenuServlet">
🍔 Menu
</a>
</li>

<li>
<a href="AdminCustomersServlet">
👥 Customers
</a>
</li>

<li>
<a href="AdminOrdersServlet">
📦 Orders
</a>
</li>

<li>
<a href="ReportsServlet">
📊 Reports
</a>
</li>

<li>
<a href="ProfileServlet">
👤 Profile
</a>
</li>


<li>
<a href="SettingsServlet">
⚙ Settings
</a>
</li>

<li>
<a href="LogoutServlet">
🚪 Logout
</a>
</li>

</ul>

</div>

<!-- ================= MAIN ================= -->

<div class="main">

<div class="header">

<h1>🖥️ Admin Dashboard 
</h1>

<div class="admin-box">



<div class="admin-name">

🛡️ Administrator

</div>

</div>

</div>








<style>

/* ===========================
        WELCOME CARD
=========================== */

.welcome-card{

 background:linear-gradient(135deg,
            #ff6b35 0%,
            #ff8c42 45%,
            #ffb347 100%);
                color:#fff;
    border-radius:22px;
    padding:35px 45px;

    display:flex;
    justify-content:space-between;
    align-items:center;

    overflow:hidden;
    position:relative;

    box-shadow:0 12px 30px rgba(255,107,53,.25);
    margin: 20px 25px;

}

.welcome-left{

    width:70%;
    z-index:2;

}

.welcome-badge{

    display:inline-block;

    background:rgba(255,255,255,.18);

    padding:8px 18px;

    border-radius:30px;

    margin-bottom:20px;

    font-size:15px;

}

.welcome-left h1{

    font-size:42px;
    margin-bottom:12px;

}

.welcome-left h1 span{

    color:#ffe66d;

}

.welcome-left p{

    font-size:17px;
    opacity:.95;
    width:90%;
    margin-bottom:28px;

}

.welcome-info{

    display:flex;
    gap:20px;
    flex-wrap:wrap;

}

.info-box{

    background:rgba(255,255,255,.15);

    backdrop-filter:blur(10px);

    border-radius:15px;

    padding:15px 20px;

    display:flex;
    align-items:center;

    gap:12px;

}

.info-box span{

    font-size:28px;

}

.info-box h4{

    margin:0;
    font-size:15px;

}

.info-box p{

    margin:4px 0 0;

    font-size:17px;

    white-space:nowrap;

}
.quick-buttons{

    margin-top:30px;
    display:flex;
    gap:15px;
    flex-wrap:wrap;

}

.quick-buttons a{

    text-decoration:none;

    color:#fff;

    background:rgba(255,255,255,.18);

    padding:12px 22px;

    border-radius:12px;

    transition:.3s;

    font-weight:600;

}

.quick-buttons a:hover{

    background:#fff;
    color:#ff6b35;
    transform:translateY(-3px);

}

.welcome-right{

    width:30%;
    position:relative;
    display:flex;
    justify-content:center;
    align-items:center;

}

.admin-icon{

    font-size:120px;
    z-index:2;

}

.circle{

    position:absolute;
    border-radius:50%;

}

.circle.one{

    width:220px;
    height:220px;

    background:rgba(255,255,255,.10);

}

.circle.two{

    width:150px;
    height:150px;

    background:rgba(255,255,255,.15);

}

@media(max-width:900px){

.welcome-card{

    flex-direction:column;
    text-align:center;

}

.welcome-left,
.welcome-right{

    width:100%;

}

.welcome-info{

    justify-content:center;

}

.quick-buttons{

    justify-content:center;

}

.admin-icon{

    margin-top:30px;

}

}

}
</style>
<%@page import="com.tap.Model.user"%>

<%
user admin = (user)session.getAttribute("user");
%>

<!-- =========================
      PREMIUM WELCOME CARD
========================== -->

<div class="welcome-card">

    <div class="welcome-left">

        <div class="welcome-badge">
            👋 Administrator
        </div>

        <h1>
            Welcome Back,
            <span>Admin</span>
        </h1>

        <p>
            Manage restaurants, menus, customers and orders from one place.
            Have a productive day!
        </p>

        <div class="welcome-info">

            <div class="info-box">
                <span>📅</span>
                <div>
                    <h4>Today</h4>
                    <p><%= new java.text.SimpleDateFormat("EEEE, dd MMM yyyy").format(new java.util.Date()) %></p>
                </div>
            </div>

            <div class="info-box">
                <span>🕒</span>
                <div>
                    <h4>Time</h4>
                    <p><%= new java.text.SimpleDateFormat("hh:mm a").format(new java.util.Date()) %></p>
                </div>
            </div>

            <div class="info-box">
                <span>📍</span>
                <div>
                    <h4>Location</h4>
                    <p>Hyderabad</p>
                </div>
            </div>

        </div>

        

    </div>

    <div class="welcome-right">

        <div class="circle one"></div>
        <div class="circle two"></div>

        <div class="admin-icon">    
👤  
        </div>

    </div>

</div>


 
 <style>
 .quick-actions{

    width:95%;
    margin:20px auto;

    display:flex;
    justify-content:center;
    flex-wrap:wrap;
    gap:20px;

}



.action-btn{

    background:white;
    color:#333;
    text-decoration:none;

    padding:18px 28px;

    border-radius:12px;

    font-size:17px;
    font-weight:bold;

    box-shadow:0 6px 15px rgba(0,0,0,.1);

    transition:.3s;

}

.action-btn:hover{

    transform:translateY(-5px);

    background:#ff6b35;

    color:white;

}
 </style>
 
 
 
<div class="quick-actions">


<a href="ProfileServlet" class="action-btn">
        👤 Profile
    </a>
    
    <a href="AdminRestaurantServlet" class="action-btn">
        🍽 Restaurants
    </a>

    <a href="addRestaurant.jsp" class="action-btn">
        ➕ Add Restaurant
    </a>

    <a href="addMenu.jsp" class="action-btn">
        ➕ Add Menu Item🍔
    </a>

    <a href="AdminCustomersServlet" class="action-btn">
        👥 Customers
    </a>


    

</div>

<div class="content">

<h2 class="section-title">

📊 Dashboard Overview

</h2>

<style>

/*================ DASHBOARD CARDS =================*/

.dashboard-cards{

display:grid;

grid-template-columns:repeat(4,1fr);

gap:25px;

margin-top:25px;

}

.card{

background:#fff;

padding:25px;

border-radius:18px;

box-shadow:0 8px 25px rgba(0,0,0,.08);

display:flex;

justify-content:space-between;

align-items:center;

transition:.3s;

cursor:pointer;

}

.card:hover{

transform:translateY(-8px);

box-shadow:0 15px 35px rgba(0,0,0,.15);

}

.card-left h3{

font-size:17px;

color:#777;

margin-bottom:10px;

}

.card-left h1{

font-size:34px;

color:#222;

}

.card-icon{

width:70px;

height:70px;

border-radius:50%;

display:flex;

justify-content:center;

align-items:center;

font-size:34px;

color:white;

}

.restaurant{

background:#ff6b35;

}

.customer{

background:#3498db;

}

.order{

background:#9b59b6;

}

.revenue{

background:#27ae60;

}

@media(max-width:1100px){

.dashboard-cards{

grid-template-columns:repeat(2,1fr);

}

}

@media(max-width:650px){

.dashboard-cards{

grid-template-columns:1fr;

}
	


</style>

<!-- ================= DASHBOARD CARDS ================= -->

<div class="dashboard-cards">

    <!-- Restaurants -->

    <div class="card">

        <div class="card-left">

            <h3>Total Restaurants</h3>

            <h1><%=restaurantCount%></h1>

        </div>

        <div class="card-icon restaurant">

            🍽

        </div>

    </div>

    <!-- Customers -->

    <div class="card">

        <div class="card-left">

            <h3>Total Customers</h3>

            <h1><%=customerCount%></h1>

        </div>

        <div class="card-icon customer">

            👥

        </div>

    </div>

    <!-- Orders -->

    <div class="card">

        <div class="card-left">

            <h3>Total Orders</h3>

            <h1><%=orderCount%></h1>

        </div>

        <div class="card-icon order">

            📦

        </div>

    </div>

    <!-- Revenue -->

  <div class="card">

        <div class="card-left">

            <h3>Total Revenue</h3>

            <h1>

                ₹<%=String.format("%.0f",totalRevenue)%>

            </h1>

        </div>

        <div class="card-icon revenue">

            💰

        </div>

    </div>

</div>

<style>

/*================ ORDER STATUS CARDS =================*/

.status-section{

margin-top:40px;

}

.status-heading{

font-size:28px;

font-weight:700;

color:#333;

margin-bottom:20px;

}

.status-grid{

display:grid;

grid-template-columns:repeat(5,1fr);

gap:20px;

}

.status-card{

background:#fff;

padding:22px;

border-radius:18px;

box-shadow:0 8px 25px rgba(0,0,0,.08);

text-align:center;

transition:.3s;

cursor:pointer;

}

.status-card:hover{

transform:translateY(-6px);

box-shadow:0 15px 35px rgba(0,0,0,.12);

}

.status-icon{

font-size:40px;

margin-bottom:12px;

}

.status-card h3{

font-size:18px;

margin-bottom:10px;

color:#555;

}

.status-card h1{

font-size:34px;

font-weight:bold;

}

/* Colors */

.placed{

border-top:6px solid #ff9800;

}

.placed h1{

color:#ff9800;

}

.preparing{

border-top:6px solid #03a9f4;

}

.preparing h1{

color:#03a9f4;

}

.out{

border-top:6px solid #9c27b0;

}

.out h1{

color:#9c27b0;

}

.delivered{

border-top:6px solid #4caf50;

}

.delivered h1{

color:#4caf50;

}

.cancelled{

border-top:6px solid #f44336;

}

.cancelled h1{

color:#f44336;

}

/* Responsive */

@media(max-width:1200px){

.status-grid{

grid-template-columns:repeat(3,1fr);

}

}

@media(max-width:768px){

.status-grid{

grid-template-columns:repeat(2,1fr);

}

}

@media(max-width:500px){

.status-grid{

grid-template-columns:1fr;

}

}

</style>


<!-- ================= ORDER STATUS ================= -->

<div class="status-section">

<h2 class="status-heading">

📦 Order Status

</h2>

<div class="status-grid">

    <!-- Placed -->

    <div class="status-card placed">

        <div class="status-icon">

            🟠

        </div>

        <h3>Placed</h3>

        <h1>

            <%=placedCount%>

        </h1>

    </div>

    <!-- Preparing -->

    <div class="status-card preparing">

        <div class="status-icon">

            👨‍🍳

        </div>

        <h3>Preparing</h3>

        <h1>

            <%=preparingCount%>

        </h1>

    </div>

    <!-- Out For Delivery -->

    <div class="status-card out">

        <div class="status-icon">

            🛵

        </div>

        <h3>Out For Delivery</h3>

        <h1>

            <%=outForDeliveryCount%>

        </h1>

    </div>

    <!-- Delivered -->

    <div class="status-card delivered">

        <div class="status-icon">

            ✅

        </div>

        <h3>Delivered</h3>

        <h1>

            <%=deliveredCount%>

        </h1>

    </div>

    <!-- Cancelled -->

    <div class="status-card cancelled">

        <div class="status-icon">

            ❌

        </div>

        <h3>Cancelled</h3>

        <h1>

            <%=cancelledCount%>

        </h1>

    </div>

</div>

</div>


<style>

/*================ RECENT ORDERS =================*/

.table-section{

margin-top:45px;

}

.table-heading{

font-size:28px;

font-weight:bold;

color:#333;

margin-bottom:20px;

}

.table-container{

background:#fff;

border-radius:18px;

overflow:hidden;

box-shadow:0 8px 25px rgba(0,0,0,.08);

}

table{

width:100%;

border-collapse:collapse;

}

table thead{

background:#ff6b35;

color:white;

}

table th{

padding:18px;

text-align:left;

font-size:16px;

}

table td{

padding:18px;

border-bottom:1px solid #eee;

font-size:15px;

}

table tbody tr:hover{

background:#fff5f2;

}

.status{

padding:8px 18px;

border-radius:25px;

font-weight:bold;

color:white;

display:inline-block;

}

.status-placed{

background:#ff9800;

}

.status-preparing{

background:#03a9f4;

}

.status-out{

background:#9c27b0;

}

.status-delivered{

background:#4caf50;

}

.status-cancelled{

background:#f44336;

}

@media(max-width:900px){

.table-container{

overflow-x:auto;

}

table{

min-width:900px;

}

}

</style>


<!-- ================= RECENT ORDERS ================= -->

<div class="table-section">

<h2 class="table-heading">

📋 Recent Orders

</h2>

<div class="table-container">

<table>

<thead>

<tr>

<th>Order ID</th>

<th>User ID</th>

<th>Restaurant ID</th>

<th>Payment</th>

<th>Amount</th>

<th>Status</th>

</tr>

</thead>

<tbody>

<%

if(orderList!=null){

for(Orders order:orderList){

%>

<tr>

<td>

#<%=order.getOrderId()%>

</td>

<td>

<%=order.getUserId()%>

</td>

<td>

<%=order.getRestaurantId()%>

</td>

<td>

<%=order.getPaymentMode()%>

</td>

<td>

₹<%=order.getAmount()%>

</td>

<td>

<%

String status = order.getStatus();

if(status.equalsIgnoreCase("Placed")){

%>

<span class="status status-placed">

Placed

</span>

<%

}else if(status.equalsIgnoreCase("Preparing")){

%>

<span class="status status-preparing">

Preparing

</span>

<%

}else if(status.equalsIgnoreCase("Out For Delivery")){

%>

<span class="status status-out">

Out For Delivery

</span>

<%

}else if(status.equalsIgnoreCase("Delivered")){

%>

<span class="status status-delivered">

Delivered

</span>

<%

}else{

%>

<span class="status status-cancelled">

Cancelled

</span>

<%

}

%>

</td>

</tr>

<%

}

}

%>

</tbody>

</table>

</div>

</div>

</div>

</div>

</body>

</html>