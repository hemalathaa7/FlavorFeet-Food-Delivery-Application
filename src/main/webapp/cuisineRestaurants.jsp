<%@ page import="java.util.List" %>
<%@ page import="com.tap.Model.Restaurant" %>
<style>

.restaurant-container{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:25px;
    padding:40px;
}

.restaurant-card{
    background:#fff;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
}

.restaurant-card img{
    width:100%;
    height:220px;
    object-fit:cover;
}

.restaurant-info{
    padding:15px;
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
<%
List<Restaurant> restaurants =
(List<Restaurant>) request.getAttribute("restaurants");
%>
<h2>Total Restaurants = <%= restaurants.size() %></h2>


<div class="section-header">
    <h1><%= request.getAttribute("cuisine") %> Restaurants</h1>
</div>

<div class="restaurant-container">

<%
for(Restaurant r : restaurants){
%>

<div class="restaurant-card">

    <img src="<%= r.getImagePath() %>" alt="Restaurant Image">

    <div class="restaurant-info">

        <h3><%= r.getRestaurantName() %></h3>

        <p><%= r.getCuisineType() %></p>

        <p>⭐ <%= r.getRating() %></p>

        <p><%= r.getAddress() %></p>

        <a href="menu?restaurantID=<%= r.getRestaurantId() %>">
            View Menu
        </a>

    </div>

</div>

<%
}
%>

</div>