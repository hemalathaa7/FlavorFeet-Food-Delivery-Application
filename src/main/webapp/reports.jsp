<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.tap.DAOImpl.RestaurantDAOImp" %>
<%@ page import="com.tap.DAOImpl.OrdersDAOImp" %>
<%@ page import="com.tap.DAOImpl.UserDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.Model.RestaurantPerformance" %>
<%@ page import="com.tap.Model.TopSellingItem"%>
<%@ page import="com.tap.DAOImpl.OrderItemDAOImp"%>



<%
RestaurantDAOImp restaurantDAO = new RestaurantDAOImp();

List<RestaurantPerformance> performance =
(List<RestaurantPerformance>)request.getAttribute("restaurantPerformance");

if(performance == null){
    OrdersDAOImp ordersDAO = new OrdersDAOImp();
    performance = ordersDAO.getRestaurantPerformance();
}

List<TopSellingItem> topItems =
(List<TopSellingItem>)request.getAttribute("topItems");

if(topItems == null){
    OrderItemDAOImp orderItemDAO = new OrderItemDAOImp();
    topItems = orderItemDAO.getTopSellingItems();
}

Double totalRevenue =
(Double)request.getAttribute("totalRevenue");

if(totalRevenue == null){
    OrdersDAOImp ordersDAO = new OrdersDAOImp();
    totalRevenue = ordersDAO.getTotalRevenue();
}

Integer orderCount =
(Integer)request.getAttribute("totalOrders");

if(orderCount == null){
    OrdersDAOImp ordersDAO = new OrdersDAOImp();
    orderCount = ordersDAO.getOrdersCount();
}

OrdersDAOImp ordersDAO = new OrdersDAOImp();

double[] weeklyRevenue = ordersDAO.getWeeklyRevenue();

int restaurantCount = restaurantDAO.getAllRestaurants().size();

UserDAOImpl userDAO = new UserDAOImpl();

int totalCustomers = userDAO.getTotalCustomers();

double todayRevenue = ordersDAO.getTodayRevenue();	
double weekRevenue = ordersDAO.getWeekRevenue();
double monthRevenue = ordersDAO.getMonthRevenue();

int placedCount = ordersDAO.getOrderCountByStatus("Placed");
int preparingCount = ordersDAO.getOrderCountByStatus("Preparing");
int deliveryCount = ordersDAO.getOrderCountByStatus("Out for Delivery");
int deliveredCount = ordersDAO.getOrderCountByStatus("Delivered");
int cancelledCount = ordersDAO.getOrderCountByStatus("Cancelled");


int newCustomers = 0;
int activeCustomers = 0;
int returningCustomers = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FlavorFeet | Reports</title>


<style>
body{

    margin:0;
    padding:25px;

    background:#f5f7fb;

    font-family:'Poppins',sans-serif;

}




/*==========================
    1.  REPORT BANNER
===========================*/

.reports-banner{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:35px 40px;

    margin-bottom:35px;

    border-radius:22px;

    background:linear-gradient(135deg,#ff6b35,#ff944d);

    color:white;

    box-shadow:0 15px 30px rgba(255,107,53,.25);

}

.banner-left h1{

    margin:15px 0 10px;

    font-size:38px;

}

.banner-left p{

    font-size:16px;

    opacity:.95;

    width:90%;

}

.report-badge{

    display:inline-block;

    padding:8px 18px;

    border-radius:30px;

    background:rgba(255,255,255,.18);

    font-size:14px;

}

.last-updated{

    display:flex;

    align-items:center;

    gap:15px;

    padding:18px 22px;

    border-radius:15px;

    background:rgba(255,255,255,.18);

}

.last-updated span{

    font-size:32px;

}

.last-updated h4{

    margin:0;

}

.last-updated p{

    margin-top:5px;

}
.report-card{

    display:flex;

    align-items:center;

    gap:20px;

    background:#fff;

    padding:28px;

    border-radius:18px;

    box-shadow:0 8px 20px rgba(0,0,0,.08);

    transition:.3s;

    border-left:6px solid #ff6b35;

}

.report-card:hover{

    transform:translateY(-6px);

    box-shadow:0 15px 30px rgba(255,107,53,.18);

}

.card-icon{

    width:70px;

    height:70px;

    border-radius:50%;

    display:flex;

    justify-content:center;

    align-items:center;

    background:#fff4ef;

    font-size:34px;

}

.report-card h2{

    color:#ff6b35;

    margin:0;

    font-size:34px;

}

.report-card p{

    margin-top:8px;

    color:#666;

}





/* ===========================
       2. SUMMARY CARDS
=========================== */

.report-cards{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(240px,1fr));

    gap:25px;

    margin-bottom:40px;

}

