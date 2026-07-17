<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:include page="navbar.jsp" />
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/darkmode.css">
<meta charset="UTF-8">
<title>FoodHub - Home</title>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet" href="darkmode.css">

<link rel="stylesheet" href="navbar.css">
<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');


/* Theme Toggle Button */
.theme-btn{
    background: transparent;
    border: none;
    color: #222;          /* Black for light navbar */
    font-size: 22px;
    cursor: pointer;
    margin-left: 15px;
    transition: all 0.3s ease;
}

.theme-btn:hover{
    transform: scale(1.1);
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f8f9fa;
}

/* Navbar */
                     
/* =========================
        NAVBAR
========================= */

.navbar{
    background:#fff;
    color:black;
    padding:15px 50px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

/* Logo */

.logo a{

    text-decoration:none;

    display:flex;

    align-items:center;

    font-size:36px;

    font-weight:800;

}

/* Right Side */

.nav-right{

    display:flex;

    align-items:center;

    gap:35px;

}

/* Navigation */

.nav-links{

    display:flex;

    list-style:none;

    gap:35px;

    margin:0;

    padding:0;

}

.nav-links a{

    text-decoration:none;

    color:#333;

    font-size:18px;

    font-weight:600;

    transition:.3s;

}

.nav-links a:hover{

    color:#FF6B35;

}

/* Buttons */

.nav-buttons{

    display:flex;

    gap:15px;

}

.login-btn{

    padding:10px 25px;

    border:2px solid #FF6B35;

    border-radius:30px;

    color:#FF6B35;

    text-decoration:none;

    font-weight:600;

    transition:.3s;

}

.login-btn:hover{

    background:#FF6B35;

    color:#fff;

}

.signup-btn{

    padding:10px 25px;

    border:2px solid #FF6B35;

    border-radius:30px;

    color:#FF6B35;

    text-decoration:none;

    font-weight:600;

    transition:.3s;
   

}

.signup-btn:hover{

 background:#FF6B35;

    color:#fff;
}


/* Login */



/* Signup */




/* Hero Section */
.hero{
    height:90vh;
    background:url("images/hero-food.jpg") center/cover no-repeat;
    display:flex;
    align-items:center;
    justify-content:center;
    text-ali gn:center;
    position:relative;
}

.hero::before{
    content:'';
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.55);
}

.hero-content{
    position:relative;
    color:white;
    z-index:2;
}

.hero-content h1{
    font-size:60px;
    margin-bottom:15px;
}

.hero-content p{
    font-size:22px;
    margin-bottom:25px;
}

.btn{
    background:#ff6b35;
    color:white;
    text-decoration:none;
    padding:15px 35px;
    border-radius:30px;
    font-size:18px;
    font-weight:bold;
}

.btn:hover{
    background:#ff4d00;
}




/* Cuisines */


.cuisine-section {
text-align:center;
    font-size:60px;
    color:#f57c00;
    margin-top:30px;   /* move down */
    margin-bottom:10px;
    width:92%;
    max-width:1450px;
    margin:0 auto;
    }


.cuisine-wrapper{

    width:85%;

    max-width:1350px;

    margin:0 auto;

    overflow-x:auto;
    overflow-y:hidden;

    scroll-behavior:smooth;

    padding:0 10px;

}

.cuisine-wrapper::-webkit-scrollbar{

    display:none;

}
.cuisine-wrapper::-webkit-scrollbar-thumb{
    background:#ff6b35;
    border-radius:10px;
}




.cuisine-container{

    display:grid;

    grid-template-rows:repeat(2,auto);

    grid-auto-flow:column;

    grid-auto-columns:170px;

    gap:30px 20px;

    transition:transform .5s ease;

}

.cuisine-card{

    width:170px;

    text-align:center;

    flex-shrink:0;

}
.cuisine-card img{

    width:135px;

    height:135px;

    border-radius:50%;

    object-fit:cover;

    transition:.3s;

}

