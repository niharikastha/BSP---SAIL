<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page  language = "java" import="java.sql.*,java.util.*,java.io.*" session="true" %>
<%@ include file = "db_conn.jsp" %>

<%@ page import="javax.mail.internet.*" %>


<%
    String result ="";
    for(int i=1; i<=30;i++)
    {
    
    GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
    cal.add((GregorianCalendar.DATE), (30-i));
    //System.out.println("Modified date (Previous Month): " + cal.getTime());
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
    String strDate= formatter.format(cal.getTime()); 
   
    String to ="";


	Statement stmt0 = conn.createStatement();
	ResultSet rs0 = stmt0.executeQuery("select email from userdetail where dsc_expiry_dt='"+strDate+"' "); 

 while (rs0.next())  
	{     			  
	  
	to = rs0.getString(1);
			 
    String subject = "dsc";
    String messg = "Your DSC is going to expire in a month. Update it as soon as possible!!!!!!!!";
    final String from = "asthaniharika123@gmail.com";
    final String pass = "lhkexvkjhispifkj";
    String host = "smtp.gmail.com";
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.user", from);
    props.put("mail.password", pass);
    props.put("mail.port", "465");
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    }); 

    try {
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO,
        new InternetAddress(to));
        message.setSubject(subject);
        message.setText(messg);
        Transport.send(message);
        result = "Your mail sent successfully....";	
    }
    
     catch (MessagingException mex) {
        out.println(mex);
        mex.printStackTrace();
        result = "Error: unable to send mail....";
    }
} 
  rs0.close();
}                                            

%>

<title>Sending Mail in JSP</title>

<h1><center><font color="blue">Sending Mail Using JSP</font></h1>

<b><center><font color="red"><% out.println(result);%></b>