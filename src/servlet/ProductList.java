package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Product;
import util.ProductHandler;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/ProductList")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ProductList() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Generate list of products; hand over to a JSP page to display them.
		// We can get any parameters we need from the request (we don't need/use any at the moment).
		ArrayList<Product> products = new ArrayList<Product>();
		try {
			products = ProductHandler.getProducts();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// Rather than embed lots of HTML into servlets; place the data you wan tto handle into the request
		request.setAttribute("products", products);
		// ... then forward the request to a JSP 'hidden' inside WEB_INF (so, can't be accessed directly by the user)
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/product-display-template.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// If called via POST... do what we'd do if called via GET.
		doGet(request, response);
	}

}
