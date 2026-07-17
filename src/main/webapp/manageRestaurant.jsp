<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tap.Model.Restaurant"%>

<%
List<Restaurant> restaurantList =
(List<Restaurant>)request.getAttribute("restaurantList");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Restaurants | FlavorFeet Admin</title>

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

box-shadow:0 3px 10px rgba(0,0,0,.08);

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

color:white;

padding:12px 22px;

text-decoration:none;

border-radius:8px;

font-weight:bold;

transition:.3s;

}

.back-btn:hover{

background:#e85b2b;

}













.add-btn{

    background:#27ae60;
    color:white;
    padding:12px 22px;
    text-decoration:none;
    border-radius:8px;
    font-weight:bold;
    transition:.3s;

}

.add-btn:hover{

    background:#229954;

}

/*================ PAGE TITLE =================*/

.page-title{

text-align:center;

padding:35px;

}

.page-title h1{

font-size:40px;

color:#333;

margin-bottom:10px;

}

.page-title p{

font-size:18px;

color:#777;

}

/*================ SEARCH =================*/

.search-box{

width:95%;

max-width:1400px;

margin:auto;

display:flex;

justify-content:flex-end;

margin-bottom:25px;
 gap:20px;    

}

.search-box input{

width:320px;

padding:12px 18px;

border:1px solid #ddd;

border-radius:8px;

outline:none;

font-size:15px;

}

/*================ CONTAINER =================*/

.container{

width:95%;

max-width:1400px;

margin:auto;

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


</style>

</head>

<body>

<!--================ HEADER =================-->

<div class="header">

    <div class="logo">
        <span class="flavor">Flavor</span><span class="feet">Feet</span>
    </div>

    <div style="display:flex; gap:15px;">

        
        <a href="AdminDashboardServlet" class="back-btn">
            🏠 Dashboard
        </a>

    </div>

</div>

<!--================ TITLE =================-->

<div class="page-title">

<h1>

🍽 Manage Restaurants

</h1>

<p>

View, search and manage restaurants

</p>

</div>

<!--================ SEARCH =================-->

<div class="search-box">

<input

type="text"

id="searchRestaurant"

placeholder="Search Restaurant..."

onkeyup="searchRestaurant()">

<a href="addRestaurant.jsp" class="add-btn">
            ➕ Add Restaurant
        </a>


</div>

<div class="container">
<style>

/*================ TABLE =================*/

.table-container{

background:#fff;

border-radius:18px;

overflow:hidden;

box-shadow:0 8px 25px rgba(0,0,0,.08);

}

table{

width:100%;

border-collapse:collapse;

}

thead{

background:#ff6b35;

color:white;

}

thead th{

padding:18px;

text-align:left;

font-size:16px;

}

tbody td{

padding:16px;

border-bottom:1px solid #eee;

vertical-align:middle;

}

tbody tr:hover{

background:#fff7f2;

}

/*================ IMAGE =================*/

.restaurant-image{

width:90px;

height:70px;

border-radius:10px;

object-fit:cover;

border:2px solid #eee;

}

/*================ RATING =================*/

.rating{

background:#27ae60;

color:white;

padding:6px 12px;

border-radius:20px;

font-weight:bold;

font-size:14px;

}

/*================ BUTTONS =================*/

.action-btn{

padding:10px 18px;

border:none;

border-radius:8px;

color:white;

cursor:pointer;

font-weight:bold;

transition:.3s;

margin-right:8px;

}

.edit{

background:#3498db;

}

.edit:hover{

background:#2980b9;

}

.delete{

background:#e74c3c;

}

.delete:hover{

background:#c0392b;

}

@media(max-width:1200px){

.table-container{

overflow-x:auto;

}

table{

min-width:1300px;

}

}

</style>

<div class="table-container">

<table id="restaurantTable">

<thead>

<tr>

<th>Image</th>

<th>Restaurant</th>

<th>Address</th>

<th>Cuisine</th>

<th>Rating</th>

<th>Average Cost</th>

<th>Edit</th>

<th>Delete</th>

</tr>

</thead>

<tbody>

<%

if(restaurantList!=null){

for(Restaurant restaurant : restaurantList){

%>

<tr>

<td>

<img

src="<%=restaurant.getImagePath()%>"

class="restaurant-image">

</td>

<td>

<%=restaurant.getRestaurantName()%>

</td>

<td>

<%=restaurant.getAddress()%>

</td>

<td>

<%=restaurant.getCuisineType()%>

</td>

<td>

<span class="rating">

⭐ <%=restaurant.getRating()%>

</span>

</td>

<td>

₹<%=restaurant.getAmount()%>

</td>

<td>

<a href="EditRestaurantServlet?restaurantId=<%=restaurant.getRestaurantId()%>">

<button class="action-btn edit">

Edit

</button>

</a>

</td>

<td>

<a

href="DeleteRestaurantServlet?restaurantId=<%=restaurant.getRestaurantId()%>"

onclick="return confirm('Delete this restaurant?')">

<button class="action-btn delete">

Delete

</button>

</a>

</td>

</tr>

<%

}

}

%>
</tbody>

</table>

</div>

</div>

<script>

function searchRestaurant(){

    let input = document.getElementById("searchRestaurant").value.toLowerCase();

    let table = document.getElementById("restaurantTable");

    let tr = table.getElementsByTagName("tr");

    for(let i=1;i<tr.length;i++){

        let td = tr[i].getElementsByTagName("td");

        if(td.length>0){

            let restaurant = td[1].innerText.toLowerCase();

            let address = td[2].innerText.toLowerCase();

            let cuisine = td[3].innerText.toLowerCase();

            if(restaurant.includes(input) ||
               address.includes(input) ||
               cuisine.includes(input)){

                tr[i].style.display="";

            }
            else{

                tr[i].style.display="none";

            }

        }

    }

}

</script>

</body>

</html>