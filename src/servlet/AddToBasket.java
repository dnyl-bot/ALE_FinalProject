package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import util.BasketHandler;

/**
 * Servlet implementation class AddToBasket
 */
@WebServlet("/AddToBasket")
public class AddToBasket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToBasket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("pid")!=null && request.getParameter("qty")!=null) {
			// Need to know WHAT is being purchased as well as HOW MANY
			int pid = Integer.valueOf(request.getParameter("pid"));
			int qty = Integer.valueOf(request.getParameter("qty"));
			System.out.println("Purchase "+qty+" of product id "+pid);
			//Hmmn. We're assuming that everything is OK with those values
			if(BasketHandler.addToBasket(pid, qty)){
				response.sendRedirect("basket.jsp");
				return;
			}
		}
		response.sendRedirect("error.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
