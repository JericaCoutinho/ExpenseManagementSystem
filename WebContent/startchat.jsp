
<%if(session.getAttribute("username")==null)
  response.sendRedirect("/chatting");
%>

<html>
<%String uname=(String)session.getAttribute("username"); %>

<head>
<link rel="stylesheet" type="text/css" href="styles.css">
<script type="text/javascript" src="check.js"></script>
<title>The Chat Room</title>
<link rel="shortcut icon" href="icon.jpeg" />
<script>
     setInterval(reloaddata, 1000);
    </script>
</head>

<body>

	<p id="result"></p>
	<p style="font-size: 25px">
		<font color="black" size="8"><b>Welcome, <%=uname%></b></font>
	</p>
	<div class="logout-div" align="right">
		<a href="logout.jsp" class="logout-chat"><p
				style="font-size: 25px">
				<font color="black" ,size="8">Logout</font></a>
	</div>
	<div id="list">
		<div id="content"></div>
		<font color="black"><input style="display: none" type="text"
			id="u" value="<%=uname%>"> </font>
		<textarea id='h' style="width: 100%; height: 10%;"></textarea>
		<input type="button" value="send" onclick="addText()" />
	</div>
</body>

</html>