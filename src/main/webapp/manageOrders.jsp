<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tap.Model.Orders"%>
<%@page import="com.tap.DAOImpl.RestaurantDAOImp"%>
<%@page import="com.tap.DAOImpl.UserDAOImpl"%>

<%

List<Orders> orderList =
(List<Orders>)request.getAttribute("orderList");

RestaurantDAOImp restaurantDAO = new RestaurantDAOImp();
UserDAOImpl userDAO = new UserDAOImpl();

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Orders | FoodMingle Admin</title>

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

/*================ HEADER ================*/

.header{

background:white;

padding:20px 40px;

display:flex;

justify-content:space-between;

align-items:center;

box-shadow:0 3px 10px rgba(0,0,0,.08);

}

.logo{

font-size:30px;

font-weight:bold;

}

.food{

color:#ff6b35;

}

.mingle{

color:#c0392b;

}

.back-btn{

background:#ff6b35;

color:white;

padding:12px 22px;

text-decoration:none;

border-radius:8px;

font-weight:bold;

transition:.3s;

}

.back-btn:hover{

background:#e85b2b;

}

/*================ PAGE TITLE ================*/

.page-title{

text-align:center;

padding:35px;

}

.page-title h1{

font-size:40px;

color:#333;

margin-bottom:10px;

}

.page-title p{

font-size:18px;

color:#777;

}

/*================ CONTAINER ================*/

.container{

width:95%;

max-width:1400px;

margin:auto;

}

/*================ TABLE =================*/

.table-container{

background:#fff;

border-radius:18px;

overflow:hidden;

box-shadow:0 8px 25px rgba(0,0,0,.08);

margin-top:30px;

}

table{

width:100%;

border-collapse:collapse;

}

thead{

background:#ff6b35;

color:white;

}

thead th{

padding:18px;

font-size:16px;

text-align:left;

}

tbody td{

padding:18px;

border-bottom:1px solid #eee;

font-size:15px;

vertical-align:middle;

}

tbody tr:hover{

background:#fff7f2;

}

/*================ STATUS =================*/

.status{

padding:8px 18px;

border-radius:25px;

font-size:14px;

font-weight:bold;

color:white;

display:inline-block;

}

.placed{

background:#ff9800;

}

.preparing{

background:#03a9f4;

}

.out{

background:#9c27b0;

}

.delivered{

background:#4caf50;

}

.cancelled{

background:#f44336;

}

/*================ DROPDOWN =================*/

select{

padding:8px 12px;

border-radius:8px;

border:1px solid #ddd;

outline:none;

cursor:pointer;

font-size:14px;

}

.update-btn{

padding:9px 16px;

background:#ff6b35;

color:white;

border:none;

border-radius:8px;

cursor:pointer;

font-weight:bold;

transition:.3s;

}

.update-btn:hover{

background:#e85b2b;

}

@media(max-width:1100px){

.table-container{

overflow-x:auto;

}

table{

min-width:1300px;

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

}

.logo:hover{

    transform:scale(1.05);

}



</style>

</head>

<body>

<!-- ================= HEADER ================= -->

<div class="header">

<div class="logo">

<span class="flavor">Flavor</span><span class="feet">Feet</span>

</div>

<a href="AdminDashboardServlet" class="back-btn">

🏠 Dashboard

</a>

</div>

<!-- ================= TITLE ================= -->

<div class="page-title">

<h1>

📦 Manage Orders

</h1>

<p>

Manage customer orders and update delivery status

</p>

</div>

<div class="container">

<div class="table-container">

<table>

<thead>

<tr>

<th>Order ID</th>

<th>Customer</th>

<th>Restaurant</th>

<th>Payment</th>

<th>Amount</th>

<th>Address</th>

<th>Status</th>

<th>Update</th>

</tr>

</thead>

<tbody>

<%

if(orderList!=null){

for(Orders order:orderList){

String restaurantName =
restaurantDAO.getRestaurantNameById(order.getRestaurantId());

String customerName =
userDAO.getUser(order.getUserId()).getUserName();

%>

<tr>

<td>

<%=order.getOrderId()%>

</td>

<td>

<%=customerName%>

</td>

<td>

<%=restaurantName%>

</td>

<td>

<%=order.getPaymentMode()%>

</td>

<td>

₹<%=order.getAmount()%>

</td>

<td>

<%=order.getDeliveryAddress()%>

</td>

<td>

<%

String status = order.getStatus();

if(status.equalsIgnoreCase("Placed")){

%>

<span class="status placed">

Placed

</span>

<%

}
else if(status.equalsIgnoreCase("Preparing")){

%>

<span class="status preparing">

Preparing

</span>

<%

}
else if(status.equalsIgnoreCase("Out For Delivery")){

%>

<span class="status out">

Out For Delivery

</span>

<%

}
else if(status.equalsIgnoreCase("Delivered")){

%>

<span class="status delivered">

Delivered

</span>

<%

}
else{

%>

<span class="status cancelled">

Cancelled

</span>

<%

}

%>

</td>

<td>

<form action="UpdateOrderStatusServlet" method="post">

<input
type="hidden"
name="orderId"
value="<%=order.getOrderId()%>">

<select name="status">

<option value="Placed"
<%=status.equals("Placed")?"selected":""%>>

Placed

</option>

<option value="Preparing"
<%=status.equals("Preparing")?"selected":""%>>

Preparing

</option>

<option value="Out For Delivery"
<%=status.equals("Out For Delivery")?"selected":""%>>

Out For Delivery

</option>

<option value="Delivered"
<%=status.equals("Delivered")?"selected":""%>>

Delivered

</option>

<option value="Cancelled"
<%=status.equals("Cancelled")?"selected":""%>>

Cancelled

</option>

</select>

<br><br>

<button
type="submit"
class="update-btn">

Update

</button>

</form>

</td>

</tr>

<%

}

}

else{

%>

<tr>

<td colspan="8"
style="text-align:center;
padding:40px;
font-size:20px;
color:#888;">

No Orders Found

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

</div>

</body>

</html>