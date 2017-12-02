<%
    Cookie ck[]=request.getCookies();
    String v1="",v2="";
    if(ck!=null){
    for(Cookie c:ck){
        String name=c.getName();
        if(name.equals("uid")){
            v1=c.getValue();
        }else if(name.equals("pw")){
            v2=c.getValue();
        }
    }
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
  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Log In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                    <div class="login-form">
                        <form action="Login">
			<div class="sign-in-htm">
				<div class="group">
					<label for="user" class="label">Username</label>
                                        <input id="user" type="text" class="input" name="uid" value="<%=v1%>">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" data-type="password" name="pw" value="<%=v2%>">
				</div>
				
				<div class="group">
					<input id="check" type="checkbox" class="check" name="remempw" >
					<label for="check"><span class="icon"></span> Keep me Signed in</label>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Login">
				</div>
				<div class="hr"></div>
				
			</div>
                    
                </form>
                <form action="Signup" method="post">
			<div class="sign-up-htm">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="user" type="text" class="input" maxlength="30"  name="uid" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
                                        <input id="pass" type="password" class="input" data-type="password" maxlength="30"  name="pw" required>
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
                                        <input type="hidden" name="namePage" value="Customer" >
				</div>
				<div class="group">
					<input type="submit" class="button" value="Register">
				</div>
				<div class="hr"></div>

		
                        </div>
                </form>
            
        </div>

        </div>
        </div>
</body>
</html>