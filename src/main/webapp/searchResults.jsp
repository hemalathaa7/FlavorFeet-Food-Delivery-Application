<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.tap.Model.Menu, com.tap.Model.Restaurant"%>
	
	      <jsp:include page="navbar.jsp" />
	
	
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>



<link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" href="home.css">



<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #f5f5f5;
}

/* NAVBAR */
.navbar {
	background: #ff5a00;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 18px 50px;
}

.logo {
	font-size: 40px;
	font-weight: 800;
}

.logo span {
	color: #222;
}

.nav-links a {
	color: white;
	text-decoration: none;
	margin-left: 25px;
	font-size: 20px;
	font-weight: 600;
}

.nav-links a:hover {
	color: #222;
}

.container {
	width: 90%;
	margin: 40px auto;
}

.page-title {
	text-align: center;
	font-size: 48px;
	color: #ff7a00;
	margin-bottom: 35px;
	font-weight: 800;
}

/* SECTION TITLE */
.section-title {
	font-size: 32px;
	color: #222;
	margin: 40px 0 20px;
	border-left: 6px solid #ff6600;
	padding-left: 15px;
}

/* MENU GRID */
.menu-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
	gap: 25px;
}

.menu-card {
	background: #fff;
	border-radius: 18px;
	overflow: hidden;
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.12);
	transition: 0.3s;
}

.menu-card:hover {
	transform: translateY(-6px);
}

.menu-card img {
	width: 100%;
	height: 220px;
	object-fit: cover;
}

.menu-info {
	padding: 18px;
}

.menu-info h3 {
	margin: 0 0 10px;
	font-size: 28px;
}

.menu-info p {
	margin: 0 0 12px;
	color: #555;
	font-size: 18px;
	line-height: 1.5;
}

.price {
	color: #ff6600;
	font-size: 26px;
	font-weight: bold;
	margin-bottom: 15px;
}

.add-btn {
	display: inline-block;
	background: #ff6600;
	color: white;
	text-decoration: none;
	padding: 10px 18px;
	border-radius: 10px;
	font-weight: bold;
}

.add-btn:hover {
	background: #e65c00;
}

/* RESTAURANT GRID */
.restaurant-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
	gap: 25px;
}

.restaurant-card {
	background: #fff;
	border-radius: 18px;
	overflow: hidden;
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.12);
	transition: 0.3s;
}

.restaurant-card:hover {
	transform: translateY(-6px);
}

.restaurant-card img {
	width: 100%;
	height: 220px;
	object-fit: cover;
}

.restaurant-info {
	padding: 18px;
}

.restaurant-info h3 {
	margin: 0 0 10px;
	font-size: 28px;
}

.restaurant-info p {
	margin: 0 0 10px;
	font-size: 18px;
	color: #555;
}

.rating {
	color: #0a8f3d;
	font-weight: bold;
	font-size: 20px;
}

.no-results {
	text-align: center;
	font-size: 30px;
	color: red;
	margin-top: 50px;
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

	<!-- NAVBAR -->
	
	<div class="container">
		<%
		String searchQuery = (String) request.getAttribute("searchQuery");
		List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
		List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("restaurantList");
		%>

		<div class="page-title">
			Search Results for "<%=searchQuery%>"
		</div>

		<!-- MENU RESULTS -->
		<%
		if (menuList != null && !menuList.isEmpty()) {
		%>
		<div class="section-title">🍽 Matching Food Items</div>
		<div class="menu-grid">
			<%
			for (Menu m : menuList) {
			%>
			<div class="menu-card">
				<img src="<%=m.getImagePath()%>" alt="<%=m.getItemName()%>">
				<div class="menu-info">
					<h3><%=m.getItemName()%></h3>
					<p><%=m.getDescription()%></p>
					<div class="price">
						₹<%=m.getPrice()%></div>

					<a class="add-btn"
						href="cart?action=add&menuId=<%=m.getMenuId()%>&restaurantId=<%=m.getRestaurantId()%>&quantity=1">
						Add to Cart </a>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<%
		}
		%>

		<!-- RESTAURANT RESULTS -->
		<%
		if (restaurantList != null && !restaurantList.isEmpty()) {
		%>
		<div class="section-title">🏨 Matching Restaurants</div>
		<div class="restaurant-grid">
			<%
			for (Restaurant r : restaurantList) {
			%>
			<div class="restaurant-card">
				<a href="menu?restaurantId=<%=r.getRestaurantId()%>"> <img
					src="<%=r.getImagePath()%>" alt="<%=r.getRestaurantName()%>">
				</a>
				<div class="restaurant-info">
					<h3><%=r.getRestaurantName()%></h3>
					<p class="rating">
						⭐
						<%=r.getRating()%></p>
					<p>
						📍
						<%=r.getAddress()%></p>
					<p><%=r.getCuisineType()%></p>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<%
		}
		%>

		<!-- NO RESULTS -->
		<%
		boolean noMenu = (menuList == null || menuList.isEmpty());
		boolean noRestaurant = (restaurantList == null || restaurantList.isEmpty());

		if (noMenu && noRestaurant) {
		%>
		<div class="no-results">No results found 😔</div>
		<%
		}
		%>

	</div>
</body>
</html>