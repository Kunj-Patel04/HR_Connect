<html>
<head>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Client_Pages/style.css">


<style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: white;
      margin: 0;
      padding: 40px;
      color: #103e46;
    }

    .container {
      max-width: 1100px;
      margin: auto;
      display: flex;
      flex-wrap: wrap;
      gap: 30px;
      justify-content: center;
      padding-top:50px;
    }

    .info-box {
      background-color: #f4f0fb;
      border-radius: 15px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
      padding: 30px;
      width: 450px;
      transition: transform 0.3s ease;
    }

    .info-box:hover {
      transform: translateY(-5px);
    }

    .info-title {
      font-size: 1.5rem;
      color: #10707f;
      margin-bottom: 15px;
    }

    .info-content {
      font-size: 1rem;
      line-height: 1.6;
    }
  </style>

</head>
<body>


<div><jsp:include page="header.jsp"/></div>
 

  <div class="container">

    <!-- Company Details Box -->
    <div class="info-box">
      <div class="info-title"> Company Details</div>
      <div class="info-content">
        <strong>Name:</strong> ABC Software Pvt. Ltd.<br>
        <strong>Founded:</strong> 2015<br>
        <strong>Location:</strong> Ahmedabad, Gujarat<br>
        <strong>Industry:</strong> IT & Software Developement<br> 
        <strong>About:</strong> We specialize in delivering high-quality enterprise software, employee systems, and cloud-based services.
      </div>
    </div>

    <!-- HR Details Box -->
    <div class="info-box">
      <div class="info-title"> HR Contact</div>
      <div class="info-content">
        <strong>Name:</strong> ABC <br>
        <strong>Email:</strong> @abcsoft.com<br>
        <strong>Phone:</strong> +91 98765 43210<br>
        <strong>Office Hours:</strong> Mon-Fri, 10:00 AM - 6:00 PM<br>
        <strong>Support:</strong> Contact HR for leave queries, policies, or personal updates.
      </div>
    </div>

  </div>











<div><jsp:include page="footer.jsp"/></div>


</body>
</html>


