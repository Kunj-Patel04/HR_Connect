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
	
		String emp_nm = req.getParameter("emp_nm");
		String emp_pass = req.getParameter("pass");
		
		
			
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DB_Util_Client.getConnection();
			String query = "select * from employees where employee_name=? and password=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,emp_nm);
			ps.setString(2,emp_pass);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				
				String emp_name = rs.getString("employee_name");
				String emp_dep = rs.getString("department");
				
				
				HttpSession session = req.getSession();
				
				session.setAttribute("emp_nm", emp_name);
				session.setAttribute("emp_deprt", emp_dep);
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
