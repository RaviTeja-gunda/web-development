<%@page import = "java.sql.*, java.util.*"%>
<%
String branch=request.getParameter("branch");
String name=request.getParameter("nam");
String father_name=request.getParameter("fname");
String contact=request.getParameter("phn");
String accountno=request.getParameter("acc"); 	
String email=request.getParameter("email");
String address=request.getParameter("add");
String username=request.getParameter("user");
String password=request.getParameter("pass");
int bal=5000;
try
{
		Connection con=null;
		Class.forName("oracle.jdbc.driver.OracleDriver");   //used to load driver
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","password");
		PreparedStatement ps=con.prepareStatement("select *from Register");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			if(rs.getString(2).equals(name))
			{%>
				<script>
					window.alert("Name already existed......Retry");
					location.replace("register.html");
				</script>	
			<%}
			else if(rs.getString(5).equals(accountno)){%>
				<script>
					window.alert("Account already existed......Retry");
					location.replace("register.html");
				</script>
			<%}
			else if(rs.getString(6).equals(email))
			{%>
				<script>
					window.alert("Email already registered......Retry...");
					location.replace("register.html");
				</script>	
			<%}
			else if(rs.getString(4).equals(contact))
			{%>
				<script>
					window.alert("Contact already existed......Retry...");
					location.replace("register.html");
				</script>	
			<%}
			else if(rs.getString(8).equals(username)) 
			{%>
				<script>
					window.alert("Username already existed......Retry...");
					location.replace("register.html");
				</script>	
			<%}
			else if(rs.getString(9).equals(password))
			{%>
				<script>
					window.alert("Password already existed......Retry...");
					location.replace("register.html");
				</script>	
			<%}
			else
			{
				ps=con.prepareStatement("insert into Register values(?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1,branch);
				ps.setString(2,name);
				ps.setString(3,father_name);
				ps.setString(4,contact);
				ps.setString(5,accountno);
				ps.setString(6,email);
				ps.setString(7,address);
				ps.setString(8,username);
				ps.setString(9,password);
				ps.setInt(10,bal);
				int i=ps.executeUpdate();
				if(i!=0)
				{%>
					<script>
						alert("Registered Successfully.....");
						location.replace("thanku.html");
					</script>
				<%}
			}
			con.close();
		}
}
catch(Exception e){
	out.println(e);
}
%>