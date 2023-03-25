package ServeletPackage;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import DAO.*;
import VO.*;

/**
 * Servlet implementation class crerateProduitServelet
 */
@WebServlet("/createProduitServelet")
public class createProduitServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createProduitServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
    ProduitDAO pDAO = new ProduitDAO();
    inventaireProduitDAO invDAO = new inventaireProduitDAO();
    String pageOutput = "/ShopServelet";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Dans createProduitServelet");
		//recuperation des donnes
		String NomProduit = request.getParameter("ProduitName");
		System.out.println("NomProduit "+NomProduit);
		String description = request.getParameter("Description");
		System.out.println("Prix "+ (request.getParameter("Prix")));
		float prix = Float.parseFloat(request.getParameter("Prix"));
		String URL = request.getParameter("URL");
		
		int QteEnStock = Integer.parseInt(request.getParameter("qteEnStock"));
		int sueilMin = Integer.parseInt(request.getParameter("seuilMin"));
		int QteAachete = Integer.parseInt(request.getParameter("qteAachete"));
		System.out.println("NomProduit "+NomProduit);
		System.out.println("description "+description);
		System.out.println("prix"+ prix);
		System.out.println("URL "+URL);
		System.out.println("QteEnStock "+QteEnStock);
		System.out.println("sueilMin "+sueilMin);
		System.out.println("QteAachete "+QteAachete);
;
		//creation du produit
		
		//creation du nouveau produit
		ProduitVO produit = new ProduitVO();
		produit.setNom(NomProduit);
		produit.setDescription(description);
		produit.setPrix(prix);
		produit.setPhotoUrl(URL);
		
	
		
		try {
			//creation du produit
			pDAO.CreateProduit(produit);
			//recupreation du id du dernier produit cree
			int produitID = pDAO.getLastID();
			//creation de son inventaire
			inventaireProduitVO inv = new inventaireProduitVO();
			inv.setProduitID(produitID);
			inv.setQteEnStock(QteEnStock);
			inv.setSeuilMinimum(sueilMin);
			inv.setQteAachete(QteAachete);

			
			invDAO.CreateInventaireProduit(inv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		response.getWriter().append("Served at: ").append(request.getContextPath());
		 RequestDispatcher dispatcher =
					getServletContext().getRequestDispatcher(pageOutput);
					 dispatcher.forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
