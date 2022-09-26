<%@  page import="java.sql.*"%>

<%@  page import="oracle.jdbc.driver.*"%>

 
<% 
Connection conn = null;
try{
DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
conn = DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","MYDB","MYDB");                                                                   
}
catch(Exception e)
{
out.print(e.toString());
}

%>