.cuisine-card:hover img{

    transform:scale(1.08);

}


.cuisine-card h3{
    margin-top:12px;
    color:black;
    font-size:20px;
    font-weight:600;
}

.cuisine-card a{
    text-decoration:none;
}




.cuisine-card a,
.cuisine-card a:hover,
.cuisine-card a:visited,
.cuisine-card a:active {
    text-decoration: none !important;
    color: inherit;
    display: block;
}




}





.cuisine-card h3 {
    text-decoration: none;
    color:#000;
    display: block;
    padding: 10px;
    font-size: 18px;
    font-weight: bold;
        text-decoration: none !important;
    
}

.cuisine-card h3:hover {
    color: #ff6600;
        text-decoration: none !important;
    
}



.cuisine-header{

    width:88%;

    max-width:1350px;

    margin:0 auto 35px;

    display:flex;

    justify-content:space-between;

    align-items:center;

}

.cuisine-header h2{
    width:100%;
    text-align:center;
    font-size:47px;
    font-weight:800;
    font-family:'Poppins', sans-serif;
     margin-bottom:10px;
          margin-top:30px;
     
     
      text-shadow: 2px 2px 8px rgba(0,0,0,0.15);
      
      background: linear-gradient(
        90deg,
        #ff5200,
        #ff7b00,
        #ffb700
        );
        -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
    background-clip:text;

    letter-spacing:1px;
}





.nav-buttons{

    display:flex;

    gap:12px;

}

.nav-buttons button{

    width:42px;

    height:42px;

    border:none;

    border-radius:50%;

    background:#f2f2f2;

    cursor:pointer;

    font-size:20px;

    transition:.3s;

}

.nav-buttons button:hover{

    background:#FF6B35;

    color:white;

}








/* Features */
.features{
    padding:70px 8%;
}

.feature-container{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:25px;
}

.feature-box{
    background:white;
    padding:30px;
    text-align:center;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.1);
}

.feature-box h3{
    margin:15px 0;
}



/* Restaurants */


.restaurant-container{

    width:83%;

    max-width:1350px;

    margin:30px auto 40px;

    display:grid;

    grid-template-columns:repeat(4,1fr);

    gap:28px;

}
.restaurant-card{

    width:100%;

    background:#fff;

    border-radius:22px;

    overflow:hidden;

    box-shadow:0 8px 20px rgba(0,0,0,.10);

    transition:.3s;

}



.restaurant-card:hover{

    transform:translateY(-8px);

}
.restaurant-card img{

    width:100%;

    height:220px;

    object-fit:cover;

}
.restaurant-card h3{
    margin:16px 16px 6px;
    font-size:18px;
    font-weight: bold;
    line-height:1.2;
    padding:0;
}
    



.restaurant-card h3:hover {
    color: #ff6600;
        text-decoration: none !important;
    
}
.restaurant-card p{
    margin:0 16px 10px;
    padding:0;
    color:#666;
    font-size:16px;
    line-height:24px;
}



.view-menu-btn{
    display:inline-block;
    margin:6px 16px 16px;
    padding:8px 16px;      /* Reduced from 10px 20px */
    background:#ff6b00;
    color:#fff;
    border-radius:8px;     /* Reduced from 10px */
    font-size:15px;        /* Added */
    font-weight:600;
    text-decoration:none;
    transition:.3s;
}

.view-menu-btn:hover{
    background:#e65c00;
    transform:translateY(-2px);
}






.hero{
    position:relative;
    height:90vh;
}

.hero-img{
    width:100%;
    height:100%;
    object-fit:cover;
}

.hero-content{
    position:absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    color:white;
    text-align:center;
}






.section-title{
    text-align:center;
    font-size:34px;
    font-weight:800;
    color:#ff6b35;
    margin:50px 0;
    letter-spacing:1px;
    text-transform:uppercase;
}




.logo-section h2{
    font-size:38px;
    color:#fc8019;
}

