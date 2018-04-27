
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RecurExpServlet
 */
@WebServlet("/RecurExpServlet")
public class RecurExpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecurExpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
		//	try {
				Class.forName("com.mysql.jdbc.Driver");
				String username = request.getParameter("username");
				String description = request.getParameter("description");
				String category = request.getParameter("category");
				String value = request.getParameter("value");
				String date = request.getParameter("datepicker");
				String frequency = request.getParameter("frequency");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/NewExpense", "root", "root");
				Statement sqlstmt=conn.createStatement();
				PrintWriter out = response.getWriter();
				String s="";
			

				//System.out.println(request.getParameter("id"));
				if(!request.getParameter("id").equals("")) {
					s= "update Expense set expense_desc='"+description
							+"',expense_category='"+category+"', expense_value='"+value+"', expense_date='"+date+"', recurring_type='"+frequency+"' where expense_id='"+request.getParameter("id")+"'";
					sqlstmt.executeUpdate(s);
					out.println("Updated Successfully!");
				}
				else
				{
					s = "insert into Expense(username,expense_desc,expense_type, expense_category, expense_date, expense_value,recurring_type) values ('"+username+"','"+description+"','Recurring Expense','"+category+"','"+date+"','"+value+"','"+frequency+"')";
					/*String query2 = "select last_insert_id() as last_id from Expense";
					PreparedStatement stmt5 = conn.prepareStatement(query2);
					ResultSet rs = stmt5.executeQuery(); 
					String expenseid = "";
					if(rs.next())
						expenseid= rs.getString("last_id");
					System.out.println(expenseid);
					String eventName= username+expenseid;
					String freq="";
					if(frequency.equals("monthly")) {
						freq="MONTH";
					}
					else if(frequency.equals("weekly")) {
						freq="WEEK";
					}
					else if(frequency.equals("yearly"))  {
						freq="YEAR";
					}
				//	else if(frequency.equals("minute"))  {
				//		freq="MINUTE";
			//		}
					//PreparedStatement stmt7 = conn.prepareStatement("CREATE EVENT "+eventName+" EVERY 1 " + freq +
						//	" DO insert into Expense(username,expense_desc,expense_type, expense_category, expense_value, expense_date,recurring_type) "
						//	+ "values ("+username+","+description+",Recurring Expense,"+category+","+value+","+date+","+frequency);
					PreparedStatement stmt7 = conn.prepareStatement("CREATE EVENT "+eventName+" ON SCHEDULE EVERY 1 " + freq +" STARTS CURRENT_TIMESTAMP + INTERVAL 1 "+freq+" ON COMPLETION PRESERVE ENABLE DO insert into Expense(username,expense_desc,expense_type, expense_category, expense_value, expense_date,recurring_type) values (?,?,?,?,?,?,?)");
					stmt7.setString(1, username);
					stmt7.setString(2, description);
					stmt7.setString(3, "Recurring Expense");
					stmt7.setString(4, category);
					stmt7.setString(5, value);
					stmt7.setString(6, date);
					stmt7.setString(7, frequency);
					stmt7.executeUpdate();*/
					sqlstmt.executeUpdate(s);
					out.println("Added Succesfully");
				}
				conn.close();
		} 
		catch (SQLException e) {
			System.out.println("Sql Exception ");

			e.printStackTrace();
			}
	//	}
		catch (ClassNotFoundException e) {
			System.out.println("Class not found");
		}	
		
		}	
		}
	


//}
