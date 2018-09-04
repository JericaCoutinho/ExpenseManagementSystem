
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;


/**
 * Servlet implementation class LoginValidation
 */
@WebServlet("/LoginValidation")
public class LoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginValidation() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String targetPage=null;
		String sqlQuery=null;
		boolean userExists = false;
		ArrayList<String> notifications = new ArrayList<String>();
		String formusername = request.getParameter("username");
		String formPassword = request.getParameter("password");
	
		out.println("Inside the Login Validation Servlet Page");
		try {

			HttpSession localHttpSession = request.getSession();
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");	
			Statement sqlst = conn.createStatement();	Statement s = conn.createStatement();
			sqlQuery="select * from Customer where username ='" + formusername + "' AND pass ='" + formPassword + "'";
			ResultSet r = s.executeQuery(sqlQuery);
			
			if (r.next()) {
				userExists= true;
				targetPage="home.jsp";
			}
			else {
				sqlQuery="select * from Advisor where username ='" + formusername + "' AND pass ='" + formPassword + "'";
				r = s.executeQuery(sqlQuery);
				if (r.next()) {
					localHttpSession.setAttribute("advisor", "true");
					userExists= true;
					targetPage="advisorHome.jsp";
					System.out.println("Found the Financial Advisor");
				}
			}

			if(userExists) {
				System.out.println("NewUser Exists");
				localHttpSession.setAttribute("username", formusername);
				sqlQuery="select * from notificationmsg where ReceiverName  ='" + formusername + "'";
				r = s.executeQuery(sqlQuery);
				while (r.next()) {
					System.out.println(r.getString("notificationType") + r.getString("SenderName"));
					notifications.add(r.getString("notificationType"));
					notifications.add(r.getString("SenderName"));
				}
				localHttpSession.setAttribute("NotificationList", notifications);
			}
			else {
				localHttpSession.setAttribute("message", "Please enter valid Credentials.");
				//System.out.println("Invalid user!");
				targetPage="login.jsp"; 
			}
			response.sendRedirect(targetPage);
			conn.close();
		} catch (Exception localException) {
			localException.printStackTrace();
			System.out.println("Invalid User");
		}
	}

}