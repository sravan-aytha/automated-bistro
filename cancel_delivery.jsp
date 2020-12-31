<%@page language="java" import="java.sql.*" %>
<html>
    <head>
        <script>
            setTimeout(function () {
   //Redirect with JavaScript
   window.location.href= 'cancel_delivery.html';
}, -2000);
</script>
<style>
    body{
        background-image:url("https://lh3.googleusercontent.com/proxy/PV2EvAXG4w6mTiHlKP5K3Jl1PH30pbRIQ6w1sjU5jx49XirAjMcCGVC7OcC9Eksmudt27M0eGBEhaLHnUC7tEReEPFbu2zTXkxNB0E5pXbfnThTXO_R7kfJ4xSBIP_ibsDqDRc_UVYyhkdBw6LGM39m8oS7UvWokzVYk4oU8KVrb");
        background-size:cover;
        text-align:center
            }
</style>
    </head>
    <body onload="setTimeout()">
<%
    String order_id=request.getParameter("id");
    int oid=Integer.parseInt(order_id);
    String status="";
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con =DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
        PreparedStatement ps=con.prepareStatement("select status from deliveries where id=?");
        PreparedStatement ps1=con.prepareStatement("update deliveries set status='cancelled' where id=?");
        
        ps.setInt(1, oid);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
            status=rs.getString(1);
        if(status.equals("cooking")||status.equals("supplied")||status.equals("delivered")||status.equals("cancelled"))
        {
       if(status.equals("delivered"))
       { out.println(status);
%>

        <script>
                    alert("sorry ! this order is delivered\n Unable to cancel");
                    
        </script>  
        <%}
else if(status.equals("cancelled"))
{%>
       <script>
                    alert("sorry ! this order is delivered\n Unable to cancel");
                    
        </script>  
        
<%}

else
{ out.println(status);
        %>
<script>
                    alert("sorry ! this order is preparing.\n Unable to cancel");
                    
        </script>  
<%}
}
         else
          {
            ps1.setInt(1,oid);
            ps1.executeUpdate();
out.println(status);
%>
         <script>
                    alert("your order has been cancelled");
        </script>  
        <%
           }
       
}catch(Exception e){}
%>
  </body>
</html>