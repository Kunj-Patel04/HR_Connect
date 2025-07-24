package in.sp.backend;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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

@WebServlet("/HR")
public class Login extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
		/* login only and redirect to Admin Index Page with Session */
		
		
		String myemail = req.getParameter("email1");
		String mypass = req.getParameter("pass1");
    	
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr","root","");
			
			String query = "Select * from user_admin Where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,myemail);
			ps.setString(2,mypass);
			
			ResultSet rs = ps.executeQuery();		
			if(rs.next()){
				String user_name = rs.getString("name");
				int id_user = rs.getInt("id");
				
				/* create session */
				
				HttpSession session = req.getSession();
				
				/* send a logged in admin_name from user_admin table in session to index->dashboard */
				
				session.setAttribute("admin_name",user_name);
				session.setAttribute("admin_id",id_user);
				session.setAttribute("date",LocalDate.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")));
				
				RequestDispatcher d = req.getRequestDispatcher("/Admin Pages/index.jsp");
				d.forward(req, resp);
				
		    	
		    	System.out.println("✅ User found in database!");
			}
			else {
					
				RequestDispatcher df =	req.getRequestDispatcher("/Admin Pages/sign_up.jsp"); 
		    	df.forward(req, resp);
		    	
		        System.out.println("❌ No user found. Login failed.");
			}
			
					
		}
    	catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
    	
    	
    	
    	/*
		 * String empName = "Kunj";
		 *req.setAttribute("date",LocalDate.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")));
		 * // Set the name in request scope req.setAttribute("name", empName)
		 * RequestDispatcher rd =
		 * req.getRequestDispatcher("/index.jsp"); rd.forward(req, resp);
		 */
        
        
        
    }
}
