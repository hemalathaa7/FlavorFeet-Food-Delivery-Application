<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="com.tap.Model.user"%>

<%
user customer = (user)request.getAttribute("customer");

if(customer == null){
    response.sendRedirect("AdminCustomersServlet");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Customer | FlavorFeet Admin</title>

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

.input-group input{

    width:100%;

    padding:14px;

    border:1px solid #ddd;

    border-radius:8px;

    outline:none;

    font-size:15px;

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

    <a href="AdminCustomersServlet" class="back-btn">

        ← Back

    </a>

</div>

<div class="title">

    <h1>👤 Edit Customer</h1>

    <p>Update customer information</p>

</div>

<div class="container">

<div class="card">

<form action="UpdateCustomerServlet" method="post">
<input
type="hidden"
name="userId"
value="<%=customer.getUserId()%>">

<div class="input-group">

<label>

User Name

</label>

<input
type="text"
name="userName"
value="<%=customer.getUserName()%>"
required>

</div>

<div class="input-group">

<label>

Email

</label>

<input
type="email"
name="email"
value="<%=customer.getEmail()%>"
required>

</div>

<div class="input-group">

<label>

Address

</label>

<input
type="text"
name="adress"
value="<%=customer.getAdress()%>"
required>

</div>

<div class="input-group">

<label>

Role

</label>

<input
type="text"
name="role"
value="<%=customer.getRole()%>"
readonly>

</div>

<div class="input-group">

<label>

Password

</label>

<input
type="text"
name="password"
value="<%=customer.getPassword()%>"
required>

</div>

<button
type="submit"
class="btn">

💾 Update Customer

</button>
</form>

</div>

</div>

</body>

</html>