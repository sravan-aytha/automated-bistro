
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>management login</title>
        <style>
            h1{
                color:red;
            }
        </style>
    </head>
    <body>
        <%
        try
        {
            int count=0;
        
            String uname=request.getParameter("uname");
            String pass=request.getParameter("pass");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
            Statement st= con.createStatement();
            ResultSet rs=st.executeQuery("select * from management_staff ");
            while(rs.next())
            {
                if(uname.equals(rs.getString(2))&&pass.equals(rs.getString(3)))
                {
                    session.setAttribute("username",uname);   
                    session.setAttribute("userpwd",pass);  
                    %>
                     <jsp:include page="management.html"/>
                     <%
                         count++;
                     break;
                     }
   
                         
                }
if(count==0)
{
out.println("<h1> unsuccessfull login<br> please try again</h1>");
}
            }
        
        catch(Exception e)
{
 out.println(e.getMessage());
}
            
        
        
        %>
    </body>
</html>
