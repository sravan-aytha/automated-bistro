<%@page language="java" import="java.sql.*" %>
<html>
    <head>
        <!--<script>
            setTimeout(function () {
   //Redirect with JavaScript
   window.location.href= 'cooking_page2.jsp';
}, -2000);
</script>-->
    </head>
    <body onload="setTimeout()">
<%
    String table=request.getParameter("table");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con =DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
        PreparedStatement ps=con.prepareStatement("update deliveries set status='cooking' where id = ?");
   ps.setString(1,table);
   ps.executeUpdate();
   response.sendRedirect("cooking_page2.jsp");
}catch(Exception e){}
%>
  </body>
</html>