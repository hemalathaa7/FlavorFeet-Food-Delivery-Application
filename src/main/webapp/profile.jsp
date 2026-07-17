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

<title>My Profile | FlavorFeet</title>
<link rel="stylesheet" href="darkmode.css">
<link rel="stylesheet" href="navbar.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:linear-gradient(135deg,#fff8f3,#f7f8fc);
}





.header{

    justify-content:space-between;

 width:100%;
    height:80px;

    background:#fff;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:0 70px;

    box-shadow:0 2px 15px rgba(0,0,0,.08);

    position:sticky;

    top:0;

    z-index:999;
}




.home-btn{

    background:#ff6b35;

    color:white;

    text-decoration:none;

    padding:12px 22px;

    border-radius:8px;

    font-weight:bold;

}

.container{

    width:90%;

    max-width:680px;

    margin:20px auto;

}
.profile-card{

    background:#fff;

    border-radius:20px;

    padding:28px;

    box-shadow:0 10px 25px rgba(0,0,0,.08);

    text-align:center;

    border-top:5px solid #ff6b35;

}

.profile-card:hover{

    transform:translateY(-5px);

}
.profile-icon{

    width:80px;

    height:80px;

    border-radius:50%;

    background:linear-gradient(135deg,#ff7b00,#ff4b2b);

    color:white;

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:38px;

    margin:0 auto 12px;

}

.profile-card h2{

    margin:10px 0 5px;

    font-size:28px;

    color:#333;

}

.info{

    text-align:left;

    margin-top:18px;

}

.info p{

    display:flex;

    justify-content:space-between;

    align-items:center;

    background:#fafafa;

    padding:12px 16px;

    margin-bottom:8px;

    border-radius:10px;

    border:1px solid #ececec;

    font-size:15px;

}

.info p:hover{

    background:#fff8f3;

    border-color:#ff6b35;

}

.info strong{

    color:#555;

    min-width:180px;

}
.btn{

    display:inline-block;

    margin:6px;

    padding:10px 18px;

    border-radius:8px;

    text-decoration:none;

    font-size:14px;

    font-weight:600;

}
.btn:hover{

    transform:translateY(-3px);

    box-shadow:0 8px 18px rgba(255,107,53,.25);

}



.subtitle{

    color:#777;

    margin:0 0 18px;

    font-size:14px;

}
.welcome{

    color:#888;

    margin-top:10px;

    margin-bottom:20px;

}
/*==================================
PROFILE CARD
==================================*/

.profile-card{

  
    background:#fff;

    border-radius:28px;


    width:100%;

    margin:18px auto;

    padding:22px 28px;
    box-shadow:0 15px 40px rgba(0,0,0,.08);

    border-top:5px solid #ff6b35;

}


/*==================================
PROFILE HEADER
==================================*/

.profile-top{

    display:flex;

    align-items:center;

   
    gap:18px;

    margin-bottom:18px;

}



.profile-avatar{

    width:80px;

    height:80px;

    font-size:38px;
    
    width:110px;

    height:110px;

    border-radius:50%;

    background:linear-gradient(135deg,#ff7b00,#ff4b2b);

    display:flex;

    justify-content:center;

    align-items:center;

    color:#fff;

    font-size:52px;

    box-shadow:0 10px 25px rgba(255,107,53,.25);

}



.profile-details{

    flex:1;

}



.profile-details h2{

   

    color:#1d2330;

 font-size:30px;

    margin-bottom:5px;
}



.profile-details p{

    color:#666;

  font-size:14px;

    margin-top:6px;

}



/*==================================
CUSTOMER BADGE
==================================*/

.customer-badge{

    display:inline-block;

    padding:8px 18px;

    background:#fff4e5;

    color:#ff8a00;

    border-radius:30px;

    font-size:14px;

    font-weight:600;

}



/*==================================
INFO CARD
==================================*/

.info-card{

    background:#fff;

    border-radius:20px;

    overflow:hidden;

    border:1px solid #eee;

    box-shadow:0 8px 20px rgba(0,0,0,.05);

}



/*==================================
ROWS
==================================*/

.info-row{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:12px 18px;

    border-bottom:1px solid #f1f1f1;

    transition:.3s;

}



.info-row:last-child{

    border-bottom:none;

}



.info-row:hover{

    background:#fff9f5;

}



.left{

    display:flex;

    align-items:center;

    gap:15px;

    font-weight:600;

    color:#555;

}



.left span{

    font-size:15px;

}



.right{

    font-size:15px;

    color:#222;

    font-weight:600;

}



/*==================================
ACTION BUTTONS
==================================*/

.action-grid{

    display:grid;

    grid-template-columns:repeat(3,1fr);

    gap:20px;

    margin-top:18px;

}



.action-box{

    text-decoration:none;

    color:#222;

    background:#fff;

 padding:16px;

    border-radius:14px;

    text-align:left;

    transition:.35s;

    box-shadow:0 8px 18px rgba(0,0,0,.06);

    border:1px solid #eee;

}



.action-box:hover{

    transform:translateY(-6px);

}



.action-box h3{

  font-size:18px;

    margin:8px 0 4px;

}



.action-box p{

    color:#777;

    font-size:12px;

}



/*==================================
COLORS
==================================*/

.purple{

    background:#f6efff;

}



.orange{

    background:#fff7ea;

}



.red{

    background:#fff0f0;

}



.purple:hover{

    border-color:#7d4dff;

}



.orange:hover{

    border-color:#ff9800;

}



.red:hover{

    border-color:#ff4d4d;

}



/*==================================
RESPONSIVE
==================================*/

@media(max-width:900px){

.profile-card{

width:95%;

padding:25px;

}

.profile-top{

flex-direction:column;

text-align:center;

}

.action-grid{

grid-template-columns:1fr;

}

.info-row{

flex-direction:column;

align-items:flex-start;

gap:10px;

}

}

.logo{
    font-size:36px;
    font-weight:800;
    letter-spacing:1px;
}

.logo .flavor{
    color:#FF6B35 !important;
}

.logo .feet{
    color:#C1121F !important;
}


.logo:hover{

    transform:scale(1.05);

}

}
</style>

</head>

<body>

<div class="header">

<div class="logo">
    <span class="flavor">Flavor</span><span class="feet">Feet</span>
</div>
<a href="home.jsp" class="home-btn">🏠 Home</a>


</div>

<div class="container">

<div class="profile-card">

    <!-- Profile Header -->
    <div class="profile-top">

        <div class="profile-avatar">

            👤

        </div>

        <div class="profile-details">

            <h2><%=customer.getUserName()%></h2>

            <span class="customer-badge">
                👑 Customer
            </span>

            <p>
                Welcome back! Manage your account details and security.
            </p>

        </div>

    </div>


    <!-- Information -->

    <div class="info-card">

        <div class="info-row">

            <div class="left">

                👤 <span>Full Name</span>

            </div>

            <div class="right">

                <%=customer.getUserName()%>

            </div>

        </div>

        <div class="info-row">

            <div class="left">

                📧 <span>Email</span>

            </div>

            <div class="right">

                <%=customer.getEmail()%>

            </div>

        </div>

        <div class="info-row">

            <div class="left">

                📍 <span>Address</span>

            </div>

            <div class="right">

                <%=customer.getAdress()%>

            </div>

        </div>

        <div class="info-row">

            <div class="left">

                🛡 <span>Role</span>

            </div>

            <div class="right">

                <%=customer.getRole()%>

            </div>

        </div>

        <div class="info-row">

            <div class="left">

                📅 <span>Account Created</span>

            </div>

            <div class="right">

                <%=customer.getCreateDate()%>

            </div>

        </div>

        <div class="info-row">

            <div class="left">

                🕒 <span>Last Login</span>

            </div>

            <div class="right">

                <%=customer.getLastLoginDate()%>

            </div>

        </div>

    </div>


    <!-- Action Buttons -->

    <div class="action-grid">

        <a href="EditProfileServlet" class="action-box purple">

            ✏️

            <h3>Edit Profile</h3>

            <p>Update your details</p>

        </a>

        <a href="ChangePasswordPageServlet" class="action-box orange">

            🔒

            <h3>Change Password</h3>

            <p>Update your password</p>

        </a>

        <a href="LogoutServlet" class="action-box red">

            🚪

            <h3>Logout</h3>

            <p>Sign out securely</p>

        </a>

    </div>

</div>

</div>
<script src="theme.js"></script>

</body>

</html>