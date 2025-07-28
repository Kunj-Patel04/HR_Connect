<html>
<head>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Client_Pages/style.css">

</head>
<body>

<div class="cards">
	<div id="card1">Welcome, 							<br>
		<%= session.getAttribute("emp_first_name") %></div>
	
	<div id="card3">Todays Date : 						<br>
		<%= session.getAttribute("date") %> </div>	

</div>




</body>
</html>