

<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="in.sp.client.*" %>

<%@ page import="java.time.LocalDate" %>



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
   width:90px;
   height:55px;
   border-radius:15px;
   border:0px;
   font-weight:825;
   }
   
   #checkin{
   color:white;
   background:#4CAF50;
   }
   #checkin:hover{
   color:white;
   background:#2e7d32;
   }
   
   #checkout{
   color:white;
   background:#f44336;
   }
   #checkout:hover{
    color:white;
   background:#b71c1c;
   }
   
	.status_start_day{
		height:6%;
		width:55%;	
		max-width:700px;		
		background:#D4EDDA;
		color:#155724;
		margin:30px auto;
		border-radius: 10px;				
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
	
	if(session.getAttribute("date")!= null && session.getAttribute("emp_id")!=null){
	
		 
	
		
		

		
	int emp_id = (int) session.getAttribute("emp_id");
		
	try{
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DB_Util_Client.getConnection();
					
					String query = "select status from emp_attendence where emp_id=? and check_in_date=CURDATE() order by id DESC limit 1";
					
					PreparedStatement ps = con.prepareStatement(query);
					ps.setInt(1,emp_id);
					   
					
					
					ResultSet rs = ps.executeQuery();
					if(rs.next()){
						String sts = rs.getString("status");
											
						System.out.println(" ");
						System.out.println("Status ======>>>>"+sts);						    
						System.out.println("id ======>>>>"+emp_id);
																	
						session.setAttribute("stus",sts);						
						
					}

				//Second Query for get last check out of employee	
				
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DB_Util_Client.getConnection();
					
					String query1 = "select check_out_time from emp_attendence where emp_id=? and status='Present' and check_out_date=CURDATE() order by id desc limit 1";
					PreparedStatement pst = conn.prepareStatement(query1);
					pst.setInt(1,emp_id);
					
					ResultSet rst = pst.executeQuery();
					if(rst.next())
					{
						Time last_checkout = rst.getTime("check_out_time");
						
						System.out.println("Last CheckOut Time =>>"+last_checkout);
						request.setAttribute("last_checkout",last_checkout);
						
					}
					
	}

	catch(SQLException | ClassNotFoundException e)
	{
	e.printStackTrace();
	}
	%>
	
	
	
	
	<% Object obj_status =  session.getAttribute("stus");
			   String s = (String) obj_status; 
			   System.out.println(" status before if condition=> "+s);
			
			%>



<div><jsp:include page="header.jsp"/></div>
<div class="status_start_day">
<%
if (s == null)
{%>
	<h2 class="status"><center>A fresh day, a fresh start <i> Check in</i> below to mark your attendance</center></h2>
	
	
<%}

else{
	if(s.equals("Present")){
%>
	
	<h2 class="status"><center>Your Last CheckOut Time => <%= request.getAttribute("last_checkout") %></center></h2>
	
<%}
	
	else{	
%>

	<h2 class="status"><center>Your Cuurent Status  =>  <%= session.getAttribute("stus")%></center></h2>
<%
}	}
%>

</div>


<table border="1">

	<tr>
			<th><center>Today's Date</center></th>
			<th colspan=2><center>Attendence</center></th>
	</tr>
	<tr>
			<td><h2><%= session.getAttribute("date") %></h2></td>
			
			
			
<%if( "Present".equals(s) || s == null)
{

%>
			<td>
				<form action="<%= request.getContextPath() %>/checkin" method="post">  <button id=checkin>Check In</button>	</form>
				  
				<%System.out.println("This is status checkin=> "+s); %>
			</td>
			
<%}
		else{
			%>
			
			<td>
					
				<form action="<%= request.getContextPath() %>/checkout" method="post">	<button id=checkout>Check Out</button>	</form>
				
				<%System.out.println("This is status checkout=> "+s); %>
			</td>
	<%} %>		
		
	</tr>

	
	


</table>










<jsp:include page="footer.jsp"/>


</body>
</html>

<%
Object obj = session.getAttribute("checkin_success");

if(obj != null)
{	int checkin = Integer.parseInt(obj.toString());

	if(checkin > 0)
	{
%>		
	<script>
		alert("Checkin Successfully...");
	</script>
<%		
session.removeAttribute("checkin_success");
	}

}

%>

<%
Object obj1 = session.getAttribute("checkout_success");

if(obj1 != null)
{	int checkout = Integer.parseInt(obj1.toString());
	
	if(checkout>0)
	{
%>		
	<script>
		alert("Checkout Successfully...");
	</script>
<%		
session.removeAttribute("checkout_success");

	}

}



%>


<%}
}%>