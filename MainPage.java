import java.sql.*;
import java.util.*;
import java.io.*;

 class signup{
	String name,passwd, firstname, lastname;
	
	signup(Connection con) throws Exception{
		System.out.println("\t\t****************************************");
		System.out.println("\t\t****************************************");
		System.out.println("\t\t************     SIGN UP     ***********");
		System.out.println("\t\t****************************************");
		System.out.println("\t\t****************************************");
		
		Scanner sc =new Scanner(System.in);
		System.out.println("Enter First Name:  ");
		String fname=sc.next();
		System.out.println("Enter Last Name:  ");
		String lname=sc.next();
		System.out.println("Enter your username Name(Must be unique):  ");
		String uname=sc.next();
		System.out.println("Enter password:  ");
		String passwd=sc.next();
		
		String query1="insert into users values(?,?,?,?)";
		String query2="insert into login values(?,?)";
		
		PreparedStatement st=con.prepareStatement(query1);
		
		st.setString(1, fname);
		st.setString(2, lname);
		st.setString(3, uname);
		st.setString(4, passwd);
		int c1=st.executeUpdate();
		
	    st=con.prepareStatement(query2);
	    st.setString(1, uname);
	    st.setString(2, passwd);
	    int c2=st.executeUpdate();
	    
		if(c1==1 && c2==1) {
			
			String query3="create table " +uname + "(sid int not null auto_increment, sname varchar(20), frequest varchar(20), Accept_denial boolean,primary key(sid)  )";
			st=con.prepareStatement(query3);
			int c3=st.executeUpdate();
			
				System.out.println(c1+ " row affected\nUSER CREATED SUCCESSFULLY\n");
		}
		else
			System.out.println("Error occured ");
		
		st.close();
	}
	
}
class signin{
	signin(Connection con) throws Exception{
		System.out.println("\t\t****************************************");
		System.out.println("\t\t****************************************");
		System.out.println("\t\t************     SIGN IN     ***********");
		System.out.println("\t\t****************************************");
		System.out.println("\t\t****************************************");
		
		Scanner sc =new Scanner(System.in);

		System.out.println("Enter User Name:  ");
		String uname=sc.next();
		System.out.println("Enter Password Name:  ");
		String passwd=sc.next();
		
		String query="select uname,pass from login";
		
		Statement st= con.createStatement();
		ResultSet rs= st.executeQuery(query);
		int flag=0;
		while(rs.next()) {
			String u=rs.getString("uname");
			String p=rs.getString("pass");
			if(u.equals(uname) && p.equals(passwd)) {
				flag=1;
				System.out.println("You have Successfully LOGGED IN...");
				NewsFeed nw=new NewsFeed(con, uname);
			}
		}
		if(flag==1)
			System.out.println("Wrong UserId of Passwd ");
		
		st.close();
		
	}
	    
}

class NewsFeed{
	NewsFeed(Connection con, String uname) throws Exception{
		Scanner sc=new Scanner(System.in);
		System.out.println("\t\t****************************************");
		System.out.println("\t\t****************************************");
		System.out.println("\t\t************   HOME SCREEN   ***********");
		System.out.println("\t\t****************************************");
		System.out.println("\t\t****************************************");
		int ch=1;
		while(ch==1) {
			System.out.println("\n\n1. Create/View NEW POSTS");
			System.out.println("2. ADD A FRIEND");
			System.out.print("3. FRIEND REQUEST NOTIFICATION COUNT: ");
				
				int count=0;
				String query="select * from notification where username='"+uname+"'";
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(query);
				while(rs.next()) {
					count++;
				}	
				System.out.println(count);
				
			 
			System.out.println("4. EXIT");
			
			System.out.print("Enter your choice:  ");
			int choice=sc.nextInt();
			switch(choice) {
				case 1:
					POST pt=new POST(con);
					pt.ShowData(con, uname);
					break;
					
				case 2:
					ADD_FRIEND ad=new ADD_FRIEND(con, uname);
					ad.Add_a_friend(con, uname);
					break;
					
				case 3:
					NOTIFICATION nf=new NOTIFICATION(con, uname);
					break;
					
				case 4:
					ch=0;
					break;
					
				default:
					System.out.println("\n\nINVALID CHOICE \n\n");
				
			}
			st.close();
			rs.close();
			
		}
		
	}
}

