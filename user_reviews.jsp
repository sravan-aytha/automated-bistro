<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user reviews</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

        <style>
            body{
                margin-left:2%;
            }
            .checked {
  color: orange;
}
            #name{
                margin-left:50px;
               
             font-size:23px;
            }
            b{
                font-size:22px;
            }
            #date
            {
                margin-left:50px;
                font-size:12px
            }
            hr{
                margin-bottom:-10px;
            }
            #profile{
                border-radius:50%;
                margin-bottom:-65px;
            }
            .food-munch-logo {
    height: 80px;
    width: 70px;
}

#navitem1 {
    color: black;
    font-size:18px;
}

#navitem2 {
    background-color: #d1ddeb;
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
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="navitem2">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/food-munch-img.png" class="food-munch-logo" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ml-auto">
                    
                    <a class="nav-link" href="index.html" id="navitem1">Home</a>
                    <!--<a class="nav-link" href="user_reviews.jsp" id="navitem1">User Reviews</a>-->
                    
                    <a class="nav-link" href="feedback.html" id="navitem1">Feedback</a>
                      <a class="nav-link" href="Tales.html" id="navitem1">Fun Zone</a>
		  <a class="nav-link" href="whychooseus.html" id="navitem1">Why Choose Us</a>
                      <a class="nav-link" href="menu.html" id="navitem1">Explore Menu</a>
					
                    <a class="nav-link" href="#" id="navitem1">Follow Us</a>
                </div>
            </div>
        </div>
    </nav>
        <br/><br/><br/><br/><br/><br/>
    <center><h1> User reviews</h1></center>
        <%
        try
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
          Statement st=con.createStatement();
          ResultSet rs=st.executeQuery("select * from user_feedback");
          while(rs.next())
          {
              %>
              <img src="https://image.shutterstock.com/image-vector/social-member-vector-icon-person-260nw-1139787308.jpg" width="50px" height="50px" alt=user" id="profile"/><br>
              <span id="name"><b><%out.println(rs.getString(2));%></b></span><br>
           <span id="date"><%out.println(rs.getString(7));%></span><br>
              <span>Service : 
                  <% if(rs.getString(3).equals("Excellent"))
                  { %>
                  <span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>

  <%}
      else if(rs.getString(3).equals("Good"))
{%>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star "></span> 
<%}
else if(rs.getString(3).equals("Satisfactory"))
{%>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star "></span>
<span class="fa fa-star "></span> 
<%}
else if(rs.getString(3).equals("Bad"))
{%>
<span class="fa fa-star checked"></span>
<span class="fa fa-star "></span>
<span class="fa fa-star "></span>
<span class="fa fa-star "></span> 
<%}%>

              </span><br>
           <span>Food : 
            <% if(rs.getString(4).equals("Excellent"))
                  { %>
                 
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
  <%}
      else if(rs.getString(4).equals("Good"))
{%>

<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star "></span> 
<%}
else if(rs.getString(4).equals("Satisfactory"))
{%>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star "></span>
<span class="fa fa-star "></span> 
<%}
else if(rs.getString(4).equals("Bad"))
{%>
<span class="fa fa-star checked"></span>
<span class="fa fa-star "></span>
<span class="fa fa-star "></span>
<span class="fa fa-star "></span> 
<%}%>            

           </span><br>
           <span><b>Ambience : </b>
            <% if(rs.getString(5).equals("Excellent"))
                  { %>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
  <%}
      else if(rs.getString(5).equals("Good"))
{%>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star "></span> 
<%}
else if(rs.getString(5).equals("Satisfactory"))
{%>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star "></span>
<span class="fa fa-star "></span> 
<%}
else if(rs.getString(5).equals("Bad"))
{%>
<span class="fa fa-star checked"></span>
<span class="fa fa-star"></span>
<span class="fa fa-star "></span>
<span class="fa fa-star "></span> 
<%}%>            

           </span><br>
           <span><b>Experience : </b><%out.println(rs.getString(6));%></span><br>
            
            <hr>
            
        <%}}catch(Exception e)
        {
            out.println(e.getMessage());
        }
        %>
    </body>
</html>
