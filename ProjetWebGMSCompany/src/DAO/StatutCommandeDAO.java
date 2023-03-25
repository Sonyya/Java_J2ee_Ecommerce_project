package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Singleton.MonSingleton;
import VO.ClientVO;
import VO.ProduitVO;
import VO.StatutCommandeVO;
public class StatutCommandeDAO {
	
	//etablissement de la connectio la base de donnee;
	Connection conn = MonSingleton.getInstance();

	public StatutCommandeVO getStatutByID(int id)  throws SQLException
{
	String query= "SELECT * from statutcommande where ID = " + id;
	System.out.println(query);
	ResultSet rs =  conn.createStatement().executeQuery(query);
	
	if(((ResultSet) rs).next()) 
	{
		StatutCommandeVO status = new StatutCommandeVO();
		status.setId(((ResultSet) rs).getInt("ID"));
		status.setNomStatut(((ResultSet) rs).getString("Nom"));
		return status;
	}	

	
	return null;
}
	
	public ArrayList<StatutCommandeVO> getAll() throws SQLException
	{
		conn = MonSingleton.getInstance();
		//creation d mon nouvel objet Client
		
		String query= "SELECT * FROM statutcommande";
		System.out.println(query);
		//creation de ma liste de vin pour contenir tous les vins
		ArrayList<StatutCommandeVO> statutList = new ArrayList<StatutCommandeVO>();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		while(((ResultSet) rs).next()) 
		{
			StatutCommandeVO statut = new StatutCommandeVO();
			statut.setId(((ResultSet) rs).getInt("ID"));
			statut.setNomStatut(((ResultSet) rs).getString("Nom"));
			
			statutList.add(statut);
		}
		return statutList;
	}
	
	public static void main(String... arg) throws SQLException
	{
	
		ArrayList<StatutCommandeVO> statutList;
		StatutCommandeDAO boss  =  new StatutCommandeDAO();
		
		statutList = boss.getAll();
		for(StatutCommandeVO article : statutList ) 
		{
			System.out.println(article.toString());
		}
		
	
	
		
		
	}
	

}
