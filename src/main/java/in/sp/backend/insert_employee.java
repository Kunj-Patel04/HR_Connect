package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add_emp")
public class insert_employee extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		if(session == null && session.getAttribute("user_id") == null) {
						
		}
		
		String new_emp = req.getParameter("new_emp_name");
		String new_pass = req.getParameter("new_emp_pass");
		String new_deprt = req.getParameter("new_emp_deprt");
		
		int admin_id =(int) session.getAttribute("admin_id");		//get a loged in admin id from login.java for register employee and set in row a his HR(admin) id

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr", "root", "");
			String query = "INSERT INTO employees (user_id, employee_name, department, password) VALUES (?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, admin_id);
			ps.setString(2, new_emp);
			ps.setString(3, new_pass);
			ps.setString(4, new_deprt);
			

			int row = ps.executeUpdate();

			if (row > 0) {

				System.out.println("Data Insert successfully");

					req.setAttribute("u_row", 4);
							
				  RequestDispatcher rd = req.getRequestDispatcher("/Admin Pages/insert_employee.jsp"); 
				  rd.forward(req, resp);
				  
				  	
				  
			} else {
				resp.setContentType("text/html");
				PrintWriter out = resp.getWriter();
				out.println("<h1>Insert Failed!</h1>");
				System.out.println("Data Insert Failed");
			}

		}

		catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
}
