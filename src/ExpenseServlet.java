 
import java.io.IOException;
import java.io.PrintWriter;
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
import java.sql.Statement;

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
			conn = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");
			String Uname = request.getParameter("Uname");
			
			String Bgoal = request.getParameter("budget");
			System.out.println("Bgoal"+Bgoal);
			String query= "select * from Budget where username= '"+Uname+"'";
			PreparedStatement preparedStmt= conn.prepareStatement(query);
			preparedStmt.execute();
			ResultSet resultSet = preparedStmt.getResultSet();  //gets the result set
			boolean recordfound= resultSet.next();
			//System.out.println(Bgoal);
			
			Statement preparedStmt2= conn.createStatement();
			PrintWriter out = response.getWriter();
			String query1="";
			if(recordfound)
			{   
				System.out.println(Bgoal);
				query1 = "update Budget set budget='"+Bgoal+"' "+" where username= '"+Uname.trim()+"'";
				System.out.println(query1);
				preparedStmt2.executeUpdate(query1);
				out.println("Updated!");
			}
			else
			{
				query1 = "insert into Budget (username, budget) values('"+Uname.trim()+"','"+Bgoal+"')";
				preparedStmt2.executeUpdate(query1);
				out.println("Inserted!");
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
