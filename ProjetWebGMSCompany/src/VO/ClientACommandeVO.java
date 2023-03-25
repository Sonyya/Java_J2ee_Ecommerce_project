package VO;

public class ClientACommandeVO {
	int CommandeId;
	int ClientId;
	int StatutCommandeId;
	
	public int getCommandeId() {
		return CommandeId;
	}
	public void setCommandeId(int commandeId) {
		this.CommandeId = commandeId;
	}
	
	public int getClientId() {
		return ClientId;
	}
	public void setClientId(int ClientId) {
		this.ClientId = ClientId;
	}
	
	public int getStatutCommandeId() {
		return StatutCommandeId;
	}
	public void setStatutCommandeId(int StatutCommandeId) {
		this.StatutCommandeId = StatutCommandeId;
	}
	
	

	public String toString() {
		// TODO Auto-generated method stub
		return "[CommandeId = " + CommandeId + ", ClientId = " +  ClientId   + ", StatutCommandeId = " +  StatutCommandeId   +  " ]";
	}


}
