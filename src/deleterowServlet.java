
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
 * Servlet implementation class deleterowServlet
 */
@WebServlet("/deleterowServlet")
public class deleterowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleterowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/NewExpense", "root", "root");
		Statement sqlstmt=conn.createStatement();
		PrintWriter out = response.getWriter();
		String s="";
		//System.out.println("ID Show: "+request.getParameter("id"));
		s= "delete from Expense where expense_id='"+request.getParameter("id")+"'";
		//System.out.println("s"+s);
		//String newlist = "Select * from Expense where username ='"+username+"'and expense_type='Recurring Expense'";
		System.out.println("s"+s);

		sqlstmt.executeUpdate(s);
		conn.close();		
		}
		catch (SQLException e) {
			System.out.println("Sql Exception ");

			e.printStackTrace();
			}
		catch (ClassNotFoundException e) {
			System.out.println("Class not found");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
