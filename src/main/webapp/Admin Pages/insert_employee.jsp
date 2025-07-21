<html>
<head>

 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Admin Pages/custom.css">
<jsp:include page="header.jsp" />
 

<style>

* {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

body{
	  /* display: flex; */
      justify-content: center; 
      align-items: center;             
      
}

.insert_emp{
	padding:3rem;
	border-radius:20px;	
	width:100%;
	max-width: 450px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.9);
	text-align:center;
	background-color:white;
	
	 
}

.insert_emp input{
	width: 100%;
    padding: 0.75rem;
    margin-bottom: 1rem;
    border: 1px solid #ccc; 
    border-radius: 15px;
}

.insert_emp button{
	width: 100%;
    padding: 0.75rem;
    margin-bottom: 1rem;
    border: 1px solid #ccc; 
    border-radius: 15px;
    background-color:007bff;
}

.insert_emp button:hover{
	background-color:0056b3;
	cursor:pointer;
}

input:focus{
	border: 2px solid #007BFF;
	background:	rgba(255, 255, 255, 0.15);				/* linear-gradient(135deg, #667eea, #764ba2); */
	color:#000;
	outline: none;
}


.insert_emp h2{
	/* margin-bottom:15px; */
}
.msg {
  
  animation: hideMsg 3s forwards;
}

@keyframes hideMsg {
  0% { opacity: 1; }
  90% { opacity: 1; }
  100% { opacity: 0; display: none; }
}

</style>

</head>
<body>



<%

session = request.getSession(false);
if (session == null || session.getAttribute("admin_id") == null) {
	  response.sendRedirect("login.jsp");
}
else{
	
	
%>

<%
Object rowObj = request.getAttribute("u_row");

if (rowObj != null) {
    int row = Integer.parseInt(rowObj.toString());

    if (row > 0) {	
%>
<script>
  alert("Data inserted successfully!");
</script>
<%} }%>


<div class="insert_emp">

<h2>Add Employee Details</h2>

	<form action="<%= request.getContextPath()%>/add_emp" method="post">
	 Name :	 <input type="text" name="new_emp_name" required>	<br>
	 Password :	 <input type="password" name="new_emp_pass" required>	<br>
	 Department: <input type="text" name="new_emp_deprt" required>	<br>
	 
	 
	 
	 <button type= "submit" value="Submit">Button</button>
	 
	</form>
</div>


<%} %>

<jsp:include page="footer.jsp" />
</body>
</html>