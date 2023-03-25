package ServeletPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class toggleLanguageServelet
 */
@WebServlet("/toggleLanguageServelet")
public class toggleLanguageServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public toggleLanguageServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("dans langue toggle servelet");
		//String pageOutput = ;
		//System.out.println(pageOutput);
		//changement de langue ne fonciton du bouton appuyer
		String langueChoisi ="fr";
		String paysChoisi = "CA";
		
		try {
			System.out.println("dans try");
			langueChoisi  = (request.getParameter("langue")).toString();
			
			System.out.println("langueChoisi des btns"+langueChoisi);
			if(!langueChoisi.equals("") || !langueChoisi.isEmpty())
			{
				String langueDef = langueChoisi;
				String paysDef = paysChoisi;
				System.out.println("paysDef Dans try= " + langueDef);
				System.out.println("paysDef Dans try= " + paysDef);
				request.setAttribute("langueChoix",langueDef);
				request.setAttribute("paysChoix",paysDef);
				//Locale lol = new Locale("en","CA");

			}
			System.out.println("langueChoisi Dans try= " + langueChoisi);
			System.out.println("paysChoisi Dans try= " + paysChoisi);
			System.out.println("request.getAttribute(\"langueChoix\") == "+ request.getAttribute("langueChoix"));
			System.out.println("request.getAttribute(\\\"paysChoix\\\") == " + request.getAttribute("paysChoix"));
			
			//
			

		}
		catch(Exception e)
		{
			System.out.println("dans catch");
			request.setAttribute("langueChoix", langueChoisi);
			
			request.setAttribute("paysChoix", paysChoisi);
			
			System.out.println("langueChoisi dans catch = " + langueChoisi);
			System.out.println("paysChoisi dans catch = " + paysChoisi);
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher("/AboutUs.jsp");
				 dispatcher.forward(request, response);
		response.sendRedirect("/AboutUs.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
