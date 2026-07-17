<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.tap.Model.Menu"%>
<%@page import="com.tap.DAOImpl.RestaurantDAOImp"%>



 
      <jsp:include page="navbar.jsp" />
     
     
<%
List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
RestaurantDAOImp restaurantDAO = new RestaurantDAOImp();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FlavorFeet - Search Results</title>

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
background:#f8f9fb;
}

/* ================= NAVBAR ================= */

.navbar{
display:flex;
justify-content:space-between;
align-items:center;
padding:20px 60px;
background:white;
box-shadow:0 3px 12px rgba(0,0,0,.08);
}

.logo{
font-size:45px;
font-weight:bold;
background:linear-gradient(to right,#ff7b00,#d50032);
-webkit-background-clip:text;
-webkit-text-fill-color:transparent;
}

.nav-links{
display:flex;
gap:35px;
align-items:center;
}

.nav-links a{
text-decoration:none;
font-size:22px;
font-weight:600;
color:#222;
}

.login-btn,
.signup-btn{

padding:10px 28px;
border-radius:30px;
border:2px solid #ff6b00;
color:#ff6b00;
text-decoration:none;
font-weight:600;
}

.search-title{

margin:35px 0;
text-align:center;
font-size:42px;
font-weight:700;
color:#333;
}

.menu-container{

width:94%;
margin:auto;

display:grid;

grid-template-columns:repeat(4,1fr);

gap:30px;

padding-bottom:50px;

}

.menu-card{

background:white;
border-radius:18px;
overflow:hidden;

box-shadow:0 8px 18px rgba(0,0,0,.08);

transition:.3s;
}

.menu-card:hover{

transform:translateY(-8px);

}

.menu-card img{

width:100%;
height:230px;
object-fit:cover;

}

.card-body{

padding:18px;

}

.restaurant{

color:#ff6b00;
font-weight:600;
font-size:15px;
margin-bottom:8px;

}

.item{

font-size:23px;
font-weight:700;
color:#222;

}

.price{

font-size:20px;
font-weight:700;
color:#27ae60;

margin:12px 0;

}

.add-btn{

display:block;

width:100%;

padding:13px;

background:#ff6b00;

color:white;

text-align:center;

border-radius:12px;

text-decoration:none;

font-size:18px;

font-weight:600;

}

.add-btn:hover{

background:#e85f00;

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

.logo:hover .flavor{

    color:#ffb347;

}

.logo:hover .feet{

    color:#ff6b35;

}
</style>

</head>

<body>



<h1 class="search-title">

Search Results

</h1>

<div class="menu-container">
<%
if(menuList!=null && !menuList.isEmpty()){

for(Menu menu : menuList){

String restaurantName=
restaurantDAO.getRestaurantNameById(menu.getRestaurantId());
%>

<div class="menu-card">

<img src="<%=menu.getImagePath()%>">

<div class="card-body">

<div class="restaurant">

🍽 <%=restaurantName%>

</div>

<div class="item">

<%=menu.getItemName()%>

</div>

<div class="price">

₹ <%=menu.getPrice()%>

</div>

<a href="cart?menuId=<%=menu.getMenuId()%>"
class="add-btn">

Add To Cart

</a>

</div>

</div>

<%
}
}
else{
%>

<h2 style="text-align:center;grid-column:1/-1;">

No Menu Items Found

</h2>

<%
}
%>

</div>

</body>

</html>