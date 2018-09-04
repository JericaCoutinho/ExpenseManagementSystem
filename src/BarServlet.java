

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
 * Servlet implementation class BarServlet
 */
@WebServlet("/BarServlet")
public class BarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		  float gro=0; 
		  float ent=0; 
		  float hom=0; 
		  float bil=0; 
		  float mis=0; 


		//String output="";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
				conn = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");
	    		String Uname=request.getParameter("username"); 
				String Grocery = "SELECT SUM(expense_value) FROM Expense WHERE username ='"+Uname+"' and expense_category ='Grocery'" ;
				String Entertainment = "SELECT SUM(expense_value) FROM Expense WHERE username ='"+Uname+"' and expense_category ='entertainment'" ;
				String Home = "SELECT SUM(expense_value) FROM Expense WHERE username ='"+Uname+"' and expense_category ='Home Utilities'" ;
				String Bill = "SELECT SUM(expense_value) FROM Expense WHERE username ='"+Uname+"' and expense_category ='bill'" ;
				String Miscellaneous = "SELECT SUM(expense_value) FROM Expense WHERE username ='"+Uname+"' and expense_category ='Miscellaneous'" ;
				PreparedStatement st1 = conn.prepareStatement(Grocery);
			    ResultSet  rs1 = st1.executeQuery();
			    rs1.next();
			    gro = rs1.getFloat(1);
				  
			      
			    PreparedStatement st2 = conn.prepareStatement(Entertainment);
			    ResultSet  rs2 = st2.executeQuery();
			    rs2.next();
			    ent = rs2.getFloat(1);
		
			    PreparedStatement st3 = conn.prepareStatement(Home);
			    ResultSet  rs3 = st3.executeQuery();
			    rs3.next();
			    hom = rs3.getFloat(1);
			    
			    PreparedStatement st4 = conn.prepareStatement(Bill);
			    ResultSet  rs4 = st4.executeQuery();
			    rs4.next();
			    bil = rs4.getFloat(1);
			
			    PreparedStatement st5 = conn.prepareStatement(Miscellaneous);
			    ResultSet  rs5 = st5.executeQuery();
			    rs5.next();
			    mis = rs5.getFloat(1);
			    
			//	response.getWriter().append("[['Expense Category', 'Value'],['Grocery',"+gro+"],['Entertainment',"+ent+"],['Home Utilities',"+hom+"],['Phone,Internet Bills',"+bil+"],['Miscellaneous',"+mis+"]]");
				response.getWriter().append("Expense_Category Value, Grocery "+gro+", Entertainment "+ent+", Home_Utilities "+hom+", Bills "+bil+", Miscellaneous "+mis);

				
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