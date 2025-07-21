
<%@ page import="java.util.*" %>
<html>
<head>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Admin Pages/custom.css">

 <jsp:include page="header.jsp" />
 

<style>
   
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f6f9;
      padding: 0px;
    }

    h2 {
      text-align: center;
      color: #333;
    }

    table {
      width: 90%;
      margin: 100px auto;
      border-collapse: collapse;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      background-color: white;
    }

    th, td {
      padding: 12px 15px;
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
   
   
  </style>

</head>
<body>

<%@ page import="java.sql.*" %>
  <br/>
  <br/>
  
  <table>
			    <tr>
			      <th>Employee Name</th>
			      <th>Department</th>
			      <th>Delete</th> 
			    </tr> 

<%
		session = request.getSession(false);
		if (session == null || session.getAttribute("admin_id") == null) {
			  response.sendRedirect("login.jsp");
		}
		else{
			
			int admin_id = (int)session.getAttribute("admin_id");
%>


<%
try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr","root","");
			String query = "select * from employees where user_id = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,admin_id);
			
			ResultSet rs = ps.executeQuery();		
			/* String name=""; */
			
			while(rs.next()) {
				String emp_name = rs.getString("employee_name");	/* Get all employees name */
				String emp_depart = rs.getString("department");		/* get all details  */ 
				int emp_id = rs.getInt("id");								/* of employess */
				
				%>	
		
			    <tr>   
			   <td><%= emp_name %></td>
			   <td><%= emp_depart %></td>      
			   <td>
			   
			   <form action="<%= request.getContextPath() %>/delete_emp" method="post">
			   	 <input type="hidden" name="emp_id" value="<%= emp_id%>">
			     <input type ="submit" value="Delete" >				<%-- <button id=<%= emp_id %>>delete</button> --%>
			   </form>
			   
			   </td>	<!-- add form tag for delete -->
			    </tr>	
				
<% 			}			
		}
		
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		}/* if end here <<-- */
%>



 </table>

<jsp:include page="footer.jsp" />
</body>
</html>