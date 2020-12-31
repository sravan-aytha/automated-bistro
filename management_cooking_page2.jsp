<!DOCTYPE html>
 <%@page language="java" import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.tab {
  margin-top:75px;
  overflow: hidden;
  border: 1px solid #ccc;
  border-radius:10px;
  background-color: #f1f1f1;
  width:265px;
  margin-left:50px;
  height:50px;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
 border:none;
  outline: none;
  cursor: pointer;
  padding: 18px 28px;
  transition: 0.3s;
  font-size: 20px;
  
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 0px solid #ccc;
  
}
            body{
background-image:url("https://i.pinimg.com/736x/7c/b1/86/7cb18679659f791b1191bea97b74dfc0.jpg");
background-size:cover;
}
th,td{
text-align:center;
width:165px;
height:78px;
font-size:25px;
font-family:arial;
color:white;
border:2px solid white;
max-width:250px;
word-wrap: break-word;
}
table{
margin-left:5px;
border:5px solid white;
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
outline:none;
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
}
img
{
 float:right;
  border-radius:50%;
  opacity:0.9;
 }

 .dine th
 {
     width:200px;
 }
  .dine td
 {
     width:200px;
 }
 .dine table{
     margin-top:10px;
 }

</style>
<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
function statuschange(x)
{
    document.getElementById(x).value="cooking";
}
</script>

</head>
<body>

        <h1>C O O K I N G &nbsp;&nbsp;O R D E R S</h1>
<div class="tab">
    <button class="tablinks" onclick="openCity(event, 'London')">Dine-In</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">Delivery</button>

</div>

<div id="London" class="tabcontent">
<img src="https://cdn2.vectorstock.com/i/1000x1000/09/31/cooking-time-lettering-design-for-kitchen-vector-22680931.jpg" width="200px" height="100px"/>
        <%
            try{
                int i=1;
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select*from tables");%>
    <div class="dine">       
    <table>
              
        <th> Table Number </th>
               <th>Status</th>
               <th>Order Priority</th>
               <th>Order Items</th>
               <th>Order Description</th>
               <%
           while(rs.next())
           {%>
           <tr>
               <td><%out.println(rs.getString(1));%></td>

               <td><%out.println(rs.getString(5));%></td>
                 <td><%out.println(rs.getString(2));%></td>
               <td><%out.println(rs.getString(3));%></td>
           <td><%out.println(rs.getString(4));%></td>
           
           </tr>           
             <% 
                 i++;
           }
con.close();
}catch(Exception e){out.println(e.getMessage());}
        %>
           </table>
    </div>

</div>

<div id="Paris" class="tabcontent">
<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
           Statement st=con.createStatement();
           ResultSet rs1=st.executeQuery("select*from deliveries where status='ordered' or status='cooking'");%>
           <table>
               <th>Delivery ID</th>
               <th>Items</th>
               <th>Description</th>
               <th>Priority</th>
               <th>COOKING</th>
               <th>SUPPLIED</th>
               <% while(rs1.next())
               {%>
               <tr>
                   <td><%out.println(rs1.getInt(1));%></td>
                   <td><%out.println(rs1.getString(2));%></td>
                   <td><%out.println(rs1.getString(3));%></td>
                   <td><%out.println(rs1.getString(4));%></td>
                   <td><form action="cooking.jsp" method="post"><input type="submit" disabled="disabled" id=<%out.println(rs1.getString(1));%>  value=<%out.println(rs1.getString(1));%>  name="table" ></form></td>
                   <td><form action="supply.jsp" method="post"><input type="submit" disabled="diasabled" value=<%out.println(rs1.getString(1));%>  name="table"></form></td>
               </tr> 
               <%}
               %>
           </table> 
    <%}catch(Exception e)
    {
        out.println(e.getMessage());
    }







%>
</div>
</body>
</html> 
