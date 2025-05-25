package Controller;

import dao.UtilisateurDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Utilisateur;

import java.io.IOException;

@WebServlet("/registerUser")
public class RegisterUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String telephone = request.getParameter("telephone");

        UtilisateurDAO dao = new UtilisateurDAO();

        // Vérifier si l'email existe déjà
        if (dao.getUtilisateurByEmail(email) != null) {
            Utilisateur u = new Utilisateur();
            u.setNom(nom);
            u.setPrenom(prenom);
            u.setEmail(email);
            u.setTelephone(telephone);

            request.setAttribute("error", "Email déjà utilisé.");
            request.setAttribute("utilisateur", u);
            request.getRequestDispatcher("registerUser.jsp").forward(request, response);
            return;
        }

        // Créer un nouvel utilisateur
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setNom(nom);
        utilisateur.setPrenom(prenom);
        utilisateur.setEmail(email);
        utilisateur.setPassword(password);
        utilisateur.setTelephone(telephone);

        dao.ajouterUtilisateur(utilisateur);

        // Connexion automatique après inscription
        request.getSession().setAttribute("utilisateur", utilisateur);
        response.sendRedirect("espaceUtilisateur.jsp");
    }
}
