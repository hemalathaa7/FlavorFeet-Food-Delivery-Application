<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FlavorFeet | Food Delivery</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&family=Playfair+Display:wght@700;800&display=swap" rel="stylesheet">
<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    overflow:hidden;
}

/* ================= NAVBAR ================= */

.navbar{
    position:absolute;
    top:0;
    left:0;
    width:100%;
    padding:22px 80px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    z-index:100;
}

.logo{

    font-size:42px;
    font-weight:800;
    letter-spacing:1px;
    cursor:pointer;
    transition:.4s ease;

}

.flavor{

    color:#ff6b35;
    font-style:italic;
    font-weight:700;

}

.feet{

        color:#c91f28;
    
    font-weight:900;
    letter-spacing:2px;

}

.logo:hover{

    transform:scale(1.05);

}




.nav-links{
    display:flex;
    gap:35px;
}

.nav-links a{
    color:white;
    text-decoration:none;
    font-size:17px;
    font-weight:500;
    transition:.3s;
}

.nav-links a:hover{
    color:#ffb347;
}

/* ================= HERO ================= */

.hero{
    position:relative;
    width:100%;
    height:100vh;
    overflow:hidden;
}

.hero-video{
    position:absolute;
    top:50%;
    left:50%;
    min-width:100%;
    min-height:100%;
    transform:translate(-50%,-50%);
    object-fit:cover;
}

.overlay{
    position:absolute;
    inset:0;
    background:linear-gradient(
    rgba(0,0,0,.60),
    rgba(0,0,0,.55));
}

.hero-content{

    position:absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    text-align:center;
    color:white;
    z-index:2;
    width:90%;
    max-width:900px;
}

.badge{

    display:inline-block;
    padding:10px 22px;
    background:rgba(255,255,255,.15);
    border:1px solid rgba(255,255,255,.2);
    backdrop-filter:blur(12px);
    border-radius:30px;
    margin-bottom:25px;
    font-size:15px;
}

.hero-content h1{

    font-size:50px;
    line-height:1.15;
    font-weight:800;
    margin-bottom:20px;
}

.hero-content h1 span{
    color:white;
}

.hero-content p{

    font-size:22px;
    color:#f2f2f2;
    line-height:1.8;
    margin-bottom:40px;
}

/* Search */

.search-box{

    width:650px;
    max-width:100%;
    margin:auto;
    display:flex;
    background:white;
    border-radius:60px;
    overflow:hidden;
    box-shadow:0 10px 35px rgba(0,0,0,.35);
}

.search-box input{

    flex:1;
    border:none;
    outline:none;
    padding:20px 25px;
    font-size:17px;
}

.search-box button{

    border:none;
    background:#ff6b35;
    color:white;
    padding:0 35px;
    font-size:17px;
    cursor:pointer;
    transition:.3s;
}

.search-box button:hover{
    background:#e85a24;
}

/* Buttons */

.hero-buttons{

    margin-top:30px;
}

.primary-btn{

    display:inline-block;
    padding:16px 40px;
    background:#ff6b35;
    color:white;
    text-decoration:none;
    border-radius:50px;
    font-weight:600;
    margin-right:15px;

    transition:all .35s ease;
    box-shadow:0 8px 20px rgba(255,107,53,.35);

}

.primary-btn:hover{

    background:linear-gradient(135deg,#ff7b32,#ff4b2b);
    transform:translateY(-5px) scale(1.05);
    box-shadow:0 15px 35px rgba(255,107,53,.55);
    color:white;

}

.primary-btn:active{

    transform:translateY(-2px) scale(.98);

}
.secondary-btn{

    display:inline-block;
    padding:16px 40px;
    border:2px solid white;
    color:white;
    text-decoration:none;
    border-radius:50px;
    font-weight:600;
    transition:all .35s ease;
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(10px);
}

.secondary-btn:hover{

    background:white;
    color:#ff6b35;
    border-color:white;
    transform:translateY(-5px) scale(1.05);
    box-shadow:0 12px 30px rgba(255,255,255,.35);

}

.secondary-btn:active{

    transform:translateY(-2px) scale(.98);

}




/* Responsive */

@media(max-width:900px){

.hero-content h1{
font-size:48px;
}

.hero-content p{
font-size:18px;
}

.navbar{
padding:20px;
}

.nav-links{
display:none;
}

.search-box{
flex-direction:column;
border-radius:20px;
}

.search-box button{
padding:18px;
}

}

.navbar{

animation:navbarDown 1s;

}

@keyframes navbarDown{

from{

transform:translateY(-100px);

opacity:0;

}

to{

transform:translateY(0);

opacity:1;

}

}



.signup-btn{

    display:inline-block;
    padding:14px 34px;

    text-decoration:none;
    font-weight:600;
    color:white;

    border-radius:50px;

    background:linear-gradient(135deg,#ff7b32,#ff4b2b);

    box-shadow:0 10px 25px rgba(255,107,53,.35);

    transition:all .35s ease;

}

.signup-btn:hover{

    transform:translateY(-5px) scale(1.05);

    background:linear-gradient(135deg,#ff8f4d,#ff5722);

    box-shadow:0 18px 40px rgba(255,107,53,.55);

}

.signup-btn:active{

    transform:translateY(-2px) scale(.98);

}

.login-btn{

    display:inline-block;
    padding:14px 34px;
    color:white;
    text-decoration:none;
    font-weight:600;

    border:2px solid rgba(255,255,255,.8);
    border-radius:50px;

    background:rgba(255,255,255,.08);
    backdrop-filter:blur(12px);

    transition:all .35s ease;

}

.login-btn:hover{

    background:white;
    color:#ff6b35;
    transform:translateY(-4px) scale(1.05);

    box-shadow:0 12px 30px rgba(255,255,255,.35);

}

.login-btn:active{

    transform:translateY(-2px) scale(.98);

}

.hero-title{

    font-family:'Playfair Display',serif;

    font-size:88px;

    font-weight:800;

    color:white;

    line-height:1.1;

    letter-spacing:1px;

    text-shadow:0 8px 25px rgba(0,0,0,.45);

}

.hero-title span{

    color:#ffb347;

    font-family:'Poppins',sans-serif;

    font-weight:800;

}

.hero-subtitle{

    font-family:'Playfair Display', serif;

    font-size:30px;

    font-weight:700;

    color:white;

    margin-top:10px;

    letter-spacing:1px;

    text-shadow:0 6px 18px rgba(0,0,0,.45);

}

.hero-subtitle span{

    color:#ffb347;

    font-family:'Poppins',sans-serif;

    font-weight:800;

}
</style>

</head>

<body>

<div class="navbar">

<div class="logo">
<span class="flavor">Flavor</span><span class="feet">Feet</span>
</div>

<div class="nav-links">


<a class="login-btn" href="login.html">🔐 Login</a>
<a class="signup-btn" href="register.html">📝 Sign Up</a>

</div>

</div>

<section class="hero">

<video autoplay muted loop playsinline class="hero-video">

<source src="videos/FoodFleet2.mp4" type="video/mp4">

</video>

<div class="overlay"></div>

<div class="hero-content">


<h1 class="hero-title">
    Craving <span>Something?</span>
</h1>

<h2 class="hero-subtitle">
    Let's Get You <span>Started!</span>
</h2>



<div class="hero-buttons">

<a href="login.html" class="primary-btn">

Explore Restaurants

</a>

<a href="register.html" class="secondary-btn">

Create Account

</a>



</div>



</div>




</section>

</body>
</html>
