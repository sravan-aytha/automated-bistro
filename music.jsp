<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" %>

        <%
              String mname=request.getParameter("music");
             try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");   
                 Statement st=con.createStatement();
                 PreparedStatement ps=con.prepareStatement("insert into music values(?)");
                 ps.setString(1,mname);
                 ps.executeUpdate();
                 %>
                 <script>
                     alert("music added to the queue");
                 </script>        
<%
                 response.sendRedirect("Tales.html");
             } 
             catch(Exception e){
             out.println(e.getMessage());
                     }
        %>
