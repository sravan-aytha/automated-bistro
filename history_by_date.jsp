<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>displaying history by date</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="js/jquery.min.js"></script>
<script src="	https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script>
    function genpdf()
    {
    var doc = new jsPDF();
var c=document.getElementById("content").innerHtml;
doc.text(20, 20, c);
doc.save('document1.pdf');
    }
</script>
    </head>
    <body onload="window.print()" id="content">
        <%
            int voodooc=0,index=0;
            int count=0;
            String str="";
            char s;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
        Statement st=con.createStatement();
        PreparedStatement ps=con.prepareStatement("select * from total_order_history where order_date=?");
        String date1=request.getParameter("date1");
        ps.setDate(1,java.sql.Date.valueOf(date1));
        
        ResultSet rs=ps.executeQuery();
        %>
        <table class="table">
            <th>order id</th>
            <th>ordered table</th>
            <th>order items</th>
            <th>amount</th>
            <th>ordered date</th>
            <%while(rs.next())
        {   %>
        <tr>
            <td><%out.println(rs.getInt(1));%></td>
            <td><%out.println(rs.getString(2));%></td>
            <td><%out.println(rs.getString(3));%></td>
            <td><%out.println(rs.getInt(4));%></td>
            <td><%out.println(rs.getDate(5));%></td>
        </tr>
        <% 
            count++;}
out.println("Dispalying orders on this "+date1);
if(count==0)
   out.println("no orders on this day");

        %>
        </table>
    </body>
</html>
<!--
if(rs.getString(3).contains("Ginger Chicken"))
        { 
            str=rs.getString(3);
             index =rs.getString(3).indexOf("Ginger Chicken")+"Ginger Chicken".length()+3;
             s=str.charAt(index);
             voodooc=voodooc+Integer.parseInt(String.valueOf(s));
             
          }-->