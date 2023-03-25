package VO;

public class CommandeAProduitVO {
	int CommandeId;
	int ProduitId;
	int QteCommande;
	
	public int getCommandeId() {
		return CommandeId;
	}
	public void setCommandeId(int commandeId) {
		this.CommandeId = commandeId;
	}
	
	public int getProduitId() {
		return ProduitId;
	}
	public void setProduitId(int ProduitId) {
		this.ProduitId = ProduitId;
	}
	
	public int getQteCommande() {
		return QteCommande;
	}
	public void setQteCommande(int QteCommande) {
		this.QteCommande = QteCommande;
	}

	public String toString() {
		// TODO Auto-generated method stub
		return "[CommandeId = " + CommandeId + ", ProduitId = " +  ProduitId   + ", QuantitéCommandé = " +  QteCommande   + " ]";
	}

}
