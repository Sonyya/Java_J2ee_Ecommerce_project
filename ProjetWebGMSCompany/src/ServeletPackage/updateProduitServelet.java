package ServeletPackage;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProduitDAO;
import DAO.inventaireProduitDAO;

/**
 * Servlet implementation class updateProduitServelet
 */
@WebServlet("/updateProduitServelet")
public class updateProduitServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProduitServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
    ProduitDAO invDAO = new ProduitDAO();
    String pageOutput = "/ShopServelet";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//recuperation des valeur pour la fonction
		String ProduitNom = request.getParameter("ProduitName");
		String description = request.getParameter("Description");
		float Prix = Float.parseFloat(request.getParameter("Prix"));
		String URL = request.getParameter("URL");
		int produitID = Integer.parseInt(request.getParameter("produitID"));
		
		System.out.println("ProduitNom "+ProduitNom);
		System.out.println("description "+ description);
		System.out.println("Prix "+ Prix);
		System.out.println("URL "+URL);
		System.out.println("produitID "+produitID);

		try {
			invDAO.UpdateProduit(produitID, ProduitNom, Prix, description, URL);
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
