 
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.Registration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.Statement;

/**
 * Servlet implementation class ExpenseServlet
 */
@WebServlet("/ExpenseServlet")
public class ExpenseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ExpenseServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().println("<input type='text' value='jerica  "+request.getParameter("budget")+"'></input>");
		//int n;
		//n= Integer.parseInt(request.getParameter("budget_value"));
		
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/NewExpense", "root", "root");
			
			String Uname = request.getParameter("Uname");
			String Bgoal = request.getParameter("budget");
			
			String query= "select * from Budget";
			PreparedStatement preparedStmt= conn.prepareStatement(query);
			preparedStmt.setString(1, Uname);
			preparedStmt.setString(2, Bgoal);
			preparedStmt.execute();
			ResultSet resultSet = preparedStmt.getResultSet();  //gets the result set
			boolean recordfound= resultSet.next();
			
			if(recordfound)
			{
				String query1 = "update Budget set username=?, budget=?";
				PreparedStatement preparedStmt2= conn.prepareStatement(query1);
				preparedStmt2.setString(1, Uname);
				preparedStmt2.setString(2, Bgoal);
				preparedStmt2.executeUpdate();
			}
			else
			{
				String query2 = "insert into Budget (username, budget) values(?,?)";
				PreparedStatement preparedStmt3= conn.prepareStatement(query2);
				preparedStmt3.setString(1, Uname);
				preparedStmt3.setString(2, Bgoal);
				preparedStmt3.executeUpdate();
			}
			conn.close();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
