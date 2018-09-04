

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetDataServlet
 */
@WebServlet("/GetDataServlet")
public class GetDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		//String output="";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
				conn = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");		
				String Uname = request.getParameter("username");
				String category = request.getParameter("category");
				String value = request.getParameter("value");
				String date = request.getParameter("date");
				String query5 = "Select * from Expense where username ='"+Uname+"' and expense_type='Daily Expense'";
				//System.out.println(Uname);
				PreparedStatement smt = conn.prepareStatement(query5);
				ResultSet rs = smt.executeQuery();
				String html="<table border =1px><tr><th>Expense ID</th> <th>User Name</th> <th>Type Of Expense</th> <th>Category</th> <th>Expense Value</th> <th>Date of Expense</th><th>Action</th> </tr> ";
				while(rs.next()) {
					html = html+"<tr>";
					int ID = rs.getInt("expense_id");
					html = html+"<td>"+rs.getString(1)+"</td>";
					html = html+"<td>"+rs.getString(2)+"</td>";
					html = html+"<td>"+rs.getString(4)+"</td>";
					html = html+"<td>"+rs.getString(5)+"</td>";
					html = html+"<td>"+rs.getString(6)+"</td>";
					html = html+"<td>"+rs.getString(7)+"</td>";
					html = html+"<td><input type=\"button\" value=\"Edit\"onclick='edit("+ID+")'/>";
					html = html+"</tr>";
				}
				html=html+"</table>";
				response.getWriter().append(html);
				
				
				conn.close();
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		//PrintWriter out =response.getWriter();
			//out.print(output);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
