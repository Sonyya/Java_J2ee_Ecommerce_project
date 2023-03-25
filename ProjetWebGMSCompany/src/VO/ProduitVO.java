package VO;

public class ProduitVO {
	int id;
	String nom;
	float prix;
	String description;
	int NbreJourPourLivraison;
	String photoUrl;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public float getPrix() {
		return prix;
	}
	public void setPrix(float prix) {
		this.prix = prix;
	}
	
	public String getdescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	
	public int getNbreJourPourLivraison() {
		return NbreJourPourLivraison;
	}
	public void setNbreJourPourLivraison(int NbreJourPourLivraison) {
		this.NbreJourPourLivraison = NbreJourPourLivraison;
	}
	
	public String toString() {
		// TODO Auto-generated method stub
		return "[ID = " + id + ", Nom = " +  nom + ", +  Prix = " +  prix + ", Description = " +  description + ", NbreJourPourLivraison = " +  NbreJourPourLivraison + ", photoUrl = " +  photoUrl + " ]";
	}
	
	/*public String WebAffichage() 
	{
		String nomCategorie = (categorie == 1)? "Vin Rouge" : "Vin Blanc";
		
		return "" + id + ". " +  nom + "- "+ origine + "- "+ nomCategorie;
	}*/

}
