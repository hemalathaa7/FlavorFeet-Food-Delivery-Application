<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="com.tap.Model.user"%>

<%
user admin = (user)request.getAttribute("admin");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Settings | FoodMingle Admin</title>

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

padding:12px 24px;

border-radius:8px;

text-decoration:none;

font-weight:bold;

transition:.3s;

}

.back-btn:hover{

background:#e85b2b;

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

/*================ CONTAINER =================*/

.container{

width:95%;

max-width:1200px;

margin:auto;

}

/*================ CARD =================*/

.card{

background:white;

border-radius:18px;

padding:30px;

box-shadow:0 8px 25px rgba(0,0,0,.08);

margin-bottom:30px;

}

.card h2{

margin-bottom:20px;

color:#333;

font-size:28px;

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

.input-group input{

width:100%;

padding:14px;

border:1px solid #ddd;

border-radius:8px;

font-size:15px;

outline:none;

}

.input-group select{

width:100%;

padding:14px;

border:1px solid #ddd;

border-radius:8px;

font-size:15px;

outline:none;

background:white;

}

.save-btn{

background:#ff6b35;

color:white;

border:none;

padding:14px 30px;

border-radius:8px;

cursor:pointer;

font-size:16px;

font-weight:bold;

transition:.3s;

}

.save-btn:hover{

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

⚙️ Admin Settings

</h1>

<p>

Manage your FlavorFeet administrator account

</p>

</div>

<div class="container">
<!--================ ADMIN PROFILE =================-->

<div class="card">

<h2>

👤 Admin Profile

</h2>

<form action="UpdateProfileServlet" method="post">

<input
type="hidden"
name="userId"
value="<%=admin.getUserId()%>">

<div class="input-group">

<label>

Full Name

</label>

<input

type="text"

name="userName"

value="<%=admin.getUserName()%>"

required>

</div>

<div class="input-group">

<label>

Email

</label>

<input

type="email"

name="email"

value="<%=admin.getEmail()%>"

required>

</div>



<div class="input-group">

<label>

Address

</label>

<input

type="text"

name="adress"

value="<%=admin.getAdress()%>"

required>

</div>

<div class="input-group">

<label>

Role

</label>

<input

type="text"

value="<%=admin.getRole()%>"

readonly>

</div>

<button
type="submit"
class="save-btn">

💾 Update Profile

</button>

</form>

</div>
<!--================ CHANGE PASSWORD =================-->

<div class="card">

<h2>

🔒 Change Password

</h2>

<form action="ChangePasswordServlet" method="post">

<input
type="hidden"
name="userId"
value="<%=admin.getUserId()%>">

<div class="input-group">

<label>

Current Password

</label>

<input

type="password"

name="currentPassword"

placeholder="Enter Current Password"

required>

</div>

<div class="input-group">

<label>

New Password

</label>

<input

type="password"

name="newPassword"

placeholder="Enter New Password"

required>

</div>

<div class="input-group">

<label>

Confirm Password

</label>

<input

type="password"

name="confirmPassword"

placeholder="Confirm New Password"

required>

</div>

<button
type="submit"
class="save-btn">

🔐 Change Password

</button>

</form>

</div>


<!--================ PREFERENCES =================-->

<div class="card">

<h2>

🎨 Preferences

</h2>

<div class="input-group">

<label>

Theme

</label>

<select>

<option>Light</option>

<option>Dark</option>

</select>

</div>

<div class="input-group">

<label>

Language

</label>

<select>

<option>English</option>

<option>Telugu</option>

<option>Hindi</option>

</select>

</div>

<div class="input-group">

<label>

Email Notifications

</label>

<select>

<option>Enabled</option>

<option>Disabled</option>

</select>

</div>

</div>


<!--================ LOGOUT =================-->

<div class="card">

<h2>

🚪 Logout

</h2>

<p style="margin-bottom:20px;color:#555;">

Click the button below to securely logout from the FlavorFeet Admin Panel.

</p>

<a href="LogoutServlet">

<button
type="button"
class="save-btn">

🚪 Logout

</button>

</a>

</div>

</div>

</body>

</html>