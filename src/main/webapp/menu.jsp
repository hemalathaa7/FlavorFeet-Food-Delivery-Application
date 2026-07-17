<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ page import="com.tap.DAOImpl.FavoriteDAOImp" %>
<%@ page import="com.tap.Model.user" %>
<%@  

page import="java.util.List, com.tap.Model.Menu"

 %>
 
 <link rel="stylesheet" href="darkmode.css">
<link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" href="home.css">
 
 
 <link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
 
 
 
 <style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#f5f5f5;
}

/* Header */
.header{
    background:#fc8019;
    color:white;
    padding:20px;
    text-align:center;
    font-size:28px;
    font-weight:bold;
    box-shadow:0 2px 10px rgba(0,0,0,0.2);
}

.restaurant-info{
    background:white;
    margin:20px;
    padding:20px;
    border-radius:12px;
    box-shadow:0 2px 8px rgba(0,0,0,0.1);
}

.restaurant-info h2{
    margin-bottom:10px;
}

.restaurant-info p{
    color:gray;
}

/* Menu Grid */
.menu-container{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:20px;
    padding:20px;
}








.menu-header{
    text-align:center;
    margin:40px 0 50px;
}

.menu-header h1{
    font-size:50px;
    font-weight:800;

     background: linear-gradient(
        90deg,
        #ff5200,
        #ff7b00,
        #ffb700
        );

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;

    margin-bottom:10px;
}

.menu-header p{
    font-size:18px;
    color:#666;
        font-weight:900;
    
}

/* Card */
.menu-card{
    position:relative;
    background:white;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
    transition:0.3s;
}

.menu-card:hover{
    transform:translateY(-5px);
}

.menu-card img{
    width:100%;
    height:180px;
    object-fit:cover;
}

.card-content{
    padding:15px;
}

.menu-name{
    font-size:20px;
    font-weight:bold;
    margin-bottom:8px;
}

.description{
    color:#666;
    font-size:14px;
    margin-bottom:10px;
    line-height:1.4;
}

.rating{
    color:green;
    font-weight:bold;
    margin-bottom:8px;
}

.price{
    font-size:18px;
    font-weight:bold;
    color:#fc8019;
    margin-bottom:12px;
}

.add-btn{
    width:100%;
    padding:10px;
    border:none;
    background:#fc8019;
    color:white;
    font-size:16px;
    border-radius:8px;
    cursor:pointer;
}

.add-btn:hover{
    background:#e66a00;
}




.favorite-btn{
    position:absolute;
    top:12px;
    right:12px;
    width:42px;
    height:42px;
    border-radius:50%;
    background:#fff;
    border:none;
    display:flex;
    align-items:center;
    justify-content:center;
    cursor:pointer;
    box-shadow:0 2px 8px rgba(0,0,0,.2);
    z-index:100;
}

.favorite-btn .fa-solid{
    color:#ff3b30;
    font-size:22px;
}

.favorite-btn .fa-regular{
    color:#d0d0d0;
    font-size:22px;
}

.favorite-btn:hover{
    transform:scale(1.1);
}




.back-container{
    width:100%;
    padding:20px 40px 0;
    margin:0;
}

.back-btn{
    display:inline-flex;
    align-items:center;
    gap:8px;
    padding:10px 18px;
    background:#ff6b00;
    color:#fff;
    text-decoration:none;
    border-radius:8px;
    font-weight:600;
    transition:.3s;
}

.back-btn:hover{
    background:#e65c00;
    transform:translateX(-3px);
}

</style>
 
 
 <div class="back-container">
    <a href="callRestaurantServlet" class="back-btn">
        <i class="fas fa-arrow-left"></i> Back to Restaurants
    </a>
</div>


<div class="menu-header">
<h1>Our Special Menu</h1>
    <p>Explore our delicious menu</p>
</div>
	 
 
<div class="menu-container">


<% 
List<Menu> allMenusByRestaurant=(List<Menu>)request.getAttribute("allMenusByRestaurant");



for (Menu menu : allMenusByRestaurant) 
{
	 %>
	 
	  <%
FavoriteDAOImp favoriteDAO = new FavoriteDAOImp();
user currentUser = (user) session.getAttribute("user");
%>
	
	
	  <div class="menu-card">
	  <%
boolean isFavorite = false;

if (currentUser != null) {
    isFavorite = favoriteDAO.isFavoriteMenu(
            currentUser.getUserId(),
            menu.getMenuId());
}
%>
	  
	 <form action="FavoriteServlet" method="post">

    <input type="hidden" name="type" value="menu">

    <input type="hidden"
           name="action"
           value="<%= isFavorite ? "remove" : "add" %>">

    <input type="hidden"
           name="menuId"
           value="<%=menu.getMenuId()%>">

    <input type="hidden"
       name="restaurantId"
       value="<%=menu.getRestaurantId()%>">

    <button type="submit" class="favorite-btn">

    <% if(isFavorite){ %>

        <i class="fa-solid fa-heart"></i>

    <% }else{ %>

        <i class="fa-regular fa-heart"></i>

    <% } %>

</button>

</form>
   <img src="<%= menu.getImagePath() %>" alt="Menu Item">


    <div class="card-content">
        <div class="menu-name"><%= menu.getItemName() %></div>

        <div class="description">
            <%= menu.getDescription() %>
        </div>

        <div class="rating">⭐ 4.5</div>

        <div class="price">
            <h4>₹<%= String.format("%.2f", menu.getPrice()) %></h4>
        </div>




<form action="cart" method="post">
<input type="hidden" name="menuId" value ="<%= menu.getMenuId() %>">
<input type="hidden" name="restaurantId" value ="<%= menu.getRestaurantId() %>">
<input type="hidden" name="quantity" value ="1">
<input type="hidden" name="action" value ="add">

        <button class="add-btn">🛒 Add Cart</button>

</form>


    </div>
</div>

<% 

}

%>

<script src="theme.js"></script>