.logo-section p{
    color:#666;
}

hr{
    width:80%;
    margin:auto;
    border:0;
    border-top:1px solid #ccc;
}





.restaurant-link{
    text-decoration: none;
    color: inherit;
    display: block;
}

.restaurant-card{
    cursor: pointer;
     display:flex;
    flex-direction:column;
    height:100%;
}


// featured resturants

.restaurant-link {
    text-decoration: none;
    color: inherit;
    display: block;
}

.restaurant-link:hover {
    text-decoration: none;
    color: inherit;
}


.restaurant-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 25px rgba(0,0,0,0.18);
}


/*=========================
        FOOTER
==========================*/
.footer{
    background:0 -4px 20px rgba(0,0,0,.08);
    margin-top:70px;
    padding:55px 70px 20px;
    border-top:none;
    box-shadow:white;
}

.footer-container{
    display:grid;
    grid-template-columns:2.2fr 1fr 1fr 1.3fr;
    gap:45px;
}

.footer-column h2{
    font-size:34px;
    margin-bottom:18px;
}

.footer-column h3{
    margin-bottom:18px;
    color:#222;
}

.footer-column p{
    color:#666;
    line-height:1.8;
    margin-bottom:10px;
}

.footer-column a{
    display:block;
    color:#555;
    text-decoration:none;
    margin-bottom:12px;
    transition:.3s;
}

.footer-column a:hover{
    color:#FF6B35;
    transform:translateX(6px);
}

.tagline{
    font-size:17px;
    color:#FF6B35;
    font-weight:600;
    margin-bottom:12px;
}

.delivery-badge{
    margin-top:15px;
    background:#fff3eb;
    border-left:4px solid #FF6B35;
    padding:15px;
    border-radius:10px;
    color:#444;
    line-height:1.8;
}

.footer-bottom{
    margin-top:40px;
    padding-top:20px;
    border-top:1px solid #ddd;
    text-align:center;
    color:#666;
    font-size:15px;
}

@media(max-width:900px){

.footer{
    padding:40px 25px;
}

.footer-container{
    grid-template-columns:1fr;
    gap:30px;
}

.footer-column{
    text-align:center;
}

.footer-column a:hover{
    transform:none;
}
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
    font-weight:700;

}

