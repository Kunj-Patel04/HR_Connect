
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="custom.css"> 

</head>	
<body>

<% 
    /* String user = (String)  */
%>

<div class="cards">
		<div id="card1">		
		  	<h1>Welcome,									<br/>		  	
		  	<%=session.getAttribute("admin_name") %>
		  	
		  	</h1>		
		</div>		
		<div id="card2">		
			<h1> Today's Date: <br/> ${date}</h1>		
		</div>
		<div id="card3">
			<h1>Last Join</h1>
		</div>
</div>		
 

</body>
</html>