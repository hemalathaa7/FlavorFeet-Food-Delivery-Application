<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.Model.Cart"%>
<%@ page import="com.tap.Model.CartItem"%>



<jsp:include page="navbar.jsp" />
     
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout | FoodHub</title>

 <link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" href="home.css">
     
     <link rel="stylesheet" href="darkmode.css">

<style>



/*==================================================
                GOOGLE FONT
==================================================*/

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f5f7fb;
    color:#333;
    overflow-x:hidden;
}

/*==================================================
                    NAVBAR
==================================================*/

.navbar{
    position:sticky;
    top:0;
    z-index:1000;

    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:18px 45px;

    background:#ffffff;

    box-shadow:0 6px 18px rgba(0,0,0,.08);
}

.logo{

    font-size:34px;

    font-weight:800;

    letter-spacing:.5px;

}

.food-text{

    color:#ff6b35;

}

.mingle-text{

    color:#c0392b;

}

.nav-links{

    list-style:none;

    display:flex;

    align-items:center;

    gap:28px;

}

.nav-links li{

    list-style:none;

}

.nav-links li a{

    text-decoration:none;

    color:#444;

    font-size:15px;

    font-weight:600;

    transition:.3s;

}

.nav-links li a:hover{

    color:#ff6b35;

}

/*==================================================
                PAGE CONTAINER
==================================================*/

.checkout-container{

    width:95%;

    max-width:1450px;

    margin:35px auto;

}

/*==================================================
                    HEADING
==================================================*/

.checkout-heading{

    text-align:center;

    margin-bottom:40px;

}

.checkout-heading h1{

    font-size:42px;

    color:#222;

    font-weight:700;

}

.checkout-heading p{

    margin-top:10px;

    color:#777;

    font-size:17px;

}

/*==================================================
                CHECKOUT STEPS
==================================================*/

.checkout-steps{

    display:flex;

    justify-content:space-between;

    align-items:center;

    max-width:760px;

    margin:0 auto 45px;

}

.step{

    flex:1;

    position:relative;

    text-align:center;

}

.step:not(:last-child)::after{

    content:"";

    position:absolute;

    top:22px;

    left:60%;

    width:80%;

    height:3px;

    background:#e5e5e5;

    z-index:-1;

}

.step-number{

    width:45px;

    height:45px;

    margin:auto;

    border-radius:50%;

    background:#e5e5e5;

    color:#666;

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:18px;

    font-weight:700;

}

.step.active .step-number{

    background:#ff6b35;

    color:#fff;

}

.step-title{

    margin-top:10px;

    font-size:14px;

    color:#666;

    font-weight:600;

}

.step.active .step-title{

    color:#ff6b35;

}

/*==================================================
                MAIN LAYOUT
==================================================*/

.checkout-wrapper{

    display:grid;

    grid-template-columns:2fr 1fr;

    gap:30px;

    align-items:start;

}

.left-column{

    display:flex;

    flex-direction:column;

    gap:28px;

}

/*==================================================
                CARD DESIGN
==================================================*/

.checkout-box,
.payment-box,
.summary-box{

    background:#fff;

    border-radius:20px;

    padding:30px;

    box-shadow:0 10px 30px rgba(0,0,0,.08);

    border:1px solid #ededed;

}

/*==================================================
                SECTION TITLE
==================================================*/

.section-title{

    display:flex;

    align-items:center;

    gap:12px;

    font-size:24px;

    color:#222;

    margin-bottom:25px;

    font-weight:700;

}

.section-icon{

    width:48px;

    height:48px;

    border-radius:50%;

    background:#fff2ec;

    color:#ff6b35;

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:24px;

}

/*==================================================
                FORM LAYOUT
==================================================*/

.form-row{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
}

.form-group{
    margin-bottom:22px;
}

.form-group label{
    display:block;
    margin-bottom:10px;
    font-size:15px;
    font-weight:600;
    color:#444;
}

/*==================================================
                INPUT FIELDS
==================================================*/

.form-group input,
.form-group textarea{

    width:100%;

    padding:16px 18px;

    border:2px solid #e7e7e7;

    border-radius:14px;

    font-size:15px;

    background:#fafafa;

    transition:.30s;

    outline:none;

}

.form-group textarea{

    min-height:130px;

    resize:none;

}

.form-group input:hover,
.form-group textarea:hover{

    border-color:#ffb79c;

    background:#fff;

}

.form-group input:focus,
.form-group textarea:focus{

    border-color:#ff6b35;

    background:#fff;

    box-shadow:0 0 0 4px rgba(255,107,53,.12);

}

/*==================================================
            PLACEHOLDER
==================================================*/