.report-card{

    background:#ffffff;

    border-radius:18px;

    padding:28px;

    text-align:center;

    box-shadow:0 8px 20px rgba(0,0,0,.08);

    transition:.3s;

    border-top:5px solid #ff6b35;

}

.report-card:hover{

    transform:translateY(-8px);

    box-shadow:0 15px 30px rgba(255,107,53,.18);

}

.report-card span{

    font-size:42px;

}

.report-card h2{

    margin:18px 0 10px;

    font-size:34px;

    color:#ff6b35;

}

.report-card p{

    color:#666;

    font-size:17px;

    font-weight:500;

}




/*=================================
       3. REPORT ROW
==================================*/

.report-row{

    display:grid;

    grid-template-columns:1fr 1fr;

    gap:30px;

    margin-bottom:30px;

}

.report-half{

    background:#fff;

    border-radius:20px;

    box-shadow:0 8px 20px rgba(0,0,0,.08);

    padding:25px;

}
@media(max-width:900px){

.report-row{

    grid-template-columns:1fr;

}

}
.report-section{

    background:#fff;

    padding:28px;

    border-radius:20px;

    margin-bottom:30px;

    box-shadow:0 8px 20px rgba(0,0,0,.08);

}
.report-half,
.report-section{

    transition:.3s;

}

.report-half:hover,
.report-section:hover{

    transform:translateY(-4px);

    box-shadow:0 15px 35px rgba(0,0,0,.12);

}


/*==========================
        CHARTS
==========================*/

.chart-row{

    display:grid;

    grid-template-columns:1fr 1fr;

    gap:30px;

    margin-bottom:30px;

}

.chart-card{

    background:#fff;
    

    padding:25px;

    border-radius:20px;

    box-shadow:0 8px 20px rgba(0,0,0,.08);

}

.chart-card h3{

    margin-bottom:20px;

    color:#2c3e50;

}

canvas{

    width:100% !important;

    height:330px !important;

}


@media(max-width:900px){

.chart-row{

grid-template-columns:1fr;

}


}


/*==============================
      CARD ANIMATION
===============================*/

.report-card,
.status-card,
.customer-card,
.revenue-card,
.chart-card,
.report-section{

    transition:all .35s ease;

}

.report-card:hover,
.status-card:hover,
.customer-card:hover,
.revenue-card:hover,
.chart-card:hover,
.report-section:hover{

    transform:translateY(-8px);

    box-shadow:0 20px 35px rgba(255,107,53,.18);

}




/*==============================================
     4. REPORT TABLE  (restaurant performance)
================================================*/

.table-responsive{

    overflow-x:auto;

}

.report-table{

    width:100%;

    border-collapse:collapse;

    background:#fff;

    border-radius:15px;

    overflow:hidden;

}

.report-table thead{

    background:#ff6b35;

    color:#fff;

}

.report-table th{

    padding:18px;

    text-align:center;

    font-size:16px;
     letter-spacing:.5px;
    

}

.report-table td{

    padding:18px;

    text-align:center;

    border-bottom:1px solid #ececec;

    font-size:15px;

}

.report-table tbody tr{

    transition:.3s;

}

.report-table tbody tr:hover{

    background:#fff5ef;

}

.report-table tbody tr:last-child td{

    border-bottom:none;

}
.revenue{

    color:#27ae60;

    font-weight:700;

}
.rating{

    background:#fff3cd;

    color:#d68910;

    padding:6px 12px;

    border-radius:20px;

    font-weight:600;

}
/*==============================
      PROGRESS BAR
===============================*/

.progress{

    width:100%;

    height:22px;

    background:#ececec;

    border-radius:20px;

    overflow:hidden;

}

