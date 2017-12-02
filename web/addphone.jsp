<%-- 
    Document   : addphone
    Created on : 6 Oct, 2017, 6:27:52 PM
    Author     : HP
--%>
<%
    String nm=(String)session.getAttribute("uid");
    if(nm==null){
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="customepage.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone Tracking System</title>
    </head>
    <body>
        <div class="login-wrap2" >
            <div class="login-html2">
                <button type="button" class="button2" ><a href="addphone.jsp">Add Phone</a></button>
                <button type="button" class="button2" ><a href ="deletephone.jsp">Delete Phone</a></button>
                <button type="button" class="button2" ><a href ="trackphone.jsp">Track Phone</a></button>
                <button type="button" class="button2" ><a href ="DeleteAccount">Delete Account</a></button>
                <button type="button" class="button2" ><a href ="Logout">Logout</a></button>
            
                <h3>ADD PHONE</h3>
                <div class="login-form">
                    <form action="AddPhone">
                        Phone Name <input type="text" name="pname" required/>
                        <input type="hidden" name="namePage" value="<%=nm%>">
                        Phone id <input type="text" name="pid" required/>
                        <input type="submit" value=" ADD PHONE "/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
