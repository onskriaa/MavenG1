package Controller;

import dao.AdminDAO;
import dao.UtilisateurDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Admin;
import model.Utilisateur;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        HttpSession session = request.getSession();

        if ("admin".equals(role)) {
            Admin admin = new AdminDAO().getAdminByEmailAndPassword(email, password);
            if (admin != null) {
                session.setAttribute("admin", admin);
                response.sendRedirect("admin.jsp");
            } else {
                request.setAttribute("error", "❌ Email ou mot de passe admin invalide.");
                request.getRequestDispatcher("loginUnique.jsp").forward(request, response);
            }
        } else if ("utilisateur".equals(role)) {
            Utilisateur user = new UtilisateurDAO().getUtilisateurByEmailAndPassword(email, password);

            if (user != null) {
                if (user.isBloque()) {
                    request.setAttribute("error", "⛔ Votre compte a été bloqué par un administrateur.");
                    request.getRequestDispatcher("loginUnique.jsp").forward(request, response);
                    return;
                }

                session.setAttribute("utilisateur", user);
                response.sendRedirect("espaceUtilisateur.jsp");
            } else {
                request.setAttribute("error", "❌ Email ou mot de passe utilisateur invalide.");
                request.getRequestDispatcher("loginUnique.jsp").forward(request, response);
            }
        }
    }
}