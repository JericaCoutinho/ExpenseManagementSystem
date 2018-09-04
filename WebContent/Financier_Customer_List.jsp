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

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"> -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href='css/FinancialAdvisor.css' rel='stylesheet' type='text/css'>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Dashboard</title>

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

<!-- -BVP Chat Script File -->
<script type="text/javascript" src="check.js"></script>
</head>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #34CACA;;
	color: white;
}
html, 
body {
    height: 100%;
}
</style>

<body>
	<div class="sidebar" data-background-color="white"
		data-active-color="danger">

		<div class="sidebar-wrapper">
			<div class="logo">
				<a href="index.html" class="simple-text"> <%=session.getAttribute("username")%>

				</a>
			</div>

			<ul class="nav">
				<li><a href="advisorHome.jsp"> <i class="ti-panel"></i>
						<p><font size="2" color="black">Dashboard</font></p>
				</a></li>
				<li><a href="table.jsp"> <i class="ti-email"></i>
						<p><font size="2" color="black">Messages</font></p>
				</a></li>
				<li class="active"><a href="Financier_Customer_List.jsp"> <i
						class="ti-pencil-alt2"></i>
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
					<a class="navbar-brand" href="#"><font size="5" color="black"><b>List of Customers</b></font></a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="ti-bell"></i>
								
								<p>
									<font size="3" color="black"><b>Notifications</b></font>
								</p> <b class="caret"></b>
						</a>
							</li>
						<li><a href="logout.jsp"> <i class="ti-settings"></i>
								<p>
									<font size="3" color="black"><b>Logout</b></font>
								</p>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>


		<div class="form-style-8">
			<h1>
				<b>LIST OF CUSTOMERS</b>
			</h1>
			<div id="accordion">
				<%
				for (int i = 0; i < customers.size(); i++) {
					customer = customers.get(i);
			%>
				<div class="card">
					<div class="card-header" id="headingOne<%= i+1 %>">
						<h5 class="mb-0">
							<button class="btn btn-link" data-toggle="collapse"
								data-target="#collapseOne<%= i+1 %>" aria-expanded="true"
								aria-controls="collapseOne<%= i+1 %>"><%=(customer.getF_name() + " " + customer.getL_name())%></button>
						</h5>
					</div>

					<div id="collapseOne<%=i + 1%>" class="collapse"
						aria-labelledby="headingOne<%=i + 1%>" data-parent="#accordion">
						<div class="card-body">
							<ul class="list-group">
								<li class="list-group-item"><%=customer.getF_name() + " " + customer.getL_name()%></li>
								<li class="list-group-item"><%=customer.getEmail()%></li>
							</ul>
						</div>
					</div>
				</div>

				<%
				}
			%>
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
</body>
</html>