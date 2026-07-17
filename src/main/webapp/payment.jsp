<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Integer orderId = (Integer) session.getAttribute("orderId");
Integer userId = (Integer) session.getAttribute("userId");
Double totalAmount = (Double) session.getAttribute("totalAmount");

if(orderId == null){
    orderId = 1001;
}

if(userId == null){
    userId = 1;
}

if(totalAmount == null){
    totalAmount = 649.00;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FlavorFeet | Secure Payment</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{

background:#f5f5f5;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
overflow:hidden;
padding:15px;

}

.payment-container{

width:900px;
max-height:95vh;
background:white;
border-radius:18px;
display:flex;
overflow:hidden;
box-shadow:0 15px 35px rgba(0,0,0,.15);

}

.left{

width:50%;
padding:20px 30px;
background:white;

display:flex;
flex-direction:column;
justify-content:center;

}

.right{

width:50%;
background:#fc8019;
display:flex;
justify-content:center;
align-items:center;
flex-direction:column;
color:white;

}

h2{

margin-bottom:25px;
font-size:28px;

}

.info{

margin-bottom:18px;
font-size:18px;

}

.amount{

font-size:40px;
font-weight:bold;
color:#fc8019;
margin:20px 0;

}

.qr{

width:180px;
height:180px;

}

.upi{

margin-top:20px;
display:flex;
justify-content:center;
gap:20px;

}

.upi img{

width:45px;
height:45px;
object-fit:contain;
transition:.3s;

}

.upi img:hover{

transform:scale(1.15);

}

button{

    width:100%;
    padding:14px 20px;
    border:none;
    border-radius:10px;
    background:#fc8019;
    color:white;
    font-size:18px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;

}

button:hover{

    background:#e96d0c;
    transform:translateY(-2px);
    box-shadow:0 8px 18px rgba(252,128,25,0.35);

}

button:active{

    transform:scale(0.98);

}

.secure{

margin-top:20px;
color:green;
font-weight:600;

}

.right h3{

font-size:30px;
margin-bottom:20px;

}

.right p{

font-size:18px;
margin:8px 0;

}

.steps{

margin-top:15px;

}

.steps p{

margin:6px 0;

}


.loader{

width:60px;
height:60px;

border:6px solid #ddd;

border-top:6px solid #fc8019;

border-radius:50%;

margin:20px auto;

animation:spin 1s linear infinite;

}

@keyframes spin{

100%{

transform:rotate(360deg);

}

}

.payment-note{

    margin-top:8px;
    margin-bottom:8px;
    padding:10px;
    background:#fff8e8;
    border-left:5px solid #fc8019;
    border-radius:10px;
    text-align:center;
    color:#555;
    font-size:15px;
    line-height:24px;

}

.payment-note strong{

    color:#222;

}
</style>

</head>

<body>

<div class="payment-container">

<div class="left">

<h2>Secure Payment</h2>

<div class="info">
<b>Order ID :</b> #<%=orderId%>
</div>

<div class="info">
<b>User ID :</b> <%=userId%>
</div>

<div class="amount">
₹ <%=totalAmount%>
</div>

<center>

<img class="qr" src="images/payment/upi-qr.png">

</center>

<div class="upi">

    <img src="images/payment/gpay.png" alt="Google Pay">

    <img src="images/payment/phonepe.png" alt="PhonePe">

    <img src="images/payment/paytm.png" alt="Paytm">

</div>

<div class="payment-note">

    <p><strong>Complete the payment using any UPI app.</strong></p>

    <p>After successful payment, click <b>"Verify Payment"</b> to continue.</p>

</div>

<div id="loadingBox" style="display:none;">

    <h3 style="color:#fc8019;text-align:center;">
        Checking Payment...
    </h3>

    <div class="loader"></div>

    <p id="countDown" style="text-align:center;"></p>

</div>

<button id="payBtn"
        type="button"
        onclick="startPayment()">

✔ Verify Payment

</button>

<form id="paymentForm"
      action="PaymentServlet"
      method="post">

    <input type="hidden" name="orderId" value="<%=orderId%>">
    <input type="hidden" name="userId" value="<%=userId%>">
    <input type="hidden" name="amount" value="<%=totalAmount%>">

</form>

</div>

<div class="right">

<h3>FlavorFeet</h3>

<p>Scan QR using</p>

<p>Google Pay</p>

<p>PhonePe</p>

<p>Paytm</p>

<div class="steps">

<p>① Open any UPI App</p>

<p>② Scan QR Code</p>

<p>③ Complete Payment</p>

<p>④ Click Verify Payment</p>

<p>⑤ Enjoy your food 🍕</p>

</div>

</div>

</div>




<script>

function startPayment(){

document.getElementById("payBtn").style.display="none";

document.getElementById("loadingBox").style.display="block";

let sec=5;

let timer=setInterval(function(){

document.getElementById("countDown").innerHTML=

"Payment verification in "+sec+" sec...";

sec--;

if(sec<0){

clearInterval(timer);

document.getElementById("paymentForm").submit();

}

},1000);

}

</script>

</body>
</html>