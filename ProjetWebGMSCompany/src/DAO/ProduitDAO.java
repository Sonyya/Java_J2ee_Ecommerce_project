package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



import Singleton.MonSingleton;
import VO.ClientVO;
import VO.ProduitVO;

public class ProduitDAO {
	//etablissement de la connectio la base de donnee;
	Connection conn = MonSingleton.getInstance();
	
	/*fonction creation du produit  A FAIRE*/
	
	public void CreateProduit(ProduitVO produit)  throws SQLException
	{
		//commande me permettant d ajouter le client dasn la base de donnees
		String query = "INSERT INTO produit (Nom, Prix, Description, photoURL) VALUES ("+ "'"+ produit.getNom()+"', "+produit.getPrix()+",'"+ produit.getdescription() +"', '"+produit.getPhotoUrl()+"' )";
		System.out.println(query);
		//execution de la commande dans un statement
		conn.createStatement().executeUpdate(query);
	}

	///UPDAte ClientInfo
	
	public void UpdateProduit(int produitIDaModifie, String Nom, float prix, String description, String URLPhoto)  throws SQLException
	{
		//commande me permettant d ajouter le client dasn la base de donnees
		String query = "UPDATE produit SET Nom ='"+ Nom+ "', Prix ="+ prix+ ", Description = '"+ description + "', photoURL ='"+ URLPhoto+ "' WHERE ID=" +  produitIDaModifie;
		System.out.println(query);
		//execution de la commande dans un statement
		conn.createStatement().executeUpdate(query);
	}
	
	public void DeleteProduit(int ProduitID)  throws SQLException
	{
		//commande me permettant d ajouter le client dasn la base de donnees
				String query = "DELETE FROM produit WHERE ID = " +   ProduitID ;
				System.out.println(query);
				//execution de la commande dans un statement
				conn.createStatement().executeUpdate(query);
	}

	//Recuperation des donnees du client de la BD
	
	public ProduitVO getProduitById(int id) throws SQLException
	{
		//creation d mon nouvel objet Client
		
		String query= "SELECT * FROM produit WHERE ID =" + id;
		System.out.println(query);
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		if(((ResultSet) rs).next()) 
		{
			ProduitVO produit = new ProduitVO();
			produit.setId(((ResultSet) rs).getInt("ID"));
			produit.setNom(((ResultSet) rs).getString("Nom"));
			produit.setPrix(((ResultSet) rs).getFloat("Prix"));
			produit.setDescription(((ResultSet) rs).getString("Description"));
			produit.setPhotoUrl(((ResultSet) rs).getString("photoURL"));
			return produit;
		}
		return null;
	}
	
	public ArrayList<ProduitVO> getAll() throws SQLException
	{
		conn = MonSingleton.getInstance();
		//creation d mon nouvel objet Client
		
		String query= "SELECT * FROM produit";
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
	
	public int getLastID() 
{
	String query= "SELECT ID FROM produit ORDER BY ID DESC LIMIT 1";
	System.out.println(query);
	try {
		ResultSet rs =  conn.createStatement().executeQuery(query);
	
		if(((ResultSet) rs).next()) {
			return ((ResultSet) rs).getInt("ID");
		}	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return 0;
}
	

	public static void main(String... arg) throws SQLException
	{
	
		ArrayList<ProduitVO> produits;
		ProduitDAO boss  =  new ProduitDAO();
		
		/*produits = boss.getAll();
		for(ProduitVO article : produits ) 
		{
			System.out.println(article.toString());
		}
		*/
	
		int pp = boss.getLastID();
		/*System.out.println(pp);
			
		boss.UpdateProduit(pp.getId(),"okay", (float)850.0, "hola", "yup.jpg" );
		ProduitVO pp2 = boss.getProduitById(8);*/
		System.out.println("last ID Produit"+ pp);
		
	}
	

}
