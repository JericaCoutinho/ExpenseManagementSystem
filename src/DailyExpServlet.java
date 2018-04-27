
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
 * Servlet implementation class DailyExpServlet
 */
@WebServlet("/DailyExpServlet")
public class DailyExpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DailyExpServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = null; int num=0, ID=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				String uname=request.getParameter("username");
				String category=request.getParameter("category");
				String expense_type="Daily expense";
				String expense_value=request.getParameter("value");
				String expense_date=request.getParameter("date");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/NewExpense", "root", "root");
				Statement sqlstmt=conn.createStatement();
				PrintWriter out = response.getWriter();
				String s="";
				//System.out.println(request.getParameter("id"));
				if(!request.getParameter("id").equals("")) {
					s = "update Expense set expense_category='"+request.getParameter("category")+"', expense_value='"+request.getParameter("value")+"', expense_date='"+request.getParameter("date")+"' "
							+ "where expense_id='"+request.getParameter("id")+"'";
					sqlstmt.executeUpdate(s);
					out.println("Updated Successfully!");
				}
				else {
					s = "insert into Expense(username,expense_desc,expense_type, expense_category, expense_value, expense_date,recurring_type) values ('"+uname+"','One time bill','Daily Expense','"+category+"','"+expense_value+"','"+expense_date+"','Once')";
					sqlstmt.executeUpdate(s);
					out.println("Added Succesfully");
				}

							
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
