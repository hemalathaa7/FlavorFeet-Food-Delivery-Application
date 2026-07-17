<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String transactionId = (String) request.getAttribute("transactionId");
Double amount = (Double) request.getAttribute("amount");

Integer orderId = (Integer) session.getAttribute("orderId");

if(transactionId == null){
    transactionId = "TXN202607130001";
}

if(amount == null){
    amount = 0.0;
}

if(orderId == null){
    orderId = 0;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Successful</title>

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

}

.card{

width:520px;
background:white;
border-radius:20px;
padding:40px;
text-align:center;
box-shadow:0 15px 35px rgba(0,0,0,.15);

}

.tick{

width:110px;
height:110px;
margin:auto;
background:#27ae60;
border-radius:50%;
display:flex;
justify-content:center;
align-items:center;
font-size:60px;
color:white;
animation:pop .6s;

}

@keyframes pop{

0%{

transform:scale(0);

}

100%{

transform:scale(1);

}

}

h1{

margin-top:25px;
color:#27ae60;

}

.amount{

font-size:38px;
font-weight:bold;
color:#fc8019;
margin:25px 0;

}

.info{

text-align:left;
margin-top:25px;

}

.info p{

font-size:18px;
margin:15px 0;

}

.delivery{

margin-top:30px;
padding:15px;
background:#fff3e0;
border-radius:10px;
color:#ff6600;
font-weight:600;

}

.redirect{

margin-top:35px;
font-size:18px;

}

#count{

font-size:34px;
font-weight:bold;
color:#fc8019;

}

</style>

<script>

let sec=3;

function startCountdown(){

let timer=setInterval(function(){

document.getElementById("count").innerHTML=sec;

sec--;

if(sec<0){

clearInterval(timer);

// Change this page if required
window.location="success.jsp";

}

},1000);

}

</script>

</head>

<body onload="startCountdown()">

<div class="card">

<div class="tick">

✓

</div>

<h1>Payment Successful</h1>

<div class="amount">

₹ <%=amount%>

</div>

<div class="info">

<p><b>Order ID :</b> #<%=orderId%></p>

<p><b>Transaction ID :</b> <%=transactionId%></p>

<p><b>Status :</b> SUCCESS</p>

<p><b>Payment Mode :</b> UPI</p>

</div>

<div class="delivery">

Estimated Delivery Time : 30 Minutes 🚴

</div>

<div class="redirect">

Redirecting...

<br><br>

<div id="count">3</div>

</div>

</div>

</body>
</html>