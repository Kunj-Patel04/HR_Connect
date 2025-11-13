package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/emp_status")
public class emp_status_filter extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String dt = req.getParameter("myDate");
		String st = req.getParameter("Status");
		System.out.println("Date ====== >" + dt);
		System.out.println("Attendence ====== >" + st);

		List<String> empNames = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr", "root", "");
			String query = "SELECT DISTINCT e.employee_first_name, ea.status FROM emp_attendence ea JOIN employees e ON ea.emp_id = e.id WHERE ea.check_out_date=? and ea.status = ? ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,dt);
			ps.setString(2, st);

			ResultSet rs = ps.executeQuery();
			

			while (rs.next()) {
				System.out.println("Employee status");
				String emp_first_name = rs.getString("employee_first_name");
				empNames.add(emp_first_name);

				System.out.println("Name =========>>>>>> " + emp_first_name);

			}
			req.setAttribute("empNames", empNames);
			RequestDispatcher rd = req.getRequestDispatcher("/Admin Pages/employee_status.jsp");
			rd.forward(req, resp);

		}

		catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
}
