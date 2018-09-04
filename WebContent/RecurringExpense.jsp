<!DOCTYPE html>
<html>
<head>
</head>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300'
	rel='stylesheet' type='text/css'>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/animate.min.css" rel="stylesheet" />
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />
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
form {
	position: relative;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 30px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

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
	background-color: #34CACA;
	color: white;
}

#cloud-container {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	overflow: hidden;
	z-index: -1;
	/* Remove this line if it's not going to be a background! */
}

#button {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #34CACA;
	width: 15%;
	border: 0;
	padding: 10px;
	color: #FFFFFF;
	font-size: 14px;
}

#button:hover, #button:active, #button:focus {
	background: #2aafaf;
}

#warning {
	color: red;
}

#bio {
	display: none;
}
</style>
<script>	
$( function() {
    $( "#datepicker" ).datepicker({ dateFormat: "yy-mm-dd" });
  } );
$( function() {
    $( "#datepicker1" ).datepicker({ dateFormat: "yy-mm-dd" });
  } );
$( document ).ready(function() {
	var p = '<%=session.getAttribute("username")%>';
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
    
    $.ajax({ 
	url: "GetRecurrServlet",
	data: {"username" : p},
	type : "post",
	success: function(data){
				$("#Response").html(data);
				
		}
	});
    $.ajax({ 
		url: "GetDataServlet",
		data: {"username" : p},
		type : "post",
    	success: function(data){
					$("#Response1").html(data);
					
    		}
		});
 
});

