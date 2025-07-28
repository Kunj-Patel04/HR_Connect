<html>
<head>

 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Admin Pages/custom.css">
<jsp:include page="header.jsp" />
 

<style>



body {
  
}



.insert_emp{
	
	border-radius:20px;	
	margin-top:25px;
	width:400px;	
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.9);
	text-align:center;
	background-color:white;
	font-weight:bold;
	padding:35px;
    
}

.heading{
	color:#001F3F;
	background:#99FF66;
	padding:0.5px;
	border-radius:75px;
	
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

.cntr{
	
	justify-content: center;
    align-items: center;
     display: flex;
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


<div class="shrikhand-regular">
<div class="cntr">
	<div class="insert_emp">

<div class="heading">	<h2>Add Employee Details</h2>	</div>

	<form action="<%= request.getContextPath()%>/add_emp" method="post">
	 First Name :	 		 <input type="text" name="emp_first_name" required>		<br>
	 Last Name(Surname) :	 <input type="text" name="emp_last_name" required>		<br>
	 Email :	         	 <input type="email" name="emp_email" required>		<br>
	 Department: 			 <input type="text" name="emp_deprt" required>		<br>
	 Password :	   			 <input type="password" name="emp_pass" required>	<br>
	 
	 
	 
	 <button type= "submit" value="Submit">Submit</button>
	 
	</form>
	</div>

</div>
</div>
<%} %>

<jsp:include page="footer.jsp" />
</body>
</html>