::placeholder{

    color:#a2a2a2;

}

/*==================================================
        ADDRESS BOX
==================================================*/

.address-box{

    background:#fafafa;

    padding:18px;

    border-radius:14px;

    border:1px solid #ededed;

}

/*==================================================
        INPUT ICON STYLE
==================================================*/

.input-box{

    position:relative;

}

.input-box i{

    position:absolute;

    left:18px;

    top:18px;

    color:#999;

    font-size:16px;

}

.input-box input{

    padding-left:48px;

}

.input-box textarea{

    padding-left:48px;

}

/*==================================================
        DELIVERY CARD HEADER
==================================================*/

.delivery-header{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-bottom:25px;

}

.delivery-badge{

    background:#eaf8ec;

    color:#28a745;

    padding:8px 18px;

    border-radius:30px;

    font-size:13px;

    font-weight:600;

}

/*==================================================
        SMALL INFO BOX
==================================================*/

.info-box{

    display:flex;

    align-items:center;

    gap:15px;

    margin-top:20px;

    padding:18px;

    background:#fff7f3;

    border-left:5px solid #ff6b35;

    border-radius:12px;

}

.info-box span{

    font-size:28px;

}

.info-box h4{

    color:#333;

    margin-bottom:4px;

}

.info-box p{

    color:#777;

    font-size:14px;

}

/*==================================================
            CARD ANIMATION
==================================================*/

.checkout-box{

    transition:.35s;

}

.checkout-box:hover{

    transform:translateY(-3px);

    box-shadow:0 18px 35px rgba(0,0,0,.10);

}
/*==================================================
                PAYMENT BOX
==================================================*/

.payment-box{
    transition:.35s;
}

.payment-box:hover{
    transform:translateY(-3px);
    box-shadow:0 18px 35px rgba(0,0,0,.10);
}

.payment-subtitle{
    color:#777;
    font-size:14px;
    margin-top:-10px;
    margin-bottom:25px;
}

/*==================================================
                PAYMENT CARD
==================================================*/

.payment-card{
    display:block;
    margin-bottom:18px;
    cursor:pointer;
}

.payment-card input{
    display:none;
}

.payment-content{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:18px;

    border:2px solid #ececec;

    border-radius:15px;

    background:#fff;

    transition:.30s;

}

.payment-left{

    display:flex;

    align-items:center;

    gap:18px;

}

.payment-icon{

    width:62px;

    height:62px;

    border-radius:14px;

    background:#fff4ef;

    display:flex;

    justify-content:center;

    align-items:center;

}

.payment-icon img{

    width:42px;

    height:42px;

    object-fit:contain;

}

.payment-details h4{

    font-size:17px;

    margin-bottom:4px;

    color:#222;

}

.payment-details p{

    font-size:14px;

    color:#777;

}

.payment-badge{

    padding:7px 14px;

    border-radius:25px;

    background:#eaf8ec;

    color:#28a745;

    font-size:12px;

    font-weight:600;

}

.payment-card input:checked + .payment-content{

    border-color:#ff6b35;

    background:#fff7f3;

    box-shadow:0 8px 25px rgba(255,107,53,.15);

}

.payment-content:hover{

    border-color:#ff6b35;

}

/*==================================================
                SECURITY
==================================================*/

.payment-security{

    margin-top:22px;

    display:flex;

    align-items:center;

    gap:10px;

    background:#eef9ef;

    padding:15px;

    border-radius:12px;

    color:#28a745;

    font-size:14px;

    font-weight:600;

}

/*==================================================
                SUMMARY BOX
==================================================*/

.summary-box{

    position:sticky;

    top:110px;

    transition:.35s;

}

.summary-box:hover{

    transform:translateY(-3px);

    box-shadow:0 18px 35px rgba(0,0,0,.10);

}

.summary-title{

    display:flex;

    align-items:center;

    gap:12px;

    margin-bottom:25px;

    font-size:24px;

    font-weight:700;

}

.summary-item{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:16px 0;

    border-bottom:1px solid #efefef;

}

.item-name{

    width:50%;

    font-weight:600;

}

.item-qty{

    color:#777;

}

.item-total{

    color:#ff6b35;

    font-weight:700;

}

/*==================================================
                BILL
==================================================*/

.bill-details{

    margin-top:25px;

}

.bill-row{

    display:flex;

    justify-content:space-between;

    padding:14px 0;

    border-bottom:1px dashed #ddd;

    color:#555;

}

.grand-total-row{

    display:flex;

    justify-content:space-between;

    margin-top:18px;

    padding-top:18px;

    border-top:2px solid #ececec;

    font-size:24px;

    font-weight:700;

    color:#ff6b35;

}

