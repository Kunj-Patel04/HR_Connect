<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="custom.css"> 

</head>	
<body>

 




<div class="cards">
		<div id="card1">		
		  	<h1>Welcome,									<br/>		  	
		  	<%=session.getAttribute("admin_name") %>
		  	
		  	</h1>		
		</div>		
		<div id="card2">		
			<h1> Today's Date: <br/> ${date}</h1>		
		</div>
		
		
		
		
		
 <%
 session = request.getSession(false);
	if (session == null || session.getAttribute("admin_id") == null) {
		  response.sendRedirect("login.jsp");
	}
	else{
	int admin_id = Integer.parseInt(session.getAttribute("admin_id").toString());
 
	 
try {
	 
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr","root","");
	String query = "select MAX(id) AS last_join from employees where user_id = ?";
	PreparedStatement ps = con.prepareStatement(query);
	
	 ps.setInt(1, admin_id); 
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){
		int last_join = rs.getInt("last_join");
		/* String emp_name = rs.getString("employee_name"); */
		
		
%>
		
		
		
		<div id="card3">
			<h1>Last Join, <%= last_join %></h1>	<!-- SELECT MAX(id) AS highest_id FROM your_table_name WHERE condition; -->			
		</div>
		
		
<%	}	
}	
 

catch(SQLException | ClassNotFoundException e){
	e.printStackTrace();
}
	}
%>
		
		
		
		
		
		
		
</div>		
 
 


</body>
</html>