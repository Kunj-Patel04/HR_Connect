<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%@ page import="in.sp.client.*" %>





<html>
<head>

<style>

.profile_card{
	background:	#f4f5ff;			/* white; */
	width: 90%;          
	max-width: 900px;    
	margin: 60px auto ;   
	padding: 20px;
	border: 1px solid #ccc;
	border-radius:25px;
}

.content{
	background:lightblue;
	margin:15px;
	padding:15px;
}






.profile-table {
      width: 100%;
      max-width: 850px;
      height:300px;
      margin: auto;
      border-collapse: collapse;
      background-color: white;					/* #fff; */
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      overflow: hidden;
      margin-top:65px;
      font-size:1.2em;
      font-weight:bold;
    }

    .profile-table th, .profile-table td {
      padding: 15px 20px;
      text-align: left;
    }

    .profile-table th {
      background-color: #5c67f2;
      color: #fff;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .profile-table tr:nth-child(even) {
      background-color: white;
    }

    .profile-table td {
      color: #333;
    }

    .profile-table tr:hover {
      background-color: #eef2ff;
    }








</style>


</head>



<%
	session = request.getSession(false);
if(session.getAttribute("emp_id") == null){
	response.sendRedirect("log_in_client.jsp");
}
else{
	int emp_id = (int) session.getAttribute("emp_id");

try{	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DB_Util_Client.getConnection();
	
	String query="select * from employees where id=?";
	PreparedStatement ps = con.prepareStatement(query);
	
	ps.setInt(1,emp_id);
	
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){
		String emp_frst_nm  = rs.getString("employee_first_name");
		String emp_lst_nm   = rs.getString("employee_last_name");
		String emp_eml 		= rs.getString("email");
		String emp_dprt     = rs.getString("department");
		%>
		
		
		<body>
		<div> <jsp:include page="header.jsp"/> </div>

		<!-- <div class="profile_card"> -->



		<table class="profile-table">
		    <tr>
		      <th>Field</th>
		      <th>Information</th>
		    </tr>
		    <tr>
		      <td>Full Name</td>
		      <td><%=emp_frst_nm %> <%=emp_lst_nm %></td>
		    </tr>
		    <tr>
		      <td>Email</td>
		      <td><%=emp_eml %></td>
		    </tr>
		    <tr>
		      <td>Department</td>
		      <td><%=emp_dprt %></td>
		    </tr>
		    
		    
		    
		  </table>

		
		
	<%
		
	}
}

		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
					} //else end here
%>
















<!-- </div> -->

<div><jsp:include page="footer.jsp"/> </div>

</body>
</html>