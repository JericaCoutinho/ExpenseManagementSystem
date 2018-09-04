<!DOCTYPE HTML>
<html>
<head>


<title>Registration</title>

</head>
<body>

  <%@ page import ="java.sql.*"%>

  <%
     
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://newexpense.c4twouumjfzk.us-east-2.rds.amazonaws.com:3306/NewExpense", "root", "root123#");
     Statement s=conn.createStatement();

     String table="Customer";
     boolean advisor=false;
     if(request.getParameter("Type")!=null)
     advisor=request.getParameter("Type").equals("Advisor");

     if(advisor)
     table="Advisor";
     
     ResultSet r=s.executeQuery("select * from Customer;");
     
  boolean takenName=false;
     
  while(r.next())
  {
     String name = r.getString("username");
     if(name.equals(request.getParameter("username")))
     {
     takenName=true;
     out.println("This username is already in use.<br>");
     break;
     }
     }


     r=s.executeQuery("select * from Advisor;");

     while(r.next())
     {
     String name = r.getString("username");
     if(name.equals(request.getParameter("username")))
     {
     takenName=true;
     out.println("This username is already in use.<br>");
     break;
     }
     }
     
     String name=request.getParameter("username");
     String pass=request.getParameter("password");
     String confirm=request.getParameter("confirm");
     String f_n=request.getParameter("f_name");
     String l_n=request.getParameter("l_name");
     String email=request.getParameter("email");
     String bio=request.getParameter("bio");
     
     int MAX_LEN=50,MAX_BIO_LEN=1000;

     boolean allNotNull=(name!="")&&(pass!="")&&(confirm!="")&&(f_n!="")&&(l_n!="")&&(email!="")&&(bio!=""||!advisor);
     boolean normalLength=(name.length()<=MAX_LEN&&pass.length()<=MAX_LEN&&confirm.length()<=MAX_LEN&&f_n.length()<=MAX_LEN&&l_n.length()<=MAX_LEN&&email.length()<=MAX_LEN&&bio.length()<=MAX_BIO_LEN);


     String targetPage="rg.jsp";
     String message="Your account has been created";
     if(takenName||!pass.equals(confirm)||!allNotNull||!normalLength)
     {
																		
        if(!allNotNull)
           message="All fields are mandatory";
        else
	if(!normalLength)
	message="Field length should not exceed 50 characters, save for the advisor biography which should not exceed 1000 characters";
	else
        if(!pass.equals(confirm))
           message="Confirm Password does not match Password";
        else
           message="This username is already in use";
     }
     else
     {
     String bioStr=null;
     if(advisor)
       bioStr="\""+bio+"\"";
       targetPage="login.jsp";
       s.executeUpdate("Insert into "+table+" values(\""+name+"\",\""+pass+"\",\""+f_n+"\",\""+l_n+"\",\""+email+"\","+bioStr+");");
       //BVP Check for the Table Name
       if(table =="Customer")
       {   int finNameIndex=0;
           
           String financierName[]=new String[20];
    	   r=s.executeQuery("select * from Advisor;");
    	     while(r.next())
    	     {
    	      financierName[finNameIndex] = r.getString("username");
    	      finNameIndex++;
    	     }
    	     
    	     for(String receiverName :financierName )
    	     {
    	    	 if (receiverName!=null)
    	    	 s.executeUpdate("Insert into chatting (Username, ReceiverName) values(\""+name+"\",\""+receiverName+"\");");
    	    	 else
    	    		 break;
    	     } 
       }   
       if(table == "Advisor")
       {
    	   int cusNameIndex=0;
           String cusName[]= new String[100];
    	   r=s.executeQuery("select * from Customer;");
    	     while(r.next())
    	     {
    	    	 cusName[cusNameIndex] = r.getString("username");
    	    	 cusNameIndex++;
    	     }
    	     
    	     for(String usrName :cusName )
    	     {
    	    	 if (usrName!=null) 
    	    	 s.executeUpdate("Insert into chatting (Username, ReceiverName) values(\""+usrName+"\",\""+name+"\");");
    	    	 else
    	    		 break;
    	     }
       }
       //IF table is customer
       // select * from Financier
       // in the while loop
       //{ INsert CustomerName and financierName in the chatting table
       //}
     }

     session.setAttribute("message",message);
     response.sendRedirect(targetPage);
     
     
/*
     r=s.executeQuery("select * from Customer;");

     out.println("<br><br><br>Current Users(This is a temporary feature to be removed upon completion)<br><br>");
     while(r.next())
        out.println("username:"+r.getString("username")+"   password:"+r.getString("pass")+"<br>");
     
  */   
%>
<br><br>
<a href="login.jsp">To registration Page</a>   
</body>
</html>
