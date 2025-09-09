<%@ page import="java.sql.*" %>

<%@ page import="in.sp.client.*" %>

<%@ page import="java.util.*" %>


<%@page import="java.sql.PreparedStatement"%>


<%session = request.getSession(false);
if(session == null || session.getAttribute("emp_id") == null)
{
	response.sendRedirect("log_in_client.jsp");
}
else
{
%>


<html>
<head>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Client_Pages/style.css">

<style>


/* Date input */
.date_pick input[type="date"] {
  padding: 8px 12px;
  font-size: 16px;
  border: 2px solid #2ecc71;   /* fresh green border */
  border-radius: 8px;
  /* background: transparent;     /*  no background */ */
  color: #333;
  transition: 0.3s;
}

.date_pick input[type="date"]:focus {
  border-color: #27ae60;       /* darker green on focus */
  outline: none;
}

/* Submit button */
.date_pick input[type="submit"] {
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  color: #2ecc71;             /* green text */
  /* background: transparent;     /*  no background */ */
  border: 2px solid #2ecc71;  /* green border */
  border-radius: 8px;
  cursor: pointer;
  transition: 0.3s;
}

.date_pick input[type="submit"]:hover {
  background: #2ecc71;  /* fill only on hover */
  color: white;
  transform: scale(1.05);
}

/* Table styling */
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
  font-family: Arial, sans-serif;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  border-radius: 10px;
  overflow: hidden;
}

/* Table header */
table th {
  background: #2ecc71;   /* solid green header */
  color: white;
  padding: 12px;
  text-align: center;
  font-size: 16px;
}

/* Table data */
table td {
  background-color: #f4f9f4;   /* soft light green/grey */
  padding: 10px;
  text-align: center;
  border-bottom: 1px solid #ddd;
  font-size: 15px;
  color: #333;
}

/* Hover effect on rows */
table tr:hover td {
  background-color: #e9f7ef;   /* light green hover */
}




</style>

</head>
<body>

<div><jsp:include page="header.jsp"/></div>

<center>
<form class="date_pick" action="<%= request.getContextPath() %>/timesheet" method="post">
<input type="date" name="Select_date" >			<br><br>
<input type="Submit" name="OK" Value="Done">
</form>

<table border="2">



<%
List<String[]> a = (List<String[]>) request.getAttribute("checkin_date_list");
if (a != null) {
%>
    <tr>
        <th>CheckIn Date</th>
        <th>CheckIn Time</th>
        <th>CheckOut Date</th>
        <th>CheckOut Time</th>
    </tr>
<%
    for (String[] A : a) {
%>
        <tr>
            <td><%= A[0] %></td>
            <td><%= A[1] %></td>
            <td><%= A[2] %></td>
            <td><%= A[3] %></td>
        </tr>
<%
    }
} // close if
%>







</table>

</center>

<div><jsp:include page="footer.jsp"/></div>
	 

</body>
</html>

<%}%>