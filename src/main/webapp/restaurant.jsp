<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, com.tap.Model.Restaurant"%>
    
    <%@ page import="com.tap.DAOImpl.FavoriteDAOImp" %>
<%@ page import="com.tap.Model.user" %>
   <!DOCTYPE html>
<html>
<head>  
     
<link rel="stylesheet" href="darkmode.css">
<link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" href="home.css">

    <style>
        
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#f8f8f8;
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



.logo:hover{

    transform:scale(1.05);

}

.logo:hover .flavor{

    color:#ffb347;

}

.logo:hover .feet{

    color:#ff6b35;

}
    .hero{
    position:relative;
    height:60vh;
    overflow:hidden;
}

.bg-video{
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    object-fit:cover;
}

.overlay{
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.45);

    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;

    color:white;
    text-align:center;
}
    .hero{
    height:100vh;
    background:url("images/banner.jpg");
    background-size:cover;
    background-position:center;
    animation:zoom 15s infinite alternate;
}

@keyframes zoom{
    from{
        background-size:100%;
    }
    to{
        background-size:120%;
    }
}
    .slide{
    height:100vh;
    animation:changeBg 15s infinite;
}

@keyframes changeBg{

0%,30%{
background:url("images/pizza.jpg");
background-size:cover;
}

35%,65%{
background:url("images/burger.jpg");
background-size:cover;
}

70%,100%{
background:url("images/biryani.jpg");
background-size:cover;
}
}
  .stats-section{
    background:#f7f7f7;
    padding:80px 20px 120px;
    text-align:center;
    position:relative;
}

.stats-content h1{
    font-size:60px;
    color:#ff4d5a;
    margin-bottom:20px;
}

.stats-content p{
    font-size:24px;
    color:#666;
    line-height:1.6;
}

.stats-box{
    width:70%;
    margin:60px auto 0;

    background:white;
    border-radius:25px;

    display:flex;
    justify-content:space-around;

    padding:30px;

    box-shadow:0 5px 20px rgba(0,0,0,0.1);
}

.stat h2{
    font-size:42px;
    color:#334155;
}

.stat p{
    font-size:20px;
    color:#666;
}

.food-images .burger{
    position:absolute;
    left:120px;
    top:150px;
    width:220px;
}

.food-images .pizza{
    position:absolute;
    right:120px;
    top:180px;
    width:220px;
}  
    

/* Navbar */
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




/* Search */

.search-section{
    padding:30px;
    text-align:center;
}

.search-box{
    width:60%;
    padding:15px;
    border:none;
    border-radius:30px;
    font-size:16px;
    box-shadow:0 2px 10px rgba(0,0,0,0.2);
}

/* Heading */

.heading{
    text-align:center;
    margin-bottom:25px;
    color:#333;
}

/* Restaurant Cards */

.restaurant-container{
    display:grid;
    text-decoration: none;
    color: inherit;
    gap:30px;
    
     max-width: 1400px;   /* Adjust as needed */
    margin: 0 auto;      /* Centers the section */
    padding: 0 40px;     /* Same left/right space as Popular Cuisines */
    box-sizing: border-box;
        grid-template-columns:repeat(4, 1fr);
    
    
    
     text-decoration: none !important;
    color: inherit !important;
}



.restaurant-container > a:hover,
.restaurant-container > a:visited,
.restaurant-container > a:active,
.restaurant-container > a:link{
    text-decoration: none !important;
    color: inherit !important;
}
.card{
    background:white;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 4px 15px rgba(0,0,0,0.15);
    transition:0.3s;
        text-decoration: none;
    color: inherit;
        position:relative;
    
    
    
}

.card:hover{
    transform:translateY(-8px);
        text-decoration: none;
    color: inherit;
    
}

.card img{
    width:100%;
    height:180px;
    object-fit:cover;
    text-decoration: none;
    color: inherit;
}

.card-content{
    padding:15px;
    text-decoration: none;
    color: inherit;
}

.card-content h3{
    margin-bottom:10px;
    text-decoration: none;
    color: inherit;
}

.rating{
    color:green;
    font-weight:bold;
    text-decoration: none;
    color: inherit;
}

.location{
    color:gray;
    margin-top:8px;
    text-decoration: none;
    color: inherit;
}

.details{
    display:flex;
    justify-content:space-between;
    margin-top:10px;
    font-size:14px;
    text-decoration: none;
    color: inherit;
}

.offer{
    background:#28a745;
    color:white;
    padding:6px 10px;
    border-radius:5px;
    display:inline-block;
    margin-top:10px;
    font-size:13px;
}


/* Search Section */
.search-section{
    display:flex;
    justify-content:center;
    margin:40px 0;
    padding-top:15px;
    padding-bottom:15px;
}

.search-form{
    width:100%;
    max-width:850px;          /* Smaller width */
}

/* Main Search Bar */
.search-bar{
    display:flex;
    align-items:center;

    background:#fff;

    height:72px;              /* Taller */
    border-radius:40px;

    border:2px solid #ffe2cc;

    padding:0 10px 0 22px;

    box-shadow:0 12px 30px rgba(255,102,0,.12);

    transition:.3s;
}

.search-bar:hover{
    transform:translateY(-2px);
    box-shadow:0 18px 35px rgba(255,102,0,.18);
}

