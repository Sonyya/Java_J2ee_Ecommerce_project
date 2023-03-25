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

import DAO.CommandeAProduitDAO;
import DAO.CommandeDAO;
import VO.ClientVO;
import VO.CommandeVO;

/**
 * Servlet implementation class cmdAdminServelet
 */
@WebServlet("/cmdAdminServelet")
public class cmdAdminServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public cmdAdminServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
  //page output qui va recevoir les infos
  	String pageOutput ="/cmdAdmin.jsp";
  	CommandeDAO cmdDAO = new CommandeDAO();
  	CommandeAProduitDAO cpDAO = new CommandeAProduitDAO();
  	ArrayList<CommandeVO>listCommande = new ArrayList<>();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		ClientVO clientCourant = (ClientVO)session.getAttribute("clientInfo");

		//recuperer toute les commandes du client
		try {
			listCommande = cmdDAO.getCommandeAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (CommandeVO i : listCommande)
		{
			System.out.println(i.toString());
		}
		
		request.setAttribute("listCommande", listCommande);
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
