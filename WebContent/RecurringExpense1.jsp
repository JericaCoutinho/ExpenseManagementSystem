<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recurring Expense</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link
	href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css">
<link href='css/financialGoal.css' rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300'
	rel='stylesheet' type='text/css'>
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
</head>

<style>
table {
	border-collapse: collapse;
	width: 85%;
	float: right;
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
</style>
<script>	
$( function() {
    $( "#datepicker" ).datepicker({ dateFormat: "yy-mm-dd" });
  } );
$( document ).ready(function() {
	var p = '<%= session.getAttribute("username") %>';
	console.log(p);
    console.log( "ready!" );
    $.ajax({ 
		url: "sumcount",
		data: {"username" : p},
		type : "post",
    	success: function(data){
					$("#total").html(data);
					
    		}
		});
    $.ajax({ 
	url: "GetRecurrServlet",
	data: {"username" : p},
	type : "post",
	success: function(data){
				$("#Response").html(data);
				
		}
	});
});


function edit(id){
	console.log(id);
	$.ajax({
		type: 'GET',
		url: 'EditRowRecurServlet',
		data: {"id":id},
		success: function(responseText){
		//	alert(responseText);
			console.log(responseText);
			obj = jQuery.parseJSON(responseText);
			document.getElementById('username').value;
			document.getElementById('description').value=obj.description;
			document.getElementById('category').value=obj.category;
			document.getElementById('datepicker').value=obj.expense_date;
			document.getElementById('value').value=obj.expense_value;
			document.getElementById('frequency').value=obj.recurring_type;
			document.getElementById('Id_hidden').value=obj.expense_id;
		}
	});
}
function deleterow(id){
	 var p = document.getElementById("username").value;
	console.log(id);
	$.ajax({
		type: 'post',
		url: 'deleterowServlet',
		data: {"username" : p,"id":id},
		success: function(data){
		//	alert(responseText);
			$("#Response").html(data);
		}
	});
}


 function myfunction()
 {
	 var p = document.getElementById("username").value;
	 var x = document.getElementById("description").value;
	 var q = document.getElementById("category").value;
	 var d = document.getElementById("datepicker").value;
	 var s = document.getElementById("value").value;
	 var f = document.getElementById("frequency").value;
	 var id = document.getElementById("Id_hidden").value;
	 $.ajax(
			{
				url: "RecurExpServlet",
				data: {"username" : p,"description":x, "category" : q,"datepicker" : d, "value" : s,"frequency":f, "id" : id},
				type : "post",
				success : function(data)
				{
					alert("Recurring Expense added succesfully!");
					$("#Response").load("#Response");
					//successmessage = 'Data was succesfully captured';
	                //$("label#successmessage").text(successmessage);
				}
			} 
	 
	 
	 );
 }
</script>
<body>

	<div class="sidebar" data-background-color="white"
		data-active-color="danger">

		<div class="sidebar-wrapper">
			<div class="logo">
				<a href="index.html" class="simple-text"> <%=session.getAttribute("username")%>
				</a>
			</div>

			<ul class="nav">
				<li><a href="home.jsp"> <i class="ti-panel"></i>
						<p>
							<font size="2" color="black">Dashboard</font>
						</p>
				</a></li>
				<li><a href="DailyExp.jsp"> <i class="ti-user"></i>
						<p>
							<font size="2" color="black">Daily Expenses</font>
						</p>
				</a></li>
				<li class="active"><a href="RecurringExpense.jsp"> <i
						class="ti-view-list-alt"></i>
						<p>
							<font size="2" color="black">Recurring Expenses</font>
						</p>
				</a></li>

				<li><a href="Finance_Advisor.jsp"> <i
						class="ti-pencil-alt2"></i>
						<p>
							<font size="2" color="black">Contact Advisor</font>
						</p>
				</a></li>
				<li><a href="Exppro.jsp"> <i class="ti-map"></i>
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
					<a class="navbar-brand" href="#">Dashboard</a>
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
						<li><a href="logout.jsp"> <i class="ti-settings"></i>
								<p>Logout</p>
						</a></li>
					</ul>

				</div>
			</div>
		</nav>
		<div class="card-body">
			<div class="row">
				<div class="col-sm-8 my-auto">
					<canvas id="TotalOver" width="100" height="50"></canvas>
				</div>
				<div class="col-sm-4 text-center my-auto">
					<div class="h4 mb-0 text-primary" id="total"></div>
					<div class="large text-muted">Total</div>
				</div>
			</div>
		</div>

		<div class="form-style-8">
			<h2>Recurring Expense</h2>
			<form>
				<b>Username:</b> <input class="effect-1" type="text" name="username"
					disabled id="username"
					value="<%= session.getAttribute("username")%>" /> <b>Expense
					Description:<b><input type="text" name="description"
						id="description" placeholder="Eg. Netflix, Prime or Blue Apron" />
						<b>Expense Category:</b> <select id="category">
							<option value="entertainment">Entertainment</option>
							<option value="bill">Bills(Phone etc)</option>
							<option value="Miscellaneous">Miscellaneous</option>
					</select> <b>Expense Date: </b><input type="text" name="date"
						id="datepicker" placeholder="Expense Date"> <b>Expense
							Value :</b><input type="text" name="value" id="value"
						placeholder="Expense Value"> <b>Billing Frequency:</b><select
						id="frequency">
							<option value="yearly">Yearly</option>
							<option value="monthly">Monthly</option>
							<option value="weekly">Weekly</option>
					</select> <input type="button" value="Add" onclick="myfunction()" /> <input
						type="hidden" id="Id_hidden" />
			</form>
		</div>
		<div
			style="position: absolute; left: 100px; height: 100px; width: 75%;"
			id="Response"></div>

	</div>
</body>
</html>