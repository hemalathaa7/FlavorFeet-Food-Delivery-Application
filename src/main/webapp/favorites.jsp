<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.Model.Restaurant"%>
<%@ page import="com.tap.Model.Menu"%>



<%
List<Restaurant> favoriteRestaurants =
(List<Restaurant>)request.getAttribute("favoriteRestaurants");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="darkmode.css">
<link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" href="home.css">



<style>

body{

    background:#f8f9fa;

    font-family:Poppins,sans-serif;
}

.favorites-container{

    width:90%;

    margin:auto;

    padding:40px 0;
}

.favorites-container h2{

    color:#ff6b35;

    margin-bottom:30px;
}

.favorite-card{

    display:flex;

    align-items:center;

    background:white;

    border-radius:18px;

    padding:18px;

    margin-bottom:20px;

    box-shadow:0 5px 20px rgba(0,0,0,.08);
}

.favorite-card img{

    width:170px;

    height:130px;

    object-fit:cover;

    border-radius:12px;
}

.details{

    flex:1;

    margin-left:25px;
}

.details h3{

    margin-bottom:10px;
}

.details p{

    margin:8px 0;

    color:#555;
}

.buttons{

    display:flex;

    flex-direction:column;

    gap:10px;
}

.menu-btn{

    background:#ff6b35;

    color:white;

    padding:10px 20px;

    border-radius:8px;

    text-decoration:none;
}

.remove-btn{

    background:#dc3545;

    color:white;

    border:none;

    padding:10px;

    border-radius:8px;

    cursor:pointer;
}

.empty{

    text-align:center;

    margin-top:80px;
}

.empty img{

    width:250px;
}

.browse-btn{

    display:inline-block;

    margin-top:20px;

    background:#ff6b35;

    color:white;

    padding:12px 25px;

    border-radius:10px;

    text-decoration:none;
}
</style>
</head>


<body>

<div class="favorites-container">

    <h2>❤️ My Favorite Restaurants</h2>

    <%
    if(favoriteRestaurants == null || favoriteRestaurants.isEmpty()){
    %>

        <div class="empty">
            <img src="images/empty-favorite.png">
            <h3>No Favorites Yet</h3>
            <p>Start adding restaurants you love ❤️</p>

            <a href="callRestaurantServlet" class="browse-btn">
                Browse Restaurants
            </a>
        </div>

    <%
    }else{

        for(Restaurant restaurant : favoriteRestaurants){
    %>

        <div class="favorite-card">

            <img src="<%=restaurant.getImagePath()%>">

            <div class="details">

                <h3>
                    <%=restaurant.getRestaurantName()%>
                </h3>

                <p>
                    🍽 <%=restaurant.getCuisineType()%>
                </p>

                <p>
                    ⭐ <%=restaurant.getRating()%>
                </p>

                <p>
                    📍 <%=restaurant.getAddress()%>
                </p>

            </div>

            <div class="buttons">

                <a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>"
                   class="menu-btn">

                    View Menu

                </a>

                

                    <form action="FavoriteServlet" method="post">
    <input type="hidden" name="type" value="restaurant">
    <input type="hidden" name="action" value="remove">
    <input type="hidden" name="restaurantId" value="<%=restaurant.getRestaurantId()%>">
    <input type="hidden" name="source" value="favorites">

    <button class="remove-btn">
        ❤️ Remove
    </button>

</form>
            </div>

        </div>

    <%
        }
    }
    %>

</div>




<!-- ADD MENU FAVORITES HERE -->
<div class="favorites-container">

<h2>❤️ My Favorite Menu Items</h2>
<%
List<Menu> favoriteMenus =
        (List<Menu>)request.getAttribute("favoriteMenus");

if(favoriteMenus != null && !favoriteMenus.isEmpty()){
    for(Menu menu : favoriteMenus){
%>

<div class="favorite-card">

    <img src="<%=menu.getImagePath()%>">

    <div class="details">

        <h3><%=menu.getItemName()%></h3>

        <p><%=menu.getDescription()%></p>

        <p><strong>₹ <%=menu.getPrice()%></strong></p>

    </div>

</div>

<%
    }
}else{
%>

<p>No Favorite Menu Items Yet</p>

<%
}
%>
</div>

<script src="theme.js"></script>

</body>
</html>