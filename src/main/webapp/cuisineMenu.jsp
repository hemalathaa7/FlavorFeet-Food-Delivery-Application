<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.tap.Model.Menu" %>

<%
List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
%>

<style>
.menu-container{
    display:flex;
    flex-wrap:wrap;
    gap:25px;
    justify-content:center;
    margin-top:40px;
}

.menu-card{
    width:280px;
    background:#fff;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
}

.menu-card img{
    width:100%;
    height:200px;
    object-fit:cover;
}

.menu-info{
    padding:15px;
}

.menu-info h3{
    margin-bottom:8px;
}

.menu-info h4{
    color:#ff6b00;
}










.price{
    color: #ff5a00;
    font-size: 20px;
    font-weight: bold;
    margin-top: 10px;
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

.add-cart-btn{
    display:inline-flex;
    align-items:center;
    justify-content:center;

    margin:18px auto 20px;
    padding:12px 24px;

    background:linear-gradient(90deg,#ff7a18,#ff5a00);
    color:#fff;

    text-decoration:none;
    font-size:16px;
    font-weight:600;

    border-radius:30px;
    width:80%;

    box-shadow:0 6px 15px rgba(255,106,0,.3);
    transition:all .3s ease;
}

.add-cart-btn:hover{
    transform:translateY(-3px);
    box-shadow:0 10px 20px rgba(255,106,0,.4);
}
</style>

<div class="menu-container">

<%
for(Menu m : menuList){
%>

<div class="menu-card">
    <img src="<%= m.getImagePath() %>" alt="<%= m.getItemName() %>">

    <div class="menu-info">
        <h3><%= m.getItemName() %></h3>
        <p><%= m.getDescription() %></p>
<h4>₹<%= String.format("%.2f", m.getPrice()) %></h4>

<a href="cart?menuId=<%=m.getMenuId()%>&quantity=1"
   class="add-cart-btn">
    🛒 Add Cart
</a>
    </div>
</div>

<%
}
%>

</div>