.feet{

    color:white;
    font-weight:900;
    letter-spacing:2px;

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








.flavor{

    color:#FF6B35;

    font-weight:800;

}

.feet{

    color:#C1121F;

    font-weight:800;

}

.footer-bottom{

    margin-top:40px;

    padding-top:20px;

    border-top:1px solid #e5e5e5;

    text-align:center;

    color:#777;

    font-size:15px;

}

/* Responsive */

@media(max-width:900px){

.footer-container{

    grid-template-columns:1fr;

    text-align:center;

}

.footer-column a:hover{

    padding-left:0;

}

}

.theme-btn{

    background:none;
    border:none;
    font-size:22px;
    cursor:pointer;
    color:white;
    margin-left:20px;
}






.restaurant-info{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin:8px 15px;
    font-size:14px;
}

.rating{
    background:#16a34a;
    color:#fff;
    padding:4px 8px;
    border-radius:6px;
    font-weight:600;
}

.delivery{
    color:#666;
    font-weight:500;
}



.image-box{
    overflow:hidden;
}

.image-box img{
    transition:.4s;
}

.restaurant-card:hover img{
    transform:scale(1.08);
}




.image-container{

    position:relative;

}




.rating-badge{
    position:absolute;
    bottom:4px;
    left:7px;

    background:#198754;
    color:#fff;

    padding:5px 7px;
    border-radius:20px;

    font-size:14px;
    font-weight:600;

    box-shadow:0 3px 10px rgba(0,0,0,0.25);
}
</style>
</head>
<body>

<!-- Navbar -->
      
      


<!-- Hero Section -->
<section class="hero">

    <img src="images/hero-food.jpg" class="hero-img">

    <div class="hero-content">
    <h1># FlavorFeet</h1>
        <h2>Delicious Food Delivered Fast</h2>
        <p>Order from your favorite restaurants near you.</p>
        <a href=callRestaurantServlet class="btn">
            Explore Restaurants
        </a>
    </div>

</section>

<!-- Popular Cuisines -->


        <h2 id="popular-cuisines" class="section-title">Popular Cuisines</h2>

<div class="cuisine-section">
        
    
    <!---  !div class="nav-buttons">
            <button onclick="prevSlide()">←</button>
        <button onclick="nextSlide()">→</button>
        </div>---->
        
        
        
        
    </div>
    
   </div>
    

    <div class="cuisine-wrapper">
<div class="cuisine-container" id="cuisineContainer">
 <!-- 1 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Biryani">
        <img src="images/cuisines/biryani.jpg">
        <h3>Biryani</h3>
    </a>
</div>


<!-- 2 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Burgers">
        <img src="images/cuisines/burger.jpg">
        <h3>Burgers</h3>
    </a>
</div>

<!-- 3 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Noodles">
        <img src="images/cuisines/noodles.jpg">
        <h3>Noodles</h3>
    </a>
</div>

<!-- 4 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=South Indian">
        <img src="images/cuisines/south-indian.jpg">
        <h3>South Indian</h3>
    </a>
</div>

<!-- 5 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=North Indian">
        <img src="images/cuisines/north-indian.jpg">
        <h3>North Indian</h3>
    </a>
</div>

<!-- 6 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Desserts">
        <img src="images/cuisines/desserts.jpg">
        <h3>Desserts</h3>
    </a>
</div>

<!-- 7 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Shakes">
        <img src="images/cuisines/shakes.jpg">
        <h3>Shakes</h3>
    </a>
</div>

<!-- 8 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Kebab">
        <img src="images/cuisines/kebab.jpg">
        <h3>Kebab</h3>
    </a>
</div>

<!-- 9 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Fish">
        <img src="images/cuisines/fish.jpg">
        <h3>Fish</h3>
    </a>
</div>

<!-- 10 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Meals">
        <img src="images/cuisines/meals.jpg">
        <h3>Meals</h3>
    </a>
</div>

<!-- 11 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Dosa">
        <img src="images/cuisines/dosa.jpg">
        <h3>Dosa</h3>
    </a>
</div>

<!-- 12 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Tiffins">
        <img src="images/cuisines/tiffins.jpg">
        <h3>Tiffins</h3>
    </a>
</div>

<!-- 13 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Mexican">
        <img src="images/cuisines/mexican.jpg">
        <h3>Mexican</h3>
    </a>
</div>
<!-- 14 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Pizza">
        <img src="images/cuisines/pizza.jpg">
        <h3>Pizza</h3>
    </a>
</div>


<!-- 15 -->

<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=IceCream">
        <img src="images/cuisines/icecream.jpg">
        <h3>Ice Cream</h3>
    </a>
</div>
<!-- 16 -->

<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Sandwich">
        <img src="images/cuisines/sandwich.jpg">
        <h3>Sandwich</h3>
    </a>
</div>
<!-- 17 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Pasta">
        <img src="images/cuisines/pasta.jpg">
        <h3>Pasta</h3>
    </a>
</div>
<!-- 18 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=RiceBowl">
        <img src="images/cuisines/ricebowl.jpg">
        <h3>Rice Bowls</h3>
    </a>
</div>
<!-- 19 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=FriedRice">
        <img src="images/cuisines/friedrice.jpg">
        <h3>Fried Rice</h3>
    </a>
</div>
<!-- 20 -->
<div class="cuisine-card">
    <a href="CuisineServlet?cuisine=Paneer">
        <img src="images/cuisines/paneer.jpg">
        <h3>Paneer Specials</h3>
    </a>
    
</div>

</div>
</div>









<!-- Featured Restaurants -->
<h2 class="section-title">Featured Restaurants</h2>

<div class="restaurant-container">

    <!-- 1 Meghana -->
    <a href="menu?restaurantId=1" class="restaurant-link">
    <div class="restaurant-card">
            <div class="image-container">
    
        <img src="images/meghana.jpg" alt="Meghana Foods">
        <div class="rating-badge">
                4.7 ⭐
            </div>
                        </div>
            
        <h3>Meghana Foods</h3>
        
<p class="restaurant-address">
            📍 Koramangala, Bangalore
        </p>
        <span class="view-menu-btn">View Menu →</span>

    </div>
</a>

    <!-- 2 Paradise -->
    <a href="menu?restaurantId=4" class="restaurant-link">

    <div class="restaurant-card">

        <div class="image-container">

            <img src="images/paradise.jpg" alt="Paradise">

            <div class="rating-badge">
                4.7 ⭐
            </div>

        </div>

        <h3>Paradise</h3>
        
        <p class="restaurant-address">
📍 Jayanagar, Bangalore
        </p>
        <span class="view-menu-btn">
            View Menu →
        </span>

    </div>

</a>
    <!-- 3 KFC -->
    <a href="menu?restaurantId=2" class="restaurant-link">
        <div class="restaurant-card">
                <div class="image-container">
        
            <img src="images/kfc.jpg" alt="KFC">
            
            <div class="rating-badge">
                4.7 ⭐
            </div>

        </div>
            <h3>KFC</h3>
             <p class="restaurant-address">
📍 Banashankari, Bangalore        </p>
                    <span class="view-menu-btn">View Menu →</span>
            
        </div>
    </a>

    <!-- 4 Truffles -->
    <a href="menu?restaurantId=7" class="restaurant-link">
        <div class="restaurant-card">
                        <div class="image-container">
        
            <img src="images/truffles.jpg" alt="Truffles">
            <div class="rating-badge">
                4.7 ⭐
            </div>

        </div>
            <h3>Truffles</h3>
             <p class="restaurant-address">
  📍 Koramangala, Bangalore        </p>
                    <span class="view-menu-btn">View Menu →</span>
            
        </div>
    </a>

    <!-- 5 Empire -->
    <a href="menu?restaurantId=5" class="restaurant-link">
        <div class="restaurant-card">
                                <div class="image-container">
        
            <img src="images/empire.jpg" alt="Empire Restaurant">
            <div class="rating-badge">
                4.7 ⭐
            </div>

        </div>
            <h3>Empire Restaurant</h3>
             <p class="restaurant-address">
📍 BTM Layout, Bangalore        </p>
            
                    <span class="view-menu-btn">View Menu →</span>
            
        </div>
    </a>

    <!-- 6 Pizza Hut -->
    <a href="menu?restaurantId=9" class="restaurant-link">
        <div class="restaurant-card">
                                        <div class="image-container">
        
            <img src="images/pizzahut.jpg" alt="Pizza Hut">
            
            <div class="rating-badge">
                4.7 ⭐
            </div>

        </div>
            <h3>Pizza Hut</h3>
             <p class="restaurant-address">
📍 Electronic City, Bangalore        </p>
                    <span class="view-menu-btn">View Menu →</span>
            
        </div>
    </a>

    <!-- 7 Burger King -->
    <a href="menu?restaurantId=8" class="restaurant-link">
        <div class="restaurant-card">
                                        <div class="image-container">
        
            <img src="images/burgerking.jpg" alt="Burger King">
            <div class="rating-badge">
                4.7 ⭐
            </div>

        </div>
            <h3>Burger King</h3>
             <p class="restaurant-address">
📍 MG Road, Bangalore        </p>
                    <span class="view-menu-btn">View Menu →</span>
            
        </div>
    </a>

    <!-- 8 McDonald's -->
    <a href="menu?restaurantId=3" class="restaurant-link">
        <div class="restaurant-card">
                                                <div class="image-container">
        
            <img src="images/mcdonalds.jpg" alt="McDonald's">
            
            <div class="rating-badge">
                4.7 ⭐
            </div>

        </div>
            <h3>McDonald's</h3>
             <p class="restaurant-address">
📍 Whitefield, Bangalore
        </p>
            
        <span class="view-menu-btn">View Menu →</span>
            
        </div>
        
        
    </a>

</div>


































<!-- ---- --<section class="service-banner">

    <div class="service-item">
        <span>🚀</span>
        <h3>30 Min Delivery</h3>
        <p>Fast delivery at your doorstep</p>
    </div>

    <div class="service-item">
        <span>🎁</span>
        <h3>Daily Offers</h3>
        <p>Exclusive discounts every day</p>
    </div>

    <div class="service-item">
        <span>⭐</span>
        <h3>Top Rated</h3>
        <p>Trusted restaurant partners</p>
    </div>

    <div class="service-item">
        <span>🛡️</span>
        <h3>Safe Payments</h3>
        <p>100% secure transactions</p>
    </div>

</section>-----!>






<%----
<!-- Statistics -->
<section class="stats-section">

    <div class="stats-card">

        <div class="stat">
            <h2>500+</h2>
            <p>Restaurants</p>
        </div>

        <div class="divider"></div>

        <div class="stat">
            <h2>50K+</h2>
            <p>Orders Delivered</p>
        </div>

        <div class="divider"></div>

        <div class="stat">
            <h2>100K+</h2>
            <p>Happy Customers</p>
        </div>

    </div>

</section>

-----%>



<!-- Footer -->
<!-- ================= FOOTER ================= -->

<footer class="footer">

    <div class="footer-container">

        <!-- Brand -->
        <div class="footer-column brand">

            <h2>
                🍽 <span class="flavor">Flavor</span><span class="feet">Feet</span>
            </h2>

            <p class="tagline">
                Delivering happiness, one meal at a time.
            </p>

            <p>
                Order from your favorite restaurants with fast delivery,
                fresh food, and the best dining experience right at your doorstep.
            </p>

        </div>

        <!-- Explore -->
        <div class="footer-column">

            <h3>Explore</h3>

            <a href="home.jsp">🏠 Home</a>
            <a href="callRestaurantServlet">🍽 Restaurants</a>
            <a href="home.jsp#popular-cuisines">🍕 Popular Cuisines</a>
            <a href="callRestaurantServlet">🔥 Today's Specials</a>

        </div>

        <div class="footer-column">

    <h3>Our Services</h3>

    <a href="#">🚀 Food Delivery</a>
    <a href="#">🍕 Online Ordering</a>
    <a href="#">🎁 Special Offers</a>
    <a href="#">📍 Live Order Tracking</a>

</div>

        <!-- Contact -->
        <div class="footer-column">

            <h3>Get in Touch</h3>

            <p>📍 Bangalore, Karnataka</p>
            <p>📞 +91 98765 43210</p>
            <p>✉ support@flavorfeet.com</p>

            <div class="delivery-badge">
                🚀 Fast Delivery <br>
                ⭐ Trusted Restaurants <br>
                ❤️ Fresh & Hygienic Food
            </div>

        </div>

    </div>

    <div class="footer-bottom">

        <p>
            © 2026 <span class="flavor">Flavor</span><span class="feet">Feet</span>.
            Crafted with ❤️ for food lovers.
        </p>

    </div>

</footer>

<script>
let scrollPosition = 0;

function nextSlide() {
    const wrapper = document.querySelector(".cuisine-wrapper");

    wrapper.scrollBy({
        left: 900,
        behavior: "smooth"
    });
}

function prevSlide() {
    const wrapper = document.querySelector(".cuisine-wrapper");

    wrapper.scrollBy({
        left: -900,
        behavior: "smooth"
    });
}
</script>
<script src="theme.js"></script>

</body>
</html>