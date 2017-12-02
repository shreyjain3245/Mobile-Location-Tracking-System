<%-- 
    Document   : deletephone
    Created on : 6 Oct, 2017, 6:33:02 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nm=(String)session.getAttribute("uid");
    if(nm==null){
        response.sendRedirect("index.jsp");
    }
%>
<% 
    ResultSet rs = (ResultSet)session.getAttribute("phonelist");
%>
<html>
    <head>
        <link rel="stylesheet" href="customepage.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone Tracking System</title>
    </head>
    <body>
        <div class="login-wrap2" >
            <div class="login-html2">                
                <div>
                <button type="button" class="button2" ><a href="addphone.jsp">Add Phone</a></button>
                <button type="button" class="button2" ><a href ="deletephone.jsp">Delete Phone</a></button>
                <button type="button" class="button2" ><a href ="trackphone.jsp">Track Phone</a></button>
                <button type="button" class="button2" ><a href ="DeleteAccount">Delete Account</a></button>
                <button type="button" class="button2" ><a href ="Logout">Logout</a></button>
                </div>
                <br>
                <h3>Select Phone to Delete</h3>
                <div>
                    <form action="DeletePhone">
                    <select name="PhoneList">
                        <% while(rs.next()){%>
                        <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                        <%} %>
                        <%rs.beforeFirst();%>
                    </select>
                    <input type="submit" name="Deletephone" value="Delete"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>