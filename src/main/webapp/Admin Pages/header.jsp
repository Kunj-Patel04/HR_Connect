
<head>
<style>
    .dropdown {
      position: relative;
      display: inline-block;
      margin-right: 20px;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #33FF99;
      min-width: 160px;
      box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
      z-index: 1;
      border-radius:15px;
    }

    .dropdown-content a {
      display: block; /* 💡 Makes the entire box clickable */
      padding: 12px 16px;
      color: 001F3F;
      text-decoration: none;
      background-color: #33FF99;
     	 
    }

    .dropdown-content a:hover {
      background-color: white; /* Hover on entire box */
      color:000099;
      display: block;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }

    .dropdown-btn {
      padding: 10px 20px;
      background-color: #33FF99;
      color: 001F3F;
      cursor: pointer;
      border-radius:10px;
    }
    
    .dropdown-menu{
	  border-radius:15px;	        	
    }
    
  </style>
</head>



 <link rel="stylesheet" type="text/css" href="custom.css">
<header>

<div id="title">
     <h1 style="color:#33FF99">HR Connect </h1>
     <center><h2 style="
			  font-family: Arial, Helvetica, sans-serif;
			  color:#33FF99;
			  text-decoration:underline;">
			  Admin Dashboard
			</h2></center>
      
</div>

   
    <nav>
 
 	
 
    <a class="A" href="<%= request.getContextPath() %>/Admin Pages/index.jsp">Home</a>    
    
	    <div class="dropdown">
	    		 <div class="dropdown-btn">  Employees &#9662;</div>	
		    		 <div class="dropdown-content">
		    		 	<a class="dropdown-menu" href="<%= request.getContextPath() %>/Admin Pages/insert_employee.jsp">Add Employee</a>
						<a class="dropdown-menu" href="#">End Employment</a>
						<a class="dropdown-menu" href="<%= request.getContextPath() %>/Admin Pages/employees.jsp">View All Employees</a>	    		 			    
			 	 </div>
		</div>
    
     <a class="A" href="<%= request.getContextPath() %>/Admin Pages/attendance.jsp">Attendance</a>     
   
    
    
    
   
    
 </nav>
    
    <%String nm = (String) session.getAttribute("admin_name");%>
    
    <%
    	if(nm == null){    
    %>
         
     	 <a class="A" id="login" href="login.jsp"> Log In</a>
     	      	 
    <%	}
    	else{
    %>
    
    	 <a class="A" id="logout" href="<%= request.getContextPath()%>/Admin Pages/logout.jsp"> Log Out</a>
    	 
    <%	
   			 }
    %>
   
   
   
	
</header>