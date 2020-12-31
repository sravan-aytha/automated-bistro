<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> login success</title>
        <style>
            p{
                font-size:25px;
                color:royalblue;
                text-align:center;
                margin-top:150px;
            }
        </style>
    </head>
    <body>
        <%
              String uname = request.getParameter("uname");
              String pwd = request.getParameter("pwd");
              if((uname.equals("john123")&&pwd.equals("john456"))||(uname.equals("angel123")&&pwd.equals("angel456")))
              {%>
                  <jsp:include page="cooking_page2.jsp"/>
              <%}
              else
              {
                  %>
                  <script>
                    alert("sorry ! this order is preparing.\n Unable to cancel");
        </script>                    <%
                      response.sendRedirect("cooking_login.html");
              }
        %>
    </body>
</html>
