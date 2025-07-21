<html>
<head>

<style type="text/css">


*{
	box-sizing: border-box;
	
}

body{
	
	display:flex;
	justify-content: center;
	align-items: center;
	 background: linear-gradient(to left,#4e54c8, #8f94fb); 
}



.logincontainer{
	padding:3em;
	border-radius:45px;
	background-color:white;
	width:400px;
	height:350px;
	box-shadow: 0px 10px 25px;	
}

.logincontainer input{
	 width: 100%;
      padding: 0.75rem;
      margin-bottom: 1rem;
      border: 1px solid #ccc;
      border-radius: 15px;
}
.logincontainer button{
	width:100%;
	height:50px;
	border-radius:20px;
	background-color:#4e54c8;
	color:black;
}



</style>


</head>
<body>



<div class="logincontainer">


				<form action="loginform" method="get">
				
					Email: 										<br>
					<input type = "text" name = "email1">		<br>
					 Password:									<br> 
					 <input type = "password" name = "pass1">	<br>
					  				
					Gender:
					<select name="Gender">
					<option >Male</option>
					<option >Female</option>		
					</select>			<br><br>	
				
				
				
					<button type = "submit" value="login"> Login
					</button>
				</form>
				
</div>	
			
</body>
</html>