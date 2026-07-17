<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tap.Model.user"%>

<%
List<user> customerList =
(List<user>)request.getAttribute("customerList");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Manage Customers | FlavorFeet Admin</title>

<style>

*{

margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;

}

body{

background:linear-gradient(135deg,#fff8f3,#f5f7fb);
padding:20px;

}

/*================ HEADER =================*/

.header{

background:white;

padding:20px 40px;

display:flex;

justify-content:space-between;

align-items:center;

box-shadow:0 3px 10px rgba(0,0,0,.08);

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

padding:12px 22px;

text-decoration:none;

border-radius:8px;

font-weight:bold;

transition:.3s;

}

.back-btn:hover{

background:#e85b2b;

}

/*================ PAGE TITLE =================*/

.page-title{

text-align:center;

padding:35px;

}

.page-title h1{

font-size:40px;

color:#333;

margin-bottom:10px;

}

.page-title p{

font-size:18px;

color:#777;

}

/*================ SEARCH =================*/

.search-box{

width:95%;

max-width:1400px;

margin:auto;

display:flex;

justify-content:flex-end;

margin-bottom:25px;

}

.search-box input{

width:320px;

padding:12px 18px;

border:1px solid #ddd;

border-radius:8px;

outline:none;

font-size:15px;

}

/*================ CONTAINER =================*/

.container{

width:95%;

max-width:1400px;

margin:auto;

}

.flavor{

    color:#FF6B35;

    font-weight:800;

}

.feet{

    color:#C1121F;

    font-weight:800;
}

</style>

</head>

<body>

<!--================ HEADER =================-->

<div class="header">

<div class="logo">

<span class="flavor">Flavor</span><span class="feet">Feet</span>

</div>

<a href="AdminDashboardServlet" class="back-btn">

🏠 Dashboard

</a>

</div>

<!--================ TITLE =================-->

<div class="page-title">

<h1>

👥 Manage Customers

</h1>

<p>

View and manage registered customers

</p>

</div>

<!--================ SEARCH =================-->

<div class="search-box">

<input

type="text"

id="searchCustomer"

placeholder="Search Customer..."

onkeyup="searchCustomer()">

</div>

<div class="container">

<style>

/*================ TABLE =================*/

.table-container{

background:#fff;

border-radius:18px;

overflow:hidden;

box-shadow:0 8px 25px rgba(0,0,0,.08);

}

table{

width:100%;

border-collapse:collapse;

}

thead{

background:#ff6b35;

color:white;

}

thead th{

padding:18px;

text-align:left;

font-size:16px;

}

tbody td{

padding:16px;

border-bottom:1px solid #eee;

vertical-align:middle;

}

tbody tr:hover{

background:#fff7f2;

}

/*================ ROLE =================*/

.role{

background:#3498db;

color:white;

padding:6px 14px;

border-radius:20px;

font-size:13px;

font-weight:bold;

}

/*================ BUTTONS =================*/

.action-btn{

padding:10px 18px;

border:none;

border-radius:8px;

color:white;

cursor:pointer;

font-weight:bold;

margin-right:8px;

transition:.3s;

}

.edit{

background:#3498db;

}

.edit:hover{

background:#2980b9;

}

.delete{

background:#e74c3c;

}

.delete:hover{

background:#c0392b;

}

@media(max-width:1200px){

.table-container{

overflow-x:auto;

}

table{

min-width:1200px;

}

}


.action-btn.view{

    background:#3498db;

    color:white;

}

.action-btn.view:hover{

    background:#2980b9;

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


</style>

<div class="table-container">

<table id="customerTable">

<thead>

<tr>

<th>User ID</th>

<th>Customer Name</th>

<th>Email</th>

<th>Address</th>

<th>Role</th>

<th>Edit</th>

<th>Delete</th>

</tr>

</thead>

<tbody>

<%

if(customerList!=null){

for(user customer : customerList){

%>

<tr>

<td>

<%=customer.getUserId()%>

</td>

<td>

<%=customer.getUserName()%>

</td>

<td>

<%=customer.getEmail()%>

</td>

<td>

<%=customer.getAdress()%>

</td>

<td>

<span class="role">

<%=customer.getRole()%>

</span>

</td>




<td>

<a href="ViewCustomerServlet?userId=<%=customer.getUserId()%>">

<button class="action-btn view">

View

</button>

</a>

&nbsp;

<a href="EditCustomerServlet?userId=<%=customer.getUserId()%>">

<button class="action-btn edit">

Edit

</button>

</a>

</td>

<td>

<a

href="DeleteCustomerServlet?userId=<%=customer.getUserId()%>"

onclick="return confirm('Delete this customer?')">

<button class="action-btn delete">

Delete

</button>

</a>

</td>

</tr>

<%

}

}

%>
</tbody>

</table>

</div>

</div>

<script>

function searchCustomer(){

    let input = document.getElementById("searchCustomer").value.toLowerCase();

    let table = document.getElementById("customerTable");

    let tr = table.getElementsByTagName("tr");

    for(let i = 1; i < tr.length; i++){

        let td = tr[i].getElementsByTagName("td");

        if(td.length > 0){

            let name = td[1].innerText.toLowerCase();

            let email = td[2].innerText.toLowerCase();

            let address = td[3].innerText.toLowerCase();

            let role = td[4].innerText.toLowerCase();

            if(name.includes(input) ||
               email.includes(input) ||
               address.includes(input) ||
               role.includes(input)){

                tr[i].style.display = "";

            }
            else{

                tr[i].style.display = "none";

            }

        }

    }

}

</script>

</body>

</html>