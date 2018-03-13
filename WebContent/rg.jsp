<!DOCTYPE HTML>
<html>
<head>  
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
.form input , #text{
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

#warning{color:red;}
#bio{display:none;}
</style>

<script>
    function bioAppear()
    {
    var box=document.getElementById("check");
    var bio=document.getElementById("bio");
    if(box.checked)
    bio.style.display="initial";
    else
    bio.style.display="none";
    }
    
   
  </script>
  <script>
  w3-display-topright {
	    position: absolute;
	    right: 0;
	    top: 0;
	}</script>

  
  
</head>
<body>
  <div class="loginpage">
    <div class="form">
      <form class="registerform" action="register.jsp" method="post">
	<span id="warning">
	  <%
	     if(session.getAttribute("message")!=null)
	     out.println(session.getAttribute("message"));
	     session.setAttribute("message",null);
	     %>
	</span>
	
        <input type="text" placeholder="First Name" name="f_name"></input>
        <input type="text" placeholder="Last Name" name="l_name"></input>
        <input type="text" placeholder="Username" name="username"></input>
        <input type="text" placeholder="Email" name="email"></input>
        <input type="password" placeholder="Create Password" name="password"></input>
        <input type="password" placeholder="Reconfirm Password" name="confirm"></input>
	<p>Are you a Financial Advisor?<br><br>
          <input id="check" type="checkbox" name="Type" value="Advisor" onclick="bioAppear();">
        </p>
    <span id="bio" >
      Biography<br>
      <textarea id="text" name="bio"></textarea>
    </span>
    <br>

        <input type="submit" value="Register" id="button">
        <p class="message">Already registered? <a href="login.jsp">Sign In</a></p>
      </form>
    </div>

  </div>

</body>
</html>
