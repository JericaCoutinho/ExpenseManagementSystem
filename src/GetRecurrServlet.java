

import java.io.IOException;
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
 * Servlet implementation class GetRecurrServlet
 */
@WebServlet("/GetRecurrServlet")
public class GetRecurrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRecurrServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
				conn = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");	
				String Uname = request.getParameter("username");
				String query5 = "Select * from Expense where username ='"+Uname+"'";
				PreparedStatement smt = conn.prepareStatement(query5);
				ResultSet rs = smt.executeQuery();
				String html="<table class=\"table\" border =1px><thead class=\"thead-dark\">\n" +"<tr><th>ID</th><th>Description</th><th>Expense Type</th> <th>Category</th><th>Value</th><th>Date Of Expense</th> <th>Frequency</th><th>Edit</th><th>Delete</th></tr></thead> ";
				while(rs.next()) {
					html = html+"<tr>";
					int ID = rs.getInt("expense_id");
					html = html+"<td scope=\"row\">"+rs.getString(1)+"</td>";
					html = html+"<td>"+rs.getString(3)+"</td>";
					html = html+"<td>"+rs.getString(4)+"</td>";
					html = html+"<td>"+rs.getString(5)+"</td>";
					html = html+"<td>"+rs.getString(6)+"</td>";
					html = html+"<td>"+rs.getString(7)+"</td>";
					html = html+"<td>"+rs.getString(8)+"</td>";
					if(rs.getString(4).equals("Daily Expense")) {
					html = html+"<td><input type=\"button\" value=\"Edit\"onclick='opendaily(); editdaily("+ID+");' id=\""+ID+"\"/>";
					}
					else {
					html = html+"<td><input type=\"button\" value=\"Edit\"onclick='openrecurring(); editrecurring("+ID+");' id=\""+ID+"\"/>";
					}
					html = html+"<td><input type=\"button\" value=\"Delete\"onclick='window.location.reload(); deleterow("+ID+");' id=\""+ID+"\"/>";
					html = html+"</tr>";
				}
				html=html+"</table>";
				response.getWriter().append(html);
				conn.close();
			}
			catch(Exception e) {
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