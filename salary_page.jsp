<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<style>
            body{
                background-image: url("https://png.pngtree.com/thumb_back/fh260/back_our/20190625/ourmid/pngtree-financial-economy-stock-banner-poster-image_261098.jpg");
                background-size: cover;            
                color:white;           
            }
            table
            {
                border: 8px solid white;
                text-align:center;
                margin-left:50px;
                border-collapse: collapse;
            }
            td,th
            {
                border: 3px solid white;
             font-size:25px;
             width:200px;
             height:40px;
            }
            td:nth-child(2)
            {
                text-transform: uppercase;
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
        <title>Salary Page</title>
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
                    <a class="nav-link" href="feedback_display.jsp" id="navitem1">Feedbacks</a>
                    <a class="nav-link" href="user_reviews.jsp" id="navitem1">User reviews</a>
                    <a class="nav-link" href="management_cooking_page2.jsp" id="navitem1">Chef's page</a>
                    <a class="nav-link" href="management_order_history.jsp" id="navitem1">History</a>
                    <a class="nav-link" href="index.html" id="navitem1">Logout</a>
                </div>
            </div>
        </div>
    </nav>
        <br><br><br><br><br>
    <center><h1>S A L A R Y&nbsp;&nbsp;&nbsp;&nbsp; P A G E</h1></center>
        <br/><%
            int count=0;
            
        try{
            int diff=0;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
            Statement st=con.createStatement();
            PreparedStatement ps=con.prepareStatement("update staff set salary=? where role=?");
            PreparedStatement ps1=con.prepareStatement("SELECT DATEDIFF(curdate(),?)");
            ResultSet rs1=st.executeQuery("select * from updates");
            
            while(rs1.next())
            {
                ps1.setDate(1,rs1.getDate(2) );
                 ResultSet rs2=ps1.executeQuery();     
                 while(rs2.next())
                 {
                     diff=rs2.getInt(1);
                 }
            }
            
            ResultSet rs = st.executeQuery("select * from staff");
            out.println(diff);
            if(diff==6){
                
              
            while(rs.next())
            {
                Double salary= rs.getDouble(5);
                int[] arr = new int[]{rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9)};
                int max = 0;
    int maxIndex =-1;

    for (int j = 0; j < arr.length; j++) {
        if (arr[j] > max) {
			max=arr[j];
            maxIndex = j;
        }
        }
    switch(maxIndex)
		 {
			 case 0:
		 salary =salary+salary*4/100;
	 		 break;
			 case 1:
               salary = salary + salary*3/100;    
 		 break;
		 case 2:
		 salary=salary+salary*2/100;
           break;	 	
		case 3:
		 salary=salary;
		 break;
		 
		 }
	         ps.setDouble(1,salary);
                 ps.setString(2,rs.getString(1));
                 ps.executeUpdate();
           
            }
            int n = st.executeUpdate("update updates set date=curdate() where num=1");
    }%>  
            <table>
               <tr>
              <th>Employee Role</th>
              <th>Employee Name</th>
              <th>Excellent</th>
              <th>Good</th>
              <th>Satisfactory</th>
              <th>Bad</th>
              <th>Salary</th>
              
          </tr> 
          <% 
              ResultSet r = st.executeQuery("select * from staff");
              while(r.next())
          {%>
          <tr>
              <td><%out.println(r.getString(1));%></td>
              <td><%out.println(r.getString(2));%></td>
              <td><%out.println(r.getInt(6));%></td>
              <td><%out.println(r.getInt(7));%></td>
              <td><%out.println(r.getInt(8));%></td>
              <td><%out.println(r.getInt(9));%></td>
              <td><%out.println(r.getDouble(5));%></td>
          </tr>
          <%}%>
            </table>

           <%
        }catch(Exception e)
        {
            out.println(e.getMessage());
        }
        
        
        
        
        
        
        %>
    </body>
</html>
