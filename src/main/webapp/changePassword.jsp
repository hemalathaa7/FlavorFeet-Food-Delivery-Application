<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="com.tap.Model.user"%>

<%
user customer = (user)request.getAttribute("user");

if(customer == null){
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Change Password | FlavorFeet</title>

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
    color:white;
    text-decoration:none;
    padding:12px 22px;
    border-radius:8px;
    font-weight:bold;
}

.container{
    width:90%;
    max-width:650px;
    margin:50px auto;
}

.card{
    background:white;
    padding:40px;
    border-radius:20px;
    box-shadow:0 8px 25px rgba(0,0,0,.08);
}

.card h2{
    text-align:center;
    margin-bottom:30px;
    color:#333;
}

.input-group{
    margin-bottom:20px;
}

.input-group label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
}

.input-group input{
    width:100%;
    padding:14px;
    border:1px solid #ddd;
    border-radius:8px;
    font-size:15px;
}

.btn{
    width:100%;
    padding:15px;
    background:#ff6b35;
    color:white;
    border:none;
    border-radius:8px;
    font-size:17px;
    font-weight:bold;
    cursor:pointer;
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

    font-size:36px;
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

<a href="ProfileServlet" class="back-btn">

← Back

</a>

</div>

<div class="container">

<div class="card">

<h2>🔒 Change Password</h2>

<form action="ChangePasswordServlet" method="post">

<input
type="hidden"
name="userId"
value="<%=customer.getUserId()%>">
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
class="btn">

🔒 Change Password

</button>
</form>

</div>

</div>

</body>

</html>