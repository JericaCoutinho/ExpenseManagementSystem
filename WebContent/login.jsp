<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
   <title>Login</title> 
<style type="text/css"> 
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.loginpage {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form #button {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
}
.form #button:hover,.form #button:active,.form #button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
p{
 font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;

}
body {
  background: #76b852;
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}

#warn{color:red;}
</style>


</head>
<body>
	<div class="loginpage">
	     <div class="form">
			<form class="loginform" action="page1.jsp" method="post" >
					<input type="text" placeholder="Username" name="username"></input>
					<input type="password" placeholder="Password" name="password"></input>
					<input type="submit" value="Login" id="button">
					<p class="message">Not registered? <a href="rg.jsp">Create an account</a></p>


<br><span id="warn">
      <%

         if(session.getAttribute("username")!=null)
         {
         String targetPage="home.jsp";
         if(session.getAttribute("advisor")!=null)
            targetPage="advisorHome.jsp";
         response.sendRedirect(targetPage);
         }

       if(session.getAttribute("message")!=null)
          out.println(session.getAttribute("message"));
       session.setAttribute("message",null);
       %>
    </span>
 
			</form>
		</div>
	</div>
</body>
</html>