.search-bar:focus-within{
    border-color:#ff6b00;
    box-shadow:0 0 0 4px rgba(255,107,0,.12);
}

.search-icon{
    font-size:24px;
    margin-right:14px;
}

.search-bar input{
    flex:1;
    border:none;
    outline:none;
    font-size:18px;
    background:transparent;
}

.search-bar input::placeholder{
    color:#8a8a8a;
}

/* Search Button */
.search-btn{

    height:56px;
    min-width:150px;

    border:none;
    border-radius:30px;

    background:linear-gradient(135deg,#ff8a00,#ff5a00);

    color:#fff;

    font-size:17px;
    font-weight:700;

    cursor:pointer;

    transition:.3s;
}

.search-btn:hover{
    transform:scale(1.03);
    background:linear-gradient(135deg,#ff6b00,#ff3d00);
}













.page-layout{
    max-width:1400px;
    margin:30px auto;
    display:flex;
    gap:30px;
    align-items:flex-start;
}

.sidebar{
    width:260px;
    position:sticky;
    top:90px;
}

.content{
    flex:1;
}

.sidebar-card{
    background:#fff;
    border-radius:15px;
    padding:20px;
    margin-bottom:20px;
    box-shadow:0 5px 15px rgba(0,0,0,.08);
}

.sidebar-card h3{
    color:#ff6600;
    margin-bottom:15px;
}

.sidebar-card p{
    margin:10px 0;
    color:#555;
}

.sidebar-card h2{
    color:#ff6600;
    margin-top:8px;
}










.view-menu-btn{
    display:block;
    width:100%;
    margin-top:15px;
    padding:12px;
    background:#ff6b00;
    color:#fff;
    text-align:center;
    text-decoration:none;
    border-radius:8px;
    font-weight:600;
    transition:.3s;
}

.view-menu-btn:hover{
    background:#e65c00;
}

.image-box{
    position: relative;
}

.image-box img{
    width:100%;
    height:190px;
    object-fit:cover;
    border-radius:18px 18px 0 0;
}

/* Rating Badge */
.rating-badge{
    position:absolute;
    bottom:1px;
    left:3px;

    background:#198754;
    color:#fff;

    padding:5px 7px;
    border-radius:20px;

    font-size:14px;
    font-weight:600;

    box-shadow:0 3px 10px rgba(0,0,0,0.25);
}

/* Give space after image */
.card-content{
    padding:15px;
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







.card{
    position:relative;
}

.favorite-btn{

    position:absolute;

    top:15px;
    right:15px;

    width:42px;
    height:42px;

    display:flex;
    justify-content:center;
    align-items:center;

    background:white;

    border-radius:50%;

    text-decoration:none;

    font-size:22px;

    box-shadow:0 4px 12px rgba(0,0,0,.25);

    transition:.3s;

    z-index:100;
}

.favorite-btn:hover{

    transform:scale(1.15);
}
</style>

</head>
<body>
      <jsp:include page="navbar.jsp" />


      

<!-- Search -->




<div class="search-section">
    <form action="SearchServlet" method="get" class="search-form">

        <div class="search-bar">

            <span class="search-icon">🔍</span>

            <input type="text"
                   name="query"
                   placeholder="Search restaurants, cuisines or dishes..."
                   required>

            <button type="submit" class="search-btn">
                Search
            </button>

        </div>

    </form>
</div>







<h1 class="heading">Popular Restaurants Near You</h1>

<!-- Restaurant Cards -->


    
    <div class="restaurant-container">

<%
List<Restaurant> allRestaurants =
    (List<Restaurant>) request.getAttribute("allRestaurants");



if (allRestaurants != null && !allRestaurants.isEmpty()) {
	
	

    for (Restaurant restaurant : allRestaurants) {
%>

<%
	FavoriteDAOImp favoriteDAO = new FavoriteDAOImp();
	user currentUser = (user) session.getAttribute("user");
	%>
<div class="card">

    <!-- Favorite Button -->
    <%
boolean isFavorite = false;

if(currentUser != null){
    isFavorite = favoriteDAO.isFavoriteRestaurant(
            currentUser.getUserId(),
            restaurant.getRestaurantId());
}
%>

<form action="FavoriteServlet" method="post" style="display:inline;">

    <input type="hidden" name="type" value="restaurant">

    <input type="hidden"
           name="action"
           value="<%= isFavorite ? "remove" : "add" %>">

    <input type="hidden"
           name="restaurantId"
           value="<%=restaurant.getRestaurantId()%>">

    <button type="submit" class="favorite-btn">
        <%= isFavorite ? "❤️" : "🤍" %>
    </button>

</form>

    <div class="image-box">

        <img src="<%=restaurant.getImagePath()%>" alt="Restaurant">

        <div class="rating-badge">
            <%=restaurant.getRating()%> ⭐
        </div>

    </div>

    <div class="card-content">

        <h3><%=restaurant.getRestaurantName()%></h3>

        <p>🕒 <%=restaurant.getOpeningTime()%></p>

        <p>📍 <%=restaurant.getAddress()%></p>

        <a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>"
           class="view-menu-btn">
            View Menu
        </a>

    </div>

</div>

<%
}
} else {
%>

<h2 style="text-align:center; margin:50px;">
    No Restaurants Found
</h2>

<%
}
%>
</div>


<script src="theme.js"></script>
</body>
</html>