/*==================================================
                OFFER BOX
==================================================*/

.offer-box{

    margin-top:20px;

    background:#edf9ef;

    padding:15px;

    border-radius:12px;

    color:#28a745;

    font-weight:600;

}

/*==================================================
                BUTTONS
==================================================*/

.place-order-btn{

    width:100%;

    margin-top:25px;

    padding:18px;

    border:none;

    border-radius:12px;

    background:#ff6b35;

    color:#fff;

    font-size:18px;

    font-weight:700;

    cursor:pointer;

    transition:.30s;

}

.place-order-btn:hover{

    background:#ea5a22;

    transform:translateY(-2px);

}

.back-cart-btn{

    display:block;

    text-align:center;

    margin-top:15px;

    padding:16px;

    border:2px solid #ff6b35;

    color:#ff6b35;

    text-decoration:none;

    border-radius:12px;

    font-weight:700;

    transition:.30s;

}

.back-cart-btn:hover{

    background:#ff6b35;

    color:#fff;

}

/*==================================================
                RESPONSIVE
==================================================*/

@media(max-width:992px){

.checkout-wrapper{

grid-template-columns:1fr;

}

.summary-box{

position:static;

}

.form-row{

grid-template-columns:1fr;

}

.checkout-steps{

width:100%;

}

.navbar{

flex-direction:column;

gap:18px;

padding:20px;

}

.nav-links{

flex-wrap:wrap;

justify-content:center;

}

}

