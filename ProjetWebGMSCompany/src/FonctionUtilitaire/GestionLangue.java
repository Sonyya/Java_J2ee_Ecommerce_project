package FonctionUtilitaire;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Locale;
import java.util.ResourceBundle;

import DAO.ClientACommandeDAO;
import DAO.CommandeAProduitDAO;
import DAO.CommandeDAO;
import VO.CommandeVO;

public class GestionLangue {
	//declaration attribut
	String langue;
	String pays;
	
	public GestionLangue()
	{
		langue="fr";
		pays="CA";
	}
	
	public GestionLangue(String lg, String pays)
	{
		this.langue=lg;
		this.pays=pays;
	}
	public void setPays(String Pays) 
	{
		//configuration de la langue
		
		this.pays= Pays;
		
	}
	public void setLangue(String langue) 
	{
		//configuration de la langue
		this.langue = langue;
		
		
	}
	public String getLangue() {
		return this.langue;
	}
	public String getPays() {
		return this.pays;
	}
	
public static void main(String... arg) throws SQLException
	
	{
		GestionLangue gl= new GestionLangue("fr", "CA");
		ResourceBundle labels;
		ResourceBundle boutons;
		ResourceBundle Navbar;
		ResourceBundle Message;
		ResourceBundle placeholder;
		//passage en valeur de mes bundles
				labels=ResourceBundle.getBundle("properties.Labels", 
						new Locale(gl.getLangue(), gl.getPays()));
				boutons=ResourceBundle.getBundle("properties.Boutons", 
				new Locale(gl.getLangue(), gl.getPays()));
				Navbar=ResourceBundle.getBundle("properties.Navbar", 
						new Locale(gl.getLangue(), gl.getPays()));
				Message=ResourceBundle.getBundle("properties.Message", 
						new Locale(gl.getLangue(), gl.getPays()));
				placeholder= ResourceBundle.getBundle("properties.Placeholder", 
						new Locale(gl.getLangue(), gl.getPays()));
	
		
				String labelNOm = labels.getString("lbNom");
				String BoutonSubmit =boutons.getString("btnSoumission");
				String NavbarAcc=Navbar.getString("NavAccueil");
		
				String PL= placeholder.getString("phMdpConfirm");
				System.out.println("labelNOm "+labelNOm);
				System.out.println("BoutonSubmit "+BoutonSubmit);
				System.out.println("NavbarAcc "+ NavbarAcc);
			
				System.out.println("PL "+PL);
		System.out.println("langue " + gl.getLangue() + ". pays " + gl.getPays());

	}
	

}