.progress-bar{

    height:100%;

    background:linear-gradient(90deg,#ff6b35,#ff944d);

    color:#fff;

    font-size:12px;

    font-weight:600;

    display:flex;

    align-items:center;

    justify-content:center;

    border-radius:20px;

}


/*==============================
   5.   CUSTOMER GRID
===============================*/

.customer-grid{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));

    gap:22px;

}

/*==============================
      CUSTOMER CARD
===============================*/

.customer-card{

    background:#ffffff;

    padding:28px;

    border-radius:18px;

    text-align:center;

    box-shadow:0 8px 18px rgba(0,0,0,.08);

    transition:.3s;

    border-top:5px solid;

}

.customer-card:hover{

    transform:translateY(-6px);

    box-shadow:0 12px 25px rgba(0,0,0,.12);

}

.customer-icon{

    font-size:42px;

    margin-bottom:15px;

}

.customer-card h2{

    font-size:34px;

    margin-bottom:8px;

}

.customer-card p{

    color:#666;

    font-size:16px;

    font-weight:600;

}

/*==============================
      CARD COLORS
===============================*/

.total{

    border-color:#3498db;

}

.total h2{

    color:#3498db;

}

.new{

    border-color:#9b59b6;

}

.new h2{

    color:#9b59b6;

}

.active{

    border-color:#27ae60;

}

.active h2{

    color:#27ae60;

}

.returning{

    border-color:#ff6b35;

}

.returning h2{

    color:#ff6b35;

}





/*==============================
    6.  REPORT FILTER
===============================*/

.report-filter{

    display:flex;

    justify-content:space-between;

    align-items:flex-end;

    gap:20px;

    flex-wrap:wrap;

    margin-bottom:30px;

}

.filter-group{

    display:flex;

    flex-direction:column;

    flex:1;

    min-width:220px;

}

.filter-group label{

    margin-bottom:8px;

    font-weight:600;

    color:#444;

}

.filter-group input{

    padding:12px;

    border:1px solid #ddd;

    border-radius:10px;

    font-size:15px;

    outline:none;

    transition:.3s;

}

.filter-group input:focus{

    border-color:#ff6b35;

    box-shadow:0 0 8px rgba(255,107,53,.2);

}

/*==============================
      GENERATE BUTTON
===============================*/

.generate-btn{

    background:#ff6b35;

    color:white;

    border:none;

    padding:13px 28px;

    border-radius:10px;

    font-size:15px;

    font-weight:600;

    cursor:pointer;

    transition:.3s;

}

.generate-btn:hover{

    background:#e85b20;

}

/*==============================
      EXPORT BUTTONS
===============================*/

.export-buttons{

    display:flex;

    gap:18px;

    margin-top:30px;

    flex-wrap:wrap;

}

.export-buttons button{

    border:none;

    padding:14px 24px;

    border-radius:10px;

    font-size:15px;

    font-weight:600;

    cursor:pointer;

    transition:.3s;

}

/* PDF */

.pdf-btn{

    background:#e74c3c;

    color:white;

}

.pdf-btn:hover{

    background:#c0392b;

}

/* Excel */

.excel-btn{

    background:#27ae60;

    color:white;

}

.excel-btn:hover{

    background:#1e8449;

}

/* Print */

.print-btn{

    background:#3498db;

    color:white;

}

.print-btn:hover{

    background:#2874a6;

}

@media(max-width:768px){

.report-filter{

    flex-direction:column;

    align-items:stretch;

}

.filter-button{

    width:100%;

}

.generate-btn{

    width:100%;

}

.export-buttons{

    flex-direction:column;

}

.export-buttons button{

    width:100%;

}

}



.chart-card{
    height:420px;
}

.chart-card canvas{
    width:100% !important;
    height:320px !important;
}
















.section-title{

    display:flex;

    align-items:center;

    gap:12px;

    font-size:24px;

    font-weight:700;

    color:#2c3e50;

    margin-bottom:25px;

}

