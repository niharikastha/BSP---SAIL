<%@ page  language = "java" import="java.sql.*,java.util.*,java.io.*" session="true" %>
<%@ include file = "db_conn.jsp" %>

<%

String y_persno = (String)session.getValue("n_persno");


 //String persno=request.getParameter("u_persno");
// String dept=request.getParameter("u_dept");
// String sect=request.getParameter("u_sect");
// String grade=request.getParameter("u_grade");
 String dsc_issue_dt=request.getParameter("u_dsc_issue_dt");
 String dsc_expiry_dt=request.getParameter("u_dsc_expiry_dt"); 
 String token_type=request.getParameter("u_token_type"); 
 String class_name=request.getParameter("u_class_name"); 
 String authorization_signatory=request.getParameter("u_authorization_signatory"); 
 try{

 PreparedStatement ps = conn.prepareStatement("update userdetail set dept='"+dept+"',sect='"+sect+"',grade='"+grade+"', dsc_issue_dt='"+dsc_issue_dt+"', dsc_expiry_dt='"+dsc_expiry_dt+"',token_type='"+token_type+"',class_name='"+class_name+"',authorization_signatory='"+authorization_signatory+"' where persno='"+y_persno+"' ");
 int i= ps.executeUpdate();
  
  if(i>0){
       %>
        <script>
        alert("Data Inserted Successfully");
        window.location.href="insert.jsp";
        </script>
       <%
  }
  else{ %>
  <script>
  alert("Insertion Unsuccessfull !!! Please try again");
  window.location.href="insert.jsp";
  </script>
  <%
  }
  conn.close();
  }

catch(Exception e) 
{
    out.print(e);
}


%>