<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="edu.albany.se.team_project.doa.CustomerDAO"%>
<%@ page import="edu.albany.se.team_project.model.Customer"%>
<%
    String financierName = new String(session.getAttribute("username").toString());
	ArrayList<Customer> customers = new ArrayList<Customer>();
    CustomerDAO customerDOA = new CustomerDAO(financierName);
    customers = customerDOA.getAllCustomerDetails();
    Customer customer = new Customer();
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Financier Advisor DashBoard</title>

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
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">
<link rel="stylesheet" href="bgimage.css">
<script type="text/javascript" src="check.js"></script>

</head>
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
					<a href="index.html" class="simple-text"> <%=financierName %>
					</a>
				</div>

				<ul class="nav">
					<li><a href="advisorHome.jsp"> <i class="ti-panel"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a href="table.jsp"> <i class="ti-email"></i>
							<p>Messages</p>
					</a></li>
					<li class="active"><a href="Financier_Customer_List.jsp">
							<i class="ti-pencil-alt2"></i>
							<p>List of Customers</p>
					</a></li>
					<li><a href="typography.jsp"> <i class="ti-panel"></i>
							<p>Settings</p>
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
						<a class="navbar-brand" href="#">Messages</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="ti-bell"></i>
									<p class="notification">5</p>
									<p>Notifications</p> <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Notification 1</a></li>
									<li><a href="#">Notification 2</a></li>
									<li><a href="#">Notification 3</a></li>
									<li><a href="#">Notification 4</a></li>
									<li><a href="#">Another notification</a></li>
								</ul></li>
							<li><a href="#"> <i class="ti-power-off"></i>
									<p>Log Out</p>
							</a></li>
						</ul>

					</div>
				</div>
			</nav>

			<div class="content">
				<%
			       for (int i = 0; i < customers.size(); i++) {
			       	customer = customers.get(i);
		           	%>
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<div class="icon-big icon-warning text-center">
												<i class="ti-user"></i>
											</div>
										</div>


										<div class="col-xs-7">
											<div class="numbers">
												<p><%=customer.getusername() %></p>
												<%=customer.getusername() %>
											</div>
										</div>
									</div>
									<div class="footer">
										<hr />
										<div class="stats">
											<i class="ti-email"></i> Hi, I need an advice for saving....
											<button
												onclick="startchatting('<%=financierName%>','<%=customer.getusername()%>')">Chat</button>

										</div>
									</div>

								</div>
							</div>
						</div>

					</div>
				</div>
				<%} %>
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


</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>


</html>
