<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="edu.albany.se.team_project.doa.AdvisorDAO"%>
<%@ page import="edu.albany.se.team_project.model.Advisor"%>

<%
     ArrayList<Advisor> advisors = new ArrayList<Advisor>();
     AdvisorDAO advisorDOA = new AdvisorDAO();
     advisors = advisorDOA.getAllAdvisorDetails();
     Advisor advisor = new Advisor();
     String usrName = new String(session.getAttribute("username").toString());

%>

<!doctype html>
<html lang="en">
<head>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css">
  <link href='css/financialGoal.css' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet"/>
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet"

    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
     crossorigin="anonymous"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Dashboard</title>

<!-- Bootstrap core CSS     -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<!-- Animation library for notifications   -->
<link href="css/animate.min.css" rel="stylesheet" />
<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->

<link href="assets/css/demo.css" rel="stylesheet" />
<!--  Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="stylesheet"
	href="css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<style>
logoutme{
right:50px;
}

input {
	  font-family: "Roboto", sans-serif;
	  outline: 0;
	  background: #34CACA;
	  width: 15%;
	  border: 0;
	  padding: 10px;
	  color: #FFFFFF;
	  font-size: 14px;
	}
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

</style>
<script>

function approveadvisor(advisorname){
	window.alert("Advisor is Approved");
}

function removeadv(username){
	
	$.ajax({
		type:'POST',
		url:'RejectServlet',
		data:{"username1":username},
		success:function(data){
			console.log(data)
			window.alert("Advisor is Removed successfully");
			
			$("#response").html(data);
		}
	});
}

</script>
 <body>
 <nav><div id="logoutme">
<ul class="nav navbar-nav navbar-right">
<li><a href="logout.jsp"> <i class="ti-power-off">
									<p><b><font size="3" color="black">Log Out</font></b></p></i>
							</a></li>
						</ul></div>
						</nav>
     <div class="form-style-8">

           <h1>

                <b> LIST OF FINANCIAL ADVISORS </b>

           </h1>

           <div id="accordion">

                <%

                     for (int i = 0; i < advisors.size(); i++) {
                           advisor = advisors.get(i);
                     
                %>

                <div class="card">
                <div class="card-header" id="headingOne<%= i+1 %>">
                <h5 class="mb-0">
                           <button class="btn btn-link" data-toggle="collapse"
                             data-target="#collapseOne<%= i+1 %>" aria-expanded="true"
                             aria-controls="collapseOne<%= i+1 %>"><%=(advisor.getF_name() + " " + advisor.getL_name())%></button>
                     </h5>
                </div>

             

                     <div id="collapseOne<%=i + 1%>" class="collapse" aria-labelledby="headingOne<%=i + 1%>" data-parent="#accordion">
                           <div class="card-body">
                                <ul id="response" class="list-group">
                                     <!-- -BVP -->
                                     <li class="list-group-item">
                         
                                     </li>
                                     <li class="list-group-item">
                                     <button id="approve" onclick="window.location.reload();approveadvisor()">Approve</button>
                                     <input type="button" value="reject" onclick= "window.location.reload();removeadv('<%=advisor.getusername()%>')" width="60" height="30"/>
                                     
                                     </li>
                                     <li class="list-group-item" id="name"><%=advisor.getF_name() + " " + advisor.getL_name()%></li>
                                     <li class="list-group-item username_li"><a href="#" class="username"><%=advisor.getusername()%></a></li>
                                     <li class="list-group-item" id="mail"><%=advisor.getEmail()%></li>
                                     <li class="list-group-item" id="bio"><%=advisor.getBiography()%></li>
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

     
     <script
     src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
           integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
           crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
           integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
           crossorigin="anonymous"></script>
          
     
    

           

</body>
</html>