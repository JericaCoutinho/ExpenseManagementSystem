

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReloadData
extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3239752255796219924L;


	public ReloadData() {}

	public void doGet(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
			throws ServletException, IOException
	{
		try
		{
			if( paramHttpServletRequest !=null)
			if(paramHttpServletRequest.getSession(false)!=null)	
		    if(paramHttpServletRequest.getSession(false).getAttribute("Msg_Id")!=null)
			{	  
				int Msg_Id = Integer.parseInt(paramHttpServletRequest.getSession(false).getAttribute("Msg_Id").toString());
				paramHttpServletResponse.setContentType("text/html");	
				Class.forName("com.mysql.jdbc.Driver");
				Connection localConnection = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");
				String str1 = "select * from chatting_data where Msg_Id in ( select Msg_Id from chatting_data group by Msg_Id having Msg_Id='" + Msg_Id +"')";

				PreparedStatement localPreparedStatement = localConnection.prepareStatement(str1);

				ResultSet localResultSet = localPreparedStatement.executeQuery();
				while (localResultSet.next()) {
					String str2 = localResultSet.getString(2);
					String str3 = localResultSet.getString(3);
					String str4 = localResultSet.getString(4);
					String str5 = localResultSet.getString(5);
					PrintWriter localPrintWriter = paramHttpServletResponse.getWriter();
					localPrintWriter.print("<p style='font-size:25px'>" + str2 + "-<g>" + str3 + "</g><br><small>" + str4 + " " + str5 + "</small></p>");
				}

				localConnection.close();
			}
		}
		catch (Exception localException)
		{
			localException.printStackTrace();
			System.out.println("Something went wrong");

		}
	}


	public void doPost(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
			throws ServletException, IOException
	{
		if(paramHttpServletRequest!=null)
		doGet(paramHttpServletRequest, paramHttpServletResponse);
	}
}