package ServeletPackage;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ClientDAO;
import DAO.InfoLoginDAO;
import VO.ClientVO;

/**
 * Servlet implementation class inscriptionServelet
 */
@WebServlet("/inscriptionServelet")
public class inscriptionServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inscriptionServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
    //declaratio nde mes variables intermediaires
    String pageOutput = new String();
    ClientDAO clDAO = new ClientDAO();
    ClientVO client= new ClientVO();
    InfoLoginDAO ifDAO = new InfoLoginDAO();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//recuperatio ndes donne dasn la page d enregistrement
				client.setNom((String)request.getParameter("InputNom"));
				client.setPrenom((String)request.getParameter("InputPrenom"));
				client.setPays((String)request.getParameter("InputPays"));
				client.setRegion((String)request.getParameter("InputRegion"));
				client.setAdresse((String)request.getParameter("InputAdresse"));
				client.setVille((String)request.getParameter("InputVille"));
				client.setCodePostal((String)request.getParameter("Inputpostal"));
				client.setTelephone((String)request.getParameter("InputTelephone"));
				System.out.println("dans le servelet"+client.toString());
				
				String email = (String)request.getParameter("InputEmail");
				System.out.println("dans le servelet"+email);
				String mdp1 = (String)request.getParameter("InputPassword");
				System.out.println("dans le servelet"+mdp1);
				String mdp2 = (String)request.getParameter("InputPassword2");
				System.out.println("dans le servelet"+mdp2);
				boolean validationMDP = mdp1.equals(mdp2)? true: false;
				if(!validationMDP )
				{
					request.setAttribute("PasMemeMdp", "Votre confirmation de mot de passe n est pareil que votre mot passe donné avant celui ci. Veuillez le reentrer afin qu ils soient identiques. Merci");
				}
				System.out.println("validationMDP? "+validationMDP);
				try {
					System.out.println("verificationEmail? "+ (ifDAO.verificationEmail(email)));
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					System.out.println("dans le try catch ");
					if(!(ifDAO.verificationEmail(email)) && validationMDP){
						System.out.println("verification faite");
						clDAO.CreateClient(client, false);
						System.out.println("client cree");
						ifDAO.createLoginInfo(email, mdp1);
						System.out.println("login info cree ");
						pageOutput = "/login.jsp";
					}
					else
					{
						if((ifDAO.verificationEmail(email)))
						{
							request.setAttribute("EmailExiste", "Ce email a deja un compte avec nous, Veuillez vous login directement, pas beosin de vous inscrire :)");	
						}
						
						pageOutput = "/Inscription.jsp";
					}
					
					
					
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
