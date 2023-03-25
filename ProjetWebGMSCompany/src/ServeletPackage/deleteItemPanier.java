package ServeletPackage;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.*;
import VO.*;

/**
 * Servlet implementation class deleteItemPanier
 */
@WebServlet("/deleteItemPanier")
public class deleteItemPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteItemPanier() {
        super();
        // TODO Auto-generated constructor stub
    }
    	
    
    //instanciation des variables qui me serviront
    PanierDAO pDAO  =  new PanierDAO();
    String pageOutput= "/CardServelet";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("In SERVELET GET ");
		//recuperation de l ID du produit a supprimer
		int ProduitID = Integer.parseInt(request.getParameter("delete"));
		System.out.println("ProduitID "+ ProduitID);
		//capturere en parametre la session en cours
		HttpSession session = request.getSession();
		ClientVO clientCourant = (ClientVO)session.getAttribute("clientInfo");
		System.out.println("clientCourant "+ clientCourant.toString());
		//supprimer le produit
		
		try {
			pDAO.deleteItemPanier(ProduitID, clientCourant.getId());
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
