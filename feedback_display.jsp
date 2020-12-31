<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
       
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

        <style>
            div.disabled {
    overflow-x: hidden; 
    overflow-y: scroll; 
}
            body{
                background-image:url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZLhqi-djVWfIghHGei0xQGJnXi3tBS3TaJw&usqp=CAU');
                background-size: cover;   
                overflow-x: hidden;
            }
            .container1{
                float:left;
                margin-left:-450px;
            }
            
            .container2
            {
                float:left;
                margin-top:-370px;
                margin-left:300px;
                
            }
            .container3
            {
                float:left;
                margin-left:-100px;
            }
            h1{
                color:midnightblue;
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
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
       <script src="feedback.js" ></script>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>feedback display</title>
    </head>
    <body onload="load()">
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
                    <a class="nav-link" href="salary.jsp" id="navitem1">Incentives</a>
                    <a class="nav-link" href="user_reviews.jsp" id="navitem1">User reviews/a>
                    <a class="nav-link" href="management_cooking_page2.jsp" id="navitem1">Chef's page</a>
                    <a class="nav-link" href="management_order_history.jsp" id="navitem1">History</a>
                    <a class="nav-link" href="index.html" id="navitem1">Logout</a>
                </div>
            </div>
        </div>
    </nav>
        
    <center><br><br><br><br><br><h1>C U S T O M E R &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;R E S P O N S E S</h1></center>
        <div id="clear">
        <%
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from feedback");
            %>
            <table id="tab" hidden="hidden">
                <tr>
                    <th>Service_Type</th>
                    <th>Excellent</th>
                    <th>Good</th>
                    <th>Satisfactory</th>
                    <th>Bad</th>

                
                </tr>
        <%
            int i=1;
            while(rs.next())
            {%>
            <tr>
                <td  > <% out.println(rs.getString(1));%></td>
                 <td id="<%out.println(i);%>"><%out.println(rs.getInt(2));%></td>
                  <td id="<%out.println(i+1);%>"><%out.println(rs.getInt(3));%></td>
                   <td id="<%out.println(i+2);%>"><%out.println(rs.getInt(4));%></td>
                    <td id="<%out.println(i+3);%>"><%out.println(rs.getInt(5));%></td>
            </tr> 
            <% i=i+4;
                    }
                %>
            </table>
            </div>
             <div class="container1">
    <canvas id="myChart" style="position: relative; height:50vh; width:100vw"></canvas>
  </div>
            <div class="container2">
    <canvas id="myChart1" style="position: relative; height:50vh; width:100vw"></canvas>
  </div>
<div class="container3">
    <canvas id="myChart2" style="position: relative; height:50vh; width:100vw"></canvas>
  </div>

            <%
        }catch(Exception e)
        {
            out.println(e.getMessage());
            
        }
        
        
        
        %>
    </body>
</html>
