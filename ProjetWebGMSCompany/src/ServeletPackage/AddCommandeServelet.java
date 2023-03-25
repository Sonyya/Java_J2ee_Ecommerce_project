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

import DAO.*;

import VO.*;

/**
 * Servlet implementation class AddCommandeServelet
 */
@WebServlet("/AddCommandeServelet")
public class AddCommandeServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommandeServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
  //declaration des variables dont on aura besoin
	PanierVO pVO= new PanierVO();
	PanierDAO pDAO = new PanierDAO();
	ProduitDAO ProDAO = new ProduitDAO();
	CommandeDAO cmdDAO = new CommandeDAO();
	ClientACommandeDAO clcDAO = new ClientACommandeDAO();
	CommandeAProduitDAO cpDAO = new CommandeAProduitDAO();
	inventaireProduitDAO invDAO = new inventaireProduitDAO();
	ArrayList<PanierVO> panierList = new ArrayList<PanierVO>();
	float somme = 0;
	
	String pageOutput= "/paypalPayment.jsp";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//capturere en parametre la session en cours
				HttpSession session = request.getSession();
				ClientVO clientCourant = (ClientVO)session.getAttribute("clientInfo");
		//stocker la lsite de s produits contenu dans la base de donnee ici
				try {
					panierList = pDAO.getAllPanierByClient(clientCourant.getId());
					
					if(!panierList.isEmpty())
					{
						System.out.println("liste de produit PLEINE PLEINE PLEINE");
						for(PanierVO article : panierList ) 
						{
							System.out.println(article.toString());
							ProduitVO prdt = ProDAO.getProduitById(article.getProduitID());
							somme += (article.getQteVoulu()* prdt.getPrix());
						}
						
						System.out.println("total " + somme);
					
					}
					else {
						System.out.println("liste de produit VIDE VIDE VIDE");
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		//verifier si les produits sont tous  disponibles
				//creation de ma liste qui dira pour chaque produit si oui ou non il ya assez dans le stock

				ArrayList<PanierVO> porduitEnRuptureList = new ArrayList<PanierVO>();
				for(int i = 0; i< panierList.size() ; i++)
				{
					try {
						boolean verif = invDAO.verifProduitStock(panierList.get(i).getProduitID(), panierList.get(i).getQteVoulu());
						if(verif == false)
						{
							porduitEnRuptureList.add(panierList.get(i));
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}

				
				if(porduitEnRuptureList.size() == 0)
				{
					try {
						//creer la commande
						cmdDAO.CreateCommande();
						int cmdID = cmdDAO.getLastID();
						//creer commande a client
						clcDAO.CreateClientACommande(clientCourant.getId(), cmdID);
						////creer commande a Produit
						for(int i = 0; i< panierList.size() ; i++)
						{
							cpDAO.CreateProduitACommande(cmdID, panierList.get(i).getProduitID(),  panierList.get(i).getQteVoulu());
							invDAO.updateQteEnStock( panierList.get(i).getProduitID(),  panierList.get(i).getQteVoulu());
						}
						//supprimerle Panier
						pDAO.deleteAllPanier(clientCourant.getId());
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				
				else {

					request.setAttribute("porduitEnRuptureList", porduitEnRuptureList);
				}
				
				String total = String.valueOf(somme);
				request.setAttribute("total", total );
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
