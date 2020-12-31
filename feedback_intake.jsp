<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>feedback success</title>
    </head>
    <%
        String name=request.getParameter("cname");        
        String table=request.getParameter("table");
        String qual[]=request.getParameterValues("service");
        String quality = qual[0];
        String amb[]=request.getParameterValues("amb");
        String ambience = amb[0];
        String fd[]=request.getParameterValues("food");
        String food = fd[0];
        String like=request.getParameter("like");
        String date=(new java.util.Date()).toLocaleString();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/restraunt","root","");
            Statement st=con.createStatement();
            PreparedStatement pp1=con.prepareStatement("update feedback set excellent =? where service_type='service'");
            PreparedStatement pp2=con.prepareStatement("update feedback set good =? where service_type='service'");
            PreparedStatement pp3=con.prepareStatement("update feedback set satisfactory =? where service_type='service'");
            PreparedStatement pp4=con.prepareStatement("update feedback set bad =? where service_type='service'");
            PreparedStatement pp5=con.prepareStatement("update feedback set excellent =? where service_type='ambience'");
            PreparedStatement pp6=con.prepareStatement("update feedback set good =? where service_type='ambience'");
            PreparedStatement pp7=con.prepareStatement("update feedback set satisfactory =? where service_type='ambience'");
            PreparedStatement pp8=con.prepareStatement("update feedback set bad =? where service_type='ambience'");
            PreparedStatement pp9=con.prepareStatement("update feedback set excellent =? where service_type='food'");
            PreparedStatement pp10=con.prepareStatement("update feedback set good =? where service_type='food'");
            PreparedStatement pp11=con.prepareStatement("update feedback set satisfactory =? where service_type='food'");
            PreparedStatement pp12=con.prepareStatement("update feedback set bad =? where service_type='food'");
            PreparedStatement ps =con.prepareStatement("insert into user_feedback values(?,?,?,?,?,?,?)");
            ps.setString(1,null);
            ps.setString(2,name);
            ps.setString(3,quality);
            ps.setString(4,food);
            ps.setString(5,ambience);
            ps.setString(6,like);
            ps.setString(7,date);
            ps.executeUpdate();
            out.println(name+table+quality+ambience+food+like+date);    
            int n=0,n1=0;
            if(quality.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from feedback where service_type='service'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               pp1.setInt(1,n);
               pp1.executeUpdate();
            }
             if(quality.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from feedback where service_type='service'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               pp2.setInt(1,n);
               pp2.executeUpdate();
            }   
             if(quality.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from feedback where service_type='service'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               pp3.setInt(1,n);
               pp3.executeUpdate();
            }   
             if(quality.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from feedback where service_type='service'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               pp4.setInt(1,n);
               
               pp4.executeUpdate();
            }
            if(ambience.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from feedback where service_type='ambience'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               pp5.setInt(1,n1);
               pp5.executeUpdate();
               
            }
             if(ambience.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from feedback where service_type='ambience'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               pp6.setInt(1,n1);
               pp6.executeUpdate();
            }   
             if(ambience.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from feedback where service_type='ambience'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               pp7.setInt(1,n);
               pp7.executeUpdate();
            }   
             if(ambience.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from feedback where service_type='ambience'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               pp8.setInt(1,n);
               pp8.executeUpdate();
            }
             if(food.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from feedback where service_type='food'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               pp9.setInt(1,n1);
               pp9.executeUpdate();
               
            }
             if(food.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from feedback where service_type='food'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               pp10.setInt(1,n1);
               pp10.executeUpdate();
            }   
             if(food.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from feedback where service_type='food'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               pp11.setInt(1,n);
               pp11.executeUpdate();
            }   
             if(food.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from feedback where service_type='food'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               pp12.setInt(1,n);
               pp12.executeUpdate();
            }

            PreparedStatement ps1=con.prepareStatement("update staff set excellent=? where role='t-1s'");
            PreparedStatement ps2=con.prepareStatement("update staff set good=? where role='t-1s'");
            PreparedStatement ps3=con.prepareStatement("update staff set satisfactory=? where role='t-1s'");
            PreparedStatement ps4=con.prepareStatement("update staff set bad=? where role='t-1s'");
            PreparedStatement ps21=con.prepareStatement("update staff set excellent=? where role='t-2s'");
            PreparedStatement ps22=con.prepareStatement("update staff set good=? where role='t-2s'");
            PreparedStatement ps23=con.prepareStatement("update staff set satisfactory=? where role='t-2s'");
            PreparedStatement ps24=con.prepareStatement("update staff set bad=? where role='t-2s'");
            PreparedStatement ps31=con.prepareStatement("update staff set excellent=? where role='t-3s'");
            PreparedStatement ps32=con.prepareStatement("update staff set good=? where role='t-3s'");
            PreparedStatement ps33=con.prepareStatement("update staff set satisfactory=? where role='t-3s'");
            PreparedStatement ps34=con.prepareStatement("update staff set bad=? where role='t-3s'");
            PreparedStatement ps41=con.prepareStatement("update staff set excellent=? where role='t-4s'");
            PreparedStatement ps42=con.prepareStatement("update staff set good=? where role='t-4s'");
            PreparedStatement ps43=con.prepareStatement("update staff set satisfactory=? where role='t-4s'");
            PreparedStatement ps44=con.prepareStatement("update staff set bad=? where role='t-4s'");
            PreparedStatement ps51=con.prepareStatement("update staff set excellent=? where role='t-5s'");
            PreparedStatement ps52=con.prepareStatement("update staff set good=? where role='t-5s'");
            PreparedStatement ps53=con.prepareStatement("update staff set satisfactory=? where role='t-5s'");
            PreparedStatement ps54=con.prepareStatement("update staff set bad=? where role='t-5s'");
            PreparedStatement ps61=con.prepareStatement("update staff set excellent=? where role='t-1a'");
            PreparedStatement ps62=con.prepareStatement("update staff set good=? where role='t-1a'");
            PreparedStatement ps63=con.prepareStatement("update staff set satisfactory=? where role='t-1a'");
            PreparedStatement ps64=con.prepareStatement("update staff set bad=? where role='t-1a'");
            PreparedStatement ps71=con.prepareStatement("update staff set excellent=? where role='t-2a'");
            PreparedStatement ps72=con.prepareStatement("update staff set good=? where role='t-2a'");
            PreparedStatement ps73=con.prepareStatement("update staff set satisfactory=? where role='t-2a'");
            PreparedStatement ps74=con.prepareStatement("update staff set bad=? where role='t-2a'");
            PreparedStatement ps81=con.prepareStatement("update staff set excellent=? where role='t-3a'");
            PreparedStatement ps82=con.prepareStatement("update staff set good=? where role='t-3a'");
            PreparedStatement ps83=con.prepareStatement("update staff set satisfactory=? where role='t-3a'");
            PreparedStatement ps84=con.prepareStatement("update staff set bad=? where role='t-3a'");
            PreparedStatement ps91=con.prepareStatement("update staff set excellent=? where role='t-4a'");
            PreparedStatement ps92=con.prepareStatement("update staff set good=? where role='t-4a'");
            PreparedStatement ps93=con.prepareStatement("update staff set satisfactory=? where role='t-4a'");
            PreparedStatement ps94=con.prepareStatement("update staff set bad=? where role='t-4a'");
            PreparedStatement ps101=con.prepareStatement("update staff set excellent=? where role='t-5a'");
            PreparedStatement ps102=con.prepareStatement("update staff set good=? where role='t-5a'");
            PreparedStatement ps103=con.prepareStatement("update staff set satisfactory=? where role='t-5a'");
            PreparedStatement ps104=con.prepareStatement("update staff set bad=? where role='t-5a'");
   

        if(table.equals("Table-1"))
        {
            
            if(quality.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from staff where role='t-1s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps1.setInt(1,n);
               ps1.executeUpdate();
            }
             if(quality.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from staff where role='t-1s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps2.setInt(1,n);
               ps2.executeUpdate();
            }   
             if(quality.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from staff where role='t-1s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps3.setInt(1,n);
               ps3.executeUpdate();
            }   
             if(quality.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from staff where role='t-1s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps4.setInt(1,n);
               ps4.executeUpdate();
            }
            if(ambience.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from staff where role='t-1a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps61.setInt(1,n1);
               ps61.executeUpdate();
            }
             if(ambience.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from staff where role='t-1a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps62.setInt(1,n1);
               ps62.executeUpdate();
            }   
             if(ambience.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from staff where role='t-1a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps63.setInt(1,n);
               ps63.executeUpdate();
            }   
             if(ambience.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from staff where role='t-1a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps64.setInt(1,n);
               ps64.executeUpdate();
            }   

        }
        if(table.equals("Table-2"))
        {
            
            if(quality.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from staff where role='t-2s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps21.setInt(1,n);
               ps21.executeUpdate();
            }
             if(quality.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from staff where role='t-2s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps22.setInt(1,n);
               ps22.executeUpdate();
            }   
             if(quality.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from staff where role='t-2s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps23.setInt(1,n);
               ps23.executeUpdate();
            }   
             if(quality.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from staff where role='t-2s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps24.setInt(1,n);
               ps24.executeUpdate();
            }
             if(ambience.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from staff where role='t-2a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps71.setInt(1,n1);
               ps71.executeUpdate();
            }
             if(ambience.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from staff where role='t-2a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps72.setInt(1,n1);
               ps72.executeUpdate();
            }   
             if(ambience.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from staff where role='t-2a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps73.setInt(1,n);
               ps73.executeUpdate();
            }   
             if(ambience.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from staff where role='t-2a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps74.setInt(1,n);
               ps74.executeUpdate();
            }   

        }
        if(table.equals("Table-3"))
        {
           
            if(quality.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from staff where role='t-3s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps31.setInt(1,n);
               ps31.executeUpdate();
            }
             if(quality.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from staff where role='t-3s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps32.setInt(1,n);
               ps32.executeUpdate();
            }   
             if(quality.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from staff where role='t-3s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps33.setInt(1,n);
               ps33.executeUpdate();
            }   
             if(quality.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from staff where role='t-3s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps34.setInt(1,n);
               ps34.executeUpdate();
            }   
            if(ambience.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from staff where role='t-3a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps81.setInt(1,n1);
               ps81.executeUpdate();
            }
             if(ambience.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from staff where role='t-3a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps82.setInt(1,n1);
               ps82.executeUpdate();
            }   
             if(ambience.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from staff where role='t-3a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps83.setInt(1,n);
               ps83.executeUpdate();
            }   
             if(ambience.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from staff where role='t-3a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps84.setInt(1,n);
               ps84.executeUpdate();
            }   
 
        }
     if(table.equals("Table-4"))
        {
           
            if(quality.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from staff where role='t-4s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps41.setInt(1,n);
               ps41.executeUpdate();
            }
             if(quality.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from staff where role='t-4s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps42.setInt(1,n);
               ps42.executeUpdate();
            }   
             if(quality.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from staff where role='t-4s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps43.setInt(1,n);
               ps43.executeUpdate();
            }   
             if(quality.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from staff where role='t-4s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps44.setInt(1,n);
               ps44.executeUpdate();
            }
             if(ambience.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from staff where role='t-4a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps91.setInt(1,n1);
               ps91.executeUpdate();
            }
             if(ambience.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from staff where role='t-4a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps92.setInt(1,n1);
               ps92.executeUpdate();
            }   
             if(ambience.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from staff where role='t-4a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps93.setInt(1,n);
               ps93.executeUpdate();
            }   
             if(ambience.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from staff where role='t-4a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps94.setInt(1,n);
               ps94.executeUpdate();
            }   

        }
        if(table.equals("Table-5"))
        {
            
            if(quality.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from staff where role='t-5s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps51.setInt(1,n);
               ps51.executeUpdate();
            }
             if(quality.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from staff where role='t-5s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps52.setInt(1,n);
               ps52.executeUpdate();
            }   
             if(quality.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from staff where role='t-5s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps53.setInt(1,n);
               ps53.executeUpdate();
            }   
             if(quality.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from staff where role='t-5s'");
               while(rs.next())
               n=rs.getInt(1);
               n++;
               ps54.setInt(1,n);
               ps54.executeUpdate();
            }   
             if(ambience.equals("Excellent"))
            {
               ResultSet rs=st.executeQuery("select excellent from staff where role='t-5a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps101.setInt(1,n1);
               ps101.executeUpdate();
            }
             if(ambience.equals("Good"))
            {
               ResultSet rs=st.executeQuery("select good from staff where role='t-5a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps102.setInt(1,n1);
               ps102.executeUpdate();
            }   
             if(ambience.equals("Satisfactory"))
            {
               ResultSet rs=st.executeQuery("select satisfactory from staff where role='t-5a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps103.setInt(1,n);
               ps103.executeUpdate();
            }   
             if(ambience.equals("Bad"))
            {
               ResultSet rs=st.executeQuery("select bad from staff where role='t-5a'");
               while(rs.next())
               n1=rs.getInt(1);
               n1++;
               ps104.setInt(1,n);
               ps104.executeUpdate();
            }   

        }
        response.sendRedirect("feedback.html");

        }catch(Exception e)
        {
            out.println(e.getMessage());
        }
        %>
</html>