class NOTIFICATION{
	NOTIFICATION(Connection con, String username) throws Exception{
		Scanner sc=new Scanner(System.in);
		String q1="select * from NOTIFICATION where username='"+username+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(q1);
		
		while(rs.next()) {
			String request=rs.getString("request_from");
			System.out.println("A Friend request is sended from "+request);
			
			System.out.println("Do you want to add(yes/no)");
			String str=sc.next();
			if(str.equals("yes")) {
				q1="insert into "+username+" values(?,?,?,?)";
				PreparedStatement pt1=con.prepareStatement(q1);
				pt1.setInt(1, 0);
				pt1.setString(2, username);
				pt1.setString(3, request);
				pt1.setInt(4, 0);
				pt1.executeUpdate();
				
				String q2="update "+request+" set Accept_denial=0 where frequest='"+username+"'";
				pt1=con.prepareStatement(q2);
				pt1.executeUpdate();
				
				String q3="delete from NOTIFICATION where request_from='"+request+"'";
				pt1=con.prepareStatement(q3);
				int count=pt1.executeUpdate();
				
				if(count==1)
					System.out.println("Deleted from notification");
				pt1.close();
				
			}
			else {
				String q3="delete from "+request+" where frequest='"+username+"'";
				PreparedStatement pt1=con.prepareStatement(q3);
				int count=pt1.executeUpdate();
				
				if(count==1)
					System.out.println("Deleted from request");
				
				String q2="delete from NOTIFICATION where request_from='"+request+"'";
				pt1=con.prepareStatement(q2);
				count=pt1.executeUpdate();
				
				if(count==1)
					System.out.println("Deleted from notification");
				pt1.close();
			}
		}
	
		st.close();
		rs.close();
	}
}

class ADD_FRIEND{
	ADD_FRIEND(Connection con,String username) throws Exception {
		
		String query="select * from users where uname not in ('"+username+"')";
		
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		System.out.println("\nUSERS REGISTED LIST: ");
		while(rs.next()) {
			String fname=rs.getString("firstname");
			String lname=rs.getString("lastname");
			String uname=rs.getString("uname");
			System.out.println("USERNAME: "+uname+"\n Name : "+fname+" "+lname+"\n\n");
			
		}
		st.close();
		rs.close();
	}
	void Add_a_friend(Connection con, String username) throws Exception {
		Scanner sc=new Scanner(System.in);
		
		System.out.println("ENTER USERNAME WHICH YOU ADD AS FRIEND: ");
		String str=sc.next();
		
		String query="insert into "+username+" values(?,?,?,?)";
		String query2="select * from users where uname='"+str+"'";
		PreparedStatement st=con.prepareStatement(query);
		Statement st1=con.createStatement();
		ResultSet rs=st1.executeQuery(query2);
		rs.next();
		
		
		st.setInt(1, 0);
		st.setString(2, username );
		st.setString(3,str);
		st.setInt(4, 1);
		int count=st.executeUpdate();
		
		if(count==1) {
			query="insert into notification values(?,?,?)";
			st=con.prepareStatement(query);
			st.setInt(1, 0);
			st.setString(2, str);
			st.setString(3, username);
			st.executeUpdate();
			
		}
		
		st.close();
		st1.close();
		rs.close();
	}
}

