package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Singleton.MonSingleton;
import VO.ClientVO;
import VO.PanierVO;
import VO.ProduitVO;

public class PanierDAO {
	
	//etablissement de la connectio la base de donnee;
	Connection conn = MonSingleton.getInstance();
	
	//creation  d un objet client dans la BD
	
	public void CreatePanier(int clientID, int produitID, int Qte)  throws SQLException
	{
		//commande me permettant d ajouter le client dasn la base de donnees
		String query = "INSERT INTO panierclient (ClientID, ProduitID, QteVoulu) VALUES ("+ clientID +", "+produitID+", "+Qte+" )";
		System.out.println(query);
		//execution de la commande dans un statement
		conn.createStatement().executeUpdate(query);
	}

	//Recuperation des donnees du client de la BD
	
	public ArrayList<PanierVO> getAllPanierByClient(int client) throws SQLException
	{
		//creation d mon nouvel objet Client
		
		String query= "SELECT * FROM panierclient Where ClientID = " + client;
		System.out.println(query);
		ResultSet rs = (ResultSet) conn.createStatement().executeQuery(query);
		ArrayList<PanierVO> PanierContenue = new ArrayList<PanierVO>();
		while(((ResultSet) rs).next()) 
		{
			PanierVO item = new PanierVO();
			item.setId(((ResultSet) rs).getInt("ID"));
			item.setClientID(((ResultSet) rs).getInt("ClientID"));
			item.setProduitID(((ResultSet) rs).getInt("ProduitID"));
			item.setQteVoulu(((ResultSet) rs).getInt("QteVoulu"));
			PanierContenue.add(item);
			
		}
		return PanierContenue;
	}
	
	public void deleteItemPanier (int produitID, int clientID) throws SQLException
	{
		//DELETE FROM table
		//WHERE
	    //condition;
		//commande me permettant d ajouter le client dasn la base de donnees
		String query = "DELETE FROM panierclient WHERE ProduitID = " +   produitID + " AND ClientID = " + clientID;
		System.out.println(query);
		//execution de la commande dans un statement
		conn.createStatement().executeUpdate(query);
		
	}
	
	public void deleteAllPanier (int clientID) throws SQLException
	{
		//DELETE FROM table
		//WHERE
	    //condition;
		//commande me permettant d ajouter le client dasn la base de donnees
		String query = "DELETE FROM panierclient WHERE ClientID = " + clientID;
		System.out.println(query);
		//execution de la commande dans un statement
		conn.createStatement().executeUpdate(query);
		
	}
	

	public static void main(String... arg) throws SQLException
	{

		/*PanierDAO boss  =  new PanierDAO();
		//boss.CreatePanier(1, 2, 10);
		//PanierDAO newOne = boss.getLastClient();
		System.out.println("AVANT DELETE");
		ArrayList<PanierVO> paniers = boss.getAllPanierByClient(4);
		for(PanierVO article : paniers ) 
		{
			System.out.println(article.toString());
		}
		System.out.println("APRES DELETE");
		
		boss.deleteItemPanier(3, 4);
		
		paniers = boss.getAllPanierByClient(4);
		for(PanierVO article : paniers ) 
		{
			System.out.println(article.toString());
		}*/
	}
	

}
