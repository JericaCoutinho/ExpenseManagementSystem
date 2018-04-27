package edu.albany.se.team_project.doa;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;

import edu.albany.se.team_project.model.Customer;
/*Customer List for one Financial Advisor*/

	public class CustomerDAO {
		private Connection jdbcConnection=null;
		private String finName=null;
		int count=0;

		public CustomerDAO(String financierName )
		{
			finName = financierName;
		}
		public ArrayList<Customer> getAllCustomerDetails() {
			ArrayList<Customer> Customers = new ArrayList<Customer>();
			ArrayList<String> custusrNames = new ArrayList<String>();
			String customerName= new String();
			try {
				this.connect();
				Statement st = jdbcConnection.createStatement();
				ResultSet rs = st.executeQuery("select * from CustomerFinancierSelect where financiername IN('" + finName + "')  ");
				while (rs.next()) {
					custusrNames.add(rs.getString("username"));
				}
				for (int i = 0; i < custusrNames.size(); i++) {
					customerName = custusrNames.get(i);
					System.out.println(customerName); //BVP
				ResultSet custableConnection = st.executeQuery("select * from Customer where username IN('" + customerName + "')  ");
				while(custableConnection.next()) {
				Customer customer = new Customer();
				customer.setusername(custableConnection.getString("username"));
				customer.setF_name(custableConnection.getString("f_name"));
				customer.setL_name(custableConnection.getString("l_name"));
				customer.setEmail(custableConnection.getString("email"));
				Customers.add(customer);
				}
				}
				this.disconnect();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return Customers;
		}

		protected void connect() throws SQLException {
			if (jdbcConnection == null || jdbcConnection.isClosed()) {
				System.out.println(" jdbcConnection is closed"); /*BVP*/
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					throw new SQLException(e);
				}
				jdbcConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/NewExpense", "root", "root");
				
				}
			
		}

		protected void disconnect() throws SQLException {
			if (jdbcConnection != null && !jdbcConnection.isClosed()) {
				jdbcConnection.close();
			}
		}

	}

