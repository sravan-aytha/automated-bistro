
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    <style>
body
{
background-image:url("data:image/jpeg;base64,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");
background-size:cover;
position:relative;
}
h1
{
text-align:center;
color:#ecfc03;
margin-top:20px;
}
table{
   
   text-align:center;
   border:2px solid orange; 
   margin-left:300px;
   margin-top:50px;
   border-radius:10px;
   border-collapse: collapse;
}
th,td{
   border:3px solid #ecfc03; 
   width:300px;
   height:40px;
   font-size:24px;
}
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

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Total Order History</title>
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
						  <a class="dropdown-item" href="deliveries.jsp">Display delivery's</a>
						  
						  <div class="dropdown-divider"></div>
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
        <h1><br/><br/>T O T A L &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O R D E R  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;H I S T O R Y</h1>
<table>
<tr>
<th> ORDER NUMBER </th>
<th> ORDERED TABLE </th>
<th> ORDER DESCRIPTION</th>
<th> ORDER VALUE</th>
<th> ORDER DATE </th>
</tr>
<%
try{
    int i=1;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con =DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root", "");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from total_order_history");
    while(rs.next())
    {
%>
<tr>
        <td><%out.println(rs.getInt(1));%></td>
        <td><%out.println(rs.getString(2));%></td>
        <td><%out.println(rs.getString(3));%></td>
        <td><%out.println(rs.getInt(4));%></td>
        <td><%out.println(rs.getDate(5));%></td>
</tr> 

<%
    i++;
    }
} catch(Exception e)
{
out.println(e.getMessage());
}



%>

</table>

    </body>
</html>
