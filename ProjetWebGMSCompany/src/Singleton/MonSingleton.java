package Singleton;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

public class MonSingleton {
	//attribut
	
	private static Connection conn = null;
	ResourceBundle Configuration=ResourceBundle.getBundle("properties.Config");

	//constructeur
	
	private MonSingleton() 
	{
	try {
		System.out.println("URL = "+ Configuration.getString("url"));
		System.out.println("ROOT = "+ Configuration.getString("root"));
		System.out.println("PWD = "+ Configuration.getString("password"));
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn= DriverManager.getConnection(Configuration.getString("url"),Configuration.getString("root"),Configuration.getString("password"));
		}
			
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}

	// focntion
	
	public static Connection getInstance() 
	{
		if(conn==null) 
		{
			System.out.println("PAS DE CONNECTION MEUF");
			new MonSingleton();
		}
		System.out.println(" CONNECTION CONNECTION CONNECTION CONNECTION");
		return conn;
	}
	

	public static void main(String... arg)
	{
		Connection cn1 = MonSingleton.getInstance();
		Connection cn2 = MonSingleton.getInstance();
		
		System.out.println(cn1 ==cn2);
		
	}


}
