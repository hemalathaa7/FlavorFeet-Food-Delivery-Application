<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.tap.Model.Cart" %>
<%@ page import="com.tap.Model.CartItem" %>




<jsp:include page="navbar.jsp" />
     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>

 
 <link rel="stylesheet" href="darkmode.css">
<link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" href="home.css">

<style>

 


   


  
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', sans-serif;
}

body{
    background: #f5f5f5;
    min-height: 100vh;
}

/* ================= NAVBAR ================= */

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

        padding:7px 18px;

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

        padding:7px 18px;

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

.login-btn{

        padding:7px 18px;

    border:2px solid #FF6B35;

    border-radius:30px;

    color:#FF6B35;

    text-decoration:none;
}

.login-btn:hover{

    background:#FF6B35;

    color:white;
}

/* Signup */

.signup-btn{

        padding:7px 18px;

    border:2px solid #FF6B35;


    color:#FF6B35;

    border-radius:30px;

    text-decoration:none;
}
.signup-btn:hover{

   background:#FF6B35;

    color:white;
}

.flavor{

    color:#FF6B35;

    font-weight:800;

}

.feet{

    color:#C1121F;

    font-weight:800;
}

FlavorFeet

.cart-link {
    
    
     padding:9px 20px;

    border:2px solid #FF6B35;

    border-radius:30px;

    color:#FF6B35;

    text-decoration:none;

    font-weight:600;

    transition:.3s;
}

.cart-link:hover {
    background: #e65c00;
}



.flavor{

    color:#FF6B35;

    font-weight:800;

}

.feet{

    color:#C1121F;

    font-weight:800;


}
/* ================= CART CONTAINER ================= */
.cart-container{
    width: 90%;
    max-width: 1200px;
    margin: 35px auto;
}

.cart-heading{
    text-align: center;
    margin-bottom: 25px;
}

.cart-heading h1{
    color: #ff6600;
    font-size: 34px;
    margin-bottom: 8px;
}

.cart-heading p{
    color: #666;
    font-size: 16px;
}

/* ================= CART BOX ================= */
.cart-box{
    background: #fff;
    border-radius: 15px;
    box-shadow: 0 4px 18px rgba(0,0,0,0.12);
    overflow: hidden;
}

/* cart header row */
.cart-header{
    display: grid;
    grid-template-columns: 2fr 1fr 1.5fr 1fr 1fr;
    gap: 10px;
    background: #ff6600;
    color: white;
    padding: 18px;
    font-weight: bold;
    text-align: center;
    font-size: 17px;
}

/* each cart item row */
.cart-item{
    display: grid;
    grid-template-columns: 2fr 1fr 1.5fr 1fr 1fr;
    gap: 10px;
    align-items: center;
    padding: 18px;
    border-bottom: 1px solid #eee;
    background: #fff;
}

.cart-item:last-child{
    border-bottom: none;
}

.item-name{
    font-size: 18px;
    font-weight: 600;
    color: #333;
    text-align: center;
}

.item-price,
.item-total{
    font-size: 17px;
    font-weight: bold;
    color: #ff6600;
    text-align: center;
}

/* ================= QUANTITY BOX ================= */
.quantity-box{
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
}

.quantity{
    min-width: 30px;
    text-align: center;
    font-size: 17px;
    font-weight: bold;
    color: #333;
}

.qty-btn{
    width: 36px;
    height: 36px;
    border: none;
    border-radius: 50%;
    background: #ff6600;
    color: white;
    font-size: 20px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s ease;
}

.qty-btn:hover{
    background: #e65c00;
    transform: scale(1.05);
}

/* ================= REMOVE BUTTON ================= */
.remove-btn{
    background: #e53935;
    color: white;
    border: none;
    padding: 10px 18px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 600;
    transition: 0.3s;
}

.remove-btn:hover{
    background: #c62828;
}

