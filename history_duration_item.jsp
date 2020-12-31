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

<style>
    table{
        border:1px solid black;
        text-align:center;
        font-size:18px;
    }
</style>
    </head>
    <body>
        <%
            int count=0;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
        Statement st=con.createStatement();
        PreparedStatement ps=con.prepareStatement("select * from total_order_history where date(order_date) between ? and ? ");
        String date1=request.getParameter("date1");
        String date2=request.getParameter("date2");
        String item=request.getParameter("item");
        ps.setDate(1,java.sql.Date.valueOf(date1));
        ps.setDate(2,java.sql.Date.valueOf(date2));
        
        ResultSet rs=ps.executeQuery();
        %>
        <table class="table">
            <th>order id</th>
            <th>ordered table</th>
            <th>order items</th>
            <th>amount</th>
            <th>ordered date</th>
            <%while(rs.next())
        {
             if(rs.getString(3).contains(item))
        {%>
        <tr>
            <td><%out.println(rs.getInt(1));%></td>
            <td><%out.println(rs.getString(2));%></td>
            <td><%out.println(rs.getString(3));%></td>
            <td><%out.println(rs.getInt(4));%></td>
            <td><%out.println(rs.getDate(5));%></td>
        </tr>
        <% 
            count++;}}
out.println("Displaying the orders containing "+item+" from "+date1+" to "+date2);
if(count==0)
   out.println("no orders on this period");

        %>
        </table>
    </body>
</html>
