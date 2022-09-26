<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>insert Page</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>

</head>

<body>
    <form method="post" action="insert2.jsp">
        <div class="logo">
            <img src="logo.png" alt="logo" class="logobsp">
        </div>
        <br>
        <marquee width="100%" direction="left" height="35px">
     This page is compatible in Google Chrome and Microsoft Edge.    
 </marquee>
        <div class="heading">
            <h2>DSC ASSET MANAGEMENT SYSTEM</h2>
        </div><br><br>
        <div class="goback">
            <a href="admin.jsp" class="back-bt">Go Back</a>
            <a href="logout.jsp" class="back-bt">Log Out</a>
        </div>

        <div class="box">
            <h1>Insert User's DSC Details</h1>

            <div class="input-box">
                <input type="text" placeholder="Personal No." name="persno">
            </div>
            <button type="submit" class="login-btn">SHOW DETAILS</button>
        </div>
<%
String x_persno = (String)session.getValue("v_persno");
String persno = x_persno;
	if(persno==null){
		
                    %>
                    <script>
                    alert("Your session logged out. Login again!!");
                    window.location.href="index.html";
                    </script>
                    <%

	};

%>

    </form>
</body>

</html>