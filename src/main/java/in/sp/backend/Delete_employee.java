package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete_emp")
public class Delete_employee extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		int dlt_emp_id = Integer.parseInt( req.getParameter("emp_id")); // get id of user(employee) whose we have to delete from employee.jsp -> form tag 
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr", "root", "");
			String query = "delete from employees where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, dlt_emp_id);
			
			

			int row = ps.executeUpdate();

			if (row > 0) {

				System.out.println("Data delted successfully");

					RequestDispatcher rd = req.getRequestDispatcher("Admin Pages/employees.jsp");
				    rd.forward(req, resp);
				  	
				  
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("/Admin pages/login.jsp");
			    rd.forward(req, resp);
			}

		}

		catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}	
	

}
