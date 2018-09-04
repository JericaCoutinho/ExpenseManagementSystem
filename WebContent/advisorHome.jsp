<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<script type="text/javascript" src="check.js"></script>
<title>Advisor Home Page</title>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Financier Home</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="assets/css/demo.css" rel="stylesheet" />
<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href="assets/css/themify-icons.css" rel="stylesheet">
<link rel="stylesheet" href="bgimage.css">
</head>
<body>

	<%

     String name=(String)session.getAttribute("username");
        if(name==null||session.getAttribute("advisor")==null)
	   {
	      session.setAttribute("message",null);
	         response.sendRedirect("login.jsp");
		    }        
 %>

<body>

	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">

			<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="index.html" class="simple-text"> <%=session.getAttribute("username") %>
					</a>
				</div>

				<ul class="nav">
					<li class="active"><a href="advisorHome.jsp"> <i class="ti-panel"></i>
							<p><font size="2" color="black">Dashboard</font></p>
					</a></li>
					<li><a href="table.jsp"> <i class="ti-email"></i>
							<p><font size="2" color="black">Messages</font></p>
					</a></li>
					<li><a href="Financier_Customer_List.jsp">
							<i class="ti-pencil-alt2"></i>
							<p><font size="2" color="black">List of Customers</font></p>
					</a></li>
					
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
							<span class="icon-bar bar3"></span>
						</button>
						<a class="navbar-brand" href="#"><font size="5" color="black">Welcome</font></a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="ti-bell"></i>
									<p class="notification"></p>
									<p><b><font size="3" color="black">Notifications</font></b></p> <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<%  
                                      // retrieve your list from the request, with casting 
                                     ArrayList<String> NotificationList = (ArrayList<String>) session.getAttribute("NotificationList");
									 if(NotificationList!=null)
									for (int i=0; i < NotificationList.size(); i=i+2){ %>
									<li>
									<a href="javascript:notificationHandler('<%=session.getAttribute("username")%>','<%=NotificationList.get(i+1)%>','<%=NotificationList.get(i)%>')"><%=NotificationList.get(i)%>
											<%=NotificationList.get(i+1 )%></a></li>
									<%}%>
								</ul></li>
							<li><a href="logout.jsp"> <i class="ti-power-off"></i>
									<p><b><font size="3" color="black">Log Out</font></b></p>
							</a></li>
						</ul>

					</div>
				</div>
			</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-15">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-md-15">
											<div class="icon-big icon-black text-center">
												<i class="ti-user"></i>Welcome Advisor
											</div>
											<div class="numbers"></div>
										</div>
									</div>
									<div class="footer">
										<hr />
										<div class="stats">
											<h3>You are the advisor.</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>


	<footer class="footer">
		<div class="container-fluid">
			<nav class="pull-left"></nav>
		</div>
	</footer>

	</div>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
    $('#btnGetValue').click(function() {
        alert($('input[name=radioName]:checked', '#myForm').val());
    });
});		
		</script>
	<!--   Core JS Files   -->
	<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="assets/js/bootstrap-notify.js"></script>


	<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>

</body>
</html>