@media(max-width:600px){

.checkout-heading h1{

font-size:32px;

}

.section-title{

font-size:21px;

}

.logo{

font-size:28px;

}

.payment-content{

flex-direction:column;

align-items:flex-start;

gap:15px;

}

.payment-left{

width:100%;

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

.logo:hover .flavor{

    color:#ffb347;

}

.logo:hover .feet{

    color:#ff6b35;

}
</style>
</head>

<body>
<!-- =================== NAVBAR =================== -->





<!-- =================== CHECKOUT =================== -->

<div class="checkout-container">

    <div class="checkout-heading">

        <h1>Checkout</h1>

        <p>Confirm your Delivery Details and Place Your Order</p>

    </div>

<%

Cart cart=(Cart)session.getAttribute("cart");
Integer restaurantId=(Integer)session.getAttribute("restaurantId");

double grandTotal=0;
double deliveryFee=40;
double platformFee=5;

if(cart!=null && !cart.getItems().isEmpty()){

    for(CartItem item:cart.getItems().values()){

        grandTotal+=item.getTotalPrice();

    }

    double finalAmount=grandTotal+deliveryFee+platformFee;

%>

<form action="PlaceOrderServlet" method="post">









<div class="checkout-wrapper">

    <!-- ================= LEFT COLUMN ================= -->

    <div class="left-column">

        <!-- ================= DELIVERY CARD ================= -->

        <div class="checkout-box">

            <div class="delivery-header">

                <h2 class="section-title">

                    <span class="section-icon">📍</span>

                    Delivery Details

                </h2>

                <span class="delivery-badge">

                    Fast Delivery

                </span>

            </div>

            <div class="info-box">

                <span>🚚</span>

                <div>

                    <h4>Delivering to your doorstep</h4>

                    <p>
                        Please provide the correct delivery information for faster order processing.
                    </p>

                </div>

            </div>

            <br>

            <div class="form-group">

                <label>Full Name</label>

                <input
                type="text"
                name="customerName"
                placeholder="Enter your Full Name"
                required>

            </div>

            <div class="form-group">

                <label>Mobile Number</label>

                <input
                type="text"
                name="mobileNumber"
                placeholder="Enter Mobile Number"
                required>

            </div>

            <div class="form-group">

                <label>Delivery Address</label>

                <textarea
                name="address"
                placeholder="House No, Street, Area, Landmark"
                required></textarea>

            </div>

            <div class="form-row">

                <div class="form-group">

                    <label>City</label>

                    <input
                    type="text"
                    name="city"
                    placeholder="Enter City"
                    required>

                </div>

                <div class="form-group">

                    <label>Pincode</label>

                    <input
                    type="text"
                    name="pincode"
                    placeholder="Enter Pincode"
                    required>

                </div>

            </div>

        </div>

        <!-- ================= PAYMENT CARD ================= -->

        <div class="payment-box">

            <h2 class="section-title">

                <span class="section-icon">💳</span>

                Payment Method

            </h2>

            <p class="payment-subtitle">

                Select your preferred payment option

            </p>


<!-- ================= CASH ON DELIVERY ================= -->

<label class="payment-card">

    <input
    type="radio"
    name="paymentMode"
    value="Cash on Delivery"
    required>

    <div class="payment-content">

        <div class="payment-left">

            <div class="payment-icon">
                <img src="images/payments/cod.png">
            </div>

            <div class="payment-details">

                <h4>Cash on Delivery</h4>

                <p>Pay when your food arrives at your doorstep</p>

            </div>

        </div>

        <span class="payment-badge">
            Available
        </span>

    </div>

</label>


<!-- ================= UPI ================= -->

<label class="payment-card">

    <input
    type="radio"
    name="paymentMode"
    value="UPI">

    <div class="payment-content">

        <div class="payment-left">

            <div class="payment-icon">
                <img src="images/payments/upi.png">
            </div>

            <div class="payment-details">

                <h4>UPI Payment</h4>

                <p>Google Pay • PhonePe • Paytm • BHIM</p>

            </div>

        </div>

        <span class="payment-badge">
            Recommended
        </span>

    </div>

</label>


<!-- ================= CREDIT CARD ================= -->

<label class="payment-card">

    <input
    type="radio"
    name="paymentMode"
    value="Credit Card">

    <div class="payment-content">

        <div class="payment-left">

            <div class="payment-icon">
                <img src="images/payments/credit-card.png">
            </div>

            <div class="payment-details">

                <h4>Credit Card</h4>

                <p>Visa • Mastercard • RuPay</p>

            </div>

        </div>

        <span class="payment-badge">

            Secure

        </span>

    </div>

</label>


<!-- ================= DEBIT CARD ================= -->

<label class="payment-card">

    <input
    type="radio"
    name="paymentMode"
    value="Debit Card">

    <div class="payment-content">

        <div class="payment-left">

            <div class="payment-icon">
                <img src="images/payments/debit-card.png">
            </div>

            <div class="payment-details">

                <h4>Debit Card</h4>

                <p>All Major Banks Supported</p>

            </div>

        </div>

        <span class="payment-badge">

            Secure

        </span>

    </div>

</label>


<!-- ================= NET BANKING ================= -->

<label class="payment-card">

    <input
    type="radio"
    name="paymentMode"
    value="Net Banking">

    <div class="payment-content">

        <div class="payment-left">

            <div class="payment-icon">
                <img src="images/payments/netbanking.png">
            </div>

            <div class="payment-details">

                <h4>Net Banking</h4>

                <p>Fast & Secure Internet Banking</p>

            </div>

        </div>

        <span class="payment-badge">

            Safe

        </span>

    </div>

</label>


<div class="payment-security">

    🔒 Your payment information is encrypted and completely secure.

</div>

</div>
</div> <!-- End left-column -->

<!-- ================= RIGHT COLUMN ================= -->

<div class="summary-box">

    <h2 class="summary-title">

        🛍 Order Summary

    </h2>
<%

for(CartItem item : cart.getItems().values()){

%>

<div class="summary-item">

    <div class="item-name">

        <%=item.getName()%>

    </div>

    <div class="item-qty">

        x <%=item.getQuantity()%>

    </div>

    <div class="item-total">

        ₹<%=item.getTotalPrice()%>

    </div>

</div>

<%

}

%>


<div class="bill-details">

    <div class="bill-row">

        <span>Item Total</span>

        <span>₹<%=grandTotal%></span>

    </div>

    <div class="bill-row">

        <span>Delivery Fee</span>

        <span>₹<%=deliveryFee%></span>

    </div>

    <div class="bill-row">

        <span>Platform Fee</span>

        <span>₹<%=platformFee%></span>

    </div>

    <div class="grand-total-row">

        <span>Total Amount</span>

        <span>₹<%=finalAmount%></span>

    </div>

</div>



<div class="offer-box">

    🎉 Congratulations!

    <br><br>

    Your order is eligible for

    <strong>Fast Delivery</strong>.

</div>



<div class="payment-security">

    🔐 100% Secure Checkout

</div>

<%

session.setAttribute("totalAmount",finalAmount);

%>

<input
type="hidden"
name="restaurantId"
value="<%=restaurantId%>">

<input
type="hidden"
name="totalAmount"
value="<%=finalAmount%>">

<button
type="submit"
class="place-order-btn">

🛒 Place Order

</button>

<a
href="cart.jsp"
class="back-cart-btn">

← Back to Cart

</a>

</div>

</form>

<%

}else{

%>

<!-- ================= EMPTY CART ================= -->

<div class="empty-checkout">

<h1>🛒</h1>
<h2>Your Cart is Empty</h2>
<p>Add delicious food before placing your order.</p>
<a href="callRestaurantServlet" class="browse-btn">Browse Restaurants</a>

</div>

<%

}

%>

</div>
<script src="theme.js"></script>

</body>

</html>