/* ================= GRAND TOTAL ================= */
.cart-summary{
    margin-top: 20px;
    background: #fff;
    padding: 20px 25px;
    border-radius: 15px;
    box-shadow: 0 4px 18px rgba(0,0,0,0.12);
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.total-text{
    font-size: 22px;
    font-weight: bold;
    color: #333;
}

.total-price{
    font-size: 26px;
    font-weight: bold;
    color: #ff6600;
}

/* ================= CART ACTIONS ================= */
.cart-actions{
    margin-top: 25px;
    display: flex;
    justify-content: space-between;
    gap: 15px;
    flex-wrap: wrap;
}

.cart-actions a{
    text-decoration: none;
}

/* add more button */
.add-more-btn{
    display: inline-block;
    background: #ff6600;
    color: white;
    padding: 12px 22px;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    transition: 0.3s;
}

.add-more-btn:hover{
    background: #e65c00;
}

/* checkout button */
.checkout-btn{
    display: inline-block;
    background: #28a745;
    color: white;
    padding: 12px 22px;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    transition: 0.3s;
    text-decoration: none;
}

.checkout-btn:hover{
    background: #1f8a39;
}

/* ================= EMPTY CART ================= */
.empty-cart{
    background: white;
    border-radius: 15px;
    box-shadow: 0 4px 18px rgba(0,0,0,0.12);
    text-align: center;
    padding: 60px 20px;
    margin-top: 25px;
}

.empty-cart h2{
    color: #333;
    margin-bottom: 12px;
    font-size: 28px;
}

.empty-cart p{
    color: #666;
    margin-bottom: 20px;
    font-size: 16px;
}

/* ================= RESPONSIVE ================= */
@media(max-width: 900px){

   

    .cart-header{
        display: none;
    }

    .cart-item{
        grid-template-columns: 1fr;
        text-align: center;
        gap: 15px;
        padding: 20px;
    }

    .quantity-box{
        justify-content: center;
    }

    .cart-summary{
        flex-direction: column;
        gap: 10px;
        text-align: center;
    }

    .cart-actions{
        flex-direction: column;
    }

    .add-more-btn,
    .checkout-btn{
        width: 100%;
        text-align: center;
    }
}










.item-action {
    display: flex;
    justify-content: center;
    align-items: center;
}
.quantity-box {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
}
















.cart-link {
    background: #ff6600;
    color: #fff !important;
    padding: 10px 18px;
    border-radius: 30px;
    box-shadow: 0 4px 10px rgba(255,102,0,0.25);
}

.cart-link:hover {
    background: #e65c00;
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


        
        
        
        
        
     
       
       

        

<div class="cart-container">

    <div class="cart-heading">
        <h1>🛒 My Cart</h1>
        <p>Review your selected food items</p>
    </div>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    Integer restaurantId = (Integer) session.getAttribute("restaurantId");
    double grandTotal = 0;

    if(cart != null && !cart.getItems().isEmpty()) {
        Map<Integer, CartItem> items = cart.getItems();
%>

<div class="cart-box">
    <div class="cart-header">
        <div>Item Name</div>
        <div>Price</div>
        <div>Quantity</div>
        <div>Total</div>
        <div>Action</div>
    </div>

<%
    for(CartItem item : items.values()) {
        double itemTotal = item.getPrice() * item.getQuantity();
        grandTotal += itemTotal;

        int currentQty = item.getQuantity();
        int decreaseQty = currentQty - 1;
        int increaseQty = currentQty + 1;
%>

    <div class="cart-item">
        <div class="item-name"><%= item.getName() %></div>

        <div class="item-price">₹<%= item.getPrice() %></div>

        <div class="quantity-box">

            <!-- MINUS -->
            <form action="cart" method="post">
                <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="quantity" value="<%= (decreaseQty <= 0 ? 1 : decreaseQty) %>">
                <button class="qty-btn" type="submit">-</button>
            </form>

            <span class="quantity"><%= currentQty %></span>

            <!-- PLUS -->
            <form action="cart" method="post">
                <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="quantity" value="<%= increaseQty %>">
                <button class="qty-btn" type="submit">+</button>
            </form>
        </div>

        <div class="item-total">₹<%= itemTotal %></div>

        <div class="item-action">
            <form action="cart" method="post">
                <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="restaurantId" value="<%= item.getRestaurantId() %>">
                <input type="hidden" name="action" value="delete">
                <button class="remove-btn" type="submit">Remove</button>
            </form>
        </div>
    </div>

<%
    }
%>
</div>

<div class="cart-summary">
    <div class="total-text">Grand Total</div>
    <div class="total-price">₹<%= grandTotal %></div>
</div>

<div class="cart-actions">
    <a class="add-more-btn" href="menu?restaurantId=<%= restaurantId %>">Add More Items</a>
    <a class="checkout-btn" href="checkout.jsp">Proceed to Checkout</a>
</div>

<%
    } else {
%>

<div class="empty-cart">
    <h2>Your Cart is Empty 😔</h2>
    <p>Add some delicious food items to continue.</p>
    <a class="checkout-btn" href="callRestaurantServlet">Browse Restaurants</a>
</div>

<%
    }
%>
</div>
<script src="theme.js"></script>
</body>
</html>