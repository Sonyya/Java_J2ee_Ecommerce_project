package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import Singleton.MonSingleton;
import VO.ClientVO;
import VO.StatutCommandeVO;

public class ClientACommandeDAO {

	//etablissement de la connectio la base de donnee;
		Connection conn = MonSingleton.getInstance();
		
		//creation  d un objet client dans la BD
		
		public void CreateClientACommande(int clientID, int CommandeID)  throws SQLException
		{
			//commande me permettant d ajouter le client dasn la base de donnees
			String query = "INSERT INTO clientacommande (IdClient, IdCommande, StatutCommandeID) VALUES ("+ clientID+", "+CommandeID+","+1+")";
			System.out.println(query);
			//execution de la commande dans un statement
			conn.createStatement().executeUpdate(query);
		}
	
		
	
		public int getStatutCmdID(int cmdID, int ClientID) throws SQLException
	{
		String query= "SELECT StatutCommandeID FROM clientacommande cc WHERE cc.IdClient= " + ClientID + " AND cc.IdCommande = "+ cmdID;
		System.out.println(query);

			ResultSet rs =  conn.createStatement().executeQuery(query);
		
			if(((ResultSet) rs).next()) {
				return ((ResultSet) rs).getInt("StatutCommandeID");
			}
				return 0;
	}			
		
		//Recuperation des donnees du client de la BD
		
	/*	public ClientVO getClient() throws SQLException
		{
			//creation d mon nouvel objet Client
			
			String query= "SELECT * FROM client ORDER BY ID DESC LIMIT 1";
			System.out.println(query);
			ResultSet rs = (ResultSet) conn.createStatement().executeQuery(query);
			if(((ResultSet) rs).next()) 
			{
				ClientVO cl = new ClientVO();
				cl.setId(((ResultSet) rs).getInt("ID"));
				cl.setNom(((ResultSet) rs).getString("Nom"));
				cl.setNaissance(((ResultSet) rs).getDate("Naissance"));
				cl.setAdresse(((ResultSet) rs).getString("Adresse"));
				cl.setVille(((ResultSet) rs).getString("Ville"));
				cl.setPays(((ResultSet) rs).getString("Pays"));
				cl.setTelephone(((ResultSet) rs).getString("Telephone"));
				return cl;
			}
			return null;
		}
	*/	
		public static void main(String... arg) throws SQLException
		{
			ClientACommandeDAO boss = new ClientACommandeDAO();
			int hih = boss.getStatutCmdID(2, 1);
			StatutCommandeDAO sDAO = new StatutCommandeDAO();
			StatutCommandeVO statut = sDAO.getStatutByID(hih);
			System.out.println(statut.toString());
			

			
		}
		


}
