<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="com.tap.Model.Restaurant"%>

<%
Restaurant restaurant = (Restaurant)request.getAttribute("restaurant");

if(restaurant == null){
    response.sendRedirect("AdminRestaurantServlet");
    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Restaurant | FlavorFeet Admin</title>

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

/*================ HEADER =================*/

.header{

    background:white;

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

.back-btn{

    background:#ff6b35;

    color:white;

    text-decoration:none;

    padding:12px 22px;

    border-radius:8px;

    font-weight:bold;

    transition:.3s;

}

.back-btn:hover{

    background:#e85b2b;

}

/*================ TITLE =================*/

.title{

    text-align:center;

    margin:35px 0;

}

.title h1{

    font-size:38px;

    color:#333;

}

.title p{

    color:#777;

    margin-top:8px;

    font-size:17px;

}

/*================ FORM =================*/

.container{

    width:95%;

    max-width:850px;

    margin:auto;

}

.card{

    background:white;

    padding:35px;

    border-radius:18px;

    box-shadow:0 8px 25px rgba(0,0,0,.08);

}

.input-group{

    margin-bottom:20px;

}

.input-group label{

    display:block;

    font-weight:bold;

    margin-bottom:8px;

    color:#444;

}

.input-group input,

.input-group textarea{

    width:100%;

    padding:14px;

    border:1px solid #ddd;

    border-radius:8px;

    outline:none;

    font-size:15px;

}

.input-group textarea{

    resize:vertical;

    min-height:90px;

}

.btn{

    background:#ff6b35;

    color:white;

    border:none;

    padding:14px 28px;

    border-radius:8px;

    cursor:pointer;

    font-size:16px;

    font-weight:bold;

    transition:.3s;

}

.btn:hover{

    background:#e85b2b;

}

</style>

</head>

<body>

<div class="header">

    <div class="logo">

        <span class="food">Food</span><span class="mingle">Mingle</span>

    </div>

    <a href="AdminRestaurantServlet" class="back-btn">

        ← Back

    </a>

</div>

<div class="title">

    <h1>✏ Edit Restaurant</h1>

    <p>Update restaurant information</p>

</div>

<div class="container">

<div class="card">

<form action="UpdateRestaurantServlet" method="post">
<input
type="hidden"
name="restaurantId"
value="<%=restaurant.getRestaurantId()%>">

<div class="input-group">

<label>

Restaurant Name

</label>

<input
type="text"
name="restaurantName"
value="<%=restaurant.getRestaurantName()%>"
required>

</div>

<div class="input-group">

<label>

Address

</label>

<textarea
name="address"
required><%=restaurant.getAddress()%></textarea>

</div>

<div class="input-group">

<label>

Cuisine Type

</label>

<input
type="text"
name="cuisineType"
value="<%=restaurant.getCuisineType()%>"
required>

</div>

<div class="input-group">

<label>

Rating

</label>

<input
type="number"
step="0.1"
min="0"
max="5"
name="rating"
value="<%=restaurant.getRating()%>"
required>

</div>

<div class="input-group">

<label>

Average Cost (₹)

</label>

<input
type="number"
name="amount"
value="<%=restaurant.getAmount()%>"
required>

</div>

<div class="input-group">

<label>

Opening Time

</label>

<input
type="text"
name="openingTime"
value="<%=restaurant.getOpeningTime()%>"
placeholder="09:00 AM"
required>

</div>

<div class="input-group">

<label>

Closing Time

</label>

<input
type="text"
name="closingTime"
value="<%=restaurant.getClosingTime()%>"
placeholder="11:00 PM"
required>

</div>

<div class="input-group">

<label>

Image Path

</label>

<input
type="text"
name="imagePath"
value="<%=restaurant.getImagePath()%>"
placeholder="images/restaurants/restaurant.jpg"
required>

</div>

<button
type="submit"
class="btn">

💾 Update Restaurant

</button>
</form>

</div>

</div>

</body>

</html>