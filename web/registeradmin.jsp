<%-- 
    Document   : registeradmin
    Created on : 2 Sep, 2017, 8:47:31 PM
    Author     : HP
--%>
<%
    String nm=(String)session.getAttribute("uid");
    if(nm==null){
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        
        <link rel="stylesheet" href="styles.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone Tracking System</title>
    </head>
    <body>
        <div class="login-wrap">
            <div class="login-html">
                <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Register New Admin
                </label>
                    <div class="login-form">
            <form action="Signup" method="post">
			
				<div class="group">
					<label for="user" class="label">Username</label>
                                        <input id="user" type="text" class="input" maxlength="30" name="uid" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" data-type="password" required maxlength="30" name="pw">
				</div>
				<div class="group">
					<label for="user" class="label">Full Name</label>
					<input id="user" type="text" class="input" maxlength="30" name="nm" required>
				</div>
				<div class="group">
					<label for="user" class="label">Phone Number</label>
					<input id="user" type="number" class="input" maxlength="30" name="mob" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Email Address</label>
					<input id="pass" type="email" class="input" maxlength="30" name="email" required>
                                        <input type="hidden" name="namePage" value="Admin" />
				</div>
				<div class="group">
					<input type="submit" class="button" value="Register">
				</div>
				<div class="hr"></div>

		
                        
                </form>
        </div>
            </div>
        </div>
    </body>
</html>