<html>
<head>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Client_Pages/style.css">


</head>
<body>



<header>

<h1>HR Connect</h1>

<nav>
		<a href="<%= request.getContextPath() %>/Client_Pages/index.jsp">Home</a>
		<a href="<%= request.getContextPath() %>/Client_Pages/MyAttendance.jsp">My Attendance</a>
		<a href="<%= request.getContextPath() %>/Client_Pages/ContactUs.jsp">Contact us</a>
		
		<a id="login" href="log_in_client.jsp">Login</a>
		<a id="logout" href="#">Logout</a>
</nav>


</header>




</body>
</html>