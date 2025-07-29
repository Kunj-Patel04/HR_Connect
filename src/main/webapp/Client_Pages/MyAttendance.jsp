<html>
<head>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Client_Pages/style.css">

<style>
   
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f6f9;
      /* padding: 0px; */
    }

    h2 {
      text-align: center;
      color: #333;
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

<div><jsp:include page="header.jsp"/></div>



<table border="1">

	<tr>
			<th>Date</th>
			<th>Check IN</th>
			<th>Check Out</th>
	</tr>
	<tr>
			<td>20/07/2025</td>
			<td>
				<form>	<button>Check In</button>	</form>
			</td>
			<td>
				<form>	<button>Check Out</button>	</form>
			</td>
	</tr>

	
	


</table>










<jsp:include page="footer.jsp"/>


</body>
</html>