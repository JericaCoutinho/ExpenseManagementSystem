

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.albany.se.team_project.doa.CustomerDAO;
import edu.albany.se.team_project.model.Customer;

/**
 * Servlet implementation class CustomerDetails
 */
@WebServlet("/CustomerDetails")
public class CustomerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerDetails() {
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
		String sqlQuery;
		PrintWriter localPrintWriter = response.getWriter();
		boolean customerFound=false;

		try {
			response.setContentType("text/html");
			Customer customer;
			String financierName = request.getParameter("financierName");
			String customerName = request.getParameter("customerName");
			Class.forName("com.mysql.jdbc.Driver");
			Connection localConnection = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");	Statement localStatement = localConnection.createStatement();
			HttpSession localHttpSession = request.getSession();
			ArrayList<Customer> customers = new ArrayList<Customer>();
			CustomerDAO customerDOA = new CustomerDAO(financierName);
			if(customerDOA!=null)
			{   
				customers = customerDOA.getAllCustomerDetails();
				for (int i = 0; i < customers.size(); i++) {
					customer = customers.get(i);
					if(customer.getusername().equals(customerName)) {
						localHttpSession.setAttribute("customerFirstName", customer.getF_name());
						localHttpSession.setAttribute("customerLastName", customer.getL_name()); //Last Sprint
						localHttpSession.setAttribute("customerEmail", customer.getEmail());					
						sqlQuery="select * from notificationmsg where SenderName IN('" + customerName + "') and ReceiverName IN('" + financierName +"') and notificationType in('"+"New Customer"+"')";
						ResultSet selectNotificationResultSet = localStatement.executeQuery(sqlQuery);
						if (selectNotificationResultSet.next()){  
							sqlQuery="delete from notificationmsg where SenderName IN('" + customerName + "') and ReceiverName IN('" + financierName +"') and notificationType in('"+"New Customer"+"')";
							localStatement.executeUpdate(sqlQuery);
							System.out.println("Delete Notification Entry");
						}
						customerFound=true;
						break;
					}
				}
				if(!customerFound){
					localPrintWriter.println("Invalid Customer");
				}
			}	
		}
		catch (Exception localException) {
			localException.printStackTrace();
			System.out.println("Invalid Customer");
		}
	}

}
