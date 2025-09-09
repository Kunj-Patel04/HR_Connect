package in.sp.client;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
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

@WebServlet("/timesheet")
public class Timesheet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String select_date = (String) req.getParameter("Select_date");
		HttpSession session = req.getSession(false);
		int emp_id = (int) session.getAttribute("emp_id");
		
		
		//create a list for store details of attendence
		ArrayList<String[]> checkin_date_list = new ArrayList<>();
		/*
		 * ArrayList<String> checkin_times_list = new ArrayList<>(); ArrayList<String>
		 * checkout_dates_list = new ArrayList<>(); ArrayList<String>
		 * checkout_times_list = new ArrayList<>();
		 */
		
		
		
			try {				
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con= DB_Util_Client.getConnection();
				String query = "select * from emp_attendence where emp_id=? and check_in_date=? ";				
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1,emp_id); 
				ps.setString(2,select_date);
				
				ResultSet rs = ps.executeQuery();
				System.out.println();
				while(rs.next())
				{	
					String checkin_date = rs.getString("check_in_date");
					String checkin_time = rs.getString("check_in_time");
					String checkout_date = rs.getString("check_out_date");
					String checkout_time = rs.getString("check_out_time");
					
									
					System.out.println(" Checkin date"+checkin_date);
					System.out.print(" Checkin time"+checkin_time);
					System.out.print(" checkout date"+checkout_date);
					System.out.print(" checkout time"+checkout_time);
					System.out.print(" Selected date "+select_date);
					System.out.println();
					
					checkin_date_list.add(new String[] {checkin_date,checkin_time,checkout_date,checkout_time});
					/*checkin_times_list.add(checkin_time);
					checkout_dates_list.add(checkout_date);
					checkout_times_list.add(checkout_time);*/
					
				}
				System.out.println();
				req.setAttribute("checkin_date_list",checkin_date_list);
				/*
				 * req.setAttribute("checkin_times_list",checkin_times_list);
				 * req.setAttribute("checkout_dates_list",checkout_dates_list);
				 * req.setAttribute("checkout_times_list",checkout_times_list);
				 */
				
				
				
				RequestDispatcher rd = req.getRequestDispatcher("/Client_Pages/Timesheet.jsp");
				rd.forward(req, resp);
			}
			catch(SQLException | ClassNotFoundException e)
			{
				e.printStackTrace();
			}
			
		
	}
}
