package VO;

import java.sql.Date;

public class PanierVO {
	
	//attributs
		int id;
		int clientID;
		int produitID;
		int qteVoulu;

		
		
		//getter et setter de mes attributs
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		public int getClientID() {
			return clientID;
		}
		public void setClientID(int clientID) {
			this.clientID = clientID;
		}
		
		public int getProduitID() {
			return produitID;
		}
		public void setProduitID(int produitID) {
			this.produitID = produitID;
		}
		
		public int getQteVoulu() {
			return qteVoulu;
		}
		public void setQteVoulu(int qteVoulu) {
			this.qteVoulu = qteVoulu;
		}	
		
		

		
		public String toString() {
			// TODO Auto-generated method stub
			/*return "[ID = " + id + ", Nom = " +  nom + ", date de naissance = "+ naissance + ", adresse = "+ adresse + ", ville = "+ ville + ", Pays = "+ pays+ ", telephone = "+ telephone + " ]";*/
			return "[ID = " + id + ", ClientID = " +  clientID + ", produitID = "+ produitID + ", qteVoulu = "+ qteVoulu + " ]";
		}

	

}
