<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

</head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script
	type="https://chart.googleapis.com/chart?cht=<chart_type>&chd=<chart_data>&chs=<chart_size>&...additional_parameters..."></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawPie);
google.charts.setOnLoadCallback(drawBar);

var graphdata = "";
var bardata = "";
var graphdata2 = [];
var bardata2 = [];

var a;
var b;

function drawPie() {
graphdata = graphdata.split(", ");
console.log(graphdata);
graphdata.forEach(function(e,i){
	a= e.split(" ");
	if(i!=0)
		a[1]=parseFloat(a[1]);
	graphdata2.push(a);
	console.log(a);

})
console.log(graphdata2);

  var data = google.visualization.arrayToDataTable(graphdata2);

  var options = {
    title: 'My Expense Stats'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

  chart.draw(data, options);
}
function drawBar() {
	bardata = bardata.split(", ");
	console.log(bardata);
	bardata.forEach(function(e,i){
		b= e.split(" ");
		if(i!=0)
			b[1]=parseFloat(b[1]);
		bardata2.push(b);
		console.log(b);

	})
	console.log(bardata2);

	  var data1 = google.visualization.arrayToDataTable(bardata2);

	  var options1 = {
	    title: 'My Expense Stats'
	  };

	  var chart1 = new google.visualization.BarChart(document.getElementById('barchart'));

	  chart1.draw(data1, options1);
	}
$( document ).ready(function() {
	var p = '<%= session.getAttribute("username") %>';
	console.log(p);
    console.log( "ready!" );
    $.ajax({ 
		url: "BarServlet",
		data: {"username" : p},
		type : "post",
    	success: function(data){
    			graphdata = data;
    			bardata = data;

				//	$("#piechart").html(data);
					
    		}
		});
});
$( document ).ready(function() {
	var p = '<%=session.getAttribute("username")%>';
	console.log(p);
    console.log( "ready!" );
    $.ajax({ 
		url: "SumCount",
		data: {"username" : p},
		type : "post",
    	success: function(data){
					$("#total1").html(data);
					$("#total2").html(data);

    		}
		});
});
    
</script>
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
					<li class="active"><a href="home.jsp"> <i class="ti-panel"></i>
							<p>
								<font size="2" color="black">Statistics</font>
							</p>
					</a></li>
					<li><a href="RecurringExpense.jsp"> <i
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
					<div class="card-body">
						<div class="row">
							<div class=" h4 col-sm-120 mb-0 text-center my-auto">
								<font size="5" color="black"><b>Statistics</b></font>
							
							</div>
						</div>
					</div>
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
					<div class="row">
						<div class="col-lg-3 col-sm-6"
							style="width: 1200px; height: 600px;">
							<div class="card">
								<div class="content">
									<b class="col-sm-8" align="right">Your Total Expenditure: $
										<b class=" mb-0 text-primary" id="total2"></b>
									</b><br>
									<div id="barchart" style="width: 1100px; height: 600px;"></div>


									<div class="footer">
										<hr />
										<div class="stats">
											<i class="ti-reload"></i><font size="3"><b>Bar
													Chart for Expense Category</b></font>
										</div>
									</div>
								</div>
							</div>
						</div>



					</div>

				</div>
			</div>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-5 col-sm-7"
							style="width: 1200px; height: 600px;">
							<div class="card">
								<div class="content">
									<b class="col-sm-8" align="right"><font size="3"><b>Your
												Total Expenditure: $ </b></font> <b class=" mb-0 text-primary"
										id="total1"></b></b><br>
									<div id="piechart" style="width: 1100px; height: 600px;"></div>


									<div class="footer">
										<hr />
										<div class="stats">
											<i class="ti-reload"></i><font size="3"><b>Pie
													Chart for Expense Category</b></font>
										</div>
									</div>
								</div>
							</div>
						</div>



					</div>

				</div>
			</div>

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

			<footer class="footer">
			<div class="container-fluid">
				<div class="copyright pull-right">
					<i>Team - 4</a>
				</div>
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