package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Singleton.MonSingleton;
import VO.ClientVO;
import VO.InfoLoginVO;
import VO.ProduitVO;


public class InfoLoginDAO {
	
	//etablissement de la connectio la base de donnee;
		Connection conn = MonSingleton.getInstance();
		
		/*fonction creation du produit  A FAIRE*/

		//Recuperation des donnees du client de la BD
		
		public boolean verificationLoginInfo(String email, String MotDePasse) throws SQLException
		{
			//creation d mon nouvel objet Client
			
			String query= "SELECT * FROM logininfo WHERE Email = " + " '" + email + "' ";
			System.out.println(query);
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			InfoLoginVO infoLogin = new InfoLoginVO();
			if(((ResultSet) rs).next()) 
			{
				infoLogin.setId(((ResultSet) rs).getInt("ID"));
				infoLogin.setClientID(((ResultSet) rs).getString("ClientId"));
				infoLogin.setEmail(((ResultSet) rs).getString("Email"));
				infoLogin.setMotDePasse(((ResultSet) rs).getString("MotDePasse"));
				infoLogin.setRep1(((ResultSet) rs).getString("Reponse1"));
				infoLogin.setRep2(((ResultSet) rs).getString("Reponse2"));
				
				if(infoLogin.getMotDePasse().equals(MotDePasse))
				{
					return true;
				}
			}

			return false;
		
		}
		
		public boolean verificationEmail(String email) throws SQLException
		{
			//creation d mon nouvel objet Client
			
			String query= "SELECT * FROM logininfo WHERE Email = " + " '" + email + "' ";
			System.out.println(query);
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			if(((ResultSet) rs).next()) 
			{
				
				return true;
			}
		
				return false;
			
		
		}

		
		public ClientVO getClientByEmail(String email) throws SQLException
		{
			//creation d mon nouvel objet Client
			
			String query= "select cl.ID, cl.Nom, cl.Prenom,cl.EstAdmin, cl.Telephone, cl.Pays, cl.region, cl.ville, cl.Adresse, cl.CodePostal from client cl JOIN logininfo ON cl.ID = logininfo.ClientId where logininfo.Email=" + " '" + email + "' ";
			System.out.println(query);
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			ClientVO clVO = new ClientVO();
			if(((ResultSet) rs).next()) 
			{
				clVO.setId(((ResultSet) rs).getInt("ID"));
				clVO.setNom(((ResultSet) rs).getString("Nom"));
				clVO.setPrenom(((ResultSet) rs).getString("Prenom"));
				clVO.setEstAdmin(((ResultSet) rs).getBoolean("EstAdmin"));
				clVO.setTelephone(((ResultSet) rs).getString("Telephone"));
				clVO.setPays(((ResultSet) rs).getString("Pays"));
				clVO.setRegion(((ResultSet) rs).getString("region"));
				clVO.setVille(((ResultSet) rs).getString("ville"));
				clVO.setAdresse(((ResultSet) rs).getString("Adresse"));
				clVO.setCodePostal(((ResultSet) rs).getString("CodePostal"));
			}
			
			return clVO;
		}
		
		public  void createLoginInfo(String email, String mdp) throws SQLException
		{
			
			//recuperer le dernier client enregistrer
			ClientDAO clDAO =  new ClientDAO();
			ClientVO client = clDAO.getLastClient();
			String query = "INSERT INTO logininfo (ClientId, Email, MotDePasse) VALUES ("+ "'"+ client.getId()+"', '"+email+"','"+mdp+"')";
			System.out.println(query);
			//execution de la commande dans un statement
			conn.createStatement().executeUpdate(query);
			
		}
		
		public static void main(String... arg) throws SQLException
		{
			InfoLoginDAO lgDAO = new InfoLoginDAO();
			/**test Fonction  verificationLoginInfo*/
/*			
			boolean exist = lgDAO.verificationLoginInfo("wds082011@gmail.com", "lolo");
			System.out.println(exist);
			*//**test Fonction  verificationEmail*//*
			
			boolean exist2 = lgDAO.verificationEmail("wds082011@gmail.com");
			System.out.println(exist2);
			
			*//**test Fonction  getClientByEmail*//*
			ClientVO cl = lgDAO.getClientByEmail("wds");
			System.out.println(cl.toString());
			*/
			lgDAO.createLoginInfo("Sonia@gmail.com","hihi");
			
		}
}
