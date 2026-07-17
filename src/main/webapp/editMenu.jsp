<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="com.tap.Model.Menu"%>

<%
Menu menu = (Menu)request.getAttribute("menu");

if(menu == null){
    response.sendRedirect("AdminMenuServlet");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Menu | FlavorFeet Admin</title>

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

    background:#ffffff;

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


.back-btn{

    background:#ff6b35;

    color:#fff;

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

    margin-top:8px;

    color:#777;

    font-size:17px;

}

/*================ FORM =================*/

.container{

    width:95%;

    max-width:850px;

    margin:auto;

}

.card{

    background:#fff;

    border-radius:18px;

    padding:35px;

    box-shadow:0 8px 25px rgba(0,0,0,.08);

}

.input-group{

    margin-bottom:20px;

}

.input-group label{

    display:block;

    margin-bottom:8px;

    font-weight:bold;

    color:#444;

}

.input-group input,

.input-group textarea,

.input-group select{

    width:100%;

    padding:14px;

    border:1px solid #ddd;

    border-radius:8px;

    outline:none;

    font-size:15px;

}

.input-group textarea{

    resize:vertical;

    min-height:100px;

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

<div class="header">

    <div class="logo">

        <span class="flavor">Flavor</span><span class="feet">Feet</span>

    </div>

    <a href="AdminMenuServlet" class="back-btn">

        ← Back

    </a>

</div>

<div class="title">

    <h1>🍔 Edit Menu Item</h1>

    <p>Update menu item information</p>

</div>

<div class="container">

<div class="card">

<form action="UpdateMenuServlet" method="post">





<input
type="hidden"
name="menuId"
value="<%=menu.getMenuId()%>">

<div class="input-group">

<label>

Restaurant ID

</label>

<input
type="number"
name="restaurantId"
value="<%=menu.getRestaurantId()%>"
required>

</div>

<div class="input-group">

<label>

Item Name

</label>

<input
type="text"
name="itemName"
value="<%=menu.getItemName()%>"
required>

</div>

<div class="input-group">

<label>

Description

</label>

<textarea
name="description"
required><%=menu.getDescription()%></textarea>

</div>

<div class="input-group">

<label>

Price (₹)

</label>

<input
type="number"
step="0.01"
name="price"
value="<%=menu.getPrice()%>"
required>

</div>

<div class="input-group">

<label>

Availability

</label>

<select name="isAvailable">

<option value="true"
<%=menu.isAvailable() ? "selected" : ""%>>

Available

</option>

<option value="false"
<%=!menu.isAvailable() ? "selected" : ""%>>

Not Available

</option>

</select>

</div>

<div class="input-group">

<label>

Image Path

</label>

<input
type="text"
name="imagePath"
value="<%=menu.getImagePath()%>"
placeholder="images/menu/item.jpg"
required>

</div>

<button
type="submit"
class="btn">

💾 Update Menu Item

</button>
</form>

</div>

</div>

</body>

</html>