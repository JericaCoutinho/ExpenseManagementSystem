

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddOrEditServlet
 */
@WebServlet("/AddOrEditServlet")
public class AddOrEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrEditServlet() {
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
	public boolean getData(String id)
	{ 
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/NewExpense", "root", "root");
			Statement sqlst = conn.createStatement();
			String s;
			s = "Select * from Expense where expense_id= '"+id+"'";
			ResultSet rs = sqlst.executeQuery(s);
			if(rs.next())
			{
				return true;
			}
			rs.close();
			sqlst.close();
			conn.close();
			
		}catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		return false;
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			PrintWriter out =response.getWriter();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MgmtSystemDB", "root", "root");
			Statement sqlstmt = conn.createStatement();
			String Uname = request.getParameter("username");
			String s;
			if(getData(request.getParameter("id"))) {
				s = "update Expense set category='"+request.getParameter("category")+"', expense_value='"+request.getParameter("value")+"', expense_date='"+request.getParameter("date")+"' "
						+ "where expense_id="+request.getParameter("id")+"";
				sqlstmt.executeUpdate(s);
				out.println("Updated Successfully!");
			}
			else {
				s = "insert into Expense(expense_category, expense_value, expense_date)values('"+request.getParameter("category")+"','"+request.getParameter("value")+"','"+request.getParameter("date")+"')";        
			sqlstmt.executeUpdate(s);
				out.println("Added Successfully!");
			}
			sqlstmt.close();
			conn.close();
		
	}catch(SQLException se) {
        se.printStackTrace();
     } catch(Exception e) {
        e.printStackTrace();
     }

	}
}
