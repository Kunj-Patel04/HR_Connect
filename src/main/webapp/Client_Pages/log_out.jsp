<html>
<head>



</head>
<body>

<%
		/* Session is invalidate and redirect to index page it shows null on index page */	
	
	 session = request.getSession(false);
	if(session != null)
	{
		session.invalidate();
		System.out.println("Session closed user loged out");
	}
	response.sendRedirect("index.jsp");



%>
</body>
</html>