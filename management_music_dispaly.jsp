<html>
<head>
<title>music page</title>
<script src="hotel.js"></script>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<style>
body
{
background-image:url("https://images.all-free-download.com/images/graphicthumb/butterflies_with_music_vector_background_535448.jpg");
background-size:cover;
}
span{
    font-size:25px;
    font-family:Brush Script MT;
    margin-left:10px;
}
th,td{
border:2px solid blue;
width:600px;
height:35px;
text-align:center;
font-size:35px;
font-family:Brush Script MT;
}
th{
height:55px
}

table{
border:3px solid blue;
border-radius:10px;
margin-top:20px;
margin-left:300px;

}
.food-munch-logo {
    height: 70px;
    width: 80px;
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
<body >
    <%@page language="java" import="java.sql.*" %>
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
                    <a class="nav-link active" href="#" id="navitem1">
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
                    <a class="nav-link" href="salary_page.jsp" id="navitem1">Incentives</a>
                    <a class="nav-link" href="feedback_display.jsp" id="navitem1">Feedbacks</a>
                    <a class="nav-link" href="management_cooking_page2.jsp" id="navitem1">Chef's page</a>
                    <a class="nav-link" href="management_order_history.jsp" id="navitem1">History</a>
                    <a class="nav-link" href="index.html" id="navitem1">Logout</a>
                </div>
            </div>
        </div>
     </nav>
<br/><br/><br/><br/>
<table>
<tr>
<th>T I T L E &nbsp;&nbsp;&nbsp;O F &nbsp;&nbsp;&nbsp;A &nbsp;&nbsp;&nbsp;M U S I C</th>
</tr>
<%
  try
  {
      String music="";
      Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
      Statement st=con.createStatement();
      ResultSet rs1=st.executeQuery("SELECT m_name FROM music LIMIT 1");
       while(rs1.next())
       {
           music=rs1.getString(1);
       }
       music=music+".mp3";%>
       <span> currently playing &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%out.println(music);%></span>
       <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <audio controls="controls" autoplay><source src="<%out.println(music);%>" type="audio/mpeg"></audio>

<%
      ResultSet rs=st.executeQuery("select * from music");
      while(rs.next())
      {%>
      <tr><td><%out.println(rs.getString(1));%></td></tr> 
      <%}
st.executeUpdate("delete from music limit 1 ");
response.setIntHeader("Refresh", 210);  
}catch(Exception e){out.println(e.getMessage());}
%>
</table>
</body>
</html>