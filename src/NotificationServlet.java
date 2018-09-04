

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class NotificationServlet
 */
@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");				String Uname = request.getParameter("username");
				String query = "select * from Budget where username='"+request.getParameter("username")+"'";
				java.sql.Statement stmt =conn.createStatement();
				ResultSet rs=stmt.executeQuery(query);
				rs.next();
				System.out.println(rs.getString("budget"));
				PrintWriter out = response.getWriter();
				out.print(rs.getString("budget"));
				
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	catch (ClassNotFoundException e) {

	}

				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
				Connection conn = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");			String Uname = request.getParameter("username");
				Date d= new Date();
				SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
		        String date = DATE_FORMAT.format(d);

				String notification = request.getParameter("notification");
				String query = "Insert into notification(username,notification,date) values ('"+Uname+"','"+notification+"','"+date+"') ";
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.executeUpdate();
				
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	catch (ClassNotFoundException e) {

	}
	}

}
