<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Expense</title>
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
<link rel="stylesheet" href="bgimage.css" />
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

main-panel {
	bakground-attachment: fixed;
}

.styling {
	
}
</style>
<script>	
$( function() {
    $( "#datepicker" ).datepicker({ dateFormat: "yy-mm-dd" });
  } );
$( document ).ready(function() {
	var p = '<%= session.getAttribute("username") %>' ;
	var budget;
	var total;
	console.log(p);
    console.log( "ready!" );
    $("#response").hide();
    $.ajax({
		url : "SumCount",
		data : {"username" : p},
		type : "post",
		success : function(data) {
			$("#total").html(data);
			 total = data;
			 $.ajax({
					url : "NotificationServlet",
					data : {"username" : p},
					type : "get",
					success : function(data) {
						console.log(data);
						if(parseFloat(total) > parseFloat(data)){
							console.log(data);
							alert("budget exceeded");
							
							$("#response").html("Budget exceeded");
							$("#response").show();
						}
					}
				});
		}
	});
    
    var notification;
    $.ajax({
		url : "GetBudget",
		data : {"username" : p, "Budget": budget},
		type : "post",
		success : function(data) {
			//$("#budget").html(data);
			budget = data;
			if(total>budget)
		    {
		 		alert("You have exceeded your Financial goal limit!");
		 		notification ="You have exceeded your Financial goal limit!";
		 		//alert(notification)
		 	    $.ajax({
		 			url : "NotificationServlet",
		 			data : {"username" : p, "notification":notification},
		 			type : "post",
		 			success : function(data) {
		 				//$("#budget").html(data);
		 				console.log("saved");
		 			}
		 		}); 
		    }
		}
	}); 
    
    
    $.ajax({ 
		url: "GetDataServlet",
		data: {"username" : p},
		type : "post",
    	success: function(data){
					$("#Response").html(data);
					
    		}
		});
});

	function edit(id){
		$.ajax({
			type: 'GET',
			url: 'EditRowServlet',
			data: {"id":id},
			success: function(responseText){
				
				obj = jQuery.parseJSON(responseText);
				document.getElementById('username').value;
				document.getElementById('category').value=obj.category;
				document.getElementById('value').value=obj.expense_value;
				document.getElementById('datepicker').value=obj.expense_date;
				document.getElementById('Id_hidden').value=obj.expense_id;
			}
		});
	}

 function myfunction()
 {
	 var p = document.getElementById("username").value;
	 var q = document.getElementById("category").value;
	 //var d=new Date("OCT 19,2016");
	 //var day = d.getDate();
	 //var month= d.getMonth()+1;
	 //var year = d.getFullYear();
	 var d = document.getElementById("datepicker").value;
	 var id = document.getElementById("Id_hidden").value;
	 var s = document.getElementById("value").value;
	 //alert(id);
	 $.ajax(
			{			
				url: "DailyExpServlet",
				data: {"username" : p, "category" : q,"date" : d, "value" : s , "id" : id},
				type : "post",
				success : function(data)
				{
					alert(data);
					document.getElementById('Id_hidden').value=null;
					document.getElementById('value').value=null;
					document.getElementById('datepicker').value=null;
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
				<a href="index.html" class="simple-text"> <%= session.getAttribute("username") %>
				</a>
			</div>

			<ul class="nav">
				<li><a href="home.jsp"> <i class="ti-panel"></i>
						<p>
							<font size="2" color="black">Dashboard</font>
						</p>
				</a></li>

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
					<a class="navbar-brand" href="#"><font size="5" color="black"><b>Dashboard</b></font></a>
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
		<div style="align: centre; font-size: 50px">
			<a href="#" id="response">Notification </a>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-sm-8 my-auto">
					<canvas id="TotalOver" width="100" height="50"></canvas>
				</div>
				<div class="col-sm-4 text-center my-auto">
					<div class="h4 mb-0 text-primary" id="total"></div>
					<div class="large text-muted">
						<font size="5" color="red"><b>TOTAL</b></font>
					</div>
				</div>
			</div>
		</div>
		<div class="form-style-8">
			<h2>
				<font color="white">Daily Expense</font>
			</h2>
			<form>
				<b><font size="5" color="black"> Username:</b> </font><input
					class="effect-1" type="text" name="username" disabled id="username"
					value="<%= session.getAttribute("username") %>" /> <b><font
					size="5" color="black">Expense Category:</b></font> <select
					id="category">
					<option value="Grocery">Grocery</option>
					<option value="Home Utilities">Home Utilities</option>
					<option value="Miscellaneous">Miscellaneous</option>
				</select> <b><font size="5" color="black">Expense Date: </b></font><input
					type="text" name="date" id="datepicker" placeholder="Expense Date">
				<b><font size="5" color="black">Expense Value :</b></font><input
					type="number" name="value" id="value" placeholder="Expense Value">
				<input type="hidden" id="Id_hidden" /> <input type="button"
					value="Add" onclick="myfunction()" />
			</form>
		</div>
		<div id="Response"></div>
		<div id="savemessage"></div>
	</div>
</body>
</html>