class POST{
	POST (Connection con) throws Exception{
		
		System.out.println("\t\t****************************************");
		System.out.println("\t\t****************************************");
		System.out.println("\t\t************    NEWS FEED    ***********");
		System.out.println("\t\t****************************************");
		System.out.println("\t\t****************************************");
		
		String query="select * from POST";
		
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
			
		while(rs.next()){
			String name=rs.getString("fname");
			name+=" "+rs.getString("lname");
			String new_post=rs.getString("new_post");
			String user_name=rs.getString("uname");
			int val= rs.getInt("post_id");
			System.out.println("POST NUMBER: "+val+"\nNAME: "+name+"\nUSERNAME: "+ user_name+ "\n\n"+ new_post+"\n");
		}
		
		
		st.close();
		rs.close();
	}
	void ShowData(Connection con, String usrname) throws Exception {
		Scanner sc=new Scanner(System.in);
		System.out.println("1. Add a New Post ");
		System.out.println("2. Delete previous post");
		System.out.println("3. Exit");
		System.out.println("Enter your choice :");
		int choice=sc.nextInt();
	
		switch(choice) {
			case 1:
				System.out.println(" Type your Views on here (Do not press enter for next line(character<=100)): ");
				sc.nextLine();
				String str=sc.nextLine();
				String query="select * from users where uname= '" +usrname + " ' ";
				String insert="insert into post values(?,?,?,?,?)";
				
				Statement st= con.createStatement();
				ResultSet rs= st.executeQuery(query);
				rs.next();
				String firstname=rs.getString("firstname");
				String lastname=rs.getString("lastname");
				 
				
				PreparedStatement pt= con.prepareStatement(insert);
				
				pt.setString(1, firstname);
				pt.setString(2, lastname);
				pt.setString(3, usrname);
				pt.setString(4, str);
				pt.setInt(5, 0);
				int count=pt.executeUpdate();
				
				if(count==1) {
					System.out.print("You Shared this post \n\n");
				}
				
				
				st.close();
				rs.close();
				pt.close();
				break;
				
			case 2:
				System.out.print("YOUR ALL POSTS \n\n");
				String query1="select * from POST where uname='"+usrname+"'";
				int counter=0;
				Statement st1=con.createStatement();
				ResultSet rs1=st1.executeQuery(query1);

					while(rs1.next()) {
						System.out.print("test\n");
						String name=rs1.getString("fname");
						name+=rs1.getString("lname");
						String new_post=rs1.getString("new_post");
						String user_name=rs1.getString("uname");
						int val= rs1.getInt("post_id");
						System.out.println("   POST NUMBER : "+val+"\n"+name+"  USERNAME: "+ user_name+ "\n\n"+ new_post+"\n");
						counter++;
					}
					
				
				System.out.print("\n\n DELETE POST \n\n Enter the POST NUMBER you want to delete: ");
				int val=sc.nextInt();
				query1="delete from POST where post_id="+val;
					
				PreparedStatement pt1=con.prepareStatement(query1);
				count=pt1.executeUpdate();
				if(count==1)
					System.out.println("POST_ID= "+val+" is successfully deleted!!!...\n\n");
				pt1.close();
				
				st1.close();
				rs1.close();
				
				
				break;
			
			case 3:
				break;
				
		}
	}
}

public class MainPage {

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		String url="jdbc:mysql://localhost:3306/focusspace";
		String user="root";
		String password="";
		int ch=1;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con= DriverManager.getConnection(url, user, password);
		while(ch==1) {
			System.out.println("\t\t******************** *******************");
			System.out.println("\t\t*******************   ******************");
			System.out.println("\t\t************   CLOSE HEARTS  ***********");
			System.out.println("\t\t*******************   ******************");
			System.out.println("\t\t******************** *******************");
			
			
			System.out.println("1. SIGN UP");
			System.out.println("2. SIGN IN");
			System.out.println("3.Exit ");
			System.out.println("Enter Your Choice");
			int choice=sc.nextInt();
			switch(choice) {
				case 1:
					signup sp=new signup(con);
					break;
				case 2:
					signin si=new signin(con);
					break;
				case 3:
					ch=0;
					break;
				default:
					System.out.println("Wrong choice :");
					break;
					
			}
			
		}
		
		
		con.close();
	}

}
