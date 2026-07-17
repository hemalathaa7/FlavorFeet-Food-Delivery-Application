<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Menu | FlavorFeet Admin</title>

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

    color:#ff6b35;

}

.feet{

    color:#c0392b;

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

    background:#fff;

    padding:35px;

    border-radius:18px;

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

    background:#27ae60;

    color:white;

    border:none;

    padding:14px 30px;

    border-radius:8px;

    cursor:pointer;

    font-size:16px;

    font-weight:bold;

    transition:.3s;

}

.btn:hover{

    background:#219150;

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

    <a href="AdminMenuServlet" class="back-btn">

        ← Back

    </a>

</div>

<div class="title">

    <h1>➕ Add Menu Item</h1>

    <p>Add a new food item to the restaurant menu</p>

</div>

<div class="container">

<div class="card">

<form action="AddMenuServlet" method="post">
<div class="input-group">

<label>

Menu ID

</label>

<input
type="number"
name="menuId"
placeholder="Enter Menu ID"
required>

</div>

<div class="input-group">

<label>

Restaurant ID

</label>

<input
type="number"
name="restaurantId"
placeholder="Enter Restaurant ID"
required>

</div>

<div class="input-group">

<label>

Item Name

</label>

<input
type="text"
name="itemName"
placeholder="Enter Item Name"
required>

</div>

<div class="input-group">

<label>

Description

</label>

<textarea
name="description"
placeholder="Enter Item Description"
required></textarea>

</div>

<div class="input-group">

<label>

Price (₹)

</label>

<input
type="number"
step="0.01"
min="0"
name="price"
placeholder="Enter Price"
required>

</div>

<div class="input-group">

<label>

Availability

</label>

<select name="isAvailable">

<option value="true">

Available

</option>

<option value="false">

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
placeholder="images/menu/chicken_biryani.jpg"
required>

</div>

<button
type="submit"
class="btn">

➕ Add Menu Item

</button>
</form>

</div>

</div>

</body>

</html>