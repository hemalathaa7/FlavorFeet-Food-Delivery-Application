<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tap.Model.Menu"%>
<%@page import="com.tap.DAOImpl.RestaurantDAOImp"%>

<%
List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");

RestaurantDAOImp restaurantDAO = new RestaurantDAOImp();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Menu | FlavorFeet Admin</title>

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

box-shadow:0 3px 12px rgba(0,0,0,.08);

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

/*================ TITLE =================*/

.page-title{

text-align:center;

padding:35px;

}

.page-title h1{

font-size:40px;

margin-bottom:10px;

color:#333;

}

.page-title p{

font-size:18px;

color:#777;

}

/*================ SEARCH =================*/

.search-box{

width:95%;

max-width:1400px;

margin:0 auto 25px auto;

display:flex;

justify-content:flex-end;


}

.search-box input{

width:320px;

padding:12px 18px;

border-radius:8px;

border:1px solid #ddd;

font-size:15px;

outline:none;

}



.add-btn{

background:#27ae60;

color:white;

padding:12px 20px;

text-decoration:none;

border-radius:8px;

font-weight:bold;

margin-left:15px;

transition:.3s;

display:inline-block;

}

.add-btn:hover{

background:#219150;

}
/*================ CONTAINER =================*/

.container{

width:95%;

max-width:1400px;

margin:auto;

}



/*================ MENU TABLE =================*/

.table-container{

background:#fff;

border-radius:18px;

overflow:hidden;

box-shadow:0 8px 25px rgba(0,0,0,.08);

margin-top:25px;

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

font-size:16px;

text-align:left;

}

tbody td{

padding:16px;

border-bottom:1px solid #eee;

vertical-align:middle;

}

tbody tr:hover{

background:#fff8f4;

}

/*================ IMAGE =================*/

.food-image{

width:80px;

height:80px;

object-fit:cover;

border-radius:12px;

border:2px solid #eee;

}

/*================ BADGES =================*/

.available{

background:#27ae60;

color:white;

padding:6px 14px;

border-radius:20px;

font-size:13px;

font-weight:bold;

}

.unavailable{

background:#e74c3c;

color:white;

padding:6px 14px;

border-radius:20px;

font-size:13px;

font-weight:bold;

}

/*================ BUTTONS =================*/

.action-btn{

padding:10px 18px;

border:none;

border-radius:8px;

color:white;

cursor:pointer;

font-weight:bold;

margin-right:8px;

transition:.3s;

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

min-width:1200px;

}

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

<a href="AdminDashboardServlet" class="back-btn">

🏠 Dashboard

</a>

</div>

<!--================ TITLE =================-->

<div class="page-title">

<h1>

🍔 Manage Menu

</h1>

<p>

View and manage all food items

</p>

</div>

<!--================ SEARCH =================-->

<div class="search-box">

<input
type="text"
id="search"
placeholder="Search Menu Item..."
onkeyup="searchMenu()">

<a href="addMenu.jsp" class="add-btn">

➕ Add Menu Item

</a>

</div>

<div class="container">

<div class="table-container">

<table id="menuTable">

<thead>

<tr>

<th>Image</th>

<th>Food Name</th>

<th>Restaurant</th>

<th>Description</th>

<th>Price</th>

<th>Availability</th>

<th>Edit</th>

<th>Delete</th>

</tr>

</thead>

<tbody>

<%

if(menuList!=null){

for(Menu menu:menuList){

String restaurantName=

restaurantDAO.getRestaurantNameById(menu.getRestaurantId());

%>

<tr>

<td>

<img

src="<%=menu.getImagePath()%>"

class="food-image">

</td>

<td>

<%=menu.getItemName()%>

</td>

<td>

<%=restaurantName%>

</td>

<td>

<%=menu.getDescription()%>

</td>

<td>

₹<%=menu.getPrice()%>

</td>

<td>

<%

if(menu.isAvailable()){

%>

<span class="available">

Available

</span>

<%

}else{

%>

<span class="unavailable">

Out Of Stock

</span>

<%

}

%>

</td>

<td>

<a href="EditMenuServlet?menuId=<%=menu.getMenuId()%>">

<button class="action-btn edit">

Edit

</button>

</a>

</td>

<td>

<a

href="DeleteMenuServlet?menuId=<%=menu.getMenuId()%>"

onclick="return confirm('Delete this menu item?')">

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

function searchMenu(){

    let input=document.getElementById("search").value.toLowerCase();

    let table=document.getElementById("menuTable");

    let tr=table.getElementsByTagName("tr");

    for(let i=1;i<tr.length;i++){

        let td=tr[i].getElementsByTagName("td");

        if(td.length>0){

            let itemName=td[1].innerText.toLowerCase();

            let restaurant=td[2].innerText.toLowerCase();

            let description=td[3].innerText.toLowerCase();

            if(itemName.includes(input) ||
               restaurant.includes(input) ||
               description.includes(input)){

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