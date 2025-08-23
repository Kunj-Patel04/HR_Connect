
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%@ page import="in.sp.client.*" %>




<%@page import="java.sql.PreparedStatement"%>
<html>
<head>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Client_Pages/style.css">

<style>
   
    body {
      
      background-color: #f4f6f9;
      /* padding: 0px; */
    }

    h2 {
      text-align: center;
      /* color: #333; */
    }

    table {
      width: 90%;
      margin: 100px auto 160px auto;
      border-collapse: collapse;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      background-color: white;
      
    }

    th, td {
      padding: 18px 15px;
      border: 1px solid #ddd;
      text-align: left;
    }

    th {
      background-color: #2f3e46;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    tr:hover {
      background-color: #e6f7ff;
    }
   
   button{
   color:Green;
   background:yellow;
   width:90px;
   height:55px;
   border-radius:15px;
   border:0px;
   font-weight:825;
   }
   
   button:hover{
   color:yellow;
   background:Green;
   }
  
   
  </style>

</head>
<body>

<%
session = request.getSession(false);
if (session == null || session.getAttribute("emp_id") == null) {
	  response.sendRedirect("log_in_client.jsp");
}
else{
%>


<div><jsp:include page="header.jsp"/></div>

<table border="1">

	<tr>
			<th>Date</th>
			<th colspan=2>Attendence</th>
	</tr>
	<tr>
			<td><%= session.getAttribute("date") %></td>
			
			<%
			int emp_id = (int) session.getAttribute("emp_id");
			
			
try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DB_Util_Client.getConnection();
				
				String query = "select check_in from emp_attendence where emp_id=? and ";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1,emp_id);
				
				ResultSet rs = ps.executeQuery();
				

}

catch(SQLException e)
{
e.printStackTrace();
}
%>


		

			<td>
				<form action="<%= request.getContextPath() %>/checkin" method="post">  <button>Check In</button>	</form>
			</td>
			
			
			
			<td>
					
				<form action="<%= request.getContextPath() %>/checkout" method="post">	<button>Check Out</button>	</form>
			</td>
			
		
	</tr>

	
	


</table>










<jsp:include page="footer.jsp"/>


</body>
</html>

<%
Object obj = request.getAttribute("checkin_success");


if(obj != null)
{	int checkin = Integer.parseInt(obj.toString());

	if(checkin > 0)
	{
%>		
	<script>
		alert("Checkin Successfully...");
	</script>
<%		
	}

}

%>




<%}%>