<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);
#message {
    display:none;
    background: #f1f1f1;
    color: #000;
        position: relative;
    
    padding: 20px;
    margin-top: 10px;
    
}
b{
    font-size: 10px;

}
#message p {
    padding: 10px 35px;
    font-size: 10px;
}
.valid {
    color: green;
}
.valid:before {
    position: relative;
    left: -35px;
    content: "Correct";
}
.invalid {
    color: red;
}
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
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input, #text {
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

.form #button:hover, .form #button:active, .form #button:focus {
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

p {
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
	background-image: url("Expense.jpg");
		width: 100%;
		height: 100%;
		    background-repeat:no-repeat;
    background-size: 1500px 1500px;
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

#warning {
	color: red;
}

#bio {
	display: none;
}
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
				<span id="warning"> <%
	     if(session.getAttribute("message")!=null)
	     out.println(session.getAttribute("message"));
	     session.setAttribute("message",null);
	     %>
				</span> <input type="text" placeholder="First Name" name="f_name"></input>
				<input type="text" placeholder="Last Name" name="l_name"></input> <input
					type="text" placeholder="Username" name="username"></input> <input
					type="email" placeholder="Email" name="email"></input> 
					<input type="password" id=psw placeholder="Create Password" name="password" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required></input>
					<div id="message">
  <b>Password must contain the following:</b>
  <p id="letter" class="invalid"><b>A lowercase letter</b></p>
  <p id="capital" class="invalid"><b>A capital (uppercase) letter</b></p>
  <p id="number" class="invalid"><b>A number</b></p>
  <p id="length" class="invalid"><b>Minimum 8 characters</b></p>
</div><br>
				<input type="password" placeholder="Reconfirm Password"
					name="confirm"></input>
				<p>
					Are you a Financial Advisor?<br>
					<br> <input id="check" type="checkbox" name="Type"
						value="Advisor" onclick="bioAppear();">
				</p>
				<span id="bio"> Biography<br> <textarea id="text"
						name="bio"></textarea>
				</span> <br> <input type="submit" value="Register" id="button">
				<p class="message">
					Already registered? <a href="login.jsp">Sign In</a>
				</p>
			</form>
			
		</div>
	
	</div>
	<script>var myInput = document.getElementById("psw");
	var letter = document.getElementById("letter");
	var capital = document.getElementById("capital");
	var number = document.getElementById("number");
	var length = document.getElementById("length");
	// When the user clicks on the password field, show the message box
	myInput.onfocus = function() {
	    document.getElementById("message").style.display = "block";
	}

	// When the user clicks outside of the password field, hide the message box
	myInput.onblur = function() {
	    document.getElementById("message").style.display = "none";
	}
	myInput.onkeyup = function() {
		  // Validate lowercase letters
		  var lowerCaseLetters = /[a-z]/g;
		  if(myInput.value.match(lowerCaseLetters)) {  
		    letter.classList.remove("invalid");
		    letter.classList.add("valid");
		  } else {
		    letter.classList.remove("valid");
		    letter.classList.add("invalid");
		  }
		  
		  // Validate capital letters
		  var upperCaseLetters = /[A-Z]/g;
		  if(myInput.value.match(upperCaseLetters)) {  
		    capital.classList.remove("invalid");
		    capital.classList.add("valid");
		  } else {
		    capital.classList.remove("valid");
		    capital.classList.add("invalid");
		  }

		  // Validate numbers
		  var numbers = /[0-9]/g;
		  if(myInput.value.match(numbers)) {  
		    number.classList.remove("invalid");
		    number.classList.add("valid");
		  } else {
		    number.classList.remove("valid");
		    number.classList.add("invalid");
		  }
		  
		  // Validate length
		  if(myInput.value.length >= 8) {
		    length.classList.remove("invalid");
		    length.classList.add("valid");
		  } else {
		    length.classList.remove("valid");
		    length.classList.add("invalid");
		  }
		}

</script>

</body>
</html>
