

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Chat extends javax.servlet.http.HttpServlet
{
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public Chat() {}
  
  public void doPost(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse) throws ServletException, IOException
  {
    PrintWriter localPrintWriter = paramHttpServletResponse.getWriter();
    try {
      paramHttpServletResponse.setContentType("text/html");
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection localConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/NewExpense", "root", "root");
      Statement localStatement = localConnection.createStatement();
      HttpSession localHttpSession = paramHttpServletRequest.getSession();
      String str1 = paramHttpServletRequest.getParameter("senderName");
      String str2 = paramHttpServletRequest.getParameter("receiverName");
      String str3 = "select * from chatting where Username IN('" + str1 + "','" + str2 +"' ) AND ReceiverName IN('" + str1 + "','" + str2 +"')";
      System.out.println(str1);
      System.out.println(str2);
      ResultSet localResultSet = localStatement.executeQuery(str3);
      if (localResultSet.next())
      {
        String str5 = localResultSet.getString("ReceiverName");
        String str6 = localResultSet.getString("Msg_Id");
        System.out.println(str5);
        System.out.println(str1);
        localHttpSession.setAttribute("senderName", str1);
        localHttpSession.setAttribute("receiverName", str5);
        localHttpSession.setAttribute("Msg_Id", str6);
        localPrintWriter.println("Welcome, " + str1.toUpperCase());
        localPrintWriter.println("<a href='startchat.jsp'>let's Enter the Chat Room</a>");
        localPrintWriter.println("<a href='logout.jsp' class='logout-chat'>Logout</a>");
      //  String nextJSP = "/startchat.jsp";
      //  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
      //  dispatcher.forward(paramHttpServletRequest,paramHttpServletResponse);
      } else {
        localPrintWriter.println("Incorrect Username or Password.");
      }
      

      localConnection.close();
    } catch (Exception localException) {
      localException.printStackTrace();
      System.out.println("Invalid User");
    }
  }
  
  public void doGet(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse) throws ServletException, IOException {
    doGet(paramHttpServletRequest, paramHttpServletResponse);
  }
}
