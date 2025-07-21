<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Sign Up Page</title>
  <style>
     *{
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background: linear-gradient(to right, #E9D5FF, #FFD6E8); /* Fresh blue gradient  #00B4DB, #0083B0 */  
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 1rem;
    }

    .signup-container {
      background-color: #ffffff;
      padding: 2rem;
      border-radius: 20px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
      width: 100%;
      max-width: 450px;
      margin: auto;      
    }

    .signup-container h2 {
      text-align: center;
      margin-bottom: 1.5rem;
      color: #A78BFA; /* 0083B0     */
    }

    .signup-container label {
      display: block;
      margin-bottom: 0.5rem;
      color: #333;
    }

    .signup-container input {
      width: 100%;
      padding: 0.75rem;
      margin-bottom: 1rem;
      border: 1px solid #ccc;
      border-radius: 12px;
    }

    .signup-container button {
      width: 100%;
      padding: 0.75rem;
      background-color: #A78BFA;
      color: white;
      border: none;
      border-radius: 12px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .signup-container button:hover {
      background-color: #009ac1;
    }

    .signup-container .footer {
      text-align: center;
      margin-top: 1rem;
      font-size: 0.9rem;
    }

    .signup-container .footer a {
      color: #0083B0;
      text-decoration: none;
    }
  </style>
</head>
<body>
  <div class="signup-container">
    <h2>Create Your Account</h2>
    <form action="#">
      <label for="fullname">Full Name</label>
      <input type="text" id="fullname" name="fullname" required>

      <label for="email">Email</label>
      <input type="email" id="email" name="email" required>

      

      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>

      

      <button type="submit">Sign Up</button>  
    </form>
      <div class="footer">
      Login here ->  <a href="   login.jsp">Login</a>         <!--Already have an account?  -->
    </div> 
  </div>
</body>
</html>





