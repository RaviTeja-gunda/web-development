<%@ page import="java.sql.*"%>
<%
String userid=request.getParameter("uname");
String npass=request.getParameter("pass");
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password");
    PreparedStatement ps=con.prepareStatement("select * from admin where username=? and password=? ");
    ps.setString(1,userid);
    ps.setString(2,npass);
    ResultSet rs=ps.executeQuery();
	if(!(rs.next())){ %>
        <script>
            window.alert("Invalid Credentials");
            location.replace("sbinocash.html");
        </script>				
	<%}				 
    else{
        //out.print("login Sucessfully Completed....");
        response.sendRedirect("login attributes.jsp");
    }
}catch(Exception e){
    out.print(e);
}
%>