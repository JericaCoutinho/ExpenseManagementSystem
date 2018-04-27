<!DOCTYPE HTML>
<html>
<head>


<title>Page1</title>

</head>
<body>

	<%@ page import="java.sql.*"%>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/NewExpense", "root", "root");
		Statement s = conn.createStatement();
		ResultSet r = s.executeQuery("select * from Customer;");

		boolean nameExists = false;
		boolean wrongPass = false;
		boolean advisor = false;

		while (r.next()) {
			String name = r.getString("username");
			if (name.equals(request.getParameter("username"))) {
				nameExists = true;
				if (!r.getString("pass").equals(request.getParameter("password")))
					wrongPass = true;
				break;
			}
		}

		if (!nameExists || wrongPass) {
			advisor = true;
			r = s.executeQuery("select * from Advisor;");
			while (r.next()) {
				String name = r.getString("username");
				if (name.equals(request.getParameter("username"))) {
					nameExists = true;
					if (!r.getString("pass").equals(request.getParameter("password")))
						wrongPass = true;
					break;
				}
			}

		}

		String name = request.getParameter("username");

		String targetPage = "DailyExp.jsp";

		if ((nameExists && !wrongPass) || session.getAttribute("username") != null) {
			targetPage = "DailyExp.jsp";
			if (session.getAttribute("username") == null) {
				if (advisor) {
					session.setAttribute("advisor", "true");
					targetPage = "advisorHome.jsp";
				}
				session.setAttribute("username", name);
			}
		} else
			session.setAttribute("message", "Please enter valid Credentials.");

		response.sendRedirect(targetPage);
	%>
	<br>
	<br>
</body>
</html>
