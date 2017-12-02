<%-- 
    Document   : adminpage
    Created on : 2 Sep, 2017, 4:30:45 PM
    Author     : Siddhant ,Yash , Shrey
--%>
<%
    String nm=(String)session.getAttribute("uid");
    if(nm==null){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('You Are Not Logged In...Login First');");
                out.println("location='index.jsp';");
                out.print("</script>");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone Tracking System</title>
    </head>
    <body>
        <div class="login-wrap2" >
            <div class="login-html2">
                
                <button type="button" class="button2" ><a href="registeradmin.jsp">Add New Admin</a></button>
                <button type="button" class="button2" ><a href="ViewUserInfo">View User Info</a></button>
                <button type="button" class="button2" ><a href ="DeleteAccount">Delete Account</a></button>
                <button type="button" class="button2" ><a href ="Logout">Logout</a></button>
                        	
            </div>
        </div>
 
    </body>
</html>
