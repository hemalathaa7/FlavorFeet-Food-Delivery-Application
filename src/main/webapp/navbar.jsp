<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Object user = session.getAttribute("user");
%>



<header class="navbar">

    <div class="logo">
        <a href="home.jsp">Flavor<span>Feet</span></a>
    </div>

    <nav>

        <a href="home.jsp">🏠 Home</a>

        <a href="callRestaurantServlet">🍽 Restaurants</a>

        <% if(user == null){ %>

            <a href="login.html">🔐 Login</a>

            <a href="register.html">📝 Sign Up</a>

        <% } else { %>

            <a href="cart.jsp">🛒 Cart</a>

            <a href="orders.jsp">📦 My Orders</a>

            <a href="ProfileServlet">👤 Profile</a>
            
            <a href="FavoriteServlet?action=view">   ❤️ Favorites</a>

            <a href="LogoutServlet">🚪 Logout</a>

        <% } %>





<div class="theme-switch"
     style="width:58px;height:35px;background:black;display:block;border-radius:20px;"
     onclick="toggleTheme()">
    <div class="switch-circle"></div>
</div>

    </nav>

</header>