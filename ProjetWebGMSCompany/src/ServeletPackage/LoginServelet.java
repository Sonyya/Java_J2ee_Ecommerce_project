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

import DAO.InfoLoginDAO;
import VO.ClientVO;
import VO.InfoLoginVO;

/**
 * Servlet implementation class LoginServelet
 */
@WebServlet("/LoginServelet")
public class LoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
    //declaratio nde mes variabel intermediaire
    String email;
    String mdp;
    InfoLoginVO ifVO = new InfoLoginVO();
    InfoLoginDAO ifDAO = new InfoLoginDAO();
    ClientVO client = new ClientVO();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageOutput = new String();
		//recuperatio ndes donnees de la page login
		email = (String)(request.getParameter("InputEmail"));
		mdp = (String)(request.getParameter("InputPassword"));
		try {
			if (ifDAO.verificationEmail(email) )
			{
				if(ifDAO.verificationLoginInfo(email, mdp))
				{
					HttpSession session = request.getSession();
					pageOutput = "/Accueil.jsp";
					client = ifDAO.getClientByEmail(email);
					session.setAttribute("clientInfo", client);
				}
				else 
				{
					pageOutput = "/login.jsp";
					request.setAttribute("ErreurEmailInfo", "Désolé votre Mot de passe est incorrect. Veuillez réessayer");

				}
			}
			else 
			{
				pageOutput = "/login.jsp";
				 request.setAttribute("ErreurLoginInfo", "Désolé votre Email n existe pas parmi nos clients enregistrés. Veuillez réessayer ou vous inscrire");
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


}
