<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Restaurant | FoodMingle</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Poppins,sans-serif;
}

body{
background:#f5f6fa;
}

.header{

background:#fff;
padding:20px 40px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 4px 12px rgba(0,0,0,.08);

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
color:#fff;
padding:12px 22px;
text-decoration:none;
border-radius:8px;
font-weight:bold;

}

.container{

width:95%;
max-width:850px;
margin:40px auto;

}

.card{

background:#fff;
padding:35px;
border-radius:18px;
box-shadow:0 8px 20px rgba(0,0,0,.08);

}

.card h2{

text-align:center;
margin-bottom:30px;

}

.input-group{

margin-bottom:18px;

}

.input-group label{

display:block;
font-weight:bold;
margin-bottom:8px;

}

.input-group input{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;

}

.btn{

width:100%;
padding:14px;
border:none;
background:#27ae60;
color:white;
font-size:17px;
font-weight:bold;
border-radius:8px;
cursor:pointer;

}

.btn:hover{

background:#229954;

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

<div class="header">

<div class="logo">

<span class="flavor">Flavor</span><span class="feet">Feet</span>

</div>

<a href="AdminRestaurantServlet" class="back-btn">

← Back

</a>

</div>

<div class="container">

<div class="card">

<h2>🍽 Add Restaurant</h2>

<form action="AddRestaurantServlet" method="post">

<div class="input-group">
<label>Restaurant Name</label>
<input type="text" name="restaurantName" required>
</div>

<div class="input-group">
<label>Address</label>
<input type="text" name="address" required>
</div>

<div class="input-group">
<label>Cuisine Type</label>
<input type="text" name="cuisineType" required>
</div>

<div class="input-group">
<label>Opening Time</label>
<input type="time" name="openingTime" placeholder="09:00 AM" required>
</div>

<div class="input-group">
<label>Closing Time</label>
<input type="time" name="closingTime" placeholder="11:00 PM" required>
</div>

<div class="input-group">
<label>Rating</label>
<input type="number" step="0.1" name="rating" required>
</div>

<div class="input-group">
<label>Average Cost (₹)</label>
<input type="number" step="0.01" name="amount" required>
</div>

<div class="input-group">
<label>Image Path</label>
<input type="text"
name="imagePath"
placeholder="images/restaurants/restaurant.jpg"
required>
</div>

<button class="btn">

➕ Add Restaurant

</button>

</form>

</div>

</div>

</body>

</html>