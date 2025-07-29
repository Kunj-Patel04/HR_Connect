package in.sp.client;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Client")
public class login_client extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String emp_email = req.getParameter("emp_email");
		String emp_pass = req.getParameter("pass");
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DB_Util_Client.getConnection();
			String query = "select * from employees where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,emp_email);
			ps.setString(2,emp_pass);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				
				String emp_first_name = rs.getString("employee_first_name");
				
				
				
				HttpSession session = req.getSession();
			
				session.setAttribute("emp_first_name", emp_first_name);
				
				session.setAttribute("date",LocalDate.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")));
				
				System.out.println("User logged in successfully");
				RequestDispatcher rd = req.getRequestDispatcher("/Client_Pages/index.jsp");
				rd.forward(req, resp);
				
				System.out.println("✅ User Logged in successfully!");
				
			}
		
		}
		
		
		catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} 
		
	
	
	
	}

}
