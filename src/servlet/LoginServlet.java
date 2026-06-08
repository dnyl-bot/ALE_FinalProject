package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // temporary login check
        if ("test@test.com".equals(email) && "123".equals(password)) {

            HttpSession session = request.getSession();
            session.setAttribute("user", email);

            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("logon.jsp");
        }
    }
}