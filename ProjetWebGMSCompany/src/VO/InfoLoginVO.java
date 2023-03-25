package VO;

import java.sql.Date;

public class InfoLoginVO {
	//attributs
		int id;
		String clientID;
		String email;
		String mdp;
		String rep1;
		String rep2;
		
		
		
		//getter et setter de mes attributs
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		public String getClientID() {
			return clientID;
		}
		public void setClientID(String clientID) {
			this.clientID = clientID;
		}
		
		
		public String getMotDePasse() {
			return mdp;
		}
		public void setMotDePasse(String mdp) {
			this.mdp = mdp;
		}
		
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		
		public String getRep1() {
			return rep1;
		}
		public void setRep1(String rep1) {
			this.rep1 = rep1;
		}	
		
		
		
		public String getRep2() {
			return rep2;
		}
		public void setRep2(String rep2) {
			this.rep2 = rep2;
		}
		

		
		public String toString() {
			// TODO Auto-generated method stub
			
			return "[ID = " + id + ", clientID = " +  clientID + ", MotDePasse = "+ mdp + ", rep1 = "+ rep1 + ", rep2 = "+ rep2 +", email = "+ email + " ]";
		}


}
