import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CustomerSelectFinancier
 */
@WebServlet("/CustomerSelectFinancier")
public class CustomerSelectFinancier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerSelectFinancier() {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse) throws ServletException, IOException
	  {
	    PrintWriter localPrintWriter = paramHttpServletResponse.getWriter();
	    try {
	      paramHttpServletResponse.setContentType("text/html");
	      Class.forName("com.mysql.jdbc.Driver");
	      Connection localConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/NewExpense", "root", "root");
	      Statement localStatement = localConnection.createStatement();
	      String str1 = paramHttpServletRequest.getParameter("customerName");
	      String str2 = paramHttpServletRequest.getParameter("financierName");
	      String str3 = "select * from CustomerFinancierSelect where username IN('" + str1 + "') AND financiername IN('" + str2 + "')";
	      System.out.println(str1);
	      System.out.println(str2);
	      ResultSet localResultSet = localStatement.executeQuery(str3);
	      if (localResultSet.next())
	      {
	        String str5 = localResultSet.getString("username");
	        String str6 = localResultSet.getString("financiername");
	        System.out.println(str5);
	        System.out.println(str6);
	        localPrintWriter.println("Already Financier " +str6+" is Selected !");
	      } else {
	    	  String InsertQuery = "INSERT INTO CustomerFinancierSelect (username,financiername) values('" + str1 + "','" + str2 +"')";
	    	  localStatement.executeUpdate(InsertQuery);
	          localPrintWriter.println("New Finacier " +str2+" is selected!" );
	      }
	      localConnection.close();
	    } catch (Exception localException) {
	      localException.printStackTrace();
	      System.out.println("Invalid User");
	    }
	  }
}
