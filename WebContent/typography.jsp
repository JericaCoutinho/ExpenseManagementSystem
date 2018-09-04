<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Paper Dashboard by Creative Tim</title>

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
					<a href="http://www.creative-tim.com" class="simple-text">
						Advisor123 </a>
				</div>

				<ul class="nav">
					<li><a href="dashboard.jsp"> <i class="ti-agenda"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a href="table.jsp"> <i class="ti-email"></i>
							<p>Messages</p>
					</a></li>
					<li class="active"><a href="typography.jsp"> <i
							class="ti-panel"></i>
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
						<a class="navbar-brand" href="#">Settings</a>
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
							<li><a href="logout.jsp"> <i class="ti-power-off"></i>
									<p>Log out</p>
							</a></li>
						</ul>

					</div>
				</div>
			</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-9 col-md-15">
							<div class="card">
								<div class="header">
									<h4 class="title">Edit Profile</h4>
								</div>
								<div class="content">
									<form>
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label>Company</label> <input type="text"
														class="form-control border-input" disabled
														placeholder="Company">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>Username</label> <input type="text"
														class="form-control border-input" placeholder="Username"
														value="Advisor123">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label for="exampleInputEmail1">Email address</label> <input
														type="email" class="form-control border-input"
														placeholder="Email">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>First Name</label> <input type="text"
														class="form-control border-input" placeholder="Company"
														value="Chet">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Last Name</label> <input type="text"
														class="form-control border-input" placeholder="Last Name"
														value="Faker">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>Address</label> <input type="text"
														class="form-control border-input"
														placeholder="Home Address" value="Melbourne, Australia">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<label>City</label> <input type="text"
														class="form-control border-input" placeholder="City"
														value="Melbourne">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>Country</label> <input type="text"
														class="form-control border-input" placeholder="Country"
														value="Australia">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>Postal Code</label> <input type="number"
														class="form-control border-input" placeholder="ZIP Code">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>About Me</label>
													<textarea rows="5" class="form-control border-input"
														placeholder="Here can be your description" value="Mike">
                                                    Hi, I am an advisor....
                                                </textarea>
												</div>
											</div>
										</div>
										<div class="text-center">
											<button type="submit" class="btn btn-info btn-fill btn-wd">Update
												Profile</button>
										</div>
										<div class="clearfix"></div>
									</form>
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
