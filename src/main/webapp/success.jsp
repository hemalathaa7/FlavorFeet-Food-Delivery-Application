<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Confirmed</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',Arial,sans-serif;
}

body{
    background:linear-gradient(135deg,#fff5f2,#ffe9df);
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.order-card{
    width:520px;
    background:#fff;
    border-radius:24px;
    padding:45px 40px;
    text-align:center;
    box-shadow:0 15px 40px rgba(0,0,0,.12);
}

.icon{
    width:100px;
    height:100px;
    margin:auto;
    border-radius:50%;
    background:#28c76f;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:55px;
    color:#fff;
}

h1{
    margin-top:25px;
    color:#222;
    font-size:32px;
}

.message{
    margin-top:12px;
    color:#666;
    font-size:17px;
    line-height:1.6;
}

.delivery-box{
    margin:30px 0;
    padding:18px;
    background:#fff6f2;
    border-radius:14px;
}

.delivery-box h3{
    color:#ff6b35;
    margin-bottom:8px;
}

.delivery-box p{
    color:#555;
    font-size:16px;
}

.buttons{
    display:flex;
    justify-content:center;
    gap:15px;
    margin-top:25px;
}

.btn{
    text-decoration:none;
    padding:14px 28px;
    border-radius:12px;
    font-weight:bold;
    transition:.3s;
}

.primary{
    background:#ff6b35;
    color:#fff;
}

.primary:hover{
    background:#e85a24;
    transform:translateY(-2px);
}

.secondary{
    border:2px solid #ff6b35;
    color:#ff6b35;
}

.secondary:hover{
    background:#ff6b35;
    color:#fff;
}

.footer{
    margin-top:25px;
    color:#888;
    font-size:14px;
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

<div class="order-card">

    <div class="icon">✓</div>

    <h1>Order Confirmed!</h1>

    <p class="message">
        Thank you for ordering with
        <strong>FlavorFeet</strong>.<br>
        Your delicious meal is now being prepared.
    </p>

    <div class="delivery-box">
        <h3>Estimated Delivery</h3>
        <p><strong>25 – 35 Minutes</strong></p>
    </div>

    <div class="buttons">
        <a href="callRestaurantServlet" class="btn primary">
            Continue Shopping
        </a>

        <a href="OrderHistoryServlet" class="btn secondary">
            View Orders
        </a>
    </div>

    <div class="footer">
        🍽️ Fresh Food • Fast Delivery • Enjoy Your Meal!
    </div>

</div>

</body>
</html>