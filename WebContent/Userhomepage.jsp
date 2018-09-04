<!DOCTYPE html>
<html>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

@import url(CSS.css);
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>User Page</title>
<body>
	<div class="w3-top">
		<div class="w3-bar w3-card" id="myNavbar">
			<button class="w3-bar-item w3-left w3-button">
				EMS<i class="fa fa-money" aria-hidden="true"></i>
			</button>
			<button class="w3-bar-item w3-left w3-button">
				<i class="fa fa-user-circle" aria-hidden="true"></i>
			</button>
			<button class="w3-bar-item w3-left w3-button">
				<i class="fa fa-envelope" aria-hidden="true"></i>
			</button>

			<button class="w3-bar-item w3-right w3-button">
				<a href="logout.jsp"><i class="fa fa-power-off"
					aria-hidden="true"></i></a>
			</button>
			<div class="w3-dropdown-hover  w3-hide-small">
				<button class="w3-bar-item w3-button">
					<i class="fa fa-bell" aria-hidden="true"></i>
				</button>

				<div class="w3-dropdown-content w3-card-4 w3-bar-block"
					style="width: 300px">
					<a href="#" class="w3-bar-item w3-button">You saved $ 200 in
						January</a> <a href="#" class="w3-bar-item w3-button">Recurring
						expense</a>
				</div>
			</div>
		</div>
		<div>


			<!-- Page Container -->
			<div class="w3-container w3-content"
				style="max-width: 1400px; margin-top: 80px">
				<!-- The Grid -->
				<div class="w3-row">
					<!-- Left Column -->
					<div class="w3-col m3">
						<!-- Profile -->
						<div class="w3-card w3-round w3-white">
							<div class="w3-container">
								<h4 class="w3-center"><%= session.getAttribute("username") %></h4>
								<p class="w3-center">
									<img src="" class="w3-circle"
										style="height: 106px; width: 106px" alt="Avatar">
								</p>
								<hr>

							</div>
						</div>
						<br> <br>

						<!-- Accordion -->
						<div class="w3-card w3-round">
							<div class="w3-white">


								<div class="w3-container">
									<a href="DailyExp.jsp"
										class="w3-button w3-block w3-theme-l1 w3-left-align w3-white">Daily
										Expenses</a>
								</div>
								<div class="w3-container">
									<button
										onclick="document.getElementById('id02').style.display='block'"
										class="w3-button w3-block w3-theme-l1 w3-left-align w3-white">Recurring
										Expenses</button>
								</div>
								<div class="w3-container">
									<button
										onclick="document.getElementById('').style.display='block'"
										class="w3-button w3-block w3-theme-l1 w3-left-align w3-white">Groups</button>
								</div>
								<div class="w3-container">
									<a href="Finance_Advisor.jsp"
										class="w3-button w3-block w3-theme-l1 w3-left-align w3-white">Contact
										Advisor</a>
								</div>
								<div class="w3-container">
									<a href="Exppro.jsp"
										class="w3-button w3-block w3-theme-l1 w3-left-align w3-white">Set
										Financial Goal</a>
								</div>


							</div>
						</div>
						<br>
						<div
							class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
							<span onclick="this.parentElement.style.display='none'"
								class="w3-button w3-theme-l3 w3-display-topright"> <i
								class="fa fa-remove"></i>
							</span>
							<p>
								<strong>Hey!</strong>
							</p>
							<p>Your expenses exceeded your budget by $40</p>
						</div>
					</div>


					<div class="w3-twothird">

						<div class="w3-container w3-card w3-white w3-margin-bottom">
							<h3 class="w3-text-grey w3-padding-16">
								<i
									class="fa fa-calendarfa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Expenses
							</h3>
							<div class="w3-container">
								<h6 class="w3-text-teal">
									<i class="fa fa-calendar fa-fw w3-margin-right"></i>Feburary
									2018</span>
								</h6>
								<h7 class="w3-opacity">
								<b>You Saved $ 20</b></h7>


								<ul>
									<li>2/3/2018 Halal-Market $ 50</li>
									<li>2/2/2018 A&F $ 50</li>
									<li>2/1/2018 Walmart$ 50</li>

								</ul>

								<hr>
							</div>
							<div class="w3-container">
								<h6 class="w3-text-teal">
									<i class="fa fa-calendar fa-fw w3-margin-right"></i>January
									2018
								</h6>
								<h7 class="w3-opacity">
								<b>You Saved $ 35</b></h7>

								<ul>
									<li>1/28/2018 RiteAid $ 50</li>
									<li>1/21/2018 Store22 $ 50</li>
									<li>1/19/2018 Walmart $ 50</li>
									<li>1/6/2018 Fedex $ 45</li>
								</ul>
								<hr>
							</div>
							<div class="w3-container">
								<h6 class="w3-text-teal">
									<i class="fa fa-calendar fa-fw w3-margin-right"></i>December
									2017
								</h6>
								<h7 class="w3-opacity">
								<b>You Saved $ 5</b></h7>

								<ul>
									<li>12/24/2018 CVS $ 6</li>
									<li>12/22/2018 Store22 $ 100</li>
									<li>12/19/2018 Walmart $ 90</li>
									<li>12/16/2018 Uncommon Grounds $ 15</li>
								</ul>
							</div>
						</div>


						<!-- End Right Column -->
					</div>

					<!-- End Grid -->
				</div>

				<!-- End Page Container -->
			</div>




			<!-- Modal that pops up when you click on "Daily Expense" -->
			<div id="id01" class="w3-modal" style="z-index: 4">
				<div class="w3-modal-content w3-animate-zoom">
					<div class="w3-container w3-padding w3-green">
						<span
							onclick="document.getElementById('id01').style.display='none'"
							class="w3-button w3-green w3-right w3-xlarge"><i
							class="fa fa-remove"></i></span>
						<h3>Daily Expense</h3>
					</div>
					<div class="w3-row">
						<div class="w3-container w3-content w3-col m4 l3">
							<div class="w3-panel">
								<form action="#">
									<select name="daily" size="3">
										<option value="Add" selected>Add</option>
										<option value="Modify">Modify</option>
										<option value="Delete">Delete</option>
									</select>
								</form>
							</div>
							<div class="w3-panel">
								<form action="#">
									<select name="type" size="4">
										<option value="utilities" selected>Utilities</option>
										<option value="Food">Food</option>
										<option value="Auto">Automotive</option>
										<option value="miscellaneous">Miscellaneous</option>
									</select>
								</form>
							</div>
						</div>
						<div class="w3-container w3-content w3-col m8 l9 w3-right">
							<hr>
							<input class="w3-input w3-border w3-margin-bottom" type="text"
								placeholder="Label"> <input
								class="w3-input w3-border w3-margin-bottom" type="text"
								placeholder="Amount Eg. $1200"> <input
								class="w3-input w3-border w3-margin-bottom" type="text"
								placeholder="Date Eg. 2/9/2018">

							<div class="w3-section">
								<a class="w3-button w3-red"
									onclick="document.getElementById('id01').style.display='none'">Cancel
									<i class="fa fa-remove"></i>
								</a> <a class="w3-button w3-dark-green w3-right"
									onclick="document.getElementById('id01').style.display='none'">Submit</a>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal that pops up when you click on "Recurring Expense" -->
			<div id="id02" class="w3-modal" style="z-index: 3">
				<div class="w3-modal-content w3-animate-zoom">
					<div class="w3-container w3-padding w3-green">
						<span
							onclick="document.getElementById('id02').style.display='none'"
							class="w3-button w3-green w3-right w3-xlarge"><i
							class="fa fa-remove"></i></span>
						<h3>Recurring Expense</h3>
					</div>
					<div class="w3-row">
						<div class="w3-container w3-content w3-col m4 l3">
							<div class="w3-panel">
								<form action="#">
									<select name="daily" size="3">
										<option value="Add" selected>Add</option>
										<option value="Modify">Modify</option>
										<option value="Delete">Delete</option>
									</select>
								</form>
							</div>
							<div class="w3-panel">
								<form action="#">
									<select name="type" size="4">
										<option value="utilities" selected>Utilities</option>
										<option value="Food">Food</option>
										<option value="Auto">Automotive</option>
										<option value="miscellaneous">Miscellaneous</option>
									</select>
								</form>
							</div>
						</div>
						<div class="w3-container w3-content w3-col m8 l9 w3-right">
							<hr>
							<input class="w3-input w3-border w3-margin-bottom" type="text"
								placeholder="Label"> <input
								class="w3-input w3-border w3-margin-bottom" type="text"
								placeholder="Amount Eg. $1200"> <input
								class="w3-input w3-border w3-margin-bottom" type="text"
								placeholder="Every Eg. 2/9/2018" style="width: 100px"> <input
								class="w3-input w3-border w3-margin-bottom" type="text"
								placeholder="Till Date" style="width: 200px">

							<div class="w3-section">
								<a class="w3-button w3-red"
									onclick="document.getElementById('id02').style.display='none'">Cancel
									<i class="fa fa-remove"></i>
								</a> <a class="w3-button w3-dark-green w3-right"
									onclick="document.getElementById('id02').style.display='none'">Submit</a>

							</div>
						</div>
					</div>
				</div>
			</div>



		</div>
		<footer class="w3-center w3-black w3-padding-64">
			<div class="w3-large w3-section"></div>
			<p>Done by TEAM-4</p>
		</footer>
</body>
</html>