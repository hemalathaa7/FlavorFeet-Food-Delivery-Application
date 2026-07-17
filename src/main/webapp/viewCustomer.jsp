<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.Model.user"%>

<%
user customer=(user)request.getAttribute("customer");

if(customer==null){

response.sendRedirect("AdminCustomersServlet");
return;

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>View Customer | FlavorFeet Admin</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

/*==========================================
GLOBAL
==========================================*/

*{

margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;

}

body{

background:linear-gradient(135deg,#fff8f3,#f5f7fb);
padding:20px;

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

/*==========================================
CONTAINER
==========================================*/

.container{

width:90%;
max-width:1200px;
margin:auto;

}



/*==========================================
TOP CARD
==========================================*/

.top-card{

background:linear-gradient(135deg,#ff7b00,#ff4b2b);
border-radius:18px;
padding:22px;
display:flex;
align-items:center;
gap:20px;
color:#fff;
box-shadow:0 10px 25px rgba(255,107,53,.18);

}

.avatar{

width:80px;
height:80px;
font-size:34px;
border-radius:50%;
background:#fff;
color:#ff6b35;
display:flex;
justify-content:center;
align-items:center;

}

.customer-details{

flex:1;

}

.customer-details h1{

font-size:28px;
margin-bottom:4px;

}

.customer-details p{

font-size:14px;
opacity:.95;

}



/*==========================================
INFO CARD
==========================================*/

.info-card{

background:#fff;

margin-top:18px;
padding:20px;
border-radius:20px;
box-shadow:0 10px 25px rgba(0,0,0,.08);

}

.info-card h2{

margin-bottom:25px;
color:#222;
font-size:28px;

}



/*==========================================
GRID
==========================================*/

.info-grid{

display:grid;
grid-template-columns:repeat(2,1fr);
gap:20px;

}



/*==========================================
INFO BOX
==========================================*/

.info-box{

background:#fafafa;
padding:14px 16px;
border-radius:15px;
border:1px solid #eee;
transition:.35s;

}

.info-box:hover{

background:#fff8f3;
border-color:#ff6b35;
transform:translateY(-4px);

}

.info-box label{

display:block;
font-size:11px;
color:#888;
margin-bottom:8px;
text-transform:uppercase;
letter-spacing:.5px;

}

.info-box span{

font-size:15px;
font-weight:600;
color:#222;

}



/*==========================================
STATISTICS
==========================================*/

.stats{

display:grid;
grid-template-columns:repeat(3,1fr);
gap:20px;
margin-top:30px;

}

.stat-card{

background:#fff;
border-radius:18px;
padding:16px;
stext-align:center;
box-shadow:0 8px 20px rgba(0,0,0,.08);
transition:.35s;

}

.stat-card:hover{

transform:translateY(-5px);

}

.stat-card i{

color:#ff6b35;
font-size:24px;

margin-bottom:8px;
}

.stat-card h3{

font-size:22px;
color:#222;
margin-bottom:5px;

}

.stat-card p{

color:#666;

}



/*==========================================
BUTTONS
==========================================*/

.buttons{

display:flex;
justify-content:flex-end;
gap:15px;
margin-top:18px;

}

.buttons a{

text-decoration:none;
padding:12px 24px;
border-radius:10px;
font-weight:600;
transition:.3s;

}

.back-btn{

background:#ecf0f1;
color:#333;

}

.back-btn:hover{

background:#d5dbdb;

}

.edit-btn{

background:linear-gradient(135deg,#ff7b00,#ff4b2b);
color:#fff;

}

.edit-btn:hover{

transform:translateY(-2px);
box-shadow:0 10px 20px rgba(255,107,53,.25);

}



/*==========================================
RESPONSIVE
==========================================*/

@media(max-width:900px){

.top-card{

flex-direction:column;
text-align:center;

}

.info-grid{

grid-template-columns:1fr;

}

.stats{

grid-template-columns:1fr;

}

.buttons{

justify-content:center;
flex-wrap:wrap;

}

}

</style>

</head>

<body>



<div class="container">




<!-- HEADER -->

<div class="top-card">

<div class="avatar">

<i class="fa-solid fa-user"></i>

</div>

<div class="customer-details">

<h1><%=customer.getUserName()%></h1>

<p>

Premium FlavorFeet Customer

</p>

</div>

</div>




<!-- INFORMATION -->

<div class="info-card">

<h2>

<i class="fa-solid fa-circle-info"></i>

Customer Information

</h2>



<div class="info-grid">



<div class="info-box">

<label>Customer ID</label>

<span>#<%=customer.getUserId()%></span>

</div>



<div class="info-box">

<label>Username</label>

<span><%=customer.getUserName()%></span>

</div>



<div class="info-box">

<label>Email</label>

<span><%=customer.getEmail()%></span>

</div>







<div class="info-box">

<label>Role</label>

<span><%=customer.getRole()%></span>

</div>



<div class="info-box">

<label>Address</label>

<span><%=customer.getAdress()%></span>

</div>



<div class="info-box">

<label>Registered On</label>

<span><%=customer.getCreateDate()%></span>

</div>



<div class="info-box">

<label>Last Login</label>

<span><%=customer.getLastLoginDate()%></span>

</div>



</div>

</div>





<!-- QUICK STATS -->

<div class="stats">

<div class="stat-card">

<i class="fa-solid fa-bag-shopping"></i>

<h3>12</h3>

<p>Total Orders</p>

</div>



<div class="stat-card">

<i class="fa-solid fa-heart"></i>

<h3>6</h3>

<p>Wishlist</p>

</div>



<div class="stat-card">

<i class="fa-solid fa-indian-rupee-sign"></i>

<h3>₹4,850</h3>

<p>Total Spent</p>

</div>

</div>





<!-- ACTIONS -->

<div class="buttons">

<a href="AdminCustomersServlet"

class="back-btn">

<i class="fa-solid fa-arrow-left"></i>

Back

</a>



<a href="EditCustomerServlet?userId=<%=customer.getUserId()%>"

class="edit-btn">

<i class="fa-solid fa-pen"></i>

Edit Customer

</a>

</div>



</div>



</body>

</html>