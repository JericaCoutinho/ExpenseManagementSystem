<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Financial goal</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300'
	rel='stylesheet' type='text/css'>
<link href='css/financialGoal.css' rel='stylesheet' type='text/css'>

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
<style>
html, 
body {
    height: 100%;
}

</style>
<script>
function alert_me()
{
	var s = document.getElementById("budget").value;
	var d = document.getElementById("username").value;
	$.ajax({
		url:"ExpenseServlet",
	    data:{"budget" : s,"Uname" : d},
		type: "post",
		success: function(data)
		        {
					alert("Successfully goal is set!");
		        	
		        }
         });
}
</script>
<script type="text/javascript" src="check.js"></script>
</head>

<body>
<div class="sidebar" data-background-color="white"
		data-active-color="danger">

		<div class="sidebar-wrapper">
			<div class="logo">
				<a href="index.html" class="simple-text"> <%= session.getAttribute("username") %>
				</a>
			</div>

			<ul class="nav">
				<li><a href="home.jsp"> <i class="ti-panel"></i>
						<p>
							<font size="2" color="black">Statistics</font>
						</p>
				</a></li>
				<li>
				<a href="RecurringExpense.jsp"> <i class="ti-view-list-alt"></i>
					<p>
						<font size="2" color="black">Expenses</font>
					</p>
				</a>
				</li>

				<li><a href="Finance_Advisor.jsp"> <i
						class="ti-pencil-alt2"></i>
						<p>
							<font size="2" color="black">Contact Advisor</font>
						</p>
				</a></li>
				<li class="active"><a href="Exppro.jsp"> <i class="ti-map"></i>
						<p>
							<font size="2" color="black">Set Financial Goal</font>
						</p>
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
					<a class="navbar-brand" href="#"><font size="5" color="black"><b>Financial Goal</b></font></a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">

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
			<h2>
				<font size="5" color="white">Set Your Financial Budget</font>
			</h2>
			<form>
				<b><font size="5" color="black">Username :</font></b><input
					type="text" name="username" disabled id="username"
					value=" <%= session.getAttribute("username") %>"
					placeholder="Full Name" /> <b><font size="5" color="black">Expense
						Budget :</font></b><input type="text" name="budget_value" id="budget"
					placeholder="Budget"> <input type="button"
					value="Set Financial Goal" onclick="alert_me()" />
			</form>
		</div>
	</div>
</body>
</html>

