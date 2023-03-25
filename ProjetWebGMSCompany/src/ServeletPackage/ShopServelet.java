package ServeletPackage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ProduitDAO;
import VO.ClientVO;
import VO.ProduitVO;

/**
 * Servlet implementation class ShopServelet
 */
@WebServlet("/ShopServelet")
public class ShopServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
    //creation de mon Vo
    ArrayList<ProduitVO> listProduits = new ArrayList<>();
    //creation de mon dao
    ProduitDAO pDAO;
  
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DANS GET DU SERVELET");
		//page output qui va recevoir les infos
		//recuperer les infos du client en seession
		String pageOutput;
		pageOutput ="/Shop.jsp";
		HttpSession session = request.getSession();
			ClientVO clientCourant = (ClientVO)session.getAttribute("clientInfo");
		if(clientCourant != null){	
			System.out.println("EstAdmin  "+clientCourant.getEstAdmin());
			if (clientCourant.getEstAdmin() == true)
			{
				System.out.println("EstAdmin  "+clientCourant.getEstAdmin());
				pageOutput = "/produitAdmin.jsp";
			}
		}
		
		
		
		System.out.println("pageOutput "+ pageOutput);
		//stocker la lsite de s produits contenu dans la base de donnee ici
		pDAO = new ProduitDAO();
		try {
			listProduits = pDAO.getAll();
			
			if(!listProduits.isEmpty())
			{
				System.out.println("liste de produit PLEINE PLEINE PLEINE");
				for(ProduitVO article : listProduits ) 
				{
					System.out.println(article.toString());
				}
			}
			else {
				System.out.println("liste de produit VIDE VIDE VIDE");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("produitList", listProduits);
		
		// TODO Auto-generated method stub
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
