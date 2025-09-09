package in.sp.client;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class check_out extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		int emp_id = (int) session.getAttribute("emp_id");

		LocalDate date = LocalDate.now();
		LocalTime time = LocalTime.now();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DB_Util_Client.getConnection();
			String query = "update emp_attendence set check_out_date = ?,check_out_time=?,status='Present' where status='CheckedIn' and emp_id = ? order by id desc limit 1";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setDate(1, java.sql.Date.valueOf(date));
			ps.setTime(2, java.sql.Time.valueOf(time));
			ps.setInt(3, emp_id);

			int row = ps.executeUpdate();

			if (row > 0) {
				System.out.println("check out successfully");

				session.setAttribute("checkout_success", 1);
				RequestDispatcher rd = req.getRequestDispatcher("/Client_Pages/MyAttendance.jsp");
				rd.forward(req, resp);
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
}