function editdaily(id){
	$.ajax({
		type: 'GET',
		url: 'EditRowServlet',
		data: {"id":id},
		success: function(responseText){
		//	alert(responseText);
			obj = jQuery.parseJSON(responseText);
			document.getElementById('username').value;
			document.getElementById('category1').value=obj.category;
			document.getElementById('value1').value=obj.expense_value;
			document.getElementById('datepicker1').value=obj.expense_date;
			document.getElementById('Id_hidden1').value=obj.expense_id;
		}
	});
}
function editrecurring(id){
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
			document.getElementById('description').value=obj.expense_desc;
			document.getElementById('category').value=obj.expense_category;
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
	 var p =  '<%=session.getAttribute("username")%>';
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

 function mydailyfunction()
 {
	 var x =  '<%=session.getAttribute("username")%>';
	 var y = document.getElementById("category1").value;
	 var cd = document.getElementById("description1").value;

	 //var d=new Date("OCT 19,2016");
	 //var day = d.getDate();
	 //var month= d.getMonth()+1;
	 //var year = d.getFullYear();
	 var z = document.getElementById("datepicker1").value;
	 var id1 = document.getElementById("Id_hidden1").value;
	 var t = document.getElementById("value1").value;

	 $.ajax(
			{			
				url: "DailyExpServlet",
				data: {"username" : x, "description1": cd, "category1" : y,"date1" : z, "value1" : t , "id" :id1},
				type : "post",
				success : function(data)
				{
					alert(data);
					document.getElementById('Id_hidden').value=null;
					document.getElementById('description1').value=null;
					document.getElementById('category1').value=null;
					document.getElementById('datepicker1').value=null;
					document.getElementById('value1').value=null;
					$("#Response").load("#Response");
					//successmessage = 'Data was succesfully captured';
	                //$("label#successmessage").text(successmessage);
				}
			} 
	 
	 
	 );
 }
</script>
<body>
	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="index.html" class="simple-text" id="username"> <%=session.getAttribute("username")%>
					</a>
				</div>

				<ul class="nav">
					<li><a href="home.jsp"> <i class="ti-panel"></i>
							<p>
								<font size="2" color="black">Statistics</font>
							</p>
					</a></li>
					<li class="active"><a href="RecurringExpense.jsp"> <i
							class="ti-view-list-alt"></i>
							<p>
								<font size="2" color="black">Expenses</font>
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
						<a class="navbar-brand" href="#"><font size="5" color="black"><b>Expenses</b></font></a>
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

			<div class="content">
				<div class="container-fluid">
					<div style="align: centre; font-size: 50px">
						<a href="#" id="response"> </a>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-sm-8 my-auto">
								<canvas id="TotalOver" width="100" height="50"></canvas>
							</div>
							<div class=" h4 col-sm-3 mb-0 text-center my-auto">
								Total: $ <b class=" mb-0 text-primary" id="total"></b>
							</div>
						</div>
					</div>
					<br>
					<div id="Recurring" class="contact100-form validate-form">

						<div id="recurringform" class="form-style-8 w3-modal">
							<div class="w3-modal-content w3-animate-zoom"
								style="max-width: 360px" padding="100px">
								<form class="recurringform" method="post">
									<h2>
										<font color="white"><b>Recurring Expense</b></font>
									</h2>
									<span onclick="closerecurring();"
										class="w3-button w3-xlarge w3-transparent w3-display-topright"
										title="Close Modal">x</span> <font size="5" color="black"><b>Expense
											Description:</b></font><input type="text" name="description"
										id="description"
										placeholder="Eg. Netflix, Prime or Blue Apron" /> <font
										size="5" color="black"><b>Expense Category:</b></font> <select
										id="category">
										<option value="entertainment">Entertainment</option>
										<option value="bill">Bills(Phone,Internet etc)</option>
										<option value="Miscellaneous">Miscellaneous</option>
									</select> <font size="5" color="black"><b>Expense Date: </b></font><input
										type="text" name="date" id="datepicker"
										placeholder="Expense Date"> <font size="5"
										color="black"><b>Expense Value :</b></font><input
										type="number" name="value" id="value"
										placeholder="Expense Value" required> <font size="5"
										color="black"><b>Billing Frequency:</b></font><select
										id="frequency">
										<option value="yearly">Yearly</option>
										<option value="monthly">Monthly</option>
										<option value="weekly">Weekly</option>
									</select> <input type="button" value="Add"
										onclick="myfunction(); closerecurring();" /> <input
										type="hidden" id="Id_hidden" />
								</form>
							</div>
						</div>
						<div id="Daily" class="contact100-form validate-form">

							<div id=dailyform class="form-style-8 w3-modal">
								<div class="w3-modal-content w3-animate-zoom"
									style="max-width: 360px" padding="100px">

									<form class="dailyform" method="post">
										<h2>
											<font color="white"><b>Daily Expense</b></font>
										</h2>
										<span onclick="closedaily();"
											class="w3-button w3-xlarge w3-transparent w3-display-topright"
											title="Close Modal">x</span> <font size="5" color="black"><b>Expense
												Description:</b></font><input type="text" name="description"
											id="description1"
											placeholder="Eg. Walmart,CVS,Clothing and etc" /> <font
											size="5" color="black"><b>Expense Category:</b></font> <select
											id="category1">
											<option value="Grocery">Grocery</option>
											<option value="Home Utilities">Home Utilities</option>
											<option value="Miscellaneous">Miscellaneous</option>
										</select> <font size="5" color="black"><b>Expense Date: </b></font><input
											type="text" name="date" id="datepicker1"
											placeholder="Expense Date"> <font size="5"
											color="black"><b>Expense Value :</b></font><input
											type="number" name="value" id="value1"
											placeholder="Expense Value" required> <input
											type="hidden" id="Id_hidden1" /> <input type="button"
											value="Add" onclick="mydailyfunction(); closedaily();" />
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-10 my-auto">
						<button id=button class="col-sm-10"
							onclick="document.getElementById('dailyform').style.display='block'">Add
							Daily</button>

						<button id=button class="col-sm-14"
							onclick="document.getElementById('recurringform').style.display='block'">Add
							Recurring</button>

					</div>
					<br>
					<br>
					<div class="cloud-container"
						style="position: absolute; left: 40px; height: 100px; width: 95%;"
						id="Response"></div>
				</div>
			</div>

		</div>
		<footer class="footer">
			<div class="container-fluid">
				<div class="copyright pull-right">
					<i>Team - 4</a>
				</div>
			</div>
		</footer>
	</div>
</body>
<script type="text/javascript">
  function closerecurring(){
    document.getElementById('recurringform').style.display='none';
  }
  function opendaily(){
    document.getElementById('dailyform').style.display='block';
  }
   function closedaily(){
    document.getElementById('dailyform').style.display='none';
  }
  function openrecurring(){
    document.getElementById('recurringform').style.display='block';
  }

  </script>

</html>