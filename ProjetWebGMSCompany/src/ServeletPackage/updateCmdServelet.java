package ServeletPackage;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;

/**
 * Servlet implementation class updateCmdServelet
 */
@WebServlet("/updateCmdServelet")
public class updateCmdServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCmdServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    CommandeDAO cmdDAO = new CommandeDAO();
    String pageOutput= "/cmdAdminServelet";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("In SERVELET GET ");
		//recuperation de l ID du statut, la date de delivrery, commande ID
		int cmdID = Integer.parseInt(request.getParameter("save"));
		System.out.println("cmdID " + cmdID);
		Date dateDelivrery = (Date.valueOf(request.getParameter("livraison")));
		System.out.println("dateDelivrery " + dateDelivrery);
		int statutID = Integer.parseInt(request.getParameter("statut"));
		System.out.println("statutID " + statutID);
		
		//update de mes commandees
		try {
			cmdDAO.updateStatutDateLivraison(statutID, dateDelivrery, cmdID);
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
