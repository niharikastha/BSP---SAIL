<%@ include file = "db_conn.jsp" %>
<%@ page  language = "java" import="java.sql.*,java.util.*,java.io.*" session="true" %>
<html>
<head>
<title>Admin Details</title>

<style>
body{
    background-image: url(bhilaihome.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    font-family: sans-serif;
    width: 95%;
    height: 95%;
}
</style>

</head>
</html>
<%
  String userdbPersno;
  String userdbPassword;
  String userdbRole;
  String x = "admin";
  String y = "Admin";
  String z = "ADMIN";  
  
  String sql = "select * from userdetail where persno=? and password=?" ;
  String persno = request.getParameter("persno");
  String password = request.getParameter("password");

  if((!(persno.equals(null) || persno.equals("")) && !(password.equals(null) || password.equals("")))){
  
  try{
      
  ResultSet rs = null;
  String v_persno="";
  PreparedStatement ps = conn.prepareStatement(sql);
  ps.setString(1,persno);
  ps.setString(2,password);
  rs = ps.executeQuery();
  if(rs.next())
{ 
            userdbPersno = rs.getString("persno");
            //out.println(userdbPersno);
            userdbPassword = rs.getString("password");
            userdbRole = rs.getString("role");
            session.putValue("v_persno",userdbPersno);

            if(persno.equals(userdbPersno) && password.equals(userdbPassword) )
                {
                   // session.setAttribute("persno",userdbPersno); 
                    if(x.equals(userdbRole)||y.equals(userdbRole)||z.equals(userdbRole) ){
                        //out.println("hello admin");
                        response.sendRedirect("admin.jsp"); 
                     }
                    else{
                        //out.println("hello user");
                        response.sendRedirect("user.jsp"); 
                    }
                    
                } 
    }
            else
                    %>
                    <script>
                    alert("wrong credentials!!");
                    window.location.href="index.html";
                    </script>
                    <%

                    rs.close();
                    ps.close(); 
}

catch(SQLException sqe)
{
out.println(sqe);
} 
}
else
{
                    %>
                    <script>
                    alert("Please insert data!!");
                    window.location.href="index.html";
                    </script>
                    <%}

%>

