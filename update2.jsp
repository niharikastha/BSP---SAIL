<%@ page  language = "java" import="java.sql.*,java.util.*,java.io.*" session="true" %>
<%@ include file = "db_conn.jsp" %>
<html>
<head>
<title> Details For Updation</title>

<style>
body{
    background-image: url(bhilaihome.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    font-family: sans-serif;
      width: 100%;
    height: 100%;
}
.h1 {
	color: #6e1616;
font-size: 25px;
font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
padding : 0 0 10px 0;
text-align: center;
font-weight:bold;
}
.h2 {
  color: white;
  opacity : 0.8;
  font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
  font-size: 18px;
  text-align: left;
}

input[type="button"] 
{
  font size: 40px;
  width: 100px;
  padding:10px;
  margin:20px;
}
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: gray;
   color: black;
   text-align: center;
}


.link, a:link, a:visited{
	text-decoration : none;
	margin : 30px;
	text-align : center;
	background-color :#18316e;
	padding :2% 0% 2% 0%;
	color : white;
	opacity : 0.9;
	border-radius : 20px;
}
.login-btn{
margin: 20px 82PX 20px;
width: 80%;
display: block;
outline: none;
padding: 10px 0;
border: 1px solid #fff;

cursor: pointer;
background: transparent;
color: #fff;
font-size: 16px;
}

button:hover{
color: black;
background-color:#ccc;
transition: background-color ease-in-out 2s;
transform: scale(1.06)  ;
}
.heading{
    color : #6e1616;
    text-align : center;
    text-decoration: underline;
	font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    font-size:25px;
	font-weight:bold;
}
#footer {
    position:absolute;
    bottom:0;
    width:100%;
    height:20px;   /* Height of the footer */
    background:#6cf;
 }
</style>

</head>

		   <body bgcolor="#CCFFFF">		 
       

    <form method="post" action="update3.jsp">  
		   <table width="300px" border=0 align="center">
		   <tr><td width="150px" ><img src="logo.png" width="400px" height="150px" ></td>
		   </tr>
		   </table>
		   <br>
		   <marquee width="100%" direction="left" height="35px">
        This page is compatible in Google Chrome and Microsoft Edge.    
    </marquee>
 <div class="heading">
            <p>DSC ASSET MANAGEMENT SYSTEM</p>
           </div>
		   
		   <table width="800px"border=0 align="center">
		   <tr><td class="h1"><u>DSC Details To Be Updated</u></td></tr>
		   </table><br>
		   

<%
String x_persno = (String)session.getValue("v_persno");
String y_persno = x_persno;
if(y_persno==null){
		
                    %>
                    <script>
                    alert("Your session logged out. Login again!!");
                    window.location.href="index.html";
                    </script>
                    <%

	}
else
{
String persno = request.getParameter("persno");


String v_persno ="";
String n_persno ="";
String v_name ="";
String v_dept ="";
String v_sect ="";
String v_grade ="";
String v_email ="";
String v_role ="";
String v_issue_date ="";
String v_expiry_date ="";
String v_token_type ="";
String v_class_name ="";
String v_authorization_signatory ="";

  if((!(persno.equals(null) || persno.equals("")))){
	
try
   { 
	 //out.println("1");  
	  Statement stmt0 = conn.createStatement();
	//out.println("3"); 
	  ResultSet rs0 = stmt0.executeQuery("select persno, name,nvl(dept,'-'),nvl(sect,'-'),nvl(grade,'-'),email,nvl(role,'-'),nvl(dsc_issue_dt,'-'),nvl(dsc_expiry_dt,'-'),nvl(token_type,'-'),nvl(class_name,'-'),nvl(authorization_signatory,'-') from userdetail where persno='"+persno+"' "); 
	  
		//out.println("2");
	  while (rs0.next())  
	  {     			  
	  		 v_persno = rs0.getString(1);                                          
		     v_name = rs0.getString(2);
			 v_dept = rs0.getString(3);
			 v_sect = rs0.getString(4);
			 v_grade = rs0.getString(5);
			 v_email = rs0.getString(6);
			 v_role = rs0.getString(7);
			 v_issue_date = rs0.getString(8);
			 v_expiry_date = rs0.getString(9);
			 v_token_type = rs0.getString(10);
			 v_class_name = rs0.getString(11);
			 v_authorization_signatory = rs0.getString(12);
			 //session.putValue("v_name",v_name);
		//out.println("21");	
		 			

		session.putValue("n_persno",persno);
		//out.println("21");	

 		//out.println(n_persno);	

      }                                             
	  rs0.close();
	 
		
		//out.println("asdfg");
		%>
		</table>
		<table align="center" width="300px" >
	
		<tr>
		<td class="link"><font size="3px"><a href="update.jsp"><b>GOBACK</b></a></font></td><td></td><td></td>
		<td class="link"><font size="3px"><a href="logout.jsp"><b>LOGOUT</b></a></font></td>
		</tr>
		</table>
		<br>

		<table align="center" style="background-color:#18316e ; opacity : 0.9 ; border-radius : 10px ; padding :2.7% 2.7% 1% 2.7%;">
		<tr><th class="h2">Name : </th><td class="h2" ><%= v_name %></td></tr>
		<tr><th class="h2">Personal No : </th><td class="h2" ><%= v_persno %></td></tr>
		<tr><th class="h2">Role : </th><td class="h2" ><%= v_role %></td></tr>
		<tr><th class="h2">Email : </th><td class="h2" ><%= v_email %></td></tr>
		<tr><th class="h2">Department : </th><td class="h2" ><input type="text" name="u_dept" value="<%= v_dept %>"></td></tr>
		<tr><th class="h2">Section : </th><td class="h2" ><input type="text" name="u_sect" value="<%= v_sect %>"></td></tr>
		<tr><th class="h2">Grade : </th><td class="h2" ><input type="text" name="u_grade" value="<%= v_grade %>"></td></tr>
		<tr><th class="h2">DSC Issue Date : </th><td class="h2" ><input type="date" name="u_dsc_issue_dt" value="<%= v_issue_date %>"></td></tr>
		<tr><th class="h2">DSC Expire Date : </th><td class="h2" ><input type="date" name="u_dsc_expiry_dt" value="<%= v_expiry_date %>"></td></tr> 
		<tr><th class="h2">Token Type : </th><td class="h2" ><input type="text" name="u_token_type" value="<%= v_token_type %>"></td></tr> 
		<tr><th class="h2">Class Name : </th><td class="h2" ><input type="text" name="u_class_name" value="<%= v_class_name %>"></td></tr> 
		<tr><th class="h2">Authorization Signatory : </th><td class="h2" ><input type="text" name="u_authorization_signatory" value="<%= v_authorization_signatory %>"></td></tr> 
    <tr><th> <button type="submit" class="login-btn">SUBMIT</button></th></tr>
			</table>

		<br>
		<br>
		<br>
  	<%
	   conn.close(); 
   }
catch(SQLException e)
		   {
		    System.err.println("SQlException:"+e.getMessage());
		   }


  }
  else
{
                    %>
                    <script>
                    alert("Please enter Personal No !!");
                    window.location.href="update.jsp";
                    </script>
                    <%}	
}  	
		%>

</form>
</body>
</html>
