<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            setTimeout(function () {
   //Redirect with JavaScript
   window.location.href= 'cooking_page2.jsp';
}, -2000);
</script>
        <title>cooking status success</title>
    </head>
    <body onload="setTimeout()">
        <%
        String table=request.getParameter("table");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con =DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
        PreparedStatement ps=con.prepareStatement("update tables set status=? where table_no = ?");

 
   ps.setString(1, "cooking");
   ps.setString(2,table);
   ps.executeUpdate();
}catch(Exception e){}
%>

        
    </body>
</html>
