

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetBudget
 */
@WebServlet("/GetBudget")
public class GetBudget extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBudget() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/NewExpense", "root", "root");
				String uname=request.getParameter("username");
				String Bgoal= request.getParameter("Budget");
				
				String SQL= "Select * from Budget";
				System.out.println(uname);
				PreparedStatement pstmt= conn.prepareStatement(SQL);
				pstmt.setString(1, uname);
				pstmt.setString(2, Bgoal);
				ResultSet rs = pstmt.executeQuery();
				//ResultSet rs = pstmt.getResultSet();
				while(rs.next())
				{
					uname = rs.getString("username");
					Bgoal = rs.getString("Budget");
					
					//System.out.println(uname);
					//System.out.println(Bgoal);
					
				}
				//if(request.)
				response.getWriter();
				conn.close();
			
		    
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
