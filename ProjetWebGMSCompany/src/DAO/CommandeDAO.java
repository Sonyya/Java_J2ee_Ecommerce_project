package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.sql.ResultSet;

import Singleton.MonSingleton;
import VO.ClientVO;
import VO.CommandeVO;

public class CommandeDAO {
	
	//etablissement de la connectio la base de donnee;
	Connection conn = MonSingleton.getInstance();
	
		public int getLastID() 
	{
		String query= "SELECT ID FROM commande ORDER BY ID DESC LIMIT 1";
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
		
		//update 
		//TODO
		
		public void updateStatutDateLivraison(int StatutID, Date dateLivraison, int cmdID )  throws SQLException
		{
			String query= "UPDATE commande cmd, clientacommande clc set cmd.EstimationOuDateLivraison = ' " + dateLivraison  +  " ', clc.StatutCommandeID = " + StatutID +" WHERE clc.IdCommande = cmd.ID AND cmd.id =" + cmdID;
			System.out.println(query);
			//execution de la commande dans un statement
			conn.createStatement().executeUpdate(query);
		}
	
	//creation  d un objet commande dans la BD
	
	public void CreateCommande()  throws SQLException
	{
		CommandeDAO DAOcmd  =  new CommandeDAO();
		ClientDAO DAOcl = new ClientDAO();
		ClientVO VOcl = DAOcl.getClient();
		LocalTime localTime = LocalTime.now();
		LocalDate localDate = LocalDate.now();
		Time now =java.sql.Time.valueOf(localTime);
		Date date = java.sql.Date.valueOf(localDate);

		/*EstimationDateLivraison = localDate+2semaine*/
		//commande me permettant d ajouter le commande dasn la base de donnees
		String query = "INSERT INTO commande (Date, heure) VALUES ( ' " +date+"', '"+now+"'"+")";
		System.out.println(query);
		//execution de la commande dans un statement
		conn.createStatement().executeUpdate(query);
	}

	//Recuperation des donnees du commande de la BD
	
	
	public  ArrayList<CommandeVO>getCommandeByClientID(int clientID) throws SQLException
	{
		//creation d mon nouvel objet commande
		
		String query= "SELECT * FROM commande cmd JOIN clientacommande clc ON cmd.ID = clc.IdCommande WHERE clc.IdClient = " + clientID;
		
		System.out.println(query);
		ResultSet rs =  conn.createStatement().executeQuery(query);
		ArrayList<CommandeVO> cmdList = new ArrayList<CommandeVO>();
		while(((ResultSet) rs).next()) 
		{
			CommandeVO cmd = new CommandeVO();
			cmd.setId(((ResultSet) rs).getInt("ID"));
			cmd.setDate(((ResultSet) rs).getDate("Date"));
			cmd.setHeure(((ResultSet) rs).getTime("heure"));
			cmd.setEstimationDateLivraison(((ResultSet) rs).getDate("EstimationOuDateLivraison"));
			cmdList.add(cmd);
		}
		return cmdList;
	}
	
	public  ArrayList<CommandeVO>getCommandeAll() throws SQLException
	{
		//creation d mon nouvel objet commande
		
		String query= "SELECT * FROM commande ";
		
		System.out.println(query);
		ResultSet rs =  conn.createStatement().executeQuery(query);
		ArrayList<CommandeVO> cmdList = new ArrayList<CommandeVO>();
		while(((ResultSet) rs).next()) 
		{
			CommandeVO cmd = new CommandeVO();
			cmd.setId(((ResultSet) rs).getInt("ID"));
			cmd.setDate(((ResultSet) rs).getDate("Date"));
			cmd.setHeure(((ResultSet) rs).getTime("heure"));
			cmd.setEstimationDateLivraison(((ResultSet) rs).getDate("EstimationOuDateLivraison"));
			cmdList.add(cmd);
		}
		return cmdList;
	}


	
	public static void main(String... arg) throws SQLException
	
	{
			CommandeDAO cDAO = new CommandeDAO();
			//cDAO.CreateCommande();
			CommandeAProduitDAO cpDAO = new CommandeAProduitDAO();
			ClientACommandeDAO cclDAO = new ClientACommandeDAO();
			
			ArrayList<CommandeVO> cmdList = cDAO.getCommandeAll();
			for(CommandeVO cnd : cmdList)
			{
				System.out.println(cnd.toString());
			}
			//prendre laderniere commadne
			
			/*int cVO = cDAO.getLastID();
			System.out.println("ID commande "+cVO);*/
			//Date livr = Date.valueOf("2010-12-31");
			//cDAO.updateStatutDateLivraison(3, livr, 2);
			
			
			//cclDAO.CreateClientACommande(6, cVO);
			//boolean fait = cpDAO.CreateProduitACommande(cVO, 2, 2);
			//System.out.println("produitACOmmandeFait?" + fait);
			
			

	}


}
