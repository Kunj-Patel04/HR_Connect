<html>
<head>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Client_Pages/style.css">

<style>
  @font-face {
  font-family: 'Permanent_Marker';
  src: url('../Fonts/Permanent_Marker-Regular.ttf') format('truetype');
     
}


#title{
 font-family: 'Permanent Marker', cursive;
  font-size: 65px;
    
}	
</style>

</head>
<body>



<header>

<div id="title" style="color:#d1f2f3">	 HR Connect 	</div>

<nav>
		<a href="<%= request.getContextPath() %>/Client_Pages/index.jsp">Home</a>
		<a href="<%= request.getContextPath() %>/Client_Pages/MyAttendance.jsp">Mark Attendance</a>
		<a href="<%= request.getContextPath() %>/Client_Pages/Timesheet.jsp">Timesheet</a>
		<a href="<%= request.getContextPath() %>/Client_Pages/ContactUs.jsp">Contact</a>
		<a href="<%= request.getContextPath() %>/Client_Pages/profile_client.jsp">Profile</a>
		
		
		
		
		
		
		<% String nm = (String)session.getAttribute("emp_first_name"); %>
		<%
		if(nm==null){
		%>		
		<a id="login" href="log_in_client.jsp">Login</a>
		
		<%} 
		else{		
		%>
		<a id="logout" href="<%= request.getContextPath() %>/Client_Pages/log_out.jsp">Logout</a>
		<%} %>
</nav>


</header>




</body>
</html>