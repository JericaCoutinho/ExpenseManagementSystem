

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChatStore
extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4785277287850474902L;

	public ChatStore() {}

	public void doPost(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse) throws ServletException, IOException
	{
		if( paramHttpServletRequest !=null)
			if(paramHttpServletRequest.getSession(false)!=null)	
				if(paramHttpServletRequest.getSession(false).getAttribute("Msg_Id")!=null)
				{	  
					try
					{
						paramHttpServletResponse.setContentType("text/html");

						Class.forName("com.mysql.jdbc.Driver");
						Connection localConnection = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");
						Statement localStatement = localConnection.createStatement();


						String str1 = paramHttpServletRequest.getSession(false).getAttribute("senderName").toString();
						String receiverName = paramHttpServletRequest.getSession(false).getAttribute("receiverName").toString();

						int Msg_Id = Integer.parseInt(paramHttpServletRequest.getSession(false).getAttribute("Msg_Id").toString());
						String str2 = paramHttpServletRequest.getParameter("msg");

						SimpleDateFormat localSimpleDateFormat1 = new SimpleDateFormat("dd-MMM-yyyy");
						SimpleDateFormat localSimpleDateFormat2 = new SimpleDateFormat("hh:mm:ss a");
						Date localDate = new Date();
						String str3 = localSimpleDateFormat1.format(localDate);
						String str4 = localSimpleDateFormat2.format(localDate);

						String str5 = "INSERT INTO chatting_data (Msg_Id, username, message, posted_date, posted_time) values('" + Msg_Id + "','" + str1 +"','" + str2 + "','" + str3 + "','" + str4 + "')";

						localStatement.executeUpdate(str5);

						/*Last Sprint Start*/
						String selectNotification = "select * from notificationmsg where notificationType in('" + "Message" +"') and SenderName IN('" + str1 + "') AND ReceiverName IN('" + receiverName + "')";
						ResultSet localResultSet = localStatement.executeQuery(selectNotification);
						if (!localResultSet.next()){
							String insertNotification = "INSERT INTO notificationmsg (notificationType, SenderName, ReceiverName) values('" + "Message" + "','" + str1 +"','" + receiverName + "')";
							localStatement.executeUpdate(insertNotification);
						} 
						/*Last Sprint End*/
						localConnection.close();
					}
					catch (Exception localException) {
						localException.printStackTrace();
						System.out.println("Invalid User At ChatStore.Java");
					}
				}
	}

	public void doGet(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse) throws ServletException, IOException
	{
		doGet(paramHttpServletRequest, paramHttpServletResponse);
	}
}