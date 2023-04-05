import java.util.*;
import java.sql.*;
class Logintable
{
	public static void main(String kjhk[]) throws Exception
	{
		Scanner sc=new Scanner(System.in);
		Class.forName("oracle.jdbc.driver.OracleDriver");   //used to load driver
		System.out.println("Loaded");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","password");
			//used to connect to the particular database
		System.out.println("Connection Established");
		Statement s=con.createStatement();
		System.out.println("Enter no.of users to enter into Loginform: ");
		int n=sc.nextInt();
		PreparedStatement ps=con.prepareStatement("insert into Loginform values(?,?)");
		for(int i=1;i<=n;i++)
		{
			System.out.println("Enter Username: ");
			String uname=sc.next();
			ps.setString(1,uname);
			System.out.println("Enter Password: ");
			String pass=sc.next();
			ps.setString(2,pass);
			int rec=ps.executeUpdate();
		}
		ResultSet r=s.executeQuery("select *from Loginform");
			while(r.next())     //checks whether records existed or not
			{
				System.out.println(r.getString(1)+" "+r.getString(2));
			}

			//5: Execute Queries by statement object
		System.out.println("Success");
	}
} 