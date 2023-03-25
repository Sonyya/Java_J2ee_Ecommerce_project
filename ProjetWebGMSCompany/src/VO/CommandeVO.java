package VO;

import java.sql.Date;
import java.sql.Time;

public class CommandeVO {
	int id;
	Time heure;
	Date date;
	Date EstimationDateLivraison;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Time getHeure() {
		return heure;
	}
	public void setHeure(Time heure) {
		this.heure = heure;
	}
	
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public Date getEstimationDateLivraison() {
		return EstimationDateLivraison;
	}
	public void setEstimationDateLivraison(Date EstimationDateLivraison) {
		this.EstimationDateLivraison = EstimationDateLivraison;
	}
	
	public String toString() {
		// TODO Auto-generated method stub
		return "[ID = " + id + ", heure = "+ heure  + ", date = "+ date  + ", EstimationDateLivraison = " +  EstimationDateLivraison + " ]";
	}
		
	/*java.util.Date dt = new java.util.Date();

	java.text.SimpleDateFormat sdf = 
	     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	String currentTime = sdf.format(dt);*/

}
