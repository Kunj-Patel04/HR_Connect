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
		  	
		  	<% if(session.getAttribute("admin_name") == null) 
{
		String a = "";
		%>	<%=a %>	<%
}
else
{
	 String a = (String)session.getAttribute("admin_name");	
	 %>		<%=a %>	<%
}
%>
		  	
		  	
		  	
		  	
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
	String query = "select employee_first_name AS last_join from employees where user_id =? order by id DESC limit 1";
	PreparedStatement ps = con.prepareStatement(query);
	
	 ps.setInt(1, admin_id); 
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){
		String employee_first_name = rs.getString("last_join");
		
		
%>
		
		<div id="card3">
			 <h1>Last Joined Employee: <u> <%= employee_first_name %> </u></h1> 
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