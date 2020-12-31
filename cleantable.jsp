<%@page language="java" import="java.sql.*" %>
<html>
    <head>
        <script>
            setTimeout(function () {
   //Redirect with JavaScript
   window.location.href= 'cooking_page2.jsp';
}, -2000);
</script>
    </head>
    <body onload="setTimeout()">
<%
    String table=request.getParameter("table");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con =DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
        PreparedStatement ps=con.prepareStatement("update tables set table_order = ?,description = ?,status=? where table_no = ?");

   ps.setString(1,"");
   ps.setString(2,"");
   ps.setString(3, "supplied");
   ps.setString(4,table);
   ps.executeUpdate();
}catch(Exception e){}
%>
  </body>
</html>