package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.Session;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/employee")
public class Employees extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false); // Don't create new session
		if (session != null) {
		   int admin_id = (int) session.getAttribute("admin_id");
		
		   if(admin_id != 0) {
			
		    
			
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr","root","");
			String query = "select * from employees where user_id = ? ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, admin_id);
			
			ResultSet rs = ps.executeQuery();		
			
			while(rs.next()) {
											
				String name = rs.getString("employee_name");
				req.setAttribute("emp_name",name);
				RequestDispatcher rd = req.getRequestDispatcher("/Admin Pages/employees.jsp");
				rd.forward(req, resp);
							
			}
				
			
		}
		
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		   }
		   else {}
		   } /* <--- if end here */else {}
		
		
		
		
	}

}
