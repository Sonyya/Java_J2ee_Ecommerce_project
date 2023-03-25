package VO;

import java.sql.Date;

public class inventaireProduitVO {
	
	//attributs
		int produitID;
		int QteEnSotck;
		int seuilMinimum;
		int QteAcheter;
		
		
		
		//getter et setter de mes attributs

		public int getProduitID() {
			return produitID;
		}
		public void setProduitID(int produitID) {
			this.produitID = produitID;
		}
		
		public int getQteEnStock() {
			return QteEnSotck;
		}
		public void setQteEnStock(int QteEnSotck) {
			this.QteEnSotck = QteEnSotck;
		}
		
		public int getSeuilMinimum() {
			return seuilMinimum;
		}
		public void setSeuilMinimum(int seuilMinimum) {
			this.seuilMinimum = seuilMinimum;
		}
		
		public int getQteAachete() {
			return QteAcheter;
		}
		public void setQteAachete(int QteAcheter) {
			this.QteAcheter = QteAcheter;
		}
		
		
		

		
		public String toString() {
			// TODO Auto-generated method stub
			/*return "[ID = " + id + ", Nom = " +  nom + ", date de naissance = "+ naissance + ", adresse = "+ adresse + ", ville = "+ ville + ", Pays = "+ pays+ ", telephone = "+ telephone + " ]";*/
			return "[ produitID = " +  produitID + ", seuilMinimum = " +  seuilMinimum + ", QteEnSotck = "+ QteEnSotck + ", QteAcheter = "+ QteAcheter  + " ]";
		}

}
