<html>
    <head>
        <title>
            bill display
        </title>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

        <style>
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
            body
              {
                 background-image:url("billbg1.jpg");
                 background-size:cover;
                 color:white;
                 overflow-x:hidden;
              }
           td,th{
                width:240px;
                text-align: center;
                height:45px;
                font-size:23px;
                 border:1px solid white;
            }
            table{
                margin-left:0px;
                margin-top:25px;
                border:4px solid white;
                border-collapse:collapse;
                width:80%;
            }
            h1{
                margin-top:25px;
                
            }
       /*     button{
                width:200px;
                height:35px;
                margin-left:1050px;
                background-color:white;
                border:2px solid white;
                border-radius:10px;
                font-size:20px;
                outline: none;
            }*/
            @media screen and (max-width:800px)
{
    /*button
    {
        margin-left:300px;
        margin-top:300px;
        margin-bottom:-300px;
    }*/
    table{
        margin-left:50px;
    }
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
                    <a class="nav-link active" href="whychooseus.html" id="navitem1">
                        Why Choose Us
                        <span class="sr-only">(current)</span>
                    </a>
                      <a class="nav-link" href="user_reviews.jsp" id="navitem1">User Reviews</a>
                      <a class="nav-link" href="feedback.html" id="navitem1">Feedback</a>
                    <a class="nav-link" href="menu.html" id="navitem1">Explore Menu</a>
                    <a class="nav-link" href="Tales.html" id="navitem1">Fun Zone</a>
					<!--<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						  Admin
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						  <a class="dropdown-item" href="cooking_login.html" target="_blank">For Chef's</a>
						  
						  <div class="dropdown-divider"></div>
						  <a class="dropdown-item" href="management_login.html" target="_blank">For Management</a>
						</div>
					  </li>-->
                    <a class="nav-link" href="FollowUs.html" id="navitem1">Follow Us</a>
                </div>
            </div>
        </div>
    </nav>
        <br><br><br><br>
    <center><h1>B&nbsp;&nbsp; I&nbsp;&nbsp; L&nbsp;&nbsp; L</h1></center>
    <div class="container">
        <div class="row">
            <div class="col-12">
    <div class="d-flex flex-row justify-content-left ml-3">
    <a href="Tales.html"><button class="btn btn-light" >visit fun page</button></a>   
    </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12">
    <div class="w-75 ml-5">
    <table class="table ml-3">
            <th>Description</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Amount</th>
            <%@page language="java" import="java.sql.*" %>
            <%@page language="java" import="java.time.LocalDateTime"%>
            <%@page language="java" import="java.time.format.DateTimeFormatter"%>
        <%
            int amount=0,tquan=0,price=0;
            String str="";
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
            Statement st=con.createStatement();
            PreparedStatement ps= con.prepareStatement("select price from menu where item=?");
            PreparedStatement ps1= con.prepareStatement("update tables set table_order = ?,description = ?,status = ? where table_no = ?");
            PreparedStatement ps3= con.prepareStatement("update tables set priority = ? where table_no = ?");
            PreparedStatement ps2= con.prepareStatement("insert into total_order_history values(?,?,?,?,?)");
            PreparedStatement ps4= con.prepareStatement("insert into deliveries values(?,?,?,?,?,?)");            
            PreparedStatement ps5=con.prepareStatement("update tables set priority='quick' where table_no=?");
            PreparedStatement ps6=con.prepareStatement("update tables set priority='' where table_no=?");
            LocalDateTime date1=LocalDateTime.now();
             DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd");
             String today = date1.format(myFormatObj);
             Date today1=Date.valueOf(today);
            String table=request.getParameter("table");
            String prior[]=request.getParameterValues("quick");
            //out.println(prior[0]);
                    
          String desc=request.getParameter("desc");
           String menutake[]=request.getParameterValues("food");
        for(int i=0;i<menutake.length;i++)
        {%>
        <tr>
            <td><%str=str+menutake[i]+" - ";
                out.println(menutake[i]);%></td>
            <%
               
              int quan=Integer.parseInt(request.getParameter(menutake[i]));
              str=str+quan+"</br>";
              tquan=tquan+quan;
              ps.setString(1,menutake[i]);
              ResultSet rs= ps.executeQuery();
              while(rs.next())
              price=rs.getInt(1);
            %>
            <td><%out.println(quan);%></td>                   
            <td><%out.println(price);%></td>
            <td><%out.println(quan*price);%></td>
            
        </tr>
           <% amount=amount+quan*price;
        }
            %>
            <% 
                if(prior[0].equals("quick"))
                { amount=amount+100;
                    %>
                <tr>
                <td>Quick delivery charges</td>
                <td>-</td>
                <td>100</td>
                <td>100</td>       
                    <%}
   
                    %>
                    
            <tr>
            <td> Total </td>
            <td colspan="2"><%out.println(tquan);%></td>
            <td><%out.println(amount); %></td>
            
        </tr>
            </div>   
</table>
    </div>
        </div>
    </div>
</div>
            <%
                if(prior[0].equals("quick"))
                    {
                        ps5.setString(1,table);
                        ps5.executeUpdate();
                    }
                else
                {
                    ps6.setString(1,table);
                        ps6.executeUpdate();
                    
                }
                
                String str1="",str2="",str3="",str4="",str5="";
           if(table.equals("table-1"))
           {
              ResultSet rr=st.executeQuery(" select table_order from tables where table_no='table-1'");
              while(rr.next())
                  str1=rr.getString(1);
              str1=str1+str;
               ps1.setString(1,str1);
               ps1.setString(2,desc);
               ps1.setString(3,"ordered");
               ps1.setString(4,"table-1");
               ps1.executeUpdate();
           }
           else if(table.equals("table-2"))
           {
              ResultSet rr1=st.executeQuery(" select table_order from tables where table_no='table-2'");
              while(rr1.next())
                  str2=rr1.getString(1);
              str2=str2+str;
               ps1.setString(1,str2);
               ps1.setString(2,desc);
               ps1.setString(3,"ordered");
               ps1.setString(4,"table-2");
               ps1.executeUpdate();
           }
           else if(table.equals("table-3"))
           {
                ResultSet rr2=st.executeQuery(" select table_order from tables where table_no='table-3'");
              while(rr2.next())
                  str3=rr2.getString(1);
              str3=str3+str;
           
             
               ps1.setString(1,str3);
               ps1.setString(2,desc);
               ps1.setString(3,"ordered");
               ps1.setString(4,"table-3");
               ps1.executeUpdate();
           }
           else if(table.equals("table-4"))
           {
                ResultSet rr3=st.executeQuery(" select table_order from tables where table_no='table-4'");
              while(rr3.next())
                  str4=rr3.getString(1);
              str4=str4+str;
           
               ps1.setString(1,str4);
                ps1.setString(2,desc);
              ps1.setString(3,"ordered");
               ps1.setString(4,"table-4");
               ps1.executeUpdate();
           }
           else if(table.equals("table-5"))
           {  ResultSet rr4=st.executeQuery(" select table_order from tables where table_no='table-5'");
              while(rr4.next())
                  str5=rr4.getString(1);
              str5=str5+str;
           
               ps1.setString(1,str5);
                ps1.setString(2,desc);
                ps1.setString(3,"ordered");
               ps1.setString(4,"table-5");
               ps1.executeUpdate();
           }
           else if(table.equals("delivery"))
           {  
               ps4.setString(1,null);
                ps4.setString(2,str);
               ps4.setString(3,desc);
               ps4.setString(5,"ordered");
               ps4.setInt(6,amount);
               if(prior[0].equals("quick"))
                    {
                        ps4.setString(4,"quick");
                        
                    }
               else
               {
                   ps4.setString(4,"0");
               }
               ps4.executeUpdate();
           }
           ps2.setString(1, null);
            ps2.setString(2, table);
            ps2.setString(3,str );
            ps2.setInt(4, amount);
            ps2.setDate(5,today1);
            ps2.executeUpdate();
             //out.println(str+desc+table);
             
            }catch(Exception e){                            
            out.println(e.getMessage());                      }
        %>
    </body>
</html>