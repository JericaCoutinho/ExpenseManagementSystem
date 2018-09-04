

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditRowRecurServlet
 */
@WebServlet("/EditRowRecurServlet")
public class EditRowRecurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditRowRecurServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = null; 
		String output="";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				conn = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");			
				System.out.println(request.getParameter("id"));
				String q1 = "Select * from Expense where expense_id='"+request.getParameter("id")+"'";
				PreparedStatement stmt3 = conn.prepareStatement(q1);
				ResultSet rst = stmt3.executeQuery();
				rst.next();
				String Uname = rst.getString("username");
				String description = rst.getString("expense_desc");
				String category = rst.getString("expense_category");
				String value = rst.getString("expense_value");
				String date = rst.getString("expense_date");
				String frequency = rst.getString("recurring_type");

				output = "";
				int ID = rst.getInt("expense_id");
				output = "{\"username\":\""+Uname.trim()+"\",\"expense_desc\":\""+description+"\",\"category\":\""+category+"\",\"expense_value\":\""+value+"\",\"expense_date\":\""+date+"\",\"frequency\":\""+frequency+"\",\"expense_id\":\""+ID+"\"}";
				System.out.println("Output: "+output);
				conn.close();
				
				
				
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}catch (ClassNotFoundException e) {

	}
		PrintWriter out =response.getWriter();
		out.print(output);

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
