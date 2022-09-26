<%@ page  language = "java" import="java.sql.*,java.util.*,java.io.*" session="true" %>
<%@  page import="java.sql.*"%>
<%@ include file = "db_conn.jsp" %>
<html>
<head>
<title>Report</title>
<style>

body{
    background-image: url(bhilaihome.jpg);
    background-repeat: no-repeat;
    /* background-size: cover; */
    font-family: sans-serif;
    width: 100%;
    height: 100%;
    padding:0px;
    margin:0px;
}
.h1 {
	color: #6e1616;
font-size: 25px;
font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
padding : 0 0 10px 0;
text-align: center;
font-weight:bold;
}

.table1{
    background: #18316e;
    opacity: 0.9;
    color: #fff;
}
.back-bt{
    
    color: white;
    background-color:#18316e;
    font-weight: bold;
	opacity : 0.9;
	border-radius : 20px;
    font-size: 16px;
    cursor: pointer;
    text-decoration: none;
	padding :0.4% 2.5%;

}

.goback{
    display: flex;
justify-content:center;
gap: 0% 3%;

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
<body>

		   <table width="300px" border=0 align="center">
		   <tr><td width="150px" ><img src="logo.png" width="400px" height="140px" ></td>
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
		   <tr><td class="h1"><u>Users DSC Report</u></td></tr>
		   </table>
<br>
           <div class="goback">
              <a href="admin.jsp" class="back-bt">Go Back</a>
              <a href="logout.jsp" class="back-bt">Log Out</a> 
           </div>
<br>


		<table align="center" style="background-color:#18316e ;color:white; opacity:0.9; border-radius : 10px ; padding : 2.7%; " border="3">
<tr style="background-color:#cbab85; color:#18316e; font-weight:bold; text-align:center; height:35px">
 <td>Mobile No.</td>
 <td>Personal No.</td>
 <td>Name</td>
 <td>Role</td>
 <td>Department</td>
 <td>Section</td>
 <td>Grade</td>
 <td>Email</td>
 <td>DSC Issue Date</td>
 <td>DSC Expiry Date</td>
 <td>Token Type</td>
 <td>Class Name</td>
 <td>Authorization Signatory</td>
</tr>

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

	};
Statement st=null;
ResultSet rs=null;
try{

    st=conn.createStatement();
    String sql="select  mobno,persno,name,role,nvl(dept,'-'),nvl(sect,'-'),nvl(grade,'-'),email,password,nvl(dsc_issue_dt,'-'),nvl(dsc_expiry_dt,'-'),nvl(token_type,'-'),nvl(class_name,'-'),nvl(authorization_signatory,'-') from userdetail";
    rs=st.executeQuery(sql);
    while(rs.next()){
   %>
   <div class="table1">
<tr >
 <td><%=rs.getString(1) %></td>
 <td><%=rs.getString(2) %></td>
 <td><%=rs.getString(3) %></td>
 <td><%=rs.getString(4) %></td>
 <td><%=rs.getString(5) %></td>
 <td><%=rs.getString(6) %></td>
 <td><%=rs.getString(7) %></td>
 <td><%=rs.getString(8) %></td>
 <td><%=rs.getString(10) %></td>
 <td><%=rs.getString(11) %></td>
 <td><%=rs.getString(12) %></td>
 <td><%=rs.getString(13) %></td>
 <td><%=rs.getString(14) %></td>

</tr></div>
   <%

    }
}catch(Exception ex){
    out.println(ex);

}


%>
</table>

<br>

 </body>
</head>
</html>
