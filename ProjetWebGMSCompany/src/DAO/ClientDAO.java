package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import Singleton.MonSingleton;
import VO.ClientVO;

public class ClientDAO {
	
	//etablissement de la connectio la base de donnee;
			Connection conn = MonSingleton.getInstance();
			
			//creation  d un objet client dans la BD
			
			public void CreateClient(ClientVO client, Boolean adminStatus)  throws SQLException
			{
				//commande me permettant d ajouter le client dasn la base de donnees
				String query = "INSERT INTO client (Nom, Prenom, EstAdmin, Telephone, Pays, region, ville, Adresse, CodePostal) VALUES ("+ "'"+ client.getNom()+"', '"+client.getPrenom()+"',"+ adminStatus +", '"+client.getTelephone()+"','"+client.getPays()+"', '"+client.getRegion()+"', '"+client.getVille()+"','"+client.getAdresse()+"','"+client.getCodePostal()+"' )";
				System.out.println(query);
				//execution de la commande dans un statement
				conn.createStatement().executeUpdate(query);
			}
				

			///UPDAte ClientInfo
			
			public void UpdateClient(ClientVO client, Boolean adminStatus)  throws SQLException
			{
				//commande me permettant d ajouter le client dasn la base de donnees
				String query = "UPDATE client SET Nom ='"+ client.getNom()+ "', Prenom ='"+ client.getPrenom() + "', EstAdmin ="+ adminStatus + ", Telephone ='"+ client.getTelephone()+ "',Pays ='"+ client.getPays() + "', region ='"+ client.getRegion() + "',ville ='"+ client.getVille() + "', Adresse='"+ client.getAdresse() + "', CodePostal ='"+ client.getCodePostal() + "' WHERE ID=" + client.getId();
				System.out.println(query);
				//execution de la commande dans un statement
				conn.createStatement().executeUpdate(query);
			}
			//Recuperation des donnees du client de la BD
			
			public ClientVO getClient() throws SQLException
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
					cl.setPrenom(((ResultSet) rs).getString("Prenom"));
					cl.setEstAdmin(((ResultSet) rs).getBoolean("EstAdmin"));
					cl.setTelephone(((ResultSet) rs).getString("Telephone"));
					cl.setPays(((ResultSet) rs).getString("Pays"));
					cl.setRegion(((ResultSet) rs).getString("region"));
					cl.setVille(((ResultSet) rs).getString("ville"));
					cl.setAdresse(((ResultSet) rs).getString("Adresse"));
					cl.setCodePostal(((ResultSet) rs).getString("CodePostal"));
					
					
					
					return cl;
				}
				return null;
			}
			
			public ClientVO getClientById(int id) throws SQLException
			{
				//creation d mon nouvel objet Client
				
				String query= "SELECT * FROM client cl where cl.ID = id";
				System.out.println(query);
				ResultSet rs = (ResultSet) conn.createStatement().executeQuery(query);
				if(((ResultSet) rs).next()) 
				{
					ClientVO cl = new ClientVO();
					cl.setId(((ResultSet) rs).getInt("ID"));
					cl.setNom(((ResultSet) rs).getString("Nom"));
					cl.setPrenom(((ResultSet) rs).getString("Prenom"));
					cl.setEstAdmin(((ResultSet) rs).getBoolean("EstAdmin"));
					cl.setTelephone(((ResultSet) rs).getString("Telephone"));
					cl.setPays(((ResultSet) rs).getString("Pays"));
					cl.setRegion(((ResultSet) rs).getString("region"));
					cl.setVille(((ResultSet) rs).getString("ville"));
					cl.setAdresse(((ResultSet) rs).getString("Adresse"));
					cl.setCodePostal(((ResultSet) rs).getString("CodePostal"));
					
					
					
					return cl;
				}
				return null;
			}
			
			public ClientVO getLastClient() 
			{
				String query= "SELECT * FROM client ORDER BY ID DESC LIMIT 1";
				System.out.println(query);
				try {
					ResultSet rs =  conn.createStatement().executeQuery(query);
					if(((ResultSet) rs).next()) 
					{
						ClientVO cl = new ClientVO();
						cl.setId(((ResultSet) rs).getInt("ID"));
						cl.setNom(((ResultSet) rs).getString("Nom"));
						cl.setPrenom(((ResultSet) rs).getString("Prenom"));
						cl.setEstAdmin(((ResultSet) rs).getBoolean("EstAdmin"));
						cl.setTelephone(((ResultSet) rs).getString("Telephone"));
						cl.setPays(((ResultSet) rs).getString("Pays"));
						cl.setRegion(((ResultSet) rs).getString("region"));
						cl.setVille(((ResultSet) rs).getString("ville"));
						cl.setAdresse(((ResultSet) rs).getString("Adresse"));
						cl.setCodePostal(((ResultSet) rs).getString("CodePostal"));

						return cl;
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return null;
			}
			
			public int getNombreItemPanier(int clientID) throws SQLException
			{
				//creation d mon nouvel objet Client
				
				String query= "SELECT COUNT(*) as CompteurElmtPanier from panierclient pc join client cl ON cl.ID = pc.ClientID where pc.ClientID =" + clientID;
				System.out.println(query);
				ResultSet rs = (ResultSet) conn.createStatement().executeQuery(query);
				
				if(((ResultSet) rs).next()) 
				{
					int nbreItems =  rs.getInt("CompteurElmtPanier");
					
					return nbreItems;
				}
				
				return 0;
			}
			
			public static void main(String... arg) throws SQLException
			{

				ClientDAO boss  =  new ClientDAO();
				//ClientVO newOne = boss.getLastClient();
				/*
				newOne.setAdresse("kdj");
				newOne.setNom("Essaie");
				newOne.setPrenom("loulou");
				newOne.setPays("cmr");
				newOne.setCodePostal("KNK IO5");
				newOne.setRegion("ON");
				newOne.setTelephone("123-965-5621");
				
				newOne.setVille("jdsx");
				boss.CreateClient(newOne);
				*/
				
				//System.out.println(newOne.toString());
				ClientVO newOne = boss.getClientById(6);
				boolean estadmin = newOne.getEstAdmin();
				System.out.println("est admin: " + estadmin);
				
			}
			
}
