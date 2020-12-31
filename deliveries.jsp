<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
             body{
background-image:url("https://i.pinimg.com/736x/7c/b1/86/7cb18679659f791b1191bea97b74dfc0.jpg");
background-size:cover;
}
th,td{
text-align:center;
width:200px;
height:78px;
font-size:25px;
font-family:arial;
color:white;
border:3px solid white;
max-width:250px;
word-wrap: break-word;
}
table{
margin-left:50px;
margin-top:50px;
border:10px solid white;
border-collapse: collapse;
}
input[type=submit]
{
width:150px;
height:50px;
background-color:red;
color:white;
font-size:20px;
border:2px solid white;
border-radius:10px;
}
input[type=submit]:hover
{
box-shadow: 5px 5px 5px #888888;
}
h1
{
margin-bottom:-60px;    
color:white;
margin-left:400px;
}/*
img
{
 float:right;
  border-radius:50%;
  opacity:0.9;
 }*/
 .food-munch-logo {
    height: 80px;
    width: 70px;
}

#navitem1 {
    color: black;
}

#navitem2 {
    color: black;
}

#navitem3 {
    color: black;
}

#navitem4 {
    color: black;
}

        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/food-munch-img.png" class="food-munch-logo" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ml-auto">
                    <a class="nav-link active" href="management.html" id="navitem1">
                        Home
                        <span class="sr-only">(current)</span>
                    </a>
                    <a class="nav-link" href="menu.html" id="navitem1">User's</a>
                    <a class="nav-link" href="management_music_dispaly.jsp" target="_blank" id="navitem1">Music</a>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						  Deliveries
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						 					  <a class="dropdown-item" href="cancel_delivery.html">Cancel Deliveries</a>
						</div>
					  </li>
                    <!--<a class="nav-link" href="salary_page.jsp" id="navitem1">Incentives</a>-->
                    <a class="nav-link" href="salary_page.jsp" id="navitem1">Incentives</a>
                    <a class="nav-link" href="user_reviews.jsp" id="navitem1">User reviews</a>
                     <a class="nav-link" href="feedback_display.jsp" id="navitem1">Feedbacks</a>
                    <a class="nav-link" href="management_cooking_page2.jsp" id="navitem1">Chef's page</a>
                   
                    <a class="nav-link" href="index.html" id="navitem1">Logout</a>
                    </div>
            </div>
        </div>
        </nav>
        <br><br><br><br>   <%
      try
    {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
           Statement st=con.createStatement();
           ResultSet rs1=st.executeQuery("select*from deliveries where status!='delivered' and status!='cancelled'");
           %>
           <table>
               
               <tr>
               <th>Delivery ID</th>
               <th>Items</th>
               <th>Description</th>
               <th>Priority</th>
               <th>Status</th>
               <th>Delivery Status</th>
               </tr>
               <%
               while(rs1.next())
               {%>
               <tr>
                   <td><%out.println(rs1.getInt(1));%></td>
                   <td><%out.println(rs1.getString(2));%></td>
                   <td><%out.println(rs1.getString(3));%></td>
                   <td><%out.println(rs1.getString(4));%></td>
                   <td><%out.println(rs1.getString(5));%></td>
                   <td><form action="delivery.jsp" method="post"><input type="text" hidden="hidden" value=<%out.println(rs1.getString(1));%>  name="table" /><input type="submit"   value="delivered" ></form></td>
               </tr>
               <%}
               %>
           </table>
    <%}catch(Exception e)
    {
        
    }
      
      
      
      
      
      
      
      
      
      
      %>
    </body>
</html>
