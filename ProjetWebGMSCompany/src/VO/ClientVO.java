package VO;

import java.sql.Date;

public class ClientVO {
	//attributs
	int id;
	Boolean EstAdmin;
	String nom;
	String prenom;
	String telephone;
	String pays;
	String region;
	String ville;
	String adresse;
	String codePostal;
	Date naissance;
	
	
	//getter et setter de mes attributs
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Boolean getEstAdmin() {
		return EstAdmin;
	}
	public void setEstAdmin(Boolean EstAdmin) {
		this.EstAdmin = EstAdmin;
	}
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}	
	
	public String getPays() {
		return pays;
	}
	public void setPays(String pays) {
		this.pays = pays;
	}
	
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	
	public String getCodePostal() {
		return codePostal;
	}
	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}
	
	public Date getNaissance() {
		return naissance;
	}
	public void setNaissance(Date naissance) {
		this.naissance = naissance;
	}
	
	
	

	
	public String toString() {
		// TODO Auto-generated method stub
		/*return "[ID = " + id + ", Nom = " +  nom + ", date de naissance = "+ naissance + ", adresse = "+ adresse + ", ville = "+ ville + ", Pays = "+ pays+ ", telephone = "+ telephone + " ]";*/
		return "[ID = " + id + ", EstAdmin = " +  EstAdmin + ", Nom = " +  nom + ", Prenom = "+ prenom + ", telephone = "+ telephone + ", pays = "+ pays + ", ville = "+ ville +", adresse = "+ adresse + ", code Postal = "+ codePostal + " ]";
	}


}
