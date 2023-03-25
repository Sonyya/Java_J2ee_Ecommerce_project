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

import DAO.PanierDAO;
import DAO.ProduitDAO;
import VO.ClientVO;
import VO.PanierVO;
import VO.ProduitVO;

/**
 * Servlet implementation class CardServelet
 */
@WebServlet("/CardServelet")
public class CardServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CardServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
    //variables utiles
	PanierVO pVO= new PanierVO();
	PanierDAO pDAO = new PanierDAO();
	ArrayList<PanierVO> panierList = new ArrayList<PanierVO>();
	String pageOutput ="/Card.jsp";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
						}
					}
					else {
						System.out.println("liste de produit VIDE VIDE VIDE");
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("panierList", panierList);
				
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
