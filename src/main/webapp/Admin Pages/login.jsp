<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <title>Login Page</title>
   <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background: linear-gradient(to left,#4e54c8, #8f94fb);  /*  #36256e, #e73493 */
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .login-container {
      background-color: #F2F2F7;       /* login-box color*/
      padding: 2rem;    /*login container padding with box*/
      border-radius: 25px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, .5);
      width: 100%;
      max-width: 400px;

    }

    .login-container h2 {         /*all for login logo-name*/
      text-align: center;
      margin-bottom: 1.5rem;
     color: #333;
    }

    .login-container label {
      display: block;
      margin-bottom: 0.5rem;
      color: #555;
    }

    .login-container input {
      width: 100%;
      padding: 0.75rem;
      margin-bottom: 1rem;
      border: 1px solid #ccc;
      border-radius: 15px;
    }

    .login-container button {
      width: 100%;
      padding: 0.75rem;
      background-color: #4e54c8;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.5s ease;
    }

    .login-container button:hover {
      background-color: #3e45b8;
    }

    .login-container .footer {
      text-align: center;
      margin-top: 1rem;
      font-size: 0.9rem;
    }

    .login-container .footer a {        /*for register link button*/
      color: #4e54c8;
      text-decoration: none;
    }
  </style> 
</head>

<body>
	  <div class="login-container">
    		<h2>Login</h2>
    
				    <form action="<%= request.getContextPath() %>/HR" method="post">
							Email:		<input type="text" name="email1" />	<br>
							Password:	<input type="password" name="pass1" /> <br>
										<button type="submit">Login</button>
										
				    </form>
				      
     <div class="footer">
      Don't have an account? <a href="sign_up.jsp">Register</a>
    </div>
  </div> 
  
  

  
</body>
</html>
