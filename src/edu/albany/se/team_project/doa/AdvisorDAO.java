package edu.albany.se.team_project.doa;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;

import edu.albany.se.team_project.model.Advisor;

public class AdvisorDAO {
	private Connection jdbcConnection;

	public ArrayList<Advisor> getAllAdvisorDetails() {
		ArrayList<Advisor> advisors = new ArrayList<Advisor>();
		try {
			connect();
			Statement st = jdbcConnection.createStatement();
			ResultSet rs = st.executeQuery("select * from Advisor");
			while (rs.next()) {
				Advisor advisor = new Advisor();
				advisor.setF_name(rs.getString("f_name"));
				advisor.setL_name(rs.getString("l_name"));
				advisor.setEmail(rs.getString("email"));
				advisor.setBiography(rs.getString("biography"));
				advisors.add(advisor);
			}
			disconnect();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return advisors;
	}

	protected void connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MgmtSystemDB", "root", "root");
		}
	}

	protected void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}

}
