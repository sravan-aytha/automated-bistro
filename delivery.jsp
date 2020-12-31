<%@page language="java" import="java.sql.*" %>
<html>
    <head>
         <script>
            setTimeout(function () {
   //Redirect with JavaScript
   window.location.href= 'deliveries.jsp';
}, -2000);
</script>
        
    </head>
    <body onload="setTimeout()">
<%
    String table=request.getParameter("table");
    String status="";
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con =DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
        Statement st=con.createStatement();
        PreparedStatement ps=con.prepareStatement("update deliveries set status='delivered' where id = ?");
        ResultSet rs=st.executeQuery("select * from deliveries where id= "+table+"");
        while(rs.next())
        {
            status=rs.getString(5);
        }
       if(status.equals("supplied"))
       {
   ps.setString(1,table);
   ps.executeUpdate();
  
       }
       else
       {%>
       <script>
           alert("the order is still cooking");
       </script>
        
        <%
         
       }
}catch(Exception e){}
%>
  </body>
</html>