.section-title span{

    font-size:30px;

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


<!-- ===========================
    1.-Report Banner
=========================== -->


<div id="loader">

    <div class="spinner"></div>

</div>

<div class="reports-banner">

    <div class="banner-left">

        <span class="report-badge">
            📊 Analytics Dashboard
        </span>

        <h1>Reports & Analytics</h1>

        <p>
            Monitor your FlavorFeet business performance, revenue,
            customer activity and restaurant growth.
        </p>

    </div>

    <div class="banner-right">

        <div class="last-updated">

            <span>🕒</span>

            <div>

                <h4>Last Updated</h4>

                <p><%= new java.text.SimpleDateFormat("dd MMM yyyy | hh:mm a").format(new java.util.Date()) %></p>

            </div>

        </div>

    </div>

</div>



<!-- ===========================
      2. reports card
=========================== -->



<div class="report-cards">

    <div class="report-card">
        <span>🍽</span>

        <h2><%= restaurantCount %></h2>

        <p>Total Restaurants</p>
    </div>

    <div class="report-card">
        <span>👥</span>

        <h2><%= totalCustomers %></h2>
<p>Total Customers</p>
    </div>

    <div class="report-card">
        <span>📦</span>

        <h2><%= orderCount %></h2>

        <p>Total Orders</p>
    </div>

    <div class="report-card">
        <span>💰</span>

        <h2>₹<%= totalRevenue %></h2>

        <p>Total Revenue</p>
    </div>

</div>

<!-- ===========================
      3.. revenue report
=========================== -->





<div class="report-row">

    <div class="report-half">

        <!-- Revenue Report -->


<div class="report-section">

    <div class="section-title">
        💰 Revenue Report
    </div>

    <div class="revenue-grid">

        <div class="revenue-card">
            <h3>🌞 ₹ <%= todayRevenue %></h3>
            <p>Today's Revenue</p>
        </div>

        <div class="revenue-card">
            <h3>📅 ₹ <%= weekRevenue %></h3>
            <p>This Week</p>
        </div>

        <div class="revenue-card">
            <h3>🗓️ ₹ <%= monthRevenue %></h3>
            <p>This Month</p>
        </div>

        <div class="revenue-card total">
            <h3>💰 ₹ <%= totalRevenue %></h3>
            <p>Overall Revenue</p>
        </div>

    </div>

</div>
    </div>
    
    
    
    
    
    <div class="chart-row">

    <div class="chart-card">

        <h3>📈 Revenue Overview</h3>

        <canvas id="revenueChart"></canvas>

    </div>

    <div class="chart-card">

        <h3>📦 Order Status</h3>

        <canvas id="orderChart"></canvas>

    </div>

</div>

























    </div>

<!-- ===========================
     4. RESTAURANT PERFORMANCE
=========================== -->

<div class="report-section">

    <div class="section-title">
        🏆 Restaurant Performance
    </div>

    <div class="table-responsive">

        <table class="report-table">

            <thead>

                <tr>
                    <th>Restaurant</th>
                    <th>Total Orders</th>
                    <th>Revenue</th>
                    <th>Rating</th>
                </tr>

            </thead>

          <tbody>

<tbody>



<%
for(RestaurantPerformance r : performance){
%>



<tr>
    <td><%= r.getRestaurantName() %></td>
    <td><%= r.getTotalOrders() %></td>
    <td>₹ <%= String.format("%.2f", r.getRevenue()) %></td>
    <td>⭐ <%= r.getRating() %></td>
</tr>

<%
}
%>

</tbody>

</tbody>

        </table>

    </div>

</div>
<!-- ===========================
    5.  TOP SELLING MENU ITEMS
=========================== -->

<div class="report-section">

    <div class="section-title">
        🍔 Top Selling Menu Items
    </div>

    <div class="table-responsive">

        <table class="report-table">

            <thead>

                <tr>
                    <th>Menu Item</th>
                    <th>Restaurant</th>
                    <th>Orders</th>
                    <th>Revenue</th>
                    <th>Quantity Sold</th>
                </tr>

            </thead>

            <tbody>

                
<tbody>

<%
for(TopSellingItem item : topItems){
%>

<tr>

<td><%= item.getItemName() %></td>

<td><%= item.getRestaurantName() %></td>

<td><%= item.getQuantitySold() %></td>

<td>₹ <%= String.format("%.2f", item.getRevenue()) %></td>


<td>
<%
int sold = item.getQuantitySold();

if(sold >= 20){
%>
🔥 Very High
<%
}else if(sold >= 10){
%>
⭐ High
<%
}else if(sold >= 5){
%>
👍 Medium
<%
}else{
%>
🆕 New
<%
}
%>
</td>
</tr>

<%
}
%>

</tbody>
                    

            </tbody>

        </table>

    </div>

</div>

<!-- ===========================
    5.  CUSTOMER STATISTICS
=========================== -->

<!----!<div class="report-section">

    <div class="section-title">
        👥 Customer Statistics
    </div>

    <div class="customer-grid">

        <div class="customer-card total">
            <div class="customer-icon">👥</div>

<h3><%= totalCustomers %></h3>            <p>Total Customers</p>
        </div>

        <div class="customer-card new">

            <div class="customer-icon">🆕</div>

<h3><%=request.getAttribute("newCustomers")%></h3>
            <p>New Customers</p>

        </div>

        <div class="customer-card active">

            <div class="customer-icon">🟢</div>

<h3><%=request.getAttribute("activeCustomers")%></h3>
            <p>Active Customers</p>

        </div>

        <div class="customer-card returning">

            <div class="customer-icon">🔁</div>

<h3><%=request.getAttribute("returningCustomers")%></h3>
            <p>Returning Customers</p>

        </div>

    </div>

</div>-----!>


<!-- ===========================
      REPORT FILTER & EXPORT
=========================== -->

<div class="report-section">

    <div class="section-title">
        📅 Filter & Export Reports
    </div>

    <form action="ReportsServlet" method="get">

        <div class="report-filter">

            <div class="filter-group">
                <label>From Date</label>
                <input type="date" name="fromDate">
            </div>

            <div class="filter-group">
                <label>To Date</label>
                <input type="date" name="toDate">
            </div>

            <div class="filter-button">

                <button type="submit" class="generate-btn">
                    📊 Generate Report
                </button>

            </div>

        </div>

    </form>

    <hr>

    <div class="export-buttons">

      <!-- -- --  <button class="pdf-btn">
            📄 Download PDF
        </button>

        <button class="excel-btn">
            📊 Export Excel
        </button>---->

        <button class="print-btn" onclick="window.print();">
            🖨 Print Report
        </button>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>






<script>
const revenueCtx = document.getElementById("revenueChart");

new Chart(revenueCtx, {
    type: "bar",
    data: {
        labels: ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"],
        datasets: [{
            label: "Revenue",
            data:[
                <%= weeklyRevenue[0] %>,
                <%= weeklyRevenue[1] %>,
                <%= weeklyRevenue[2] %>,
                <%= weeklyRevenue[3] %>,
                <%= weeklyRevenue[4] %>,
                <%= weeklyRevenue[5] %>,
                <%= weeklyRevenue[6] %>
            ],
            	backgroundColor: [
                "#ff7043",
                "#ff8a65",
                "#ffb74d",
                "#ffd54f",
                "#ffab40",
                "#ff9800",
                "#ff7043"
            ],
            borderRadius: 8
        }]
    },
    options: {
        responsive:true,
        maintainAspectRatio:false,
        plugins:{
            legend:{
                display:false
            }
        },
        scales:{
            y:{
                beginAtZero:true,
                grid:{
                    color:"#eeeeee"
                }
            },
            x:{
                grid:{
                    display:false
                }
            }
        }
    }
});
</script>


<script>
const orderCtx = document.getElementById("orderChart");

new Chart(orderCtx,{
    type:"pie",
    data:{
        labels:[
            "Placed",
            "Preparing",
            "Out for Delivery",
            "Delivered",
            "Cancelled"
        ],
        datasets:[{
            data:[
                <%= placedCount %>,
                <%= preparingCount %>,
                <%= deliveryCount %>,
                <%= deliveredCount %>,
                <%= cancelledCount %>
            ],
        		backgroundColor:[
                "#3498db",
                "#f39c12",
                "#9b59b6",
                "#27ae60",
                "#e74c3c"
            ]
        }]
    },
    options:{
        responsive:true,
        maintainAspectRatio:false
    }
});
</script>

</body>
</html>