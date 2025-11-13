<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>


<html>
<head>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Admin Pages/custom.css">

<style>




 .footer{
	margin-top:6em;
}
.header{
	margin-bottom:6em;
} 

 .info{
	background:lightblue;
	width:100%;
	height:auto;
}

option,select,input,button{
	color:#001F3F;
	background:#33FF99;
	padding: 8px;
    border-radius: 5px;
    font-size: 16px;
} 

form{
	margin-left:5em;
}

.emp_details{
	
	margin-left:588px;
}


</style>

</head>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	session = request.getSession(false);
	if(session == null || session.getAttribute("admin_id") == null)
	{
		response.sendRedirect("login.jsp");
	}
	else{
%>




<body>
 <div class="header"><jsp:include page="header.jsp" /></div>

<div class="info">
<center><h1>Employee Status</h1></center>

<form action="<%= request.getContextPath() %>/emp_status" method="post">

<label>Select Date:</label>
<input type="date" name="myDate">

<select name="Status">

  <option value="" selected>-- Select Status --</option>
  <option value="Present">Present</option>
  <option value="Absent">Absent</option>

</select>

<button type="submit">Apply</button> 

</form>

<table class=emp_details border=1 >
          <form>
          		<th>
          			Presents
          		</th>

<% 
   List<String> names = (List<String>) request.getAttribute("empNames");
   if (names != null) {
       for (String name : names) {
%>
           
          
          		<tr>
          			<td> <%= name %></td>
          		</tr>
          
<% 
       }
   }
%>

          </form>
          </table> 


</div>

<div class="footer"><jsp:include page="footer.jsp" /></div>
</body>
<%} %>
</html>