<%-- 
    Document   : viewuserinfo
    Created on : 9 Oct, 2017, 6:12:54 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nm=(String)session.getAttribute("uid");
    if(nm==null){
        response.sendRedirect("index.jsp");
    }
%>
<%ResultSet rs=(ResultSet)session.getAttribute("userinfo");%>
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
                
                <table border="1">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Name</th>
                            <th>Mobile Number</th>
                            <th>E-Mail</th>
                            <th>User Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <%while(rs.next()){%>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                           
                        </tr>
                                    <%}%>
                    </tbody>
                </table>

            </div>
            
        </div>
 
    </body>
</html>