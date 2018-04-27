

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
 * Servlet implementation class SumCount
 */
@WebServlet("/SumCount")
public class SumCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SumCount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		  float sumcount=0; 
	    try
	    {
	    	Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/NewExpense", "root", "root");
			String Uname=request.getParameter("username"); 
	      String str1 =  "SELECT SUM(expense_value) FROM Expense WHERE username ='"+Uname+"'" ;
	      System.out.println("str1" + str1);

	      PreparedStatement st = conn.prepareStatement(str1);
	      ResultSet  rs = st.executeQuery();
	      if(rs.next())
	      {
	      sumcount = rs.getFloat(1);
	      System.out.println("Total: "+sumcount);
	      }
		  response.getWriter().append(""+sumcount);
		  
	      
	      
	      /*   request.setAttribute("sumcount",sumcount);
	      String nextJSP = "/RecurringExpense.jsp";
	      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
	    		  dispatcher.forward(request,response);*/
	      conn.close();

	    }
	    catch (Exception localException)
	    {
	      localException.printStackTrace();
	      System.out.println("Something went wrong");
	      
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
