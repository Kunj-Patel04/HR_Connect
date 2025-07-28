package in.sp.client;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Signup_Client")
public class Signup_Client extends HttpServlet{

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String new_emp_nm = req.getParameter("new_emp_name");
			String new_emp_email = req.getParameter("new_emp_email");
			String new_emp_password = req.getParameter("new_emp_pass");
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DB_Util_Client.getConnection();
				String query = "INSERT INTO employees (employee_name,password,email) VALUES (?,?,?)";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1,new_emp_nm);
				ps.setString(2,new_emp_password);
				ps.setString(3,new_emp_email);
				
				int row = ps.executeUpdate();
				if(row > 0){
					RequestDispatcher rd = req.getRequestDispatcher("/Client_Pages/log_in_client.jsp");
					rd.forward(req, resp);
				}
				else {
					System.out.println("Client create failed....");
					}
				
			}
			catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
		}
}
