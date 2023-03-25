package VO;

public class StatutCommandeVO {

	//attributs
			int id;
			String NomStatut;
			
			
			
			
			//getter et setter de mes attributs
			
			public int getId() {
				return id;
			}
			public void setId(int id) {
				this.id = id;
			}
			
			public String getNomStatut() {
				return NomStatut;
			}
			public void setNomStatut(String NomStatut) {
				this.NomStatut = NomStatut;
			}
			
			
			

			
			public String toString() {
				// TODO Auto-generated method stub
				
				return "[ID = " + id + ", NomStatut = " +  NomStatut +  " ]";
			}

}
