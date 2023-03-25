package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Singleton.MonSingleton;
import VO.CommandeVO;
import VO.CommandeAProduitVO;
import VO.ProduitVO;

public class CommandeAProduitDAO {
	//etablissement de la connectio la base de donnee;
	Connection conn = MonSingleton.getInstance();
	
	//creation  d un objet client dans la BD
	
	public void CreateProduitACommande(int CommandeID, int ProduitID, int QtePris)  throws SQLException
	{

			//commande me permettant d ajouter le client dasn la base de donnees
			String query = "INSERT INTO commandeaproduit (CommandeID, ProduitID, QteCommande) VALUES (" + CommandeID+", "+ProduitID+", "+ QtePris+")";
			System.out.println(query);
			//execution de la commande dans un statement
			conn.createStatement().executeUpdate(query);

	}

		
	
	public ArrayList<ProduitVO> getProduitByCmdID(int cmdID) throws SQLException
	{
		conn = MonSingleton.getInstance();
		//creation d mon nouvel objet Client
		
		String query= "SELECT * FROM produit p JOIN commandeaproduit cp ON cp.ProduitID = p.ID WHERE cp.CommandeID = " + cmdID;
		System.out.println(query);
		//creation de ma liste de vin pour contenir tous les vins
		ArrayList<ProduitVO> produitList = new ArrayList<ProduitVO>();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		while(((ResultSet) rs).next()) 
		{
			ProduitVO article = new ProduitVO();
			article.setId(((ResultSet) rs).getInt("ID"));
			article.setNom(((ResultSet) rs).getString("Nom"));
			article.setPrix(((ResultSet) rs).getFloat("Prix"));
			article.setDescription(((ResultSet) rs).getString("Description"));
			article.setPhotoUrl(((ResultSet) rs).getString("photoUrl"));
			produitList.add(article);
		}
		return produitList;
	}
	
	public ArrayList<CommandeAProduitVO> getProduitACommandeByCmdID(int cmdID) throws SQLException
	{
		conn = MonSingleton.getInstance();
		//creation d mon nouvel objet Client
		
		String query= "SELECT * FROM commandeaproduit WHERE CommandeID = " + cmdID;
		System.out.println(query);
		//creation de ma liste de vin pour contenir tous les vins
		ArrayList<CommandeAProduitVO> produitList = new ArrayList<CommandeAProduitVO>();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		while(((ResultSet) rs).next()) 
		{
			CommandeAProduitVO article = new CommandeAProduitVO();
			article.setCommandeId(((ResultSet) rs).getInt("CommandeID"));
			article.setProduitId(((ResultSet) rs).getInt("ProduitID"));
			article.setQteCommande(((ResultSet) rs).getInt("QteCommande"));

			produitList.add(article);
		}
		return produitList;
	}
	
	public float SommeTotalCommande(int cmdID) throws SQLException
	{
		
		//commadne pour la somme
		//select sum(p.Prix * cp.QteCommande) from produit p JOIN commandeaproduit cp ON cp.ProduitID = p.ID where cp.CommandeID = 2
		float somme = 0;
		ArrayList<CommandeAProduitVO> produitList = this.getProduitACommandeByCmdID (cmdID);
		ProduitDAO pDAO = new ProduitDAO();
		for( CommandeAProduitVO item : produitList)
		{
	
			float prixProduit = pDAO.getProduitById(item.getProduitId()).getPrix();
			somme += (prixProduit * item.getQteCommande());
		}
		
		return somme;
	}

	//Recuperation des donnees du client de la BD
	
	public CommandeAProduitVO getProduitACommande() throws SQLException
	{
		//creation d mon nouvel objet Client
		
		String query= "SELECT * FROM commandeaproduit ORDER BY ID DESC LIMIT 1";
		System.out.println(query);
		ResultSet rs = conn.createStatement().executeQuery(query);
		if(((ResultSet) rs).next()) 
		{
			CommandeAProduitVO pac = new CommandeAProduitVO();
			pac.setCommandeId(((ResultSet) rs).getInt("CommandeID"));
			pac.setProduitId(((ResultSet) rs).getInt("ProduitID"));
			pac.setQteCommande(((ResultSet) rs).getInt("QteCommande"));
			return pac;
		}
		return null;
	}
	
	public CommandeAProduitVO getProduitACommandeBycmdID(int cmdID, int ProduitID) throws SQLException
	{
		//creation d mon nouvel objet Client
		
		String query= "SELECT * FROM commandeaproduit Where CommandeID = " +  cmdID+" AND ProduitID= "+ ProduitID;
		System.out.println(query);
		ResultSet rs = conn.createStatement().executeQuery(query);
		if(((ResultSet) rs).next()) 
		{
			CommandeAProduitVO pac = new CommandeAProduitVO();
			pac.setCommandeId(((ResultSet) rs).getInt("CommandeID"));
			pac.setProduitId(((ResultSet) rs).getInt("ProduitID"));
			pac.setQteCommande(((ResultSet) rs).getInt("QteCommande"));
			return pac;
		}
		return null;
	}
	
	public static void main(String... arg) throws SQLException
	{
		CommandeAProduitDAO cDAO = new CommandeAProduitDAO();
		float in = cDAO.SommeTotalCommande(2);
		System.out.println(in);
		
		CommandeAProduitVO c = cDAO.getProduitACommandeBycmdID(2, 3);
		System.out.println(c.toString());
		
		
	}


}
