<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Expense</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css">
  <link href='css/financialGoal.css' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
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
    <link rel="stylesheet" href="bgimage.css"  />
</head>

<style>
table {
    border-collapse: collapse;
    width: 85%;
    float:right;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color:#34CACA;;
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
		url: "GetDataServlet",
		data: {"username" : p},
		type : "post",
    	success: function(data){
					$("#Response").html(data);
					
    		}
		});
});

 function myfunction()
 {
	 var p = document.getElementById("username").value;
	 var q = document.getElementById("category").value;
	 //var d=new Date("OCT 19,2016");
	 //var day = d.getDate();
	 //var month= d.getMonth()+1;
	 //var year = d.getFullYear();
	 var d = document.getElementById("datepicker").value;
	 var s = document.getElementById("value").value;
	 $.ajax(
			{
				url: "DailyExpServlet",
				data: {"username" : p, "category" : q,"date" : d, "value" : s},
				type : "post",
				success : function(data)
				{
					alert("Daily Expense added!");
					$("#Response").load("#Response");
					//successmessage = 'Data was succesfully captured';
	                //$("label#successmessage").text(successmessage);
				}
			} 
	 
	 
	 );
 }
</script>
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
                <li class="active">
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
                <li>
                    <a href="Exppro.jsp">
                        <i class="ti-map"></i>
                        <p>Set Financial Goal</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>
<div class="form-style-8">
  <h2>Daily Expense</h2>
  <form>
    <b>Username:</b> <input class="effect-1" type="text" name="username" disabled
					id="username" value= " <%= session.getAttribute("username") %>" 
					 />
   <b>Expense Category:</b> <select id="category">
					<option value="Grocery">Grocery</option>
					<option value="Home Utilities">Home Utilities</option>
					<option value="Miscellaneous">Miscellaneous</option>
				</select>
    <b>Expense Date: </b><input  type="text" name="date" id="datepicker" placeholder="Expense Date">
    <b>Expense Value :</b><input type="text"  name="value" id="value" placeholder="Expense Value">
    <input type="button" value="Add" onclick="myfunction()" />
  </form>
</div>
	<div id="Response"></div>
</body>
</html>


