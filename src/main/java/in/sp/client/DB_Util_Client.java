package in.sp.client;
import java.sql.*;

public class DB_Util_Client {

	
			public static final String url = "jdbc:mysql://localhost:3306/hr";
			public static final String dbUser="root";
			public static final String dbPassword="";
			
			public static Connection getConnection()throws SQLException{ 
				
				return DriverManager.getConnection(url,dbUser,dbPassword);
			}
}
