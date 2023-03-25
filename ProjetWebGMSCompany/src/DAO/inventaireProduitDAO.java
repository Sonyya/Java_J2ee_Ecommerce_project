package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Singleton.MonSingleton;
import VO.ProduitVO;
import VO.inventaireProduitVO;

public class inventaireProduitDAO {
	//etablissement de la connectio la base de donnee;
		Connection conn = MonSingleton.getInstance();
		
		/*fonction creation du produit  A FAIRE*/
		
		public void CreateInventaireProduit(inventaireProduitVO inv)  throws SQLException
		{
			//commande me permettant d ajouter le client dasn la base de donnees
			String query = "INSERT INTO inventaireproduit (produitID, QteEnStock, seuilMinimum, QteAachete) VALUES ("+ ""+ inv.getProduitID()+", "+inv.getQteEnStock()+","+ inv.getSeuilMinimum()+", "+inv.getQteAachete()+" )";
			System.out.println(query);
			//execution de la commande dans un statement
			conn.createStatement().executeUpdate(query);
		}

		///UPDAte ClientInfo
		
		public void UpdateInventaireProduit(int ProduitID, int qteEnStock, int seuilMinimum, int QteAchete)  throws SQLException
		{
			//commande me permettant d ajouter le client dasn la base de donnees
			String query = "UPDATE inventaireproduit SET QteEnStock ="+ qteEnStock + ", seuilMinimum = "+ seuilMinimum + ", QteAachete ="+ QteAchete+ " WHERE produitID=" + ProduitID;
			System.out.println(query);
			//execution de la commande dans un statement
			conn.createStatement().executeUpdate(query);
		}
		
		public void deleteInventaireProduit(int ProduitID)  throws SQLException
		{
			//commande me permettant d ajouter le client dasn la base de donnees
			String query = "DELETE FROM inventaireproduit WHERE produitID = " +   ProduitID ;
			System.out.println(query);
			//execution de la commande dans un statement
			conn.createStatement().executeUpdate(query);
		}

		public void updateQteEnStock(int ProduitID, int qtePris)  throws SQLException
		{
			inventaireProduitDAO invDAO = new inventaireProduitDAO();
	
			int ancienneQte = invDAO.getInventaireByProduitId(ProduitID).getQteEnStock();

				int newQte = ancienneQte - qtePris;
				//commande me permettant d ajouter le client dasn la base de donnees
				String query = "UPDATE inventaireproduit SET QteEnStock ="+ newQte + " WHERE produitID=" + ProduitID;
				System.out.println(query);
				//execution de la commande dans un statement
				conn.createStatement().executeUpdate(query);

		
		}
		
		public boolean verifProduitStock(int ProduitID, int qtePris) throws SQLException
		{
			inventaireProduitDAO invDAO = new inventaireProduitDAO();
			int ancienneQte = invDAO.getInventaireByProduitId(ProduitID).getQteEnStock();
			if(qtePris <= ancienneQte )
			{
				return true;
			}
			return false;
		}
		//Recuperation des donnees du client de la BD
		
		public inventaireProduitVO getInventaireByProduitId(int ProduitId) throws SQLException
		{
			//creation d mon nouvel objet Client
			
			String query= "SELECT * FROM inventaireproduit WHERE ProduitID =" + ProduitId;
			System.out.println(query);
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			if(((ResultSet) rs).next()) 
			{
				inventaireProduitVO inv = new inventaireProduitVO();
				inv.setProduitID(((ResultSet) rs).getInt("ProduitID"));
				inv.setQteEnStock(((ResultSet) rs).getInt("QteEnStock"));
				inv.setSeuilMinimum(((ResultSet) rs).getInt("seuilMinimum"));
				inv.setQteAachete(((ResultSet) rs).getInt("QteAachete"));
				return inv;
			}
			return null;
		}
		
		

		public static void main(String... arg) throws SQLException
		{
		
			ArrayList<ProduitVO> produits;
			inventaireProduitDAO boss  =  new inventaireProduitDAO();
			
			/*produits = boss.getAll();
			for(ProduitVO article : produits ) 
			{
				System.out.println(article.toString());
			}
			*/
		
			inventaireProduitVO pp = boss.getInventaireByProduitId(8);
			System.out.println(pp);
//			inventaireProduitVO pp2 = new inventaireProduitVO();
//			pp2.setProduitID(8);
//			pp2.setQteAachete(20);
//			pp2.setSeuilMinimum(5);
//			pp2.setQteEnStock(10);
//			boss.CreateInventaireProduit(pp2);
			
			//boss.UpdateInventaireProduit(8, 30, 2, 100);
			//boolean jj = boss.updateQteEnStock(8, 10);
			//System.out.println("update "+jj);
			inventaireProduitVO pp2= boss.getInventaireByProduitId(4);
			System.out.println(pp2);
			
		}
		

}
