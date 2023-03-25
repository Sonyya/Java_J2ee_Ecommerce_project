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

import VO.*;
import DAO.*;

/**
 * Servlet implementation class cardServelet
 */
@WebServlet("/AddCardServelet")
public class AddCardServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCardServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
    	//declaration des variables dont on aura besoin
    	PanierVO pVO= new PanierVO();
    	PanierDAO pDAO = new PanierDAO();
    	ProduitDAO ProDAO = new ProduitDAO();
    	String pageOutput= "/ShopServelet";
    	
    	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Dans AddCardServelet");
		//capturere en parametre la session en cours
		HttpSession session = request.getSession();
		//prendre toute la lsite des produits pour comparer avec la valeur du btn
		ArrayList<ProduitVO> listProducts = new ArrayList();
		try {
			listProducts = ProDAO.getAll();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ClientVO clientCourant = (ClientVO)session.getAttribute("clientInfo");
		System.out.println("clientCourant " + clientCourant.toString());
		int IDProduitSelectionne = Integer.parseInt(request.getParameter("buttonRent")) ;
		
		int QtePris = Integer.parseInt(request.getParameter("quantity")) ;
		
		System.out.println("IDProduitSelectionne"+ IDProduitSelectionne);
		System.out.println("qteprisEn String:  "+request.getAttribute("quantity")); 
		//int QtePris = Integer.parseInt(request.getAttribute("quantity"));
		System.out.println("QtePris "+ QtePris );
		try {
			//si la quantite est superieur a 0 on cree un nouveau element dans la table panier
			if(QtePris > 0)
			{
				pDAO.CreatePanier(clientCourant.getId(), IDProduitSelectionne, QtePris);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
