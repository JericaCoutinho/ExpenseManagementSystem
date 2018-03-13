<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Financial goal
</title><script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<link href='css/financialGoal.css' rel='stylesheet' type='text/css'>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
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
</head>

<body>
<div class="sidebar" data-background-color="white" data-active-color="danger">

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="index.html" class="simple-text">
                    <%=session.getAttribute("username") %>>
                </a>
            </div>

            <ul class="nav">
                <li >
                    <a href="home.jsp">
                        <i class="ti-panel"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="DailyExp.jsp">
                        <i class="ti-user"></i>
                        <p>Daily Expenses</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="ti-view-list-alt"></i>
                        <p>Recurring Expenses</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="ti-text"></i>
                        <p>Groups</p>
                    </a>
                </li>
                <li>
                    <a href="Finance_Advisor.jsp">
                        <i class="ti-pencil-alt2"></i>
                        <p>Contact Advisor</p>
                    </a>
                </li>
                <li class="active">
                    <a href="Exppro.jsp">
                        <i class="ti-map"></i>
                        <p>Set Financial Goal</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>
<div class="form-style-8">
  <h2>Set Your Financial Budget</h2>
  <form>
    <b>Username :</b><input type="text" name="username"  disabled id="username" value= " <%= session.getAttribute("username") %>" placeholder="Full Name" />
     <b>Expense Budget :</b><input type="text"  name="budget_value" id="budget" placeholder="Budget">
    <input type="button" value="Set Financial Goal" onclick="alert_me()" />
  </form>
</div>
</body>
